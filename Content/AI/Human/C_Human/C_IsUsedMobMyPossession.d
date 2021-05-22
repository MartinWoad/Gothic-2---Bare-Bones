
func int C_IsUsedMobMyPossession(var C_Npc slf,var C_Npc oth)
{
	if(Npc_IsDetectedMobOwnedByNpc(other,self))
	{
		return TRUE;
	};
	if(C_NpcIsBotheredByPlayerRoomGuild(self) || (Wld_GetPlayerPortalGuild() == GIL_PUBLIC))
	{
		return TRUE;
	};
	if(Wld_GetGuildAttitude(slf.guild,oth.guild) == ATT_FRIENDLY)
	{
		return TRUE;
	};
	return FALSE;
};

