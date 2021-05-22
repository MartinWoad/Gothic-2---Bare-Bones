
func void B_SetFightSkills(var C_Npc slf,var int percent)
{
	B_AddFightSkill(slf,NPC_TALENT_1H,percent,FALSE);
	B_AddFightSkill(slf,NPC_TALENT_2H,percent,FALSE);
	B_AddFightSkill(slf,NPC_TALENT_BOW,percent,FALSE);
	B_AddFightSkill(slf,NPC_TALENT_CROSSBOW,percent,FALSE);
};

