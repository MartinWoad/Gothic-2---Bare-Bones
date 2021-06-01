
func void Hook_oCNpc__DoTakeVob()
{
	const int oCNpc__DoTakeVob = 7621056; //0x7449C0
	HookEngineF (oCNpc__DoTakeVob, 6, EVT_NpcTakeVob);
};

func void EVT_NpcTakeVob()
{
	var c_npc slf; slf = MEM_PtrToInst(ECX);
	var C_ITEM itm; itm = MEM_PtrToInst(MEM_ReadInt(ESP + 4));
  var oCNpc her; her = Hlp_GetNpc(hero);
  var int portalguild; portalguild = Wld_GetPlayerPortalGuild();

	if (!Hlp_IsValidItem(itm))
	{
		PrintS_Ext("oCNpc Hook Error: Invalid Item", RGBA(255, 100, 100, 255));
		return;
	};
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(hero))
	{
  	if(portalguild > GIL_NONE && her.guild != portalguild && Wld_GetGuildAttitude(her.guild,portalguild) != ATT_FRIENDLY && ((itm.flags & ITEM_DROPPED) != ITEM_DROPPED))
  	{
      // Add to stolen goods if an item is owner by someone
  		heroThefts += itm.value;
      //PrintScreen(ConcatStrings("Ukrad³eœ ", itm.name), -1, -1, FONT_ScreenSmall, 2);
			PrintS_Ext(ConcatStrings("Ukrad³eœ: ", itm.name), RGBA(255, 100, 100, 255));
  	}
    else
    {
      //PrintScreen(ConcatStrings("Podnios³eœ ", itm.name), -1, -1, FONT_ScreenSmall, 2);
			PrintS_Ext(ConcatStrings("Podnios³eœ: ", itm.name), RGBA(255, 255, 255, 255));
    };
	};
};
