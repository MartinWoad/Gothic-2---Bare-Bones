
const int SPL_Cost_SummonGolem = 40;

instance Spell_SummonGolem(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_BAD;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int Spell_Logic_SummonGolem(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_SummonGolem)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_SummonGolem()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonGolem;
	if(Npc_IsPlayer(self))
	{
		Wld_SpawnNpcRange(self,Summoned_Golem,1,500);
	}
	else
	{
		Wld_SpawnNpcRange(self,StoneGolem,1,500);
	};
};

