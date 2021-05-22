
func void b_setattributestochapter(var C_NPC slf,var int kapitel)
{
	if(kapitel == 0)
	{
		if(c_npcisevil(slf) == TRUE)
		{
			slf.level = 5;
		}
		else
		{
			slf.level = 0;
		};
		slf.attribute[ATR_STRENGTH] = 10;
		slf.attribute[ATR_DEXTERITY] = 10;
		slf.attribute[ATR_MANA_MAX] = 0;
		slf.attribute[ATR_MANA] = 0;
		slf.attribute[ATR_HITPOINTS_MAX] = 50;
		slf.attribute[ATR_HITPOINTS] = 40;
	};
	if(kapitel == 1)
	{
		if(c_npcisevil(slf) == TRUE)
		{
			slf.level = 8;
		}
		else
		{
			slf.level = 0;
		};
		slf.attribute[ATR_STRENGTH] = 30;
		slf.attribute[ATR_DEXTERITY] = 30;
		slf.attribute[ATR_MANA_MAX] = 100;
		slf.attribute[ATR_MANA] = 100;
		slf.attribute[ATR_HITPOINTS_MAX] = 100;
		slf.attribute[ATR_HITPOINTS] = 100;
	};
	if(kapitel == 2)
	{
		if(c_npcisevil(slf) == TRUE)
		{
			slf.level = 12;
		}
		else
		{
			slf.level = 0;
		};
		slf.attribute[ATR_STRENGTH] = 50;
		slf.attribute[ATR_DEXTERITY] = 50;
		slf.attribute[ATR_MANA_MAX] = 100;
		slf.attribute[ATR_MANA] = 100;
		slf.attribute[ATR_HITPOINTS_MAX] = 150;
		slf.attribute[ATR_HITPOINTS] = 150;
	};
	if(kapitel == 3)
	{
		if(c_npcisevil(slf) == TRUE)
		{
			slf.level = 18;
		}
		else
		{
			slf.level = 0;
		};
		slf.attribute[ATR_STRENGTH] = 70;
		slf.attribute[ATR_DEXTERITY] = 70;
		slf.attribute[ATR_MANA_MAX] = 100;
		slf.attribute[ATR_MANA] = 100;
		slf.attribute[ATR_HITPOINTS_MAX] = 200;
		slf.attribute[ATR_HITPOINTS] = 200;
	};
	if(kapitel == 4)
	{
		if(c_npcisevil(slf) == TRUE)
		{
			slf.level = 24;
		}
		else
		{
			slf.level = 0;
		};
		slf.attribute[ATR_STRENGTH] = 90;
		slf.attribute[ATR_DEXTERITY] = 90;
		slf.attribute[ATR_MANA_MAX] = 150;
		slf.attribute[ATR_MANA] = 150;
		slf.attribute[ATR_HITPOINTS_MAX] = 300;
		slf.attribute[ATR_HITPOINTS] = 300;
	};
	if(kapitel == 5)
	{
		if(c_npcisevil(slf) == TRUE)
		{
			slf.level = 30;
		}
		else
		{
			slf.level = 0;
		};
		slf.attribute[ATR_STRENGTH] = 100;
		slf.attribute[ATR_DEXTERITY] = 100;
		slf.attribute[ATR_MANA_MAX] = 200;
		slf.attribute[ATR_MANA] = 200;
		slf.attribute[ATR_HITPOINTS_MAX] = 450;
		slf.attribute[ATR_HITPOINTS] = 450;
	};
	if(kapitel >= 6)
	{
		if(c_npcisevil(slf) == TRUE)
		{
			slf.level = 36;
		}
		else
		{
			slf.level = 0;
		};
		slf.attribute[ATR_STRENGTH] = 100;
		slf.attribute[ATR_DEXTERITY] = 100;
		slf.attribute[ATR_MANA_MAX] = 250;
		slf.attribute[ATR_MANA] = 250;
		slf.attribute[ATR_HITPOINTS_MAX] = 600;
		slf.attribute[ATR_HITPOINTS] = 600;
	};
	slf.exp = 500 * ((slf.level + 1) / 2) * (slf.level + 1);
	slf.exp_next = 500 * ((slf.level + 2) / 2) * (slf.level + 1);
};

