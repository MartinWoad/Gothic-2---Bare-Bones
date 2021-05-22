
const int SPL_Cost_Firerain = 60;
const int SPL_Damage_FireRain = 300;

instance Spell_FireRain(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_FireRain;
	damagetype = DAM_FIRE;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int Spell_Logic_Firerain(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_Firerain)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Firerain()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Firerain;
};

