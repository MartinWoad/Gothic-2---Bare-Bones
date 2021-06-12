
func void B_MagicHurtNpc(var C_Npc attacker,var int damage)
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,-damage);
	if(Npc_IsDead(self))
	{
		if(Npc_IsPlayer(other))
		{
			if(self.guild < GIL_SEPERATOR_HUM && self.guild != GIL_BDT && self.guild != GIL_DMT && self.aivar[AIV_ATTACKREASON] != AR_KILL && self.aivar[AIV_ATTACKREASON] != AR_GuildEnemy && Hlp_GetInstanceID(Cornelius) != Hlp_GetInstanceID(self))
			{
				heroMurders += 1;
				PrintS_Ext("Zamordowa³eœ niewinnego cz³owieka!", RGBA(255, 100, 100, 255));
			};
		};

		if(Npc_IsPlayer(other) && (self.aivar[AIV_VictoryXPGiven] == FALSE))
		{
			B_GivePlayerXP(self.level * XP_PER_VICTORY);
			self.aivar[AIV_VictoryXPGiven] = TRUE;
		};

	};
};
