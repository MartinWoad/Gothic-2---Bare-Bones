
func void B_GivePlayerXP(var int add_xp)
{
	var string concatText;
	if(hero.level == 0)
	{
		hero.exp_next = 400;
	};
	if(hero.level < 50)
	{
		hero.exp = hero.exp + add_xp;
		concatText = PRINT_XPGained;
		concatText = ConcatStrings(concatText,IntToString(add_xp));
		if(add_xp > 0)
		{
			//PrintScreen(concatText,-1,YPOS_XPGained,FONT_ScreenSmall,2);
			PrintS_Ext(concatText, White());
		};
	};
	if((hero.exp >= hero.exp_next) && (hero.level < 50))
	{
		hero.level = hero.level + 1;
		hero.exp_next = hero.exp_next + ((hero.level + 1) * 400);
		hero.lp = hero.lp + LP_PER_LEVEL;
		//PrintScreen(PRINT_LevelUp,-1,YPOS_LevelUp,FONT_Screen,2);
		PrintS_Ext(PRINT_LevelUp, RGBA(100, 255, 100, 255));
		Snd_Play("LevelUp");
	}
	else if(hero.level >= 50)
	{
		hero.exp_next = 0;
	};
	B_CheckLog();
};
