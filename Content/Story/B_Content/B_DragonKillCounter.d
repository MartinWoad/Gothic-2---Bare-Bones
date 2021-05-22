
func void B_DragonKillCounter(var C_Npc current_dragon)
{
	if(current_dragon.guild == GIL_DRAGON)
	{
		MIS_KilledDragons = MIS_KilledDragons + 1;
	};
	if(MIS_KilledDragons == 4)
	{
		MIS_AllDragonsDead = TRUE;
		if((DJG_BiffParty == TRUE) && (Npc_IsDead(Biff) == FALSE))
		{
			DJG_BiffSurvivedLastDragon = TRUE;
		};
	};
	if(current_dragon.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD)
	{
		UndeadDragonIsDead = TRUE;
		Log_CreateTopic(TOPIC_BackToShip,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_BackToShip,LOG_Running);
		B_LogEntry(TOPIC_BackToShip,PRINT_DragKillCount);
		AI_Teleport(hero,"UNDEAD_ENDTELEPORT");
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			PlayVideoEx("EXTRO_PAL.BIK",TRUE,FALSE);
		}
		else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			PlayVideoEx("EXTRO_DJG.BIK",TRUE,FALSE);
		}
		else
		{
			PlayVideoEx("EXTRO_KDF.BIK",TRUE,FALSE);
		};
	};
};

