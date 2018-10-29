import classes.ItemSlotClass;

public function useWashingMachine():void{
	clearOutput();
	clearMenu();
	showBust("");
	showName("REPAIR\nMACHINE");
	
	output("Select an item for cleaning and repairing.\n");
	
	var items:Array = getListOfType(pc.inventory, "WARDROBE");
	items.push(pc.armor);
	items.push(pc.upperUndergarment);
	items.push(pc.lowerUndergarment);
	
	var i:int = 0;	
	var j:int = 0;
	var maxPerPage:int = 10;
	var pgIdx:int = 0;
	
	for (i = 0; i < items.length; i++)
	{
		if (items[i].statusEffects.length > 0)
		{
			var btnIdx:int = j % maxPerPage;
			pgIdx = j / maxPerPage;
			var pgOset:int = 15 * pgIdx;
			addOverrideItemButton((btnIdx + pgOset), items[i], items[i].shortName, washItem, items[i]);
			j++;
		}
	}
	addButton(14,"Back",leaveWashingMachine);
}

public function leaveWashingMachine():void 
{
	if(InShipInterior()) shipStorageMenuRoot();
	else mainGameMenu();
}

public function washItem(item:ItemSlotClass):void
{
	clearOutput();
	clearMenu();
	
	output("You dump the " + item.longName + " into the machine, close the door and tap the button on the front.\nWith a beep it springs into life, whirring, its interior swirling rapidly until with a ding, the door pops open and you're able to examine it's handywork.\n\n");
	
	if (item.hasStatusEffect("Milk-Soaked Clothing"))
	{
		output("The milk has been washed off.\n");
		item.removeStatusEffect("Milk-Soaked Clothing");
	}
	if (item.hasStatusEffect("Cum-Soaked Clothing"))
	{
		output("The cum has been washed off.\n");
		item.removeStatusEffect("Cum-Soaked Clothing");
	}
	if (item.hasStatusEffect("Pussy-Soaked Clothing"))
	{
		output("The girlcum has been washed off.\n");
		item.removeStatusEffect("Pussy-Soaked Clothing");
	}
	if (item.hasStatusEffect("Sweat-Soaked Clothing"))
	{
		output("The sweat has been washed off.\n");
		item.removeStatusEffect("Sweat-Soaked Clothing");
	}
	if (item.hasStatusEffect("Damp Clothing"))
	{
		output("The dampness has been washed off.\n");
		item.removeStatusEffect("Damp Clothing");
	}
	
	addButton(0,"Okay",useWashingMachine);
}