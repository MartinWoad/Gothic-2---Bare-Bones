
func void b_giveplayerxp(var int add_xp)
{
	var string concattext;
	if(hero.level == 0)
	{
		hero.exp_next = 400;
	};
	if(hero.level < 50)
	{
		hero.exp = hero.exp + add_xp;
		concattext = PRINT_XPGAINED;
		concattext = ConcatStrings(concattext,IntToString(add_xp));
		if(add_xp > 0)
		{
			PrintScreen(concattext,-1,YPOS_XPGAINED,FONT_SCREENSMALL,2);
		};
	};
	if((hero.exp >= hero.exp_next) && (hero.level < 50))
	{
		hero.level = hero.level + 1;
		hero.exp_next = hero.exp_next + ((hero.level + 1) * 400);
		hero.lp = hero.lp + LP_PER_LEVEL;
		PrintScreen(PRINT_LEVELUP,-1,YPOS_LEVELUP,FONT_SCREEN,2);
		Snd_Play("LevelUp");
	}
	else if(hero.level >= 50)
	{
		hero.exp_next = 0;
	};
	b_checklog();
};

