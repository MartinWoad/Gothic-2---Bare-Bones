
func int B_AssessEnemy()
{
	var C_Npc pcl;
	pcl = Hlp_GetNpc(PC_Levelinspektor);
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(pcl))
	{
		return FALSE;
	};
	if(Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT)
	{
		return FALSE;
	};
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(Npc_GetDistToNpc(self,other) > PERC_DIST_ACTIVE_MAX)
		{
			return FALSE;
		};
		if(!Npc_CanSeeNpc(self,other))
		{
			return FALSE;
		};
	};
	if(((self.aivar[AIV_EnemyOverride] == TRUE) || (other.aivar[AIV_EnemyOverride] == TRUE)) && (other.guild < GIL_SEPERATOR_HUM))
	{
		return FALSE;
	};
	if(Npc_GetAttitude(self,other) != ATT_HOSTILE)
	{
		return FALSE;
	};
	if(C_NpcIsGateGuard(self))
	{
		return FALSE;
	};
	if(Npc_IsPlayer(other) && (self.npcType == NPCTYPE_FRIEND))
	{
		return FALSE;
	};
	if(Wld_GetGuildAttitude(self.guild,other.guild) != ATT_HOSTILE)
	{
		if((self.aivar[AIV_LastPlayerAR] == AR_GuildEnemy) || (self.aivar[AIV_LastPlayerAR] == AR_MonsterVsHuman) || (self.aivar[AIV_LastPlayerAR] == AR_MonsterMurderedHuman) || (self.aivar[AIV_LastPlayerAR] == AR_MonsterCloseToGate) || (self.aivar[AIV_LastPlayerAR] == AR_GuardCalledToKill))
		{
			B_SetAttitude(self,Wld_GetGuildAttitude(self.guild,other.guild));
			self.aivar[AIV_LastPlayerAR] = AR_NONE;
			return FALSE;
		};
		if((Npc_GetAttitude(self,other) == ATT_HOSTILE) && ((Npc_GetStateTime(self) > 2) || Npc_IsInState(self,ZS_ObservePlayer)) && (Npc_GetDistToNpc(self,other) <= PERC_DIST_INTERMEDIAT))
		{
			B_Attack(self,other,self.aivar[AIV_LastPlayerAR],0);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	B_Attack(self,other,AR_GuildEnemy,0);
	return TRUE;
};

