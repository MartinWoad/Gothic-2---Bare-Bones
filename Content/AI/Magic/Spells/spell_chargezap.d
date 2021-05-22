
const int SPL_COST_ChargeZap = 60;
const int SPL_Damage_ChargeZap = 60;

instance Spell_ChargeZap(C_Spell_Proto)
{
	time_per_mana = 100;
	damage_per_level = SPL_Damage_ChargeZap;
	damagetype = DAM_MAGIC;
	canTurnDuringInvest = TRUE;
};


func int Spell_Logic_ChargeZap(var int manaInvested)
{
	if(manaInvested == 0)
	{
		return SPL_FORCEINVEST + ((SPL_COST_ChargeZap * 3) / 10);
	};
	if((manaInvested == ((SPL_COST_ChargeZap * 5) / 10)) || (manaInvested == ((SPL_COST_ChargeZap * 7) / 10)) || (manaInvested == ((SPL_COST_ChargeZap * 9) / 10)))
	{
		return SPL_NEXTLEVEL;
	};
	if(manaInvested >= SPL_COST_ChargeZap)
	{
		return SPL_DONTINVEST;
	};
	return SPL_RECEIVEINVEST;
};

