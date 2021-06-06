/***********************************\
             FOCUSNAMES
\***********************************/

func int Focusnames_Color_Friendly() {
    return RGBA(100,   255, 100,   255); // Grün
};

func int Focusnames_Color_Neutral() {
    return RGBA(255, 255, 255, 255); // Weiß
};

func int Focusnames_Color_Angry() {
    return RGBA(255, 180, 100,   255); // Orange
};

func int Focusnames_Color_Hostile() {
    return RGBA(255, 100,   100,   255); // Rot
};

func int Focusnames_Color_Dead() {
    return RGBA(150, 150, 150, 255); // Gray
};

//========================================
// [intern] Färben der Namen
//========================================
func void _Focusnames() {
    var int col; col = -1; // Stupid pseudo-locals
    var oCNpc her; her = Hlp_GetNpc(hero);
    var int portalguild; portalguild = Wld_GetPlayerPortalGuild();
	if(Hlp_Is_oCNpc(her.focus_vob))
  {
		var c_npc oth; oth = MEM_PtrToInst(her.focus_vob);
		var int att; att = Npc_GetPermAttitude(hero, oth);

    if(Npc_IsDead(oth))
    {
      col = Focusnames_Color_Dead();
    }
		else if     (att == ATT_FRIENDLY) { col = Focusnames_Color_Friendly(); }
		else if(att == ATT_NEUTRAL)  { col = Focusnames_Color_Neutral();  }
		else if(att == ATT_ANGRY)    { col = Focusnames_Color_Angry();    }
		else if(att == ATT_HOSTILE)  { col = Focusnames_Color_Hostile();  };

	}
	else if(Hlp_Is_oCItem(her.focus_vob)) {
		var c_item itm; itm = MEM_PtrToInst(her.focus_vob);
  	//if(portalguild > GIL_NONE && her.guild != portalguild && Wld_GetGuildAttitude(her.guild,portalguild) != ATT_FRIENDLY && ((itm.flags & ITEM_DROPPED) != ITEM_DROPPED))
    if(portalguild > GIL_NONE && ((itm.flags & ITEM_DROPPED) != ITEM_DROPPED))
    {
  		col = Focusnames_Color_Hostile();
  	};

	// Setze col = RGBA(.., .., .., ..); um die Farbe einzustellen
	}
  else if(Hlp_Is_oCMobContainer(her.focus_vob))
  {
    var oCMobContainer container; container = MEM_PtrToInst(her.focus_vob);
    //container._oCMob_owner != 0 ||
    //if((portalguild > GIL_NONE && her.guild != portalguild && Wld_GetGuildAttitude(her.guild,portalguild) != ATT_FRIENDLY))
    if(portalguild > GIL_NONE)
    {
      col = Focusnames_Color_Hostile();
    };
  }
	else
  {
		col = Focusnames_Color_Neutral();
	};

    var int ptr; ptr = MEM_Alloc(4);
    MEM_WriteInt(ptr, col);
    CALL_IntParam(ptr);
    CALL__thiscall(MEM_ReadInt(screen_offset), zCView__SetFontColor);
    MEM_Free(ptr);
};
