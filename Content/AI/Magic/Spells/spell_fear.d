
const int SPL_Cost_Fear = 15;
const int SPL_TIME_Fear = 5;

instance Spell_Fear(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = 0;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int Spell_Logic_Fear(var int manaInvested)
{
	if((PLAYER_TALENT_RUNES[SPL_Fear] == FALSE) && Npc_IsPlayer(self))
	{
		return SPL_SENDSTOP;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_Fear)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Fear()
{
	AI_SetNpcsToState(self,ZS_MagicFlee,1000);
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Fear;
};

