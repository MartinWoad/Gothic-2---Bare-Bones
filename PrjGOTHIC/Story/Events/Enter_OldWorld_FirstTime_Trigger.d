
var int enter_oldworld_firsttime_trigger_onetime;

func void enter_oldworld_firsttime_trigger()
{
	if(enter_oldworld_firsttime_trigger_onetime == FALSE)
	{
		b_killnpc(3314);
		b_killnpc(3317);
		b_killnpc(3316);
		b_killnpc(3318);
		b_killnpc(3319);
		b_killnpc(3320);
		b_killnpc(3321);
		b_killnpc(3322);
		b_killnpc(3323);
		b_killnpc(3324);
		b_killnpc(3325);
		b_killnpc(3326);
		b_killnpc(3327);
		b_killnpc(3328);
		b_killnpc(3315);
		b_killnpc(3329);
		b_killnpc(3330);
		b_killnpc(3331);
		PlayVideo("DRAGONATTACK.BIK");
		enter_oldworld_firsttime_trigger_onetime = TRUE;
	};
	if(TSCHUESSBILGOT == TRUE)
	{
		b_removenpc(3354);
	};
};

