package classes.DataManager.Serialization 
{
	import classes.Creature;
	import classes.DataManager.Errors.VersionUpgraderError;
	import classes.DataManager.Serialization.ISaveable;
	import classes.Ships.IOwned;
	import classes.Ships.IOwner;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	import flash.utils.describeType;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	/**
	 * ItemSaveable implements a flag to determine if a given item has randomised properties. Items with the flag set will save and load ALL of their properties to file,
	 * whereas items without the flag set will only save enough data to correctly reconstitue character inventories (name, classInstance and quantity)
	 * @author Gedan
	 */
	public class ItemSaveable implements ISaveable
	{
		public function ItemSaveable()
		{
			
		}
		
		// For finding who's wearing the item. Use char name such as chars["PC"], we use PC. Works for persistent chars.
		private var _owner:String;
		public function get Owner():String { return _owner; }
		public function set Owner(v:String):void 
		{
			_owner = v;
		}
		
		//Putting this in here because it needs to be saved
		private var _statusEffects:Array;
		public function get statusEffects():Array { return _statusEffects; }
		public function set statusEffects(v:Array):void 
		{
			_statusEffects = v;
		}
		
		/**
		 * Versioning Info
		 */
		private var _version:int = 0;
		public function get version():int { return _version; }
		public function set version(v:int):void { _version = v; }
		
		protected var _latestVersion:int = 0;
		
		/**
		 * Core values for any item. I've had to push them down the inheritence tree to here to avoid some bullshitting, but I could shift them back up...
		 */
		private var _quantity:Number;
		
		public function get quantity():Number { return _quantity; }
		public function set quantity(v:Number):void { _quantity = v; }
		
		public var shortName:String = "";
		public var hasUniqueName:Boolean = false;
		
		/**
		 * Serialization settings. If an item doesn't have random properties defined, we don't have to save/restore all the shit for it every time, so we can just ignore it.
		 * If a previously non-random item becomes random, we don't have to do shit to unfuck saves, it'll get flipped over in code and will save with random properties from then on.
		 */
		public var hasRandomProperties:Boolean = false;

		/**
		 * Fields/Proprties to ignore on the class. Not fully implemented, but it should work for any class-based properties. Just add fields to ignore in an items constructor if
		 * you really need to do it. It's more to avoid serializing some system-specific fields that don't actually exist on the objects at runtime.
		 */
		protected var _ignoredFields:Array = ["prototype", "classInstance", "neverSerialize", "shortName", "attackImplementor", "droneAttack"];
		public function addIgnoredField(fieldName:String):void
		{
			_ignoredFields.push(fieldName);
		}
		
		private function isBasicType(obj:*):Boolean
		{
			if (obj is int) return true;
			if (obj is Number) return true;
			if (obj is String) return true;
			if (obj is Boolean) return true;
			if (obj is uint) return true;
			return false;
		}
		
		public function getSaveObject():Object
		{
			var dataObject:Object = new Object();
			var i:int;
			
			var _d:XML = describeType(this);
			var _dl:XMLList = _d..variable;
			var _da:XMLList = _d..accessor;
			
			if (this.hasRandomProperties == true)
			{
				for each (var prop:XML in _dl)
				{
					var propName:String = prop.@name.toString();
					if (_ignoredFields.length > 0 && _ignoredFields.indexOf(propName) == -1)
					{
						if (this[propName] != null && this[propName] != undefined)
						{
							if (this[propName] is ISaveable)
							{
								dataObject[propName] = this[propName].getSaveObject();
							}
							else if (this[propName] is Array)
							{
								if (this[propName].length > 0)
								{
									if (this[propName][0] is ISaveable)
									{
										dataObject[propName] = new Array();
										
										for (i = 0; i < this[propName].length; i++)
										{
											dataObject[propName].push(this[propName][i].getSaveObject());
										}
									}
									else if (isBasicType(this[propName][0]))
									{
										dataObject[propName] = new Array();
										
										for (i = 0; i < this[propName].length; i++)
										{
											dataObject[propName].push(this[propName][i]);
										}
									}
									else
									{
										dataObject[propName] = this[propName];
									}
								}
								else
								{
									dataObject[propName] = new Array();
								}
							}
							else if (isBasicType(this[propName]))
							{
								dataObject[propName] = this[propName];
							}
							else
							{
								dataObject[propName] = this[propName];
							}
						}
					}
				}
				
				if ( this.hasUniqueName ) {
					dataObject.shortName = this.shortName;
				}
				
				for each (var accs:XML in _da)
				{
					var accsName:String = accs.@name.toString();
					if (_ignoredFields.length > 0 && _ignoredFields.indexOf(accsName) == -1)
					{
						if (this[accsName] is ISaveable)
						{
							dataObject[accsName] = this[accsName].getSaveObject();
						}
						else if (this[accsName] is Array)
						{
							if (this[accsName].length > 0)
							{
								if (this[accsName][0] is ISaveable)
								{
									dataObject[accsName] = new Array();
									for (i = 0; i < this[accsName].length; i++)
									{
										dataObject[accsName].push(this[accsName][i].getSaveObject());
									}
								}
								else if (isBasicType(this[accsName][0]))
								{
									dataObject[accsName] = new Array();
									
									for (i = 0; i < this[accsName].length; i++)
									{
										dataObject[accsName].push(this[accsName][i]);
									}
								}
								else
								{
									dataObject[accsName] = this[accsName];
								}
							}
							else
							{
								dataObject[accsName] = new Array();
							}
						}
						else if (isBasicType(this[accsName]))
						{
							dataObject[accsName] = this[accsName];
						}
						else
						{
							dataObject[accsName] = this[accsName];
						}
					}
				}
			}
			else
			{
				dataObject.quantity = this.quantity;
				dataObject.shortName = this.shortName;
				dataObject.version = this.version;
				dataObject.Owner = this.Owner;
				
				// StatusEffects needs actual data though, as it's an array of a complex type
				dataObject.statusEffects = new Array();
				for (i = 0; i < this.statusEffects.length; i++)
				{
					dataObject.statusEffects.push(this.statusEffects[i].getSaveObject());
				}
			}
			
			dataObject.classInstance = getQualifiedClassName(this);
			
			return dataObject;
		}
		
		public function loadSaveObject(dataObject:Object):void
		{
			var prop:*;
			
			if (this._latestVersion == -1) return;
			
			if (this.hasRandomProperties == true)
			{
				// Same mechanic as for creatures. If the player has a save instance of an item, their values will clobber
				// those in the game data, so rebalancing will have to go via a version system.
				if (dataObject.version < this._latestVersion)
				{
					while (dataObject.version < this._latestVersion)
					{
						this["UpgradeVersion" + dataObject.version](dataObject);
						dataObject.version++;
					}
				}
				
				if (dataObject.version != this._latestVersion)
				{
					throw new VersionUpgraderError("Couldn't upgrade the save data for " + dataObject.classInstance);
				}
			}
			
			var _d:XML = describeType(dataObject);
			if (_d.@isDynamic == "true")
			{
				for (prop in dataObject)
				{
					if (!hasOwnProperty(prop)) continue;
					
					var tProp:String = prop;
					if (_ignoredFields.length > 0)
					{
						if (_ignoredFields.indexOf(tProp) == -1)
						{
							if (this[tProp] is ISaveable)
							{
								var classT:Class = getDefinitionByName(dataObject[tProp].classInstance) as Class;
								this[tProp] = new classT();
								this[tProp].loadSaveObject(dataObject[tProp]);
							}
							else if (this[tProp] is Array) 
							{
								if (dataObject[tProp].length > 0)
								{
									var i:int = 0;
									if (!(dataObject[tProp][0] is Number) && !(dataObject[tProp][0] is String) && dataObject[tProp][0]["classInstance"] !== undefined) //If array of ISaveable, like statusEffects
									{
										this[tProp] = new Array();
										for (i = 0; i < dataObject[tProp].length; i++)
										{	
											var itemT:ISaveable = new (getDefinitionByName(dataObject[tProp][i].classInstance) as Class)();
											itemT.loadSaveObject(dataObject[tProp][i]);
											this[tProp].push(itemT);
										}
									}
									else if (isBasicType(dataObject[tProp][0]))
									{
										this[tProp] = new Array();
										for (i = 0; i < dataObject[tProp].length; i++)
										{
											this[tProp].push(dataObject[tProp][i]);
										}
									}
									else
									{
										this[tProp] = dataObject[tProp];
										trace("Potential serialization issue with property: " + tProp);
									}
								}
								else 
								{
									dataObject[tProp] = new Array();
								}
							}
							else
							{
								this[tProp] = dataObject[tProp];
							}
						}
					}
					else
					{
						this[tProp] = dataObject[tProp];
					}
				}
				if (dataObject.hasUniqueName == true)
				{
					this['shortName'] = dataObject['shortName'];
					TooltipManager.addFullName(this['shortName'],StringUtil.toTitleCase(this['longName']))
					TooltipManager.addTooltip(this['shortName'],this['tooltip']);
				}
			}
			else
			{				
				var _dl:XMLList = _d..variable;
				var _da:XMLList = _d..accessor;
				
				for each (prop in _dl)
				{
					var propName:String = prop.@name.toString();
					if (this[propName] != null && this[propName] != undefined)
					{
						this[propName] = dataObject[propName];
					}
				}
				
				for each (var accs:* in _da)
				{
					var accsName:String = accs.@name.toString();
					if (accsName != "prototype" && accsName != "neverSerialize")
					{
						this[accsName] = dataObject[accsName];
					}
				}
			}
		}
		
		/**
		 * Provides a method to create a deep copy of an item, using the actual serialization methods!
		 * Returns a completely new instance of a given item Class, with properties overwritten from the
		 * source object; ie works for both static items and items with randomised properties.
		 * Handy way to take a copy of something from another characters inventory, ie, shops.
		 * @return
		 */
		public function makeCopy():*
		{
			var classT:Class = (getDefinitionByName(getQualifiedClassName(this)) as Class);
			var cObj:* = new classT();
			cObj.loadSaveObject(this.getSaveObject());
			return cObj;
		}
	}

}