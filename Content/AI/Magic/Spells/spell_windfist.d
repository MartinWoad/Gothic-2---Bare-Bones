
const int SPL_Cost_WindFist = 50;
const int SPL_Damage_Windfist = 20;

instance Spell_WindFist(C_Spell_Proto)
{
	time_per_mana = 200;
	damage_per_level = SPL_Damage_Windfist;
	damagetype = DAM_FLY;
	targetCollectAlgo = TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetCollectRange = 1200;
	targetCollectType = TARGET_TYPE_NPCS;
};


func int Spell_Logic_WindFist(var int manaInvested)
{
	if(manaInvested == 0)
	{
		return SPL_FORCEINVEST + ((SPL_COST_ChargeFireball * 2) / 10);
	};
	if((manaInvested == ((SPL_Cost_WindFist * 4) / 10)) || (manaInvested == ((SPL_Cost_WindFist * 6) / 10)) || (manaInvested == ((SPL_Cost_WindFist * 7) / 10)))
	{
		return SPL_NEXTLEVEL;
	};
	if(manaInvested >= SPL_Cost_WindFist)
	{
		return SPL_DONTINVEST;
	};
	return SPL_RECEIVEINVEST;
};

