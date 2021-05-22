
const int SPL_Cost_PalRepelEvil = 30;
const int SPL_Damage_PalRepelEvil = 300;

instance Spell_PalRepelEvil(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_PalRepelEvil;
};


func int Spell_Logic_PalRepelEvil(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_PalRepelEvil)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_PalRepelEvil()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_PalRepelEvil;
};

