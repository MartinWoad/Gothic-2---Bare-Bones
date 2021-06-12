

var int attributebonus[8];

var int attributefromequipment[8];

func void B_RaiseAttribute(var C_Npc oth,var int attrib,var int points,var int isbonus,var int isfromequipment)
{
	var string concatText;
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
			concatText = ConcatStrings(PRINT_LearnSTR,IntToString(points));
			if(isfromequipment == FALSE)
			{
				//PrintScreen(concatText,-1,-1,FONT_Screen,2);
				PrintS_Ext(concatText, White());
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
				//PrintScreen("Osi¹gniêto limit si³y!",-1,-1,FONT_Screen,2);
				PrintS_Ext("Osi¹gniêto limit si³y!", White());
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
			concatText = ConcatStrings(PRINT_LearnDEX,IntToString(points));
			if(isfromequipment == FALSE)
			{
				//PrintScreen(concatText,-1,-1,FONT_Screen,2);
				PrintS_Ext(concatText, White());
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
				//PrintScreen("Osi¹gniêto limit zrêcznoœci!",-1,-1,FONT_Screen,2);
				PrintS_Ext("Osi¹gniêto limit zrêcznoœci!", White());
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
			concatText = ConcatStrings(PRINT_LearnMANA_MAX,IntToString(points));
			if(isfromequipment == FALSE)
			{
				//PrintScreen(concatText,-1,-1,FONT_Screen,2);
				PrintS_Ext(concatText, White());
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
				//PrintScreen("Osi¹gniêto limit energii magicznej!",-1,-1,FONT_Screen,2);
				PrintS_Ext("Osi¹gniêto limit energii magicznej!", White());
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
		concatText = ConcatStrings(PRINT_Learnhitpoints_MAX,IntToString(points));
		if(isfromequipment == FALSE)
		{
			//PrintScreen(concatText,-1,-1,FONT_Screen,2);
			PrintS_Ext(concatText, White());
		};
	};
};
