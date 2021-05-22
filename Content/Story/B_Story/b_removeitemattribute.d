
func void b_removeitemattribute(var C_Npc oth,var int attrib,var int points)
{
	var string concatText;
	if(attrib == ATR_STRENGTH)
	{
		if(points <= ATTRIBUTEFROMEQUIPMENT[4])
		{
			oth.attribute[ATR_STRENGTH] = oth.attribute[ATR_STRENGTH] - points;
			oth.attribute[ATR_HITPOINTS_MAX] = oth.attribute[ATR_HITPOINTS_MAX] - points;
			ATTRIBUTEFROMEQUIPMENT[4] = ATTRIBUTEFROMEQUIPMENT[4] - points;
		}
		else
		{
			oth.attribute[ATR_STRENGTH] = oth.attribute[ATR_STRENGTH] - ATTRIBUTEFROMEQUIPMENT[4];
			oth.attribute[ATR_HITPOINTS_MAX] = oth.attribute[ATR_HITPOINTS_MAX] - ATTRIBUTEFROMEQUIPMENT[4];
			ATTRIBUTEFROMEQUIPMENT[4] = 0;
		};
	};
	if(attrib == ATR_DEXTERITY)
	{
		if(points <= ATTRIBUTEFROMEQUIPMENT[4])
		{
			oth.attribute[ATR_DEXTERITY] = oth.attribute[ATR_DEXTERITY] - points;
			ATTRIBUTEFROMEQUIPMENT[5] = ATTRIBUTEFROMEQUIPMENT[5] - points;
		}
		else
		{
			oth.attribute[ATR_DEXTERITY] = oth.attribute[ATR_DEXTERITY] - ATTRIBUTEFROMEQUIPMENT[5];
			ATTRIBUTEFROMEQUIPMENT[5] = 0;
		};
	};
	if(attrib == ATR_MANA_MAX)
	{
		if(points <= ATTRIBUTEFROMEQUIPMENT[3])
		{
			oth.attribute[ATR_MANA_MAX] = oth.attribute[ATR_MANA_MAX] - points;
			ATTRIBUTEFROMEQUIPMENT[3] = ATTRIBUTEFROMEQUIPMENT[3] - points;
		}
		else
		{
			oth.attribute[ATR_MANA_MAX] = oth.attribute[ATR_MANA_MAX] - ATTRIBUTEFROMEQUIPMENT[3];
			ATTRIBUTEFROMEQUIPMENT[3] = 0;
		};
	};
	if(attrib == ATR_HITPOINTS_MAX)
	{
		oth.attribute[ATR_HITPOINTS_MAX] = oth.attribute[ATR_HITPOINTS_MAX] - points;
	};
};

