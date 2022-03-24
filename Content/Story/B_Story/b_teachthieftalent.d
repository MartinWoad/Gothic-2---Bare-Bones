
func int B_TeachThiefTalent(var C_Npc slf,var C_Npc oth,var int talent)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,talent);
	if((talent != NPC_TALENT_PICKLOCK) && (talent != NPC_TALENT_SNEAK) && (talent != NPC_TALENT_ACROBAT) && (talent != NPC_TALENT_PICKPOCKET))
	{
		PrintS("*** ERROR: Wrong Parameter ***");
		return FALSE;
	};
	if(oth.lp < kosten)
	{
		AI_PrintS(oth, PRINT_NotEnoughLearnPoints);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	if(talent == NPC_TALENT_PICKLOCK)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_PICKLOCK,1);
		AI_PrintS(oth, PRINT_LearnPicklock);
		//PrintScreen(PRINT_LearnPicklock,-1,-1,FONT_Screen,2);
		return TRUE;
	};
	if(talent == NPC_TALENT_SNEAK)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SNEAK,1);
		AI_PrintS(oth, PRINT_LearnSneak);
		//PrintScreen(PRINT_LearnSneak,-1,-1,FONT_Screen,2);
		return TRUE;
	};
	if(talent == NPC_TALENT_ACROBAT)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ACROBAT,1);
		AI_PrintS(oth, PRINT_LearnAcrobat);
		//PrintScreen(PRINT_LearnAcrobat,-1,-1,FONT_Screen,2);
		return TRUE;
	};
	if(talent == NPC_TALENT_PICKPOCKET)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_PICKPOCKET,1);
		//PrintScreen(PRINT_LearnPickpocket,-1,-1,FONT_Screen,2);
		AI_PrintS(oth, PRINT_LearnPickpocket);
		return TRUE;
	};
};
