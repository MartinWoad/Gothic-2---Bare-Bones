
func int C_NpcIsUndead(var C_Npc slf)
{
	if((slf.guild == GIL_GOBBO_SKELETON) || (slf.guild == GIL_SUMMONED_GOBBO_SKELETON) || (slf.guild == GIL_SKELETON) || (slf.guild == GIL_SUMMONED_SKELETON) || (slf.guild == GIL_SKELETON_MAGE) || (slf.guild == GIL_ZOMBIE) || (slf.guild == GIL_SHADOWBEAST_SKELETON) || (slf.guild == GIL_UNDEADORC))
	{
		return TRUE;
	};
	return FALSE;
};
