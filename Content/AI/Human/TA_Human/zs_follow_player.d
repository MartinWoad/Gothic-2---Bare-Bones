
func void ZS_Follow_Player()
{
	Perception_Set_Minimal();
	B_ResetAll(self);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_AssessPlayer);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	Npc_PercEnable(self,PERC_MOVEMOB,B_MoveMob);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_RUN);
};

func int ZS_Follow_Player_Loop()
{
	if(Npc_GetDistToNpc(self,hero) > 500)
	{
		if(!C_BodyStateContains(self,BS_SWIM))
		{
			AI_SetWalkMode(self,NPC_RUN);
		};
		AI_GotoNpc(self,hero);
	}
	else if(Npc_GetStateTime(self) > 1)
	{
		if(!Npc_CanSeeNpc(self,hero))
		{
			B_TurnToNpc(self,hero);
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_Follow_Player_End()
{
};

