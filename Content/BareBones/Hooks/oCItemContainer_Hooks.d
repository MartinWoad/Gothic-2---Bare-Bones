var string lastTransferedItemName;

func void Hook_oCItemContainer__Remove()
{
	//const int oCMobContainer__Remove = 7495808; //0x0726080
	//HookEngineF (oCMobContainer__Remove, 10, EVT_MobContainerRemove);
	//const int oCMobContainer__Remove2 = 7495664; //0x0725FF0
	//HookEngineF (oCMobContainer__Remove2, 6, EVT_MobContainerRemove);
	lastTransferedItemName = "";
	const int oCItemContainer__Remove = 7378144; //0x07094E0
	HookEngineF (oCItemContainer__Remove, 6, EVT_ItemContainerRemove);
	//const int oCItemContainer__Remove2 = 7378128; //0x07094D0
	//HookEngineF (oCItemContainer__Remove2, 6, EVT_MobContainerRemove);

	//const int oCItemContainer__Remove3 = 7378144; //0x07094E0
	//HookEngineF (oCItemContainer__Remove3, 6, EVT_MobContainerRemove);

	//const int oCNpc__DoTakeVob = 7621056; //0x7449C0
	//HookEngineF (oCNpc__DoTakeVob, 6, EVT_MobContainerRemove);
};

func void EVT_ItemContainerRemove()
{
	//Get caller oCItemContainer pointer
	var int itemContainerPtr; itemContainerPtr = MEM_ReadInt(ECX);

	const int oCItemContainer__GetTransferCount = 7360816; //0x0705130
	var oCItem itm; itm = MEM_PtrToInst(MEM_ReadInt(ESP + 4));
  var oCNpc her; her = Hlp_GetNpc(hero);
	var oCMobContainer container;
  var int portalguild; portalguild = Wld_GetPlayerPortalGuild();

	// Call GetTransferCount
	CALL__thiscall(MEM_ReadInt(ECX), oCItemContainer__GetTransferCount);
	// Pull transferCount from the stack
	var int transferCount ;
	transferCount = MEM_ReadShort(ESP + 8);

	if (!Hlp_IsValidItem(itm))
	{
		PrintS_Ext("oCItemContainer Hook Error: Invalid Item", RGBA(255, 100, 100, 255));
		return;
	};

	if(Hlp_Is_oCMobContainer(her.focus_vob))
  {
	  container = MEM_PtrToInst(her.focus_vob);

		//Get oCItemContainer from player
		var int itemContainerPlayerPtr; itemContainerPlayerPtr = her.inventory2_vtbl - 1640 + 1024; // 0x0668 - oCNpc::oCItemContainer*
		//var int itemContainerPlayerPtr; itemContainerPlayerPtr = _@(her.inventory2_vtbl);

		var C_Npc owner; owner = Hlp_GetNpc(PC_Hero);
		//if(itm.owner != 0)
		//{
		//	owner = MEM_PtrToInst(itm.owner);
		//};

		//PrintS_Ext(ConcatStrings("Twój ekwipunek: ", IntToString(itemContainerPlayerPtr)), RGBA(255, 255, 255, 255));
		//PrintS_Ext(ConcatStrings("Wykonuj¹cy ekwipunek: ", IntToString(itemContainerPtr)), RGBA(255, 255, 255, 255));

		// Compare pointers to see if player is looking at the same oCItemContainer as caller oCItemContainer
		if(itemContainerPlayerPtr == itemContainerPtr)
		{
				if(!Npc_OwnedByNpc(itm,owner) && portalguild > GIL_NONE && her.guild != portalguild && Wld_GetGuildAttitude(her.guild,portalguild) != ATT_FRIENDLY)
			  {
			    // Add to stolen goods if an item is owner by someone
					heroThefts += itm.value * transferCount;
					//PrintScreen(ConcatStrings("Ukrad³eœ ", itm.name), -1, -1, FONT_ScreenSmall, 2);
					if(STR_Compare(lastTransferedItemName, itm.name) != 0)
					{
						PrintS_Ext(ConcatStrings("Ukrad³eœ: ", itm.name), RGBA(255, 100, 100, 255));
						//PrintS_Ext(ConcatStrings("Ukrad³eœ ³¹cznie: ", IntToString(heroThefts)), RGBA(255, 100, 100, 255));
					};
			  }
			  else
			  {
			    //PrintScreen(ConcatStrings("Zdoby³eœ ", itm.name), -1, -1, FONT_ScreenSmall, 2);
					if(STR_Compare(lastTransferedItemName, itm.name) != 0)
					{
						PrintS_Ext(ConcatStrings("Zdoby³eœ: ", itm.name), RGBA(255, 255, 255, 255));
					};
			  };
				lastTransferedItemName = itm.name;
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
	var int itemContainerPtr; itemContainerPtr = MEM_ReadInt(ECX);
	var C_Item itm; itm = MEM_PtrToInst(MEM_ReadInt(ESP + 4));
  var oCNpc her; her = Hlp_GetNpc(hero);
	var oCMobContainer container;
  var int portalguild; portalguild = Wld_GetPlayerPortalGuild();

  //PrintScreen("Debug", -1, -1, FONT_ScreenSmall, 2);
	//PrintS_Ext("oCItemContainer Hook Debug: Insert Item", RGBA(255, 255, 255, 255));

	if (!Hlp_IsValidItem(itm))
	{
    //PrintScreen("Invalid Item", -1, -1, FONT_ScreenSmall, 2);
		PrintS_Ext("oCItemContainer Hook Error: Invalid Item", RGBA(255, 100, 100, 255));
		return;
	};

	if(Hlp_Is_oCMobContainer(her.focus_vob))
  {
	  container = MEM_PtrToInst(her.focus_vob);

		//Get oCItemContainer from player
		var int itemContainerPlayerPtr; itemContainerPlayerPtr = her.inventory2_vtbl - 1640 + 1024; // 0x0668 - oCNpc::oCItemContainer*

		if(itemContainerPlayerPtr == itemContainerPtr)
		{
				if(container._oCMob_owner != 0 || (portalguild > GIL_NONE && her.guild != portalguild && Wld_GetGuildAttitude(her.guild,portalguild) != ATT_FRIENDLY))
				{
						//C_Npc pchero; pchero = Hlp_GetNpc(PC_Hero);
						itm.owner = PC_Hero;
				};
				PrintS_Ext(ConcatStrings("Od³o¿y³eœ: ", itm.name), RGBA(255, 255, 255, 255));
		};
	};
};
