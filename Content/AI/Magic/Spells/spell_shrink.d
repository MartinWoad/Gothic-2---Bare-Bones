
const int SPL_Cost_Shrink = 100;

instance Spell_Shrink(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_FOCUS;
	targetCollectRange = 1000;
};


func int Spell_Logic_Shrink(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_Shrink)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Shrink()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Shrink;
	if((other.flags != NPC_FLAG_IMMORTAL) && (other.guild > GIL_SEPERATOR_HUM) && (other.aivar[AIV_MM_ShrinkState] == 0))
	{
		Npc_ClearAIQueue(other);
		B_ClearPerceptions(other);
		AI_StartState(other,ZS_MagicShrink,0,"");
	};
};

