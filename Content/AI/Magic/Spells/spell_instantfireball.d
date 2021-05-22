
const int SPL_COST_InstantFireball = 10;
const int SPL_DAMAGE_InstantFireball = 60;

instance Spell_InstantFireball(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_InstantFireball;
	damagetype = DAM_FIRE;
};


func int Spell_Logic_InstantFireball(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_InstantFireball)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_InstantFireball()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_InstantFireball;
};

