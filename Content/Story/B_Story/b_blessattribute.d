
func void B_BlessAttribute(var C_Npc oth,var int attrib,var int points)
{
	var string concatText;
	if(attrib == ATR_STRENGTH)
	{
		if((oth.attribute[ATR_STRENGTH] + points) <= attributepotential[ATR_STRENGTH])
		{
			oth.attribute[ATR_STRENGTH] = oth.attribute[ATR_STRENGTH] + points;
			ATTRIBUTEBONUS[4] = ATTRIBUTEBONUS[4] + points;
			concatText = ConcatStrings(PRINT_BlessSTR,IntToString(points));
			//PrintScreen(concatText,-1,-1,FONT_Screen,1);
			PrintS_Ext(concatText, RGBA(100, 255, 100, 255));
			oth.attribute[ATR_HITPOINTS_MAX] = oth.attribute[ATR_HITPOINTS_MAX] + points;
		}
		else
		{
			if(((attributepotential[ATR_STRENGTH]) - oth.attribute[ATR_STRENGTH]) > 0)
			{
				oth.attribute[ATR_HITPOINTS_MAX] = (oth.attribute[ATR_HITPOINTS_MAX] + attributepotential[ATR_STRENGTH]) - oth.attribute[ATR_STRENGTH];
				ATTRIBUTEBONUS[4] = (ATTRIBUTEBONUS[4] + attributepotential[ATR_STRENGTH]) - oth.attribute[ATR_STRENGTH];
			};
			oth.attribute[ATR_STRENGTH] = attributepotential[ATR_STRENGTH];
			//PrintScreen("Osi¹gniêto limit si³y!",-1,-1,FONT_Screen,2);
			PrintS_Ext("B³ogos³awieñstwo Innosa nie wywiera wp³ywu na twoje cia³o", RGBA(255, 255, 255, 255));
		};
		if(oth.attribute[ATR_STRENGTH] > attributepotential[ATR_STRENGTH])
		{
			ATTRIBUTEFROMEQUIPMENT[4] = (ATTRIBUTEFROMEQUIPMENT[4] - oth.attribute[ATR_STRENGTH]) + attributepotential[ATR_STRENGTH];
			oth.attribute[ATR_STRENGTH] = attributepotential[ATR_STRENGTH];
		};
	};
	if(attrib == ATR_DEXTERITY)
	{
		if((oth.attribute[ATR_DEXTERITY] + points) <= attributepotential[ATR_DEXTERITY])
		{
			oth.attribute[ATR_DEXTERITY] = oth.attribute[ATR_DEXTERITY] + points;
			ATTRIBUTEBONUS[5] = ATTRIBUTEBONUS[5] + points;
			concatText = ConcatStrings(PRINT_BlessDEX,IntToString(points));
			//PrintScreen(concatText,-1,-1,FONT_Screen,1);
			PrintS_Ext(concatText, RGBA(100, 255, 100, 255));
		}
		else
		{
			if((attributepotential[ATR_DEXTERITY] - oth.attribute[ATR_DEXTERITY]) > 0)
			{
				ATTRIBUTEBONUS[5] = (ATTRIBUTEBONUS[5] + attributepotential[ATR_DEXTERITY]) - oth.attribute[ATR_DEXTERITY];
			};
			oth.attribute[ATR_DEXTERITY] = attributepotential[ATR_DEXTERITY];
			//PrintScreen("Osi¹gniêto limit zrêcznoœci!",-1,-1,FONT_Screen,2);
			PrintS_Ext("B³ogos³awieñstwo Innosa nie wywiera wp³ywu na twoje cia³o", RGBA(255, 255, 255, 255));
		};
	};
	if(attrib == ATR_MANA_MAX)
	{
		if((oth.attribute[ATR_MANA_MAX] + points) <= attributepotential[ATR_MANA_MAX])
		{
			oth.attribute[ATR_MANA_MAX] = oth.attribute[ATR_MANA_MAX] + points;
			ATTRIBUTEBONUS[3] = ATTRIBUTEBONUS[3] + points;
			oth.attribute[ATR_MANA] = oth.attribute[ATR_MANA_MAX];
			concatText = ConcatStrings(PRINT_BlessMANA_MAX,IntToString(points));
			//PrintScreen(concatText,-1,-1,FONT_Screen,1);
			PrintS_Ext(concatText, RGBA(100, 255, 100, 255));
		}
		else
		{
			if((attributepotential[ATR_MANA_MAX] - oth.attribute[ATR_MANA_MAX]) > 0)
			{
				ATTRIBUTEBONUS[3] = (ATTRIBUTEBONUS[3] + attributepotential[ATR_MANA_MAX]) - oth.attribute[ATR_MANA_MAX];
			};
			oth.attribute[ATR_MANA_MAX] = attributepotential[ATR_MANA_MAX];
			oth.attribute[ATR_MANA] = oth.attribute[ATR_MANA_MAX];
			//PrintScreen("Osi¹gniêto limit energii magicznej!",-1,-1,FONT_Screen,2);
			PrintS_Ext("B³ogos³awieñstwo Innosa nie wywiera wp³ywu na twoje cia³o", RGBA(255, 255, 255, 255));
		};
	};
	if(attrib == ATR_HITPOINTS_MAX)
	{
		oth.attribute[ATR_HITPOINTS_MAX] = oth.attribute[ATR_HITPOINTS_MAX] + points;
		oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS_MAX];
		concatText = ConcatStrings(PRINT_BlessHitpoints_MAX,IntToString(points));
		//PrintScreen(concatText,-1,-1,FONT_Screen,1);
		PrintS_Ext(concatText, RGBA(100, 255, 100, 255));
	};
	if(attrib == ATR_HITPOINTS)
	{
		oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS_MAX];
		//PrintScreen(PRINT_BlessHitpoints,-1,-1,FONT_Screen,1);
		PrintS_Ext(PRINT_BlessHitpoints, RGBA(100, 255, 100, 255));
	};
	if(attrib == ATR_MANA)
	{
		oth.attribute[ATR_MANA] = oth.attribute[ATR_MANA_MAX];
		//PrintScreen(PRINT_BlessMANA,-1,-1,FONT_Screen,1);
		PrintS_Ext(PRINT_BlessHitpoints, RGBA(100, 255, 100, 255));
	};
};
