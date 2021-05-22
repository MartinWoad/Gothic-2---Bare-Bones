

var int attributebonus[8];

var int attributefromequipment[8];

func void b_raiseattribute(var C_NPC oth,var int attrib,var int points,var int isbonus,var int isfromequipment)
{
	var string concattext;
	if(attrib == ATR_STRENGTH)
	{
		if((((oth.attribute[ATR_STRENGTH] - ATTRIBUTEFROMEQUIPMENT[4]) + points) <= 100) || (isfromequipment == TRUE))
		{
			oth.attribute[ATR_STRENGTH] = oth.attribute[ATR_STRENGTH] + points;
			if(isbonus == TRUE)
			{
				ATTRIBUTEBONUS[4] = ATTRIBUTEBONUS[4] + points;
			};
			if(isfromequipment == TRUE)
			{
				ATTRIBUTEFROMEQUIPMENT[4] = ATTRIBUTEFROMEQUIPMENT[4] + points;
			};
			concattext = ConcatStrings(PRINT_LEARNSTR,IntToString(points));
			if(isfromequipment == FALSE)
			{
				PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
			};
			oth.attribute[ATR_HITPOINTS_MAX] = oth.attribute[ATR_HITPOINTS_MAX] + points;
		}
		else
		{
			if(((100 - oth.attribute[ATR_STRENGTH]) + ATTRIBUTEFROMEQUIPMENT[4]) > 0)
			{
				oth.attribute[ATR_HITPOINTS_MAX] = ((oth.attribute[ATR_HITPOINTS_MAX] + 100) - oth.attribute[ATR_STRENGTH]) + ATTRIBUTEFROMEQUIPMENT[4];
				if(isbonus == TRUE)
				{
					ATTRIBUTEBONUS[4] = ((ATTRIBUTEBONUS[4] + 100) - oth.attribute[ATR_STRENGTH]) + ATTRIBUTEFROMEQUIPMENT[4];
				};
			};
			oth.attribute[ATR_STRENGTH] = 100;
			if(isfromequipment == FALSE)
			{
				PrintScreen("Osi¹gniêto limit si³y!",-1,-1,FONT_SCREEN,2);
			};
		};
		if(oth.attribute[ATR_STRENGTH] > 100)
		{
			ATTRIBUTEFROMEQUIPMENT[4] = (ATTRIBUTEFROMEQUIPMENT[4] - oth.attribute[ATR_STRENGTH]) + 100;
			oth.attribute[ATR_STRENGTH] = 100;
		};
	};
	if(attrib == ATR_DEXTERITY)
	{
		if((((oth.attribute[ATR_DEXTERITY] - ATTRIBUTEFROMEQUIPMENT[5]) + points) <= 100) || (isfromequipment == TRUE))
		{
			oth.attribute[ATR_DEXTERITY] = oth.attribute[ATR_DEXTERITY] + points;
			if(isbonus == TRUE)
			{
				ATTRIBUTEBONUS[5] = ATTRIBUTEBONUS[5] + points;
			};
			if(isfromequipment == TRUE)
			{
				ATTRIBUTEFROMEQUIPMENT[5] = ATTRIBUTEFROMEQUIPMENT[5] + points;
			};
			concattext = ConcatStrings(PRINT_LEARNDEX,IntToString(points));
			if(isfromequipment == FALSE)
			{
				PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
			};
		}
		else
		{
			if(((100 - oth.attribute[ATR_DEXTERITY]) + ATTRIBUTEFROMEQUIPMENT[5]) > 0)
			{
				if(isbonus == TRUE)
				{
					ATTRIBUTEBONUS[5] = ((ATTRIBUTEBONUS[5] + 100) - oth.attribute[ATR_DEXTERITY]) + ATTRIBUTEFROMEQUIPMENT[5];
				};
				if(isfromequipment == TRUE)
				{
					ATTRIBUTEFROMEQUIPMENT[5] = ((ATTRIBUTEFROMEQUIPMENT[5] + 100) - oth.attribute[ATR_DEXTERITY]) + ATTRIBUTEFROMEQUIPMENT[5];
				};
			};
			oth.attribute[ATR_DEXTERITY] = 100;
			if(isfromequipment == FALSE)
			{
				PrintScreen("Osi¹gniêto limit zrêcznoœci!",-1,-1,FONT_SCREEN,2);
			};
		};
		if(oth.attribute[ATR_DEXTERITY] > 100)
		{
			ATTRIBUTEFROMEQUIPMENT[5] = (ATTRIBUTEFROMEQUIPMENT[5] - oth.attribute[ATR_DEXTERITY]) + 100;
			oth.attribute[ATR_DEXTERITY] = 100;
		};
	};
	if(attrib == ATR_MANA_MAX)
	{
		if((((oth.attribute[ATR_MANA_MAX] - ATTRIBUTEFROMEQUIPMENT[3]) + points) <= 250) || (isfromequipment == TRUE))
		{
			oth.attribute[ATR_MANA_MAX] = oth.attribute[ATR_MANA_MAX] + points;
			if(isbonus == TRUE)
			{
				ATTRIBUTEBONUS[3] = ATTRIBUTEBONUS[3] + points;
			};
			if(isfromequipment == TRUE)
			{
				ATTRIBUTEFROMEQUIPMENT[3] = ATTRIBUTEFROMEQUIPMENT[3] + points;
			};
			concattext = ConcatStrings(PRINT_LEARNMANA_MAX,IntToString(points));
			if(isfromequipment == FALSE)
			{
				PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
			};
		}
		else
		{
			if(((250 - oth.attribute[ATR_MANA_MAX]) + ATTRIBUTEFROMEQUIPMENT[3]) > 0)
			{
				if(isbonus == TRUE)
				{
					ATTRIBUTEBONUS[3] = ((ATTRIBUTEBONUS[3] + 250) - oth.attribute[ATR_MANA_MAX]) + ATTRIBUTEFROMEQUIPMENT[3];
				};
				if(isfromequipment == TRUE)
				{
					ATTRIBUTEFROMEQUIPMENT[3] = ((ATTRIBUTEFROMEQUIPMENT[3] + 250) - oth.attribute[ATR_MANA_MAX]) + ATTRIBUTEFROMEQUIPMENT[3];
				};
			};
			oth.attribute[ATR_MANA_MAX] = 250;
			if(isfromequipment == FALSE)
			{
				PrintScreen("Osi¹gniêto limit energii magicznej!",-1,-1,FONT_SCREEN,2);
			};
		};
		if(oth.attribute[ATR_MANA_MAX] > 250)
		{
			ATTRIBUTEFROMEQUIPMENT[3] = (ATTRIBUTEFROMEQUIPMENT[3] - oth.attribute[ATR_MANA_MAX]) + 250;
			oth.attribute[ATR_MANA_MAX] = 250;
		};
	};
	if(attrib == ATR_HITPOINTS_MAX)
	{
		oth.attribute[ATR_HITPOINTS_MAX] = oth.attribute[ATR_HITPOINTS_MAX] + points;
		concattext = ConcatStrings(PRINT_LEARNHITPOINTS_MAX,IntToString(points));
		if(isfromequipment == FALSE)
		{
			PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
		};
	};
};

