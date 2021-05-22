
const int SPL_Cost_SummonSkeleton = 30;

instance Spell_SummonSkeleton(C_Spell_Proto)
{
	time_per_mana = 0;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int Spell_Logic_SummonSkeleton(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_SummonSkeleton)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_SummonSkeleton()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonSkeleton;
	self.aivar[AIV_SelectSpell] = self.aivar[AIV_SelectSpell] + 1;
	if(Npc_IsPlayer(self))
	{
		Wld_SpawnNpcRange(self,Summoned_Skeleton,1,500);
	}
	else
	{
		Wld_SpawnNpcRange(self,skeleton_0,1,500);
	};
};

