
const int SPL_Cost_DESTROYUNDEAD = 40;
const int SPL_Damage_DESTROYUNDEAD = 1000;

instance Spell_DestroyUndead(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_DESTROYUNDEAD;
	spellType = SPELL_NEUTRAL;
};


func int Spell_Logic_DestroyUndead(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_DESTROYUNDEAD)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_DestroyUndead()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_DESTROYUNDEAD;
};

