
const int SPL_COST_ChargeFireball = 75;
const int SPL_Damage_ChargeFireball = 100;

instance Spell_ChargeFireball(C_Spell_Proto)
{
	time_per_mana = 120;
	damage_per_level = SPL_Damage_ChargeFireball;
	damagetype = DAM_FIRE;
	canTurnDuringInvest = TRUE;
};


func int Spell_Logic_ChargeFireball(var int manaInvested)
{
	if(manaInvested == 0)
	{
		return SPL_FORCEINVEST + ((SPL_COST_ChargeFireball * 2) / 10);
	};
	if((manaInvested == ((SPL_COST_ChargeFireball * 3) / 10)) || (manaInvested == ((SPL_COST_ChargeFireball * 5) / 10)) || (manaInvested == ((SPL_COST_ChargeFireball * 8) / 10)))
	{
		return SPL_NEXTLEVEL;
	};
	if(manaInvested >= SPL_COST_ChargeFireball)
	{
		return SPL_DONTINVEST;
	};
	return SPL_RECEIVEINVEST;
};

