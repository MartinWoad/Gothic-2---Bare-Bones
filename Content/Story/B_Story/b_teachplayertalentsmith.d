
func int B_TeachPlayerTalentSmith(var C_Npc slf,var C_Npc oth,var int waffe)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_SMITH);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_TalentSmith,LOG_NOTE);
	B_LogEntry(TOPIC_TalentSmith,"Je�li zechc� wyku� jak�� bro�, to po pierwsze b�dzie mi potrzebny kawa� surowej stali, kt�ry musz� rozgrza� do czerwono�ci w ku�ni, a nast�pnie nada� mu odpowiedni kszta�t na kowadle. Je�li zechc� nada� broni jakie� specjalne charakterystyki, to b�d� musia� u�y� dodatkowych sk�adnik�w.");
	if(waffe == WEAPON_Common)
	{
		PLAYER_TALENT_SMITH[WEAPON_Common] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Najprostszy miecz nie potrzebuje �adnych dodatk�w.");
	};
	if(waffe == WEAPON_1H_Special_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Gdy otrzymam 1 bry�k� rudy, zrobi� �D�UGI MIECZ Z RUDY�.");
	};
	if(waffe == WEAPON_2H_Special_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Gdy otrzymam 2 bry�ki rudy, zrobi� �MIECZ DWUR�CZNY Z RUDY�.");
	};
	if(waffe == WEAPON_1H_Special_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Gdy otrzymam 2 bry�ki rudy, zrobi� �MIECZ PӣTORAR�CZNY Z RUDY�.");
	};
	if(waffe == WEAPON_2H_Special_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Gdy otrzymam 3 bry�ki rudy, zrobi� �CIʯKI MIECZ DWUR�CZNY Z RUDY�.");
	};
	if(waffe == WEAPON_1H_Special_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Gdy otrzymam 3 bry�ki rudy, zrobi� �OSTRZE BOJOWE Z RUDY�.");
	};
	if(waffe == WEAPON_2H_Special_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Gdy otrzymam 4 bry�ki rudy, zrobi� �CIʯKIE OSTRZE BOJOWE Z RUDY�.");
	};
	if(waffe == WEAPON_1H_Special_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Gdy otrzymam 4 bry�ki rudy i 5 porcji smoczej krwi, zrobi� �OSTRZE Z RUDY NA SMOKI�.");
	};
	if(waffe == WEAPON_2H_Special_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Gdy otrzymam 5 bry�ek rudy i 5 porcji smoczej krwi, zrobi� �DU�E OSTRZE Z RUDY NA SMOKI�.");
	};
	PrintScreen(PRINT_LearnSmith,-1,-1,FONT_Screen,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,1);
	return TRUE;
};

