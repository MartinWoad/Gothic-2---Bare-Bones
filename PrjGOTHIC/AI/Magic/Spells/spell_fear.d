
const int SPL_COST_FEAR = 15;
const int SPL_TIME_FEAR = 5;

instance SPELL_FEAR(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = 0;
	targetcollectalgo = TARGET_COLLECT_NONE;
};


func int spell_logic_fear(var int manainvested)
{
	if((PLAYER_TALENT_RUNES[SPL_FEAR] == FALSE) && Npc_IsPlayer(self))
	{
		return SPL_SENDSTOP;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_FEAR)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_fear()
{
	AI_SetNpcsToState(self,zs_magicflee,1000);
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_FEAR;
};

