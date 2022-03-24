

var int attributebonus[8];

var int attributefromequipment[8];

var int attributepotential[8];

func void B_RaiseAttribute(var C_Npc oth,var int attrib,var int points,var int isbonus,var int isfromequipment)
{
	var string concatText;
	if(attrib == ATR_STRENGTH)
	{
		if((((oth.attribute[ATR_STRENGTH] - ATTRIBUTEFROMEQUIPMENT[4]) + points) <= attributepotential[ATR_STRENGTH]) || (isfromequipment == TRUE))
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
			if(((attributepotential[ATR_STRENGTH] - oth.attribute[ATR_STRENGTH]) + ATTRIBUTEFROMEQUIPMENT[4]) > 0)
			{
				oth.attribute[ATR_HITPOINTS_MAX] = ((oth.attribute[ATR_HITPOINTS_MAX] + attributepotential[ATR_STRENGTH]) - oth.attribute[ATR_STRENGTH]) + ATTRIBUTEFROMEQUIPMENT[4];
				if(isbonus == TRUE)
				{
					ATTRIBUTEBONUS[4] = ((ATTRIBUTEBONUS[4] + attributepotential[ATR_STRENGTH]) - oth.attribute[ATR_STRENGTH]) + ATTRIBUTEFROMEQUIPMENT[4];
				};
			};
			oth.attribute[ATR_STRENGTH] = attributepotential[ATR_STRENGTH];
			if(isfromequipment == FALSE)
			{
				//PrintScreen("Osi¹gniêto limit si³y!",-1,-1,FONT_Screen,2);
				PrintS_Ext("Brak efektu!", White());
			};
		};
		if(oth.attribute[ATR_STRENGTH] > attributepotential[ATR_STRENGTH])
		{
			ATTRIBUTEFROMEQUIPMENT[4] = (ATTRIBUTEFROMEQUIPMENT[4] - oth.attribute[ATR_STRENGTH]) + attributepotential[ATR_STRENGTH];
			oth.attribute[ATR_STRENGTH] = attributepotential[ATR_STRENGTH];
		};
	};
	if(attrib == ATR_DEXTERITY)
	{
		if((((oth.attribute[ATR_DEXTERITY] - ATTRIBUTEFROMEQUIPMENT[5]) + points) <= attributepotential[ATR_DEXTERITY]) || (isfromequipment == TRUE))
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
			if(((attributepotential[ATR_DEXTERITY] - oth.attribute[ATR_DEXTERITY]) + ATTRIBUTEFROMEQUIPMENT[5]) > 0)
			{
				if(isbonus == TRUE)
				{
					ATTRIBUTEBONUS[5] = ((ATTRIBUTEBONUS[5] + attributepotential[ATR_DEXTERITY]) - oth.attribute[ATR_DEXTERITY]) + ATTRIBUTEFROMEQUIPMENT[5];
				};
				if(isfromequipment == TRUE)
				{
					ATTRIBUTEFROMEQUIPMENT[5] = ((ATTRIBUTEFROMEQUIPMENT[5] + attributepotential[ATR_DEXTERITY]) - oth.attribute[ATR_DEXTERITY]) + ATTRIBUTEFROMEQUIPMENT[5];
				};
			};
			oth.attribute[ATR_DEXTERITY] = attributepotential[ATR_DEXTERITY];
			if(isfromequipment == FALSE)
			{
				//PrintScreen("Osi¹gniêto limit zrêcznoœci!",-1,-1,FONT_Screen,2);
				PrintS_Ext("Brak efektu!", White());
			};
		};
		if(oth.attribute[ATR_DEXTERITY] > attributepotential[ATR_DEXTERITY])
		{
			ATTRIBUTEFROMEQUIPMENT[5] = (ATTRIBUTEFROMEQUIPMENT[5] - oth.attribute[ATR_DEXTERITY]) + attributepotential[ATR_DEXTERITY];
			oth.attribute[ATR_DEXTERITY] = attributepotential[ATR_DEXTERITY];
		};
	};
	if(attrib == ATR_MANA_MAX)
	{
		if((((oth.attribute[ATR_MANA_MAX] - ATTRIBUTEFROMEQUIPMENT[3]) + points) <= attributepotential[ATR_MANA_MAX]) || (isfromequipment == TRUE))
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
			if(((attributepotential[ATR_MANA_MAX] - oth.attribute[ATR_MANA_MAX]) + ATTRIBUTEFROMEQUIPMENT[3]) > 0)
			{
				if(isbonus == TRUE)
				{
					ATTRIBUTEBONUS[3] = ((ATTRIBUTEBONUS[3] + attributepotential[ATR_MANA_MAX]) - oth.attribute[ATR_MANA_MAX]) + ATTRIBUTEFROMEQUIPMENT[3];
				};
				if(isfromequipment == TRUE)
				{
					ATTRIBUTEFROMEQUIPMENT[3] = ((ATTRIBUTEFROMEQUIPMENT[3] + attributepotential[ATR_MANA_MAX]) - oth.attribute[ATR_MANA_MAX]) + ATTRIBUTEFROMEQUIPMENT[3];
				};
			};
			oth.attribute[ATR_MANA_MAX] = attributepotential[ATR_MANA_MAX];
			if(isfromequipment == FALSE)
			{
				//PrintScreen("Osi¹gniêto limit energii magicznej!",-1,-1,FONT_Screen,2);
				PrintS_Ext("Brak efektu!", White());
			};
		};
		if(oth.attribute[ATR_MANA_MAX] > attributepotential[ATR_MANA_MAX])
		{
			ATTRIBUTEFROMEQUIPMENT[3] = (ATTRIBUTEFROMEQUIPMENT[3] - oth.attribute[ATR_MANA_MAX]) + attributepotential[ATR_MANA_MAX];
			oth.attribute[ATR_MANA_MAX] = attributepotential[ATR_MANA_MAX];
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
