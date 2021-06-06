
func int B_TeachFightTalentPercent(var C_Npc slf,var C_Npc oth,var int talent,var int percent,var int teacherMAX)
{
	var string concatText;
	var int kosten;
	var int realHitChance;
	kosten = B_GetLearnCostTalent(oth,talent) * percent;
	if((talent != NPC_TALENT_1H) && (talent != NPC_TALENT_2H) && (talent != NPC_TALENT_BOW) && (talent != NPC_TALENT_CROSSBOW))
	{
		Print("*** ERROR: Wrong Parameter ***");
		return FALSE;
	};
	if(talent == NPC_TALENT_1H)
	{
		realHitChance = oth.HitChance[NPC_TALENT_1H];
	}
	else if(talent == NPC_TALENT_2H)
	{
		realHitChance = oth.HitChance[NPC_TALENT_2H];
	}
	else if(talent == NPC_TALENT_BOW)
	{
		realHitChance = oth.HitChance[NPC_TALENT_BOW];
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		realHitChance = oth.HitChance[NPC_TALENT_CROSSBOW];
	};
	if(realHitChance >= teacherMAX)
	{
		//concatText = ConcatStrings(PRINT_NoLearnOverPersonalMAX,IntToString(teacherMAX));
		//PrintScreen(concatText,-1,-1,FONT_Screen,2);
		B_Say(slf,oth,"$NOLEARNYOUREBETTER");
		return FALSE;
	};
	if((realHitChance + percent) > teacherMAX)
	{
		//concatText = ConcatStrings(PRINT_NoLearnOverPersonalMAX,IntToString(teacherMAX));
		//PrintScreen(concatText,-1,-1,FONT_Screen,2);
		B_Say(slf,oth,"$NOLEARNOVERPERSONALMAX");
		return FALSE;
	};
	if(oth.lp < kosten)
	{
		//PrintScreen(PRINT_NotEnoughLP,-1,-1,FONT_Screen,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	if(talent == NPC_TALENT_1H)
	{
		B_AddFightSkill(oth,NPC_TALENT_1H,percent,FALSE);
		//PrintScreen(PRINT_Learn1H,-1,-1,FONT_Screen,2);
		PrintS_Ext(PRINT_Learn1H, White());
		return TRUE;
	};
	if(talent == NPC_TALENT_2H)
	{
		B_AddFightSkill(oth,NPC_TALENT_2H,percent,FALSE);
		//PrintScreen(PRINT_Learn2H,-1,-1,FONT_Screen,2);
		PrintS_Ext(PRINT_Learn2H, White());
		return TRUE;
	};
	if(talent == NPC_TALENT_BOW)
	{
		B_AddFightSkill(oth,NPC_TALENT_BOW,percent,FALSE);
		//PrintScreen(PRINT_LearnBow,-1,-1,FONT_Screen,2);
		PrintS_Ext(PRINT_LearnBow, White());
		return TRUE;
	};
	if(talent == NPC_TALENT_CROSSBOW)
	{
		B_AddFightSkill(oth,NPC_TALENT_CROSSBOW,percent,FALSE);
		//PrintScreen(PRINT_LearnCrossbow,-1,-1,FONT_Screen,2);
		PrintS_Ext(PRINT_LearnCrossbow, White());
		return TRUE;
	};
};
