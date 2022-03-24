
func void G_PickLock(var int bSuccess,var int bBrokenOpen)
{
	var int rnd;
	if(bSuccess)
	{
		if(bBrokenOpen)
		{
			Snd_Play3d(self,"PICKLOCK_UNLOCK");
			PrintS(PRINT_PICKLOCK_UNLOCK);
		}
		else
		{
			Snd_Play3d(self,"PICKLOCK_SUCCESS");
			PrintS(PRINT_PICKLOCK_SUCCESS);

			if(hero.attribute[ATR_DEXTERITY] - ATTRIBUTEFROMEQUIPMENT[ATR_DEXTERITY] < attributepotential[ATR_DEXTERITY])
			{
				heroDexterityExp += 200;
				CheckWeaponLevelUp();
			};

		};
	}
	else if(bBrokenOpen)
	{
		Snd_Play3d(self,"PICKLOCK_BROKEN");
		PrintS(PRINT_PICKLOCK_BROKEN);
		rnd = Hlp_Random(100);
		if(rnd <= 25)
		{
			Npc_SendPassivePerc(hero,PERC_ASSESSQUIETSOUND,hero,hero);
		};
	}
	else
	{
		Snd_Play3d(self,"PICKLOCK_FAILURE");
		PrintS(PRINT_PICKLOCK_FAILURE);
	};
};
