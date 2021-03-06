
const int SPL_Cost_PalHolyBolt = 15;
const int SPL_Damage_PalHolyBolt = 150;

instance Spell_PalHolyBolt(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_PalHolyBolt;
};


func int Spell_Logic_PalHolyBolt(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_PalHolyBolt)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_PalHolyBolt()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_PalHolyBolt;
};

