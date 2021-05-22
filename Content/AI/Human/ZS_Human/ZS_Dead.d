
func void ZS_Dead()
{
	self.aivar[AIV_RANSACKED] = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	B_StopLookAt(self);
	AI_StopPointAt(self);
	if(Npc_IsPlayer(other) && (self.aivar[AIV_VictoryXPGiven] == FALSE))
	{
		B_GivePlayerXP(self.level * XP_PER_VICTORY);
		self.aivar[AIV_VictoryXPGiven] = TRUE;
	}
	else if((other.aivar[AIV_PARTYMEMBER] == TRUE) && ((other.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_DEMON) || (other.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_SKELETON) || (other.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_GOLEM) || (other.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_WOLF)) && (self.aivar[AIV_VictoryXPGiven] == FALSE))
	{
		B_GivePlayerXP(self.level * XP_PER_VICTORY);
		self.aivar[AIV_VictoryXPGiven] = TRUE;
	};
	if(Npc_IsPlayer(other))
	{
		self.aivar[AIV_KilledByPlayer] = TRUE;
		if((self.guild == GIL_GIANT_BUG) && (MIS_Fester_KillBugs == LOG_Running))
		{
			Festers_Giant_Bug_Killed = Festers_Giant_Bug_Killed + 1;
		};
	};
	B_GiveTradeInv(self);
	B_GiveDeathInv(self);
	B_ClearRuneInv(self);
	B_DeletePetzCrime(self);
	self.aivar[AIV_NpcSawPlayerCommit] = CRIME_NONE;
	AI_UnequipWeapons(self);
	B_DragonKillCounter(self);
};

