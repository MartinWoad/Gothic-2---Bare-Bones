
const int SPL_MAGICBURN_DAMAGE_PER_SEC = 1;

func void B_StopMagicBurn()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_ClearAIQueue(self);
	AI_Standup(self);
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		B_AssessDamage();
		AI_ContinueRoutine(self);
	}
	else
	{
		Npc_SetTempAttitude(self,ATT_HOSTILE);
		AI_ContinueRoutine(self);
	};
};

func void B_RestartBurn()
{
	if((Npc_GetActiveSpell(other) == SPL_Firerain) || (Npc_GetActiveSpell(other) == SPL_ChargeFireball) || (Npc_GetActiveSpell(other) == SPL_InstantFireball) || (Npc_GetActiveSpell(other) == SPL_Firebolt))
	{
		Npc_SetStateTime(self,0);
		return;
	};
	if((Npc_GetActiveSpell(other) == SPL_IceWave) || (Npc_GetActiveSpell(other) == SPL_IceCube))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_MagicFreeze,0,"");
	};
};

func void ZS_MagicBurn()
{
	Npc_PercEnable(self,PERC_ASSESSSTOPMAGIC,B_StopMagicBurn);
	if(!Npc_HasBodyFlag(self,BS_FLAG_INTERRUPTABLE))
	{
		AI_Standup(self);
	}
	else
	{
		AI_StandupQuick(self);
	};
};

func int ZS_MagicBurn_Loop()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_RestartBurn);
	if(Npc_GetStateTime(self) == 1)
	{
		Npc_SetStateTime(self,0);
		B_MagicHurtNpc(other,SPL_MAGICBURN_DAMAGE_PER_SEC);
	};
	if(self.attribute[ATR_HITPOINTS] <= 0)
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void ZS_MagicBurn_End()
{
};

