package classes.DataManager 
{
	import classes.Creature;
	import classes.DataManager.Errors.VersionUpgraderError;
	import classes.DataManager.Serialization.ItemSaveable;
	import classes.GameData.GameOptions;
	import classes.ItemSlotClass;
	import classes.Ships.IOwner;
	import classes.StorageClass;
	import flash.net.SharedObject;
	import classes.Util.InCollection;
	import classes.GLOBAL;
	
	/**
	 * ...
	 * @author HNB
	 */
	public class SaveVersionUpgrader32 implements ISaveVersionUpgrader
	{
		private const _newVersionValue:int = 33;
		
		public function SaveVersionUpgrader32() 
		{}
		
		public function upgrade(data:Object):Boolean
		{
			for (var key:String in data.characters)
			{
				var pussyUpgraded:Boolean = false;
				var cumUpgraded:Boolean = false;
				// Force all worn items to have their owner property set 
				var char:Object = data.characters[key];
				if (char.meleeWeapon != null) char.meleeWeapon.Owner = key;
				if (char.rangedWeapon != null) char.rangedWeapon.Owner = key;
				if (char.armor != null) char.armor.Owner = key;
				if (char.upperUndergarment != null) char.upperUndergarment.Owner = key;
				if (char.lowerUndergarment != null) char.lowerUndergarment.Owner = key;
				if (char.accessory != null) char.accessory.Owner = key;
				if (char.shield != null) char.shield.Owner = key;
				
				var cumCounter:StorageClass = new StorageClass();
				cumCounter.storageName = "Cum Soaked Counter";
				cumCounter.hidden = true;
				var pussyCounter:StorageClass = new StorageClass();
				pussyCounter.storageName = "Pussy Drenched Counter";
				pussyCounter.hidden = true;
				var desc:String = "";
				var cumS:StorageClass = new StorageClass();
				cumS.value1 = 1;
				cumS.hidden = false;
				cumS.iconName = "Icon_Splatter";
				var pussyS:StorageClass = new StorageClass();
				pussyS.value1 = 1;
				pussyS.hidden = false;
				pussyS.iconName = "Icon_Water_Drop";
				
				// Remove any cumsoakings and pussy drenchings and replace with the new status effect
				for(var i:int = 0; i < char.statusEffects.length; i++)
				{
					trace(char.statusEffects[i].storageName);
					if (!cumUpgraded && char.statusEffects[i].storageName == "Cum Soaked"){
						var cumC:int = char.statusEffects[i].value1;
						if (cumC > 5) cumC = 5;
						cumCounter.value1 = cumC;
						char.statusEffects.removeAt(i);
						char.statusEffects.push(cumCounter.getSaveObject());
						
						if (cumC >= 5)
						{
							if(key == "PC") desc = "You’re drenched from top to bottom in a thick layer of cum! Anyone in the vicinity could smell what you've been up to, even before they catch sight of you!";
							else desc = char.capitalA + char.short + " " + (!char.isPlural ? "is" : "are") + " drenched in a thick layer of cum!";
							cumS.storageName = "Cum Drenched";
							cumS.tooltip = desc;
							cumS.iconShade = 0xF8E5FF;
							trace("Added CumDrenched to " + char.short);
						}
						else if (cumC >= 3)
						{
							if(key == "PC") desc = "You’re soaked in cum! Anyone can tell at a glance what sort of activities you’ve been engaging in!";
							else desc = char.capitalA + char.short + " " + (!char.isPlural ? "is" : "are") + " covered in cum!";
							
							cumS.storageName = "Cum Soaked";
							cumS.tooltip = desc;
							cumS.iconShade = 0xCAA9D6;
							trace("Added CumSoaked to " + char.short);
						}
						else
						{
							if(key == "PC") desc = "You’re splattered in spurts of cum! If anyone saw one of the streaks covering you, they'd immediately know what you've been up to!";
							else desc = char.capitalA + char.short + " " + (!char.isPlural ? "is" : "are") + " splattered in spurts of cum!";
							
							cumS.storageName = "Cum Splattered";
							cumS.tooltip = desc;
							cumS.iconShade = 0xB793C4;
							trace("Added CumSplattered to " + char.short);
						}
						char.statusEffects.push(cumS.getSaveObject());	
						cumUpgraded = true;
					}
					else if (!pussyUpgraded && char.statusEffects[i].storageName == "Pussy Drenched"){
						var pussyC:int = char.statusEffects[i].value1;
						if (pussyC > 5) pussyC = 5;
						pussyCounter.value1 = pussyC;
						char.statusEffects.removeAt(i);
						char.statusEffects.push(pussyCounter.getSaveObject());
						
						if (pussyC >= 5)
						{
							if(key == "PC") desc = "You’re drenched in a shiny layer of girlcum! Anyone could smell what you've been up to, even before catching sight of you!";
							else desc = char.capitalA + char.short + " " + (!char.isPlural ? "is" : "are") + " completely covered in girlcum!";
							
							pussyS.storageName = "Pussy Drenched";
							pussyS.tooltip = desc;
							pussyS.iconShade = 0xB793C4;
							trace("Added PussyDrenched to " + char.short);
						}
						else if (pussyC >= 3)
						{
							if(key == "PC") desc = "You’re soaked in girlcum! Anyone can tell at a glance what sort of activities you’ve been engaging in!";
							else desc = char.capitalA + char.short + " " + (!char.isPlural ? "is" : "are") + " covered in girlcum!";
							
							pussyS.storageName = "Pussy Soaked";
							pussyS.tooltip = desc;
							pussyS.iconShade = 0xCAA9D6;
							trace("Added PussySoaked to " + char.short);
						}
						else
						{
							if(key == "PC") desc = "You’re splattered in bursts of girlcum! If anyone saw one of the wet streaks covering you, they'd know for certain what you've been up to!";
							else desc = char.capitalA + char.short + " " + (!char.isPlural ? "is" : "are") + " splattered in bursts of girlcum!";
							
							pussyS.storageName = "Pussy Splattered";
							pussyS.tooltip = desc;
							pussyS.iconShade = 0xB793C4;
							trace("Added PussySplattered to " + char.short);
						}
						char.statusEffects.push(pussyS.getSaveObject());	
						pussyUpgraded = true;
					}
					if (cumUpgraded && pussyUpgraded) i = char.statusEffects.length;
				}
			}
			
			data.version = _newVersionValue;
			data.minVersion = _newVersionValue;
			
			return verify(data);
		}
		
		public function verify(data:Object):Boolean
		{
			if (data.version != this._newVersionValue)
			{
				throw new VersionUpgraderError("Upgrader Version 32 recieved data version " + data.version + " during a verification call. Wakka wakka.");
				return false;
			}
			
			if (data.minVersion == undefined)
			{
				trace("wat");
			}
			
			if (data.minVersion == undefined || data.minVersion != this._newVersionValue)
			{
				throw new VersionUpgraderError("MinVersion invalid!");
				return false;
			}
			
			return true;
		}
	}
}