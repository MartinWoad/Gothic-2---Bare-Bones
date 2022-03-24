func int GetHeroFightTechniqueLevel(var int talent)
{
  if(talent == NPC_TALENT_1H)
  {
    if(heroKnows1hMaster)
    {
      return 5;
    }
    else if(heroKnows1hAdvanced2)
    {
      return 4;
    }
    else if(heroKnows1hAdvanced1)
    {
      return 3;
    }
    else if(heroKnows1hBasic2)
    {
      return 2;
    }
    else if(heroKnows1hBasic1)
    {
      return 1;
    };
    return 0;
  }
  else if(talent == NPC_TALENT_2H)
  {
    if(heroKnows2hMaster)
    {
      return 5;
    }
    else if(heroKnows2hAdvanced2)
    {
      return 4;
    }
    else if(heroKnows2hAdvanced1)
    {
      return 3;
    }
    else if(heroKnows2hBasic2)
    {
      return 2;
    }
    else if(heroKnows2hBasic1)
    {
      return 1;
    };
    return 0;
  }
  else if(talent == NPC_TALENT_BOW)
  {
    if(heroKnowsBowMaster)
    {
      return 5;
    }
    else if(heroKnowsBowAdvanced2)
    {
      return 4;
    }
    else if(heroKnowsBowAdvanced1)
    {
      return 3;
    }
    else if(heroKnowsBowBasic2)
    {
      return 2;
    }
    else if(heroKnowsBowBasic1)
    {
      return 1;
    };
    return 0;
  }
  else if(talent == NPC_TALENT_CROSSBOW)
  {
    if(heroKnowsCrossbowMaster)
    {
      return 5;
    }
    else if(heroKnowsCrossbowAdvanced2)
    {
      return 4;
    }
    else if(heroKnowsCrossbowAdvanced1)
    {
      return 3;
    }
    else if(heroKnowsCrossbowBasic2)
    {
      return 2;
    }
    else if(heroKnowsCrossbowBasic1)
    {
      return 1;
    };
    return 0;
  };
  return 0;
};

func int TeachFightTechnique(var C_Npc slf,var C_Npc oth,var int talent,var int level)
{
	var string concatText;
	var int kosten;
	var int realHitChance;
	kosten = B_GetLearnCostTalent(oth,talent) * 5;
	if((talent != NPC_TALENT_1H) && (talent != NPC_TALENT_2H) && (talent != NPC_TALENT_BOW) && (talent != NPC_TALENT_CROSSBOW))
	{
		PrintS("*** ERROR: Wrong Parameter ***");
		return FALSE;
	};
  if(level > 5 || level < 1)
  {
    PrintS_Ext("TeachFightTechnique Func Error: Invalid Skill Level", Red());
    return FALSE;
  };
  if(Npc_IsPlayer(oth) == FALSE)
  {
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

	if(GetHeroFightTechniqueLevel(talent) != level - 1)
  {
    PrintS_Ext(PRINT_NoPreviousTechnique, White());
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
  }

  if(realHitChance < (level - 1)*10 + 5)
  {
    PrintS_Ext(ConcatStrings(PRINT_RequiredSkill, IntToString((level - 1)*10 + 5)), White());
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
  }

	if(oth.lp < kosten)
	{
		PrintS_Ext(PRINT_NotEnoughLP, White());
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	if(talent == NPC_TALENT_1H)
	{
		if(level == 1)
    {
      heroKnows1hBasic1 = TRUE;
    }
    else if(level == 2)
    {
      heroKnows1hBasic2  = TRUE;
    }
    else if(level == 3)
    {
      heroKnows1hAdvanced1  = TRUE;
      Npc_SetTalentSkill(oth,NPC_TALENT_1H,1);
    }
    else if(level == 4)
    {
      heroKnows1hAdvanced2  = TRUE;
    }
    else if(level == 5)
    {
      heroKnows1hMaster  = TRUE;
      Npc_SetTalentSkill(oth,NPC_TALENT_1H,2);
    };
		PrintS_Ext(PRINT_Learn1H, White());
		return TRUE;
	};
	if(talent == NPC_TALENT_2H)
	{
    if(level == 1)
    {
      heroKnows2hBasic1 = TRUE;
    }
    else if(level == 2)
    {
      heroKnows2hBasic2  = TRUE;
    }
    else if(level == 3)
    {
      heroKnows2hAdvanced1  = TRUE;
      Npc_SetTalentSkill(oth,NPC_TALENT_2H,1);
    }
    else if(level == 4)
    {
      heroKnows2hAdvanced2  = TRUE;
    }
    else if(level == 5)
    {
      heroKnows2hMaster  = TRUE;
      Npc_SetTalentSkill(oth,NPC_TALENT_2H,2);
    };
		PrintS_Ext(PRINT_Learn2H, White());
		return TRUE;
	};
	if(talent == NPC_TALENT_BOW)
	{
    if(level == 1)
    {
      heroKnowsBowBasic1 = TRUE;
    }
    else if(level == 2)
    {
      heroKnowsBowBasic2  = TRUE;
    }
    else if(level == 3)
    {
      heroKnowsBowAdvanced1  = TRUE;
      Npc_SetTalentSkill(oth,NPC_TALENT_BOW,1);
    }
    else if(level == 4)
    {
      heroKnowsBowAdvanced2  = TRUE;
    }
    else if(level == 5)
    {
      heroKnowsBowMaster  = TRUE;
      Npc_SetTalentSkill(oth,NPC_TALENT_BOW,2);
    };
		PrintS_Ext(PRINT_LearnBow, White());
		return TRUE;
	};
	if(talent == NPC_TALENT_CROSSBOW)
	{
    if(level == 1)
    {
      heroKnowsCrossbowBasic1 = TRUE;
    }
    else if(level == 2)
    {
      heroKnowsCrossbowBasic2  = TRUE;
    }
    else if(level == 3)
    {
      heroKnowsCrossbowAdvanced1  = TRUE;
      Npc_SetTalentSkill(oth,NPC_TALENT_CROSSBOW,1);
    }
    else if(level == 4)
    {
      heroKnowsCrossbowAdvanced2  = TRUE;
    }
    else if(level == 5)
    {
      heroKnowsCrossbowMaster  = TRUE;
      Npc_SetTalentSkill(oth,NPC_TALENT_CROSSBOW,2);
    };
		PrintS_Ext(PRINT_LearnCrossbow, White());
		return TRUE;
	};
};
