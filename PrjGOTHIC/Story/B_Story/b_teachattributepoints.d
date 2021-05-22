
func int b_teachattributepoints(var C_NPC slf,var C_NPC oth,var int attrib,var int points,var int teachermax)
{
	var string concattext;
	var int kosten;
	var int realattribute;
	kosten = b_getlearncostattribute(oth,attrib) * points;
	if((attrib != ATR_STRENGTH) && (attrib != ATR_DEXTERITY) && (attrib != ATR_MANA_MAX))
	{
		Print("*** ERROR: Wrong Parameter ***");
		return FALSE;
	};
	if(attrib == ATR_STRENGTH)
	{
		realattribute = oth.attribute[ATR_STRENGTH] - ATTRIBUTEBONUS[4] - ATTRIBUTEFROMEQUIPMENT[4];
		if((oth.attribute[ATR_STRENGTH] - ATTRIBUTEFROMEQUIPMENT[4]) >= 100)
		{
			realattribute = 100;
		};
	}
	else if(attrib == ATR_DEXTERITY)
	{
		realattribute = oth.attribute[ATR_DEXTERITY] - ATTRIBUTEBONUS[5] - ATTRIBUTEFROMEQUIPMENT[5];
		if((oth.attribute[ATR_DEXTERITY] - ATTRIBUTEFROMEQUIPMENT[5]) >= 100)
		{
			realattribute = 100;
		};
	}
	else if(attrib == ATR_MANA_MAX)
	{
		realattribute = oth.attribute[ATR_MANA_MAX] - ATTRIBUTEBONUS[3] - ATTRIBUTEFROMEQUIPMENT[3];
		if((oth.attribute[ATR_MANA_MAX] - ATTRIBUTEFROMEQUIPMENT[3]) >= 250)
		{
			realattribute = 250;
		};
	};
	if(realattribute >= teachermax)
	{
		b_say(slf,oth,"$NOLEARNYOUREBETTER");
		return FALSE;
	};
	if((realattribute + points) > teachermax)
	{
		b_say(slf,oth,"$NOLEARNOVERPERSONALMAX");
		return FALSE;
	};
	if(oth.lp < kosten)
	{
		b_say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	b_raiseattribute(oth,attrib,points,FALSE,FALSE);
	return TRUE;
};

