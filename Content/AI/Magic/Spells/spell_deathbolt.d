
const int SPL_COST_Deathbolt = 5;
const int SPL_DAMAGE_Deathbolt = 100;

instance Spell_Deathbolt(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_Deathbolt;
	damagetype = DAM_FIRE;
};


func int Spell_Logic_Deathbolt(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_Deathbolt)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Deathbolt()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_Deathbolt;
};
