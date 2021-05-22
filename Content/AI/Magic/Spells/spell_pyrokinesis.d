
const int SPL_COST_Firestorm = 125;
const int SPL_Damage_Firestorm = 100;
const int SPL_PYRO_DAMAGE_PER_SEC = 20;

instance Spell_Pyrokinesis(C_Spell_Proto)
{
	time_per_mana = 120;
	damage_per_level = SPL_Damage_Firestorm;
	damagetype = DAM_FIRE;
};


func int Spell_Logic_Pyrokinesis(var int manaInvested)
{
	if(manaInvested >= SPL_COST_Firestorm)
	{
		return SPL_DONTINVEST;
	};
	if((manaInvested == ((SPL_COST_Firestorm * 3) / 10)) || (manaInvested == ((SPL_COST_Firestorm * 5) / 10)) || (manaInvested == ((SPL_COST_Firestorm * 8) / 10)))
	{
		return SPL_NEXTLEVEL;
	};
	if(manaInvested >= SPL_COST_Firestorm)
	{
		return SPL_SENDCAST;
	};
	return SPL_RECEIVEINVEST;
};

func void Spell_Cast_Pyrokinesis(var int spellLevel)
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - (spellLevel * SPL_COST_Firestorm);
};

