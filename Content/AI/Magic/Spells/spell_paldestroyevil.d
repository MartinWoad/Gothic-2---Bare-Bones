
const int SPL_Cost_PalDestroyEvil = 60;
const int SPL_Damage_PalDestroyEvil = 600;

instance Spell_PalDestroyEvil(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_PalDestroyEvil;
	spellType = SPELL_NEUTRAL;
};


func int Spell_Logic_PalDestroyEvil(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_PalDestroyEvil)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_PalDestroyEvil()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_PalDestroyEvil;
};

