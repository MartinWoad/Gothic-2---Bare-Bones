
func void b_setfightskills(var C_NPC slf,var int percent)
{
	b_addfightskill(slf,NPC_TALENT_1H,percent,FALSE);
	b_addfightskill(slf,NPC_TALENT_2H,percent,FALSE);
	b_addfightskill(slf,NPC_TALENT_BOW,percent,FALSE);
	b_addfightskill(slf,NPC_TALENT_CROSSBOW,percent,FALSE);
};

