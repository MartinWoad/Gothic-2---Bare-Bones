
func void B_MagicHurtNpc(var C_Npc attacker,var int damage)
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,-damage);
	if(Npc_IsDead(self))
	{
		if(Npc_IsPlayer(other) && (self.aivar[AIV_VictoryXPGiven] == FALSE))
		{
			B_GivePlayerXP(self.level * XP_PER_VICTORY);
			self.aivar[AIV_VictoryXPGiven] = TRUE;
		};
	};
};

