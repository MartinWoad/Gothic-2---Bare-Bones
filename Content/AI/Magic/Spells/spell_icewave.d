
const int SPL_Cost_IceWave = 60;

instance Spell_IceWave(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = 60;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int Spell_Logic_IceWave(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_IceWave)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_IceWave()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_IceWave;
};

