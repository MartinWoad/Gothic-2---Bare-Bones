
func void b_blessattribute(var C_NPC oth,var int attrib,var int points)
{
	var string concattext;
	if(attrib == ATR_STRENGTH)
	{
		if((oth.attribute[ATR_STRENGTH] + points) <= 100)
		{
			oth.attribute[ATR_STRENGTH] = oth.attribute[ATR_STRENGTH] + points;
			ATTRIBUTEBONUS[4] = ATTRIBUTEBONUS[4] + points;
			concattext = ConcatStrings(PRINT_BLESSSTR,IntToString(points));
			PrintScreen(concattext,-1,-1,FONT_SCREEN,1);
			oth.attribute[ATR_HITPOINTS_MAX] = oth.attribute[ATR_HITPOINTS_MAX] + points;
		}
		else
		{
			if((100 - oth.attribute[ATR_STRENGTH]) > 0)
			{
				oth.attribute[ATR_HITPOINTS_MAX] = (oth.attribute[ATR_HITPOINTS_MAX] + 100) - oth.attribute[ATR_STRENGTH];
				ATTRIBUTEBONUS[4] = (ATTRIBUTEBONUS[4] + 100) - oth.attribute[ATR_STRENGTH];
			};
			oth.attribute[ATR_STRENGTH] = 100;
			PrintScreen("Osi¹gniêto limit si³y!",-1,-1,FONT_SCREEN,2);
		};
		if(oth.attribute[ATR_STRENGTH] > 100)
		{
			ATTRIBUTEFROMEQUIPMENT[4] = (ATTRIBUTEFROMEQUIPMENT[4] - oth.attribute[ATR_STRENGTH]) + 100;
			oth.attribute[ATR_STRENGTH] = 100;
		};
	};
	if(attrib == ATR_DEXTERITY)
	{
		if((oth.attribute[ATR_DEXTERITY] + points) <= 100)
		{
			oth.attribute[ATR_DEXTERITY] = oth.attribute[ATR_DEXTERITY] + points;
			ATTRIBUTEBONUS[5] = ATTRIBUTEBONUS[5] + points;
			concattext = ConcatStrings(PRINT_BLESSDEX,IntToString(points));
			PrintScreen(concattext,-1,-1,FONT_SCREEN,1);
		}
		else
		{
			if((100 - oth.attribute[ATR_DEXTERITY]) > 0)
			{
				ATTRIBUTEBONUS[5] = (ATTRIBUTEBONUS[5] + 100) - oth.attribute[ATR_DEXTERITY];
			};
			oth.attribute[ATR_DEXTERITY] = 100;
			PrintScreen("Osi¹gniêto limit zrêcznoœci!",-1,-1,FONT_SCREEN,2);
		};
	};
	if(attrib == ATR_MANA_MAX)
	{
		if((oth.attribute[ATR_MANA_MAX] + points) <= 250)
		{
			oth.attribute[ATR_MANA_MAX] = oth.attribute[ATR_MANA_MAX] + points;
			ATTRIBUTEBONUS[3] = ATTRIBUTEBONUS[3] + points;
			oth.attribute[ATR_MANA] = oth.attribute[ATR_MANA_MAX];
			concattext = ConcatStrings(PRINT_BLESSMANA_MAX,IntToString(points));
			PrintScreen(concattext,-1,-1,FONT_SCREEN,1);
		}
		else
		{
			if((250 - oth.attribute[ATR_MANA_MAX]) > 0)
			{
				ATTRIBUTEBONUS[3] = (ATTRIBUTEBONUS[3] + 250) - oth.attribute[ATR_MANA_MAX];
			};
			oth.attribute[ATR_MANA_MAX] = 250;
			oth.attribute[ATR_MANA] = oth.attribute[ATR_MANA_MAX];
			PrintScreen("Osi¹gniêto limit energii magicznej!",-1,-1,FONT_SCREEN,2);
		};
	};
	if(attrib == ATR_HITPOINTS_MAX)
	{
		oth.attribute[ATR_HITPOINTS_MAX] = oth.attribute[ATR_HITPOINTS_MAX] + points;
		oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS_MAX];
		concattext = ConcatStrings(PRINT_BLESSHITPOINTS_MAX,IntToString(points));
		PrintScreen(concattext,-1,-1,FONT_SCREEN,1);
	};
	if(attrib == ATR_HITPOINTS)
	{
		oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS_MAX];
		PrintScreen(PRINT_BLESSHITPOINTS,-1,-1,FONT_SCREEN,1);
	};
	if(attrib == ATR_MANA)
	{
		oth.attribute[ATR_MANA] = oth.attribute[ATR_MANA_MAX];
		PrintScreen(PRINT_BLESSMANA,-1,-1,FONT_SCREEN,1);
	};
};

