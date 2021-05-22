
const int SPL_Cost_BreathOfDeath = 50;
const int SPL_Damage_BreathOfDeath = 500;

instance Spell_BreathOfDeath(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_BreathOfDeath;
};


func int Spell_Logic_BreathOfDeath(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_BreathOfDeath)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_BreathOfDeath(var int spellLevel)
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_BreathOfDeath;
};

