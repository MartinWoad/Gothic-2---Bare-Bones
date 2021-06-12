var string lastTransferedItemName;
var string lastInsertedItemName;

func void Hook_oCItemContainer__Remove()
{

	lastTransferedItemName = "";
	lastInsertedItemName = "";

	const int oCItemContainer__Remove = 7378144; //0x07094E0
	HookEngineF (oCItemContainer__Remove, 6, EVT_ItemContainerRemove);

	//const int oCItemContainer__Remove2 = 7378128; //0x07094D0
	//HookEngineF (oCItemContainer__Remove2, 6, EVT_ItemContainerRemove);

	//const int oCItemContainer__Remove3 = 7377968; //0x0709430
	//HookEngineF (oCItemContainer__Remove3, 6, EVT_ItemContainerRemove);

};

func void EVT_ItemContainerRemove()
{
	//Get caller oCItemContainer pointer
	var int itemContainerCallerPtr; itemContainerCallerPtr = ECX;

	const int oCItemContainer__GetTransferCount = 7360816; //0x0705130
	var oCItem itm; itm = MEM_PtrToInst(MEM_ReadInt(ESP + 4));
  var oCNpc her; her = Hlp_GetNpc(hero);
	var oCMobContainer container;
  var int portalguild; portalguild = Wld_GetPlayerPortalGuild();

	// Call GetTransferCount
	CALL__thiscall(MEM_ReadInt(ECX), oCItemContainer__GetTransferCount);
	// Pull transferCount from the stack
	var int transferCount; transferCount = MEM_ReadShort(ESP + 8);

	if (!Hlp_IsValidItem(itm))
	{
		PrintS_Ext("oCItemContainer Hook Error: Invalid Item", RGBA(255, 100, 100, 255));
		return;
	};

	if(Hlp_Is_oCMobContainer(her.focus_vob))
  {
	  container = MEM_PtrToInst(her.focus_vob);

		//Get oCItemContainer from chest
		var int itemContainerChestPtr; itemContainerChestPtr = container.items;

		// Compare pointers to see if player is looking at the same oCItemContainer as caller oCItemContainer
		if(itemContainerChestPtr == itemContainerCallerPtr)
		{
				if(portalguild > GIL_NONE)
				{
			    // Add to stolen goods if an item is owner by someone
					heroThefts += itm.value * transferCount;
					if(STR_Compare(lastTransferedItemName, itm.name) != 0)
					{
						PrintS_Ext(ConcatStrings("Ukrad³eœ: ", itm.name), RGBA(255, 100, 100, 255));
						//PrintS_Ext(ConcatStrings("Ukrad³eœ ³¹cznie: ", IntToString(heroThefts)), RGBA(255, 100, 100, 255));
					};
			  }
			  else
			  {
					if(STR_Compare(lastTransferedItemName, itm.name) != 0)
					{
						PrintS_Ext(ConcatStrings("Zdoby³eœ: ", itm.name), RGBA(255, 255, 255, 255));
					};
			  };
				lastTransferedItemName = itm.name;
				lastInsertedItemName = "";
		};
	}
	else if(Hlp_Is_oCNpc(her.focus_vob))
	{
		var C_Npc npc; npc = MEM_PtrToInst(her.focus_vob);

		if((Npc_GetBodyState(npc) == BS_UNCONSCIOUS) || (Npc_GetBodyState(npc) ==  BS_DEAD) || (npc.attribute[ATR_HITPOINTS] <= 1) || npc.aivar[AIV_RANSACKED] == TRUE)
		{
			if(npc.guild < GIL_SEPERATOR_HUM && npc.guild != GIL_BDT && npc.guild != GIL_DMT && npc.aivar[AIV_ATTACKREASON] != AR_KILL && npc.aivar[AIV_ATTACKREASON] != AR_GuildEnemy && Hlp_GetInstanceID(Cornelius) != Hlp_GetInstanceID(npc) && !Npc_IsDead(npc))
			{
				// Add to stolen goods if an npc is innocent and not dead
				heroThefts += itm.value * transferCount;
				if(STR_Compare(lastTransferedItemName, itm.name) != 0)
				{
					PrintS_Ext(ConcatStrings("Ukrad³eœ: ", itm.name), RGBA(255, 100, 100, 255));
					//PrintS_Ext(ConcatStrings("Ukrad³eœ ³¹cznie: ", IntToString(heroThefts)), RGBA(255, 100, 100, 255));
				};
			}
			else
			{
				if(STR_Compare(lastTransferedItemName, itm.name) != 0)
				{
					PrintS_Ext(ConcatStrings("Zabra³eœ: ", itm.name), RGBA(255, 255, 255, 255));
				};
			};
			lastTransferedItemName = itm.name;
			lastInsertedItemName = "";
		};
	};
};

func void Hook_oCItemContainer__Insert()
{
	const int oCMobContainer__Insert = 7377760; //0x0709360
	HookEngineF (oCMobContainer__Insert, 8, EVT_ItemContainerInsert);
};

func void EVT_ItemContainerInsert()
{
	var int itemContainerCallerPtr; itemContainerCallerPtr = ECX;
	const int oCItemContainer__GetTransferCount = 7360816; //0x0705130
	var C_Item itm; itm = MEM_PtrToInst(MEM_ReadInt(ESP + 4));
  var oCNpc her; her = Hlp_GetNpc(hero);
	var oCMobContainer container;
  var int portalguild; portalguild = Wld_GetPlayerPortalGuild();

	// Call GetTransferCount
	CALL__thiscall(MEM_ReadInt(ECX), oCItemContainer__GetTransferCount);
	// Pull transferCount from the stack
	var int transferCount; transferCount = MEM_ReadShort(ESP + 8);

	if (!Hlp_IsValidItem(itm))
	{
		PrintS_Ext("oCItemContainer Hook Error: Invalid Item", RGBA(255, 100, 100, 255));
		return;
	};

	if(Hlp_Is_oCMobContainer(her.focus_vob))
  {
	  container = MEM_PtrToInst(her.focus_vob);

		//Get oCItemContainer from chest
		var int itemContainerChestPtr; itemContainerChestPtr = container.items;

		if(itemContainerChestPtr == itemContainerCallerPtr)
		{
				if(portalguild > GIL_NONE)
				{
						heroThefts -= itm.value * transferCount;
						if(STR_Compare(lastinsertedItemName, itm.name) != 0)
						{
							PrintS_Ext(ConcatStrings("Od³o¿y³eœ: ", itm.name), RGBA(100, 255, 100, 255));
						};
				}
				else
				{
					if(STR_Compare(lastInsertedItemName, itm.name) != 0)
					{
						PrintS_Ext(ConcatStrings("Od³o¿y³eœ: ", itm.name), RGBA(255, 255, 255, 255));
					};
				};
				lastInsertedItemName = itm.name;
				lastTransferedItemName = "";
		};
	};
};
