
func void B_StopMagicSleep()
{
	Npc_PercDisable(self,PERC_ASSESSDAMAGE);
	B_Say_Overlay(self,other,"$WHATWASSTHAT");
	AI_PlayAni(self,"T_VICTIM_SLE_2_STAND");
};

func void B_AssessMagicSleepTalk()
{
	B_Say(self,other,"$YOUDISTURBEDMYSLUMBER");
	AI_StartState(self,ZS_ObservePlayer,1,"");
};

func void ZS_MagicSleep()
{
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_StopMagicSleep);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessMagicSleepTalk);
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	Npc_SetRefuseTalk(self,0);
	Npc_SetTempAttitude(self,Npc_GetPermAttitude(self,hero));
	B_StopLookAt(self);
	AI_StopPointAt(self);
	if(!Npc_HasBodyFlag(self,BS_FLAG_INTERRUPTABLE))
	{
		AI_Standup(self);
	}
	else
	{
		AI_StandupQuick(self);
	};
	AI_PlayAniBS(self,"T_STAND_2_VICTIM_SLE",BS_LIE);
};

func int ZS_MagicSleep_Loop()
{
	if(Npc_GetStateTime(self) > SPL_TIME_Sleep)
	{
		Npc_ClearAIQueue(self);
		B_StopMagicSleep();
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void ZS_MagicSleep_End()
{
};

func void B_StopMagicFlee()
{
	Npc_PercDisable(self,PERC_ASSESSDAMAGE);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Flee,0,"");
};

func void ZS_MagicFlee()
{
	var int randy;
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_StopMagicFlee);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	Npc_SetRefuseTalk(self,0);
	Npc_SetTempAttitude(self,Npc_GetPermAttitude(self,hero));
	B_StopLookAt(self);
	AI_StopPointAt(self);
	if(!Npc_HasBodyFlag(self,BS_FLAG_INTERRUPTABLE))
	{
		AI_Standup(self);
	}
	else
	{
		AI_StandupQuick(self);
	};
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		randy = Hlp_Random(3);
		if(randy == 0)
		{
			AI_PlayAniBS(self,"T_STAND_2_FEAR_VICTIM1",BS_STAND);
		};
		if(randy == 1)
		{
			AI_PlayAniBS(self,"T_STAND_2_FEAR_VICTIM2",BS_STAND);
		};
		if(randy == 2)
		{
			AI_PlayAniBS(self,"T_STAND_2_FEAR_VICTIM3",BS_STAND);
		};
	};
};

func int ZS_MagicFlee_Loop()
{
	if(Npc_GetStateTime(self) > SPL_TIME_Fear)
	{
		Npc_ClearAIQueue(self);
		B_StopMagicFlee();
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void ZS_MagicFlee_End()
{
};

