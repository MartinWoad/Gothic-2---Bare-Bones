
const int SPL_Cost_MassDeath = 150;
const int SPL_Damage_MassDeath = 400;

instance Spell_MassDeath(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_MassDeath;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int Spell_Logic_Massdeath(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_MassDeath)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Massdeath()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_MassDeath;
};

