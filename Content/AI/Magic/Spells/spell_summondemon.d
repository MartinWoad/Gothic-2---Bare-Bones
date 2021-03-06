
const int SPL_Cost_SummonDemon = 50;

instance Spell_SummonDemon(C_Spell_Proto)
{
	time_per_mana = 0;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int Spell_Logic_SummonDemon(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_SummonDemon)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_SummonDemon()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonDemon;
	if(Npc_IsPlayer(self))
	{
		Wld_SpawnNpcRange(self,Summoned_Demon,1,1000);
	}
	else
	{
		Wld_SpawnNpcRange(self,Demon,1,1000);
	};
};

