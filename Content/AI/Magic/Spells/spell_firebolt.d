
const int SPL_Cost_Firebolt = 5;
const int SPL_Damage_Firebolt = 30;

instance Spell_Firebolt(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_Firebolt;
	damagetype = DAM_FIRE;
};


func int Spell_Logic_Firebolt(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_Firebolt)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Firebolt()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Firebolt;
};

