
func void zs_dead()
{
	self.aivar[AIV_RANSACKED] = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	b_stoplookat(self);
	AI_StopPointAt(self);
	if(Npc_IsPlayer(other) && (self.aivar[AIV_VICTORYXPGIVEN] == FALSE))
	{
		b_giveplayerxp(self.level * XP_PER_VICTORY);
		self.aivar[AIV_VICTORYXPGIVEN] = TRUE;
	}
	else if((other.aivar[AIV_PARTYMEMBER] == TRUE) && ((other.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_DEMON) || (other.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_SKELETON) || (other.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_GOLEM) || (other.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_WOLF)) && (self.aivar[AIV_VICTORYXPGIVEN] == FALSE))
	{
		b_giveplayerxp(self.level * XP_PER_VICTORY);
		self.aivar[AIV_VICTORYXPGIVEN] = TRUE;
	};
	if(Npc_IsPlayer(other))
	{
		self.aivar[AIV_KILLEDBYPLAYER] = TRUE;
		if((self.guild == GIL_GIANT_BUG) && (MIS_FESTER_KILLBUGS == LOG_RUNNING))
		{
			FESTERS_GIANT_BUG_KILLED = FESTERS_GIANT_BUG_KILLED + 1;
		};
	};
	b_givetradeinv(self);
	b_givedeathinv(self);
	b_clearruneinv(self);
	b_deletepetzcrime(self);
	self.aivar[AIV_NPCSAWPLAYERCOMMIT] = CRIME_NONE;
	AI_UnequipWeapons(self);
	b_dragonkillcounter(self);
};

