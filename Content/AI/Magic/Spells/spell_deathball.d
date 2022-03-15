
const int SPL_COST_Deathball = 5;
const int SPL_DAMAGE_Deathball = 80;

instance Spell_Deathball(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_Deathball;
	damagetype = DAM_FIRE;
};


func int Spell_Logic_Deathball(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_Deathball)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Deathball()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_Deathball;
};
