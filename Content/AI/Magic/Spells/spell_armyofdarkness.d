
const int SPL_Cost_ArmyOfDarkness = 60;

instance Spell_ArmyOfDarkness(C_Spell_Proto)
{
	time_per_mana = 0;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int Spell_Logic_ArmyOfDarkness(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_ArmyOfDarkness)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_ArmyOfDarkness(var int spellLevel)
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_ArmyOfDarkness;
	if(Npc_IsPlayer(self))
	{
		Wld_SpawnNpcRange(self,Summoned_Skeleton,6,800);
	}
	else
	{
		Wld_SpawnNpcRange(self,Skeleton,6,800);
	};
};

