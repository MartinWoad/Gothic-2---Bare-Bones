
func int B_TeachAttributePoints(var C_Npc slf,var C_Npc oth,var int attrib,var int points,var int teacherMAX)
{
	var string concatText;
	var int kosten;
	var int realAttribute;
	kosten = B_GetLearnCostAttribute(oth,attrib) * points;
	if((attrib != ATR_STRENGTH) && (attrib != ATR_DEXTERITY) && (attrib != ATR_MANA_MAX))
	{
		Print("*** ERROR: Wrong Parameter ***");
		return FALSE;
	};
	if(attrib == ATR_STRENGTH)
	{
		realAttribute = oth.attribute[ATR_STRENGTH] - ATTRIBUTEBONUS[4] - ATTRIBUTEFROMEQUIPMENT[4];
		if((oth.attribute[ATR_STRENGTH] - ATTRIBUTEFROMEQUIPMENT[4]) >= 100)
		{
			realAttribute = 100;
		};
	}
	else if(attrib == ATR_DEXTERITY)
	{
		realAttribute = oth.attribute[ATR_DEXTERITY] - ATTRIBUTEBONUS[5] - ATTRIBUTEFROMEQUIPMENT[5];
		if((oth.attribute[ATR_DEXTERITY] - ATTRIBUTEFROMEQUIPMENT[5]) >= 100)
		{
			realAttribute = 100;
		};
	}
	else if(attrib == ATR_MANA_MAX)
	{
		realAttribute = oth.attribute[ATR_MANA_MAX] - ATTRIBUTEBONUS[3] - ATTRIBUTEFROMEQUIPMENT[3];
		if((oth.attribute[ATR_MANA_MAX] - ATTRIBUTEFROMEQUIPMENT[3]) >= 250)
		{
			realAttribute = 250;
		};
	};
	if(realAttribute >= teacherMAX)
	{
		B_Say(slf,oth,"$NOLEARNYOUREBETTER");
		return FALSE;
	};
	if((realAttribute + points) > teacherMAX)
	{
		B_Say(slf,oth,"$NOLEARNOVERPERSONALMAX");
		return FALSE;
	};
	if(oth.lp < kosten)
	{
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	B_RaiseAttribute(oth,attrib,points,FALSE,FALSE);
	return TRUE;
};

