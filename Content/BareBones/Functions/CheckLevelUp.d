func void CheckWeaponLevelUp()
{
	var oCNpc her; her = Hlp_GetNpc(hero);
	if(hero1hExp >= hero1hExp_NextLevel && hero.hitChance[NPC_TALENT_1H] < 60)
	{

		hero.hitChance[NPC_TALENT_1H] += 1;
		PrintS_Ext(PRINT_Learn1H1, White());
		hero1hExp_NextLevel += (hero.hitChance[NPC_TALENT_1H] + 1) * 50;
	};

	if(hero2hExp >= hero2hExp_NextLevel && hero.hitChance[NPC_TALENT_2H] < 60)
	{

		hero.hitChance[NPC_TALENT_2H] += 1;
		PrintS_Ext(PRINT_Learn2H1, White());
		hero2hExp_NextLevel += (hero.hitChance[NPC_TALENT_2H] + 1) * 50;
	};

	if(heroBowExp >= heroBowExp_NextLevel && hero.hitChance[NPC_TALENT_BOW] < 60)
	{

		hero.hitChance[NPC_TALENT_BOW] += 1;
		PrintS_Ext(PRINT_LearnBow1, White());
		heroBowExp_NextLevel += (hero.hitChance[NPC_TALENT_BOW] + 1) * 50;
	};

	if(heroCrossbowExp >= heroCrossbowExp_NextLevel && hero.hitChance[NPC_TALENT_CROSSBOW] < 60)
	{

		hero.hitChance[NPC_TALENT_CROSSBOW] += 1;
		PrintS_Ext(PRINT_LearnCrossbow1, White());
		heroCrossbowExp_NextLevel += (hero.hitChance[NPC_TALENT_CROSSBOW] + 1) * 50;
	};

	if(heroStrengthExp >= heroStrengthExp_NextLevel && hero.attribute[ATR_STRENGTH] < 100)
	{

		B_RaiseAttribute(hero,ATR_STRENGTH,1,FALSE,FALSE);
		heroStrengthExp_NextLevel += (hero.attribute[ATR_STRENGTH] - ATTRIBUTEBONUS[4] - ATTRIBUTEFROMEQUIPMENT[4] + 1) * 50;
	};

	if(heroDexterityExp >= heroDexterityExp_NextLevel && hero.attribute[ATR_DEXTERITY] < 100)
	{

		B_RaiseAttribute(hero,ATR_DEXTERITY,1,FALSE,FALSE);
		heroDexterityExp_NextLevel += (hero.attribute[ATR_DEXTERITY] - ATTRIBUTEBONUS[ATR_DEXTERITY] - ATTRIBUTEFROMEQUIPMENT[ATR_DEXTERITY] + 1) * 50;
	};

	if(heroPowerExp >= heroPowerExp_NextLevel && hero.attribute[ATR_MANA_MAX] < 250)
	{

		B_RaiseAttribute(hero,ATR_MANA_MAX,1,FALSE,FALSE);
		heroPowerExp_NextLevel += (hero.attribute[ATR_MANA_MAX] - ATTRIBUTEBONUS[ATR_MANA_MAX] - ATTRIBUTEFROMEQUIPMENT[ATR_MANA_MAX] + 1) * 50;
	};

};
