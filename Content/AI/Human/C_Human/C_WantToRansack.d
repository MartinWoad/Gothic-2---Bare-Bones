
func int C_WantToRansack(var C_Npc slf)
{
	if((slf.npcType == NPCTYPE_FRIEND) && Npc_IsPlayer(other))
	{
		return FALSE;
	};
	if((slf.guild == GIL_DMT) || (slf.guild == GIL_ORC) || (slf.guild == GIL_PAL) || (slf.guild == GIL_KDF) || (slf.guild == GIL_NOV))
	{
		return FALSE;
	};
	return TRUE;
};

