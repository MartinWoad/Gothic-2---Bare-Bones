
const int SPL_Cost_InstantFireStorm = 20;
const int SPL_Damage_InstantFireStorm = 60;

instance Spell_Firestorm(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_InstantFireStorm;
	damagetype = DAM_FIRE;
};


func int Spell_Logic_Firestorm(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_InstantFireStorm)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Firestorm()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_InstantFireStorm;
};

