
func int C_NpcIsEvil(var C_Npc slf)
{
	if((slf.guild == GIL_DMT) || (slf.guild == GIL_BDT) || (slf.guild == GIL_DRAGON) || (slf.guild == GIL_ORC) || (slf.aivar[AIV_MM_REAL_ID] == ID_WARG) || (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGONSNAPPER) || (slf.guild == GIL_DRACONIAN) || (slf.guild == GIL_DEMON) || (slf.guild == GIL_SUMMONED_DEMON) || C_NpcIsUndead(slf))
	{
		return TRUE;
	};
	return FALSE;
};

