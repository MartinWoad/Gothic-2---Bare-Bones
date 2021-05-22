
func void B_AssessThreat()
{
	if(!Npc_CanSeeNpc(self,other))
	{
		return;
	};
	if(!C_NpcIsBotheredByWeapon(self,other))
	{
		return;
	};
	Npc_ClearAIQueue(self);
	B_ClearPerceptions(self);
	AI_StartState(self,ZS_ReactToWeapon,0,"");
};

