
instance DIA_GARVELL_EXIT(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 999;
	condition = dia_garvell_exit_condition;
	information = dia_garvell_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garvell_exit_condition()
{
	return TRUE;
};

func void dia_garvell_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GARVELL_PICKPOCKET(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 900;
	condition = dia_garvell_pickpocket_condition;
	information = dia_garvell_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie¿ tego mieszka bêdzie dziecinnie ³atwa)";
};


func int dia_garvell_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itse_goldpocket25) >= 1) && (other.attribute[ATR_DEXTERITY] >= (10 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_garvell_pickpocket_info()
{
	Info_ClearChoices(dia_garvell_pickpocket);
	Info_AddChoice(dia_garvell_pickpocket,DIALOG_BACK,dia_garvell_pickpocket_back);
	Info_AddChoice(dia_garvell_pickpocket,DIALOG_PICKPOCKET,dia_garvell_pickpocket_doit);
};

func void dia_garvell_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 10)
	{
		b_giveinvitems(self,other,5602,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_giveplayerxp(XP_AMBIENT);
		Info_ClearChoices(dia_garvell_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_garvell_pickpocket_back()
{
	Info_ClearChoices(dia_garvell_pickpocket);
};


instance DIA_GARVELL_GREET(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 2;
	condition = dia_garvell_greet_condition;
	information = dia_garvell_greet_info;
	description = "Co tu porabiasz?";
};


func int dia_garvell_greet_condition()
{
	if(Wld_IsTime(5,0,19,0))
	{
		return TRUE;
	};
};

func void dia_garvell_greet_info()
{
	AI_Output(other,self,"DIA_Garvell_GREET_15_00");	//Co tu robisz?
	AI_Output(self,other,"DIA_Garvell_GREET_04_01");	//Budujê statek i chcê siê jak najszybciej st¹d wydostaæ.
	AI_Output(self,other,"DIA_Garvell_GREET_04_02");	//Wygl¹da jednak na to, ¿e nigdy nie zdo³am ukoñczyæ budowy.
};


instance DIA_GARVELL_EILIG(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 2;
	condition = dia_garvell_eilig_condition;
	information = dia_garvell_eilig_info;
	description = "Czemu siê tak strasznie spieszysz?";
};


func int dia_garvell_eilig_condition()
{
	if(Npc_KnowsInfo(other,dia_garvell_greet))
	{
		return TRUE;
	};
};

func void dia_garvell_eilig_info()
{
	AI_Output(other,self,"DIA_Garvell_eilig_15_00");	//Czemu siê tak strasznie spieszysz?
	AI_Output(self,other,"DIA_Garvell_eilig_04_01");	//Wkrótce przybêd¹ orkowie i spal¹ to miasto.
	AI_Output(other,self,"DIA_Garvell_eilig_15_02");	//Czemu tak s¹dzisz?
	AI_Output(self,other,"DIA_Garvell_eilig_04_03");	//A nie zauwa¿y³eœ tych wszystkich paladynów? Jak s¹dzisz, co oni tutaj robi¹?
	AI_Output(self,other,"DIA_Garvell_eilig_04_04");	//Powiem ci - przybyli tutaj, bo wkrótce rozpocznie siê atak orków. Bêdzie gor¹co.
};


instance DIA_GARVELL_SCHIFF(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 99;
	condition = dia_garvell_schiff_condition;
	information = dia_garvell_schiff_info;
	description = "Czemu nie mo¿esz dokoñczyæ budowy statku?";
};


func int dia_garvell_schiff_condition()
{
	if(Npc_KnowsInfo(other,dia_garvell_greet))
	{
		return TRUE;
	};
};

func void dia_garvell_schiff_info()
{
	AI_Output(other,self,"DIA_Garvell_Schiff_15_00");	//Czemu nie mo¿esz dokoñczyæ budowy statku?
	AI_Output(self,other,"DIA_Garvell_Schiff_04_01");	//Och, mamy tysi¹ce problemów. Kad³ub wci¹¿ jeszcze nie stabilny, brakuje wielu elementów...
	AI_Output(self,other,"DIA_Garvell_Schiff_04_02");	//Niestety, nie mam ju¿ pieniêdzy na zakup nowych materia³ów, a w ostatniej dostawie pe³no by³o korników.
	AI_Output(self,other,"DIA_Garvell_Schiff_04_03");	//Moi ch³opcy te¿ nie pracuj¹ zbyt produktywnie. Jednemu zale¿y tylko i wy³¹cznie na tym, ¿eby statek by³ szybki, drugi najbardziej przejmuje siê figur¹ dziobow¹!
	AI_Output(self,other,"DIA_Garvell_Schiff_04_04");	//Jakbyœmy nie mieli wa¿niejszych problemów!
};


instance DIA_GARVELL_MISSION(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 2;
	condition = dia_garvell_mission_condition;
	information = dia_garvell_mission_info;
	permanent = FALSE;
	description = "Czy mogê ci jakoœ pomóc?";
};


func int dia_garvell_mission_condition()
{
	if(Npc_KnowsInfo(other,dia_garvell_eilig) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_garvell_mission_info()
{
	AI_Output(other,self,"DIA_Garvell_MISSION_15_00");	//Czy mogê ci jakoœ pomóc?
	AI_Output(self,other,"DIA_Garvell_MISSION_04_01");	//Oczywiœcie. Spróbuj siê dowiedzieæ, co planuj¹ paladyni. Jestem ciekaw, po co tu przybyli.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_02");	//Muszê wiedzieæ, czy orkowie faktycznie zamierzaj¹ zaatakowaæ, a jeœli tak, to w jakiej odleg³oœci od miasta siê znajduj¹.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_03");	//Jeden z tych œmierdzieli podobno pojawi³ siê tu¿ za miastem...
	AI_Output(self,other,"DIA_Garvell_MISSION_04_04");	//Po prostu dowiedz siê tyle, ile mo¿esz.
	AI_Output(self,other,"DIA_Garvell_Add_04_00");	//Chcê wiedzieæ, ile mam jeszcze czasu na dokoñczenie budowy okrêtu.
	MIS_GARVELL_INFOS = LOG_RUNNING;
	KNOWS_ORK = TRUE;
	Log_CreateTopic(TOPIC_GARVELL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GARVELL,LOG_RUNNING);
	b_logentry(TOPIC_GARVELL,"Garvell chce siê dowiedzieæ jak najwiêcej na temat orków. Chce te¿ wiedzieæ, czemu w mieœcie przebywaj¹ paladyni.");
};

func void b_garvellweiter()
{
	AI_Output(self,other,"DIA_Garvell_Weiter_04_00");	//Dobrze. Jeœli dowiesz siê czegoœ wiêcej, daj mi znaæ.
};

func void b_garvellsuccess()
{
	AI_Output(self,other,"DIA_Garvell_Success_04_00");	//Dziêkujê za informacje. Wygl¹da na to, ¿e mamy ca³¹ masê czasu na ukoñczenie naszego statku.
	MIS_GARVELL_INFOS = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_GARVELL_ORKS(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 3;
	condition = dia_garvell_orks_condition;
	information = dia_garvell_orks_info;
	permanent = FALSE;
	description = "Mam informacje dotycz¹ce orków.";
};


func int dia_garvell_orks_condition()
{
	if((MIS_GARVELL_INFOS == LOG_RUNNING) && (KNOWS_PALADINS >= 1))
	{
		return TRUE;
	};
};

func void dia_garvell_orks_info()
{
	AI_Output(other,self,"DIA_Garvell_Orks_15_00");	//Mam informacje dotycz¹ce orków.
	AI_Output(self,other,"DIA_Garvell_Orks_04_01");	//S³ucham.
	AI_Output(other,self,"DIA_Garvell_Orks_15_02");	//Utknêli w Górniczej Dolinie, i wygl¹da na to, ¿e ju¿ tam pozostan¹.
	AI_Output(other,self,"DIA_Garvell_Orks_15_03");	//Paladyni strzeg¹ prze³êczy.
	TELL_GARVELL = TELL_GARVELL + 1;
	b_giveplayerxp(XP_AMBIENT);
	if(TELL_GARVELL >= 3)
	{
		b_garvellsuccess();
	}
	else
	{
		b_garvellweiter();
	};
};


instance DIA_GARVELL_PALADINE(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 2;
	condition = dia_garvell_paladine_condition;
	information = dia_garvell_paladine_info;
	permanent = FALSE;
	description = "Wiem, co tu robi¹ paladyni.";
};


func int dia_garvell_paladine_condition()
{
	if((MIS_GARVELL_INFOS == LOG_RUNNING) && (KNOWSPALADINS_ORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_garvell_paladine_info()
{
	AI_Output(other,self,"DIA_Garvell_Paladine_15_00");	//Wiem, co tu robi¹ paladyni.
	AI_Output(self,other,"DIA_Garvell_Paladine_04_01");	//Naprawdê? Powiedz!
	AI_Output(other,self,"DIA_Garvell_Paladine_15_02");	//Paladyni nie przybyli tutaj, dlatego ¿e spodziewaj¹ siê ataku orków. Ich celem jest zdobycie magicznej rudy z Górniczej Doliny.
	AI_Output(other,self,"DIA_Garvell_Paladine_15_03");	//Kiedy tylko j¹ zdobêd¹, powróc¹ na kontynent.
	TELL_GARVELL = TELL_GARVELL + 1;
	b_giveplayerxp(XP_AMBIENT);
	if(TELL_GARVELL >= 3)
	{
		b_garvellsuccess();
	}
	else
	{
		b_garvellweiter();
	};
};


instance DIA_GARVELL_CITY(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 4;
	condition = dia_garvell_city_condition;
	information = dia_garvell_city_info;
	permanent = FALSE;
	description = "Co do tego orka za miastem…";
};


func int dia_garvell_city_condition()
{
	if((MIS_GARVELL_INFOS == LOG_RUNNING) && (KNOWS_PALADINS >= 2))
	{
		return TRUE;
	};
};

func void dia_garvell_city_info()
{
	AI_Output(other,self,"DIA_Garvell_City_15_00");	//Co do tego orka za miastem...
	AI_Output(self,other,"DIA_Garvell_City_04_01");	//Taaak...?
	AI_Output(other,self,"DIA_Garvell_City_15_02");	//Nie przejmuj siê nim. Stra¿ da sobie radê.
	TELL_GARVELL = TELL_GARVELL + 1;
	b_giveplayerxp(XP_AMBIENT);
	if(TELL_GARVELL >= 3)
	{
		b_garvellsuccess();
	}
	else
	{
		b_garvellweiter();
	};
};


instance DIA_GARVELL_PERM(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 13;
	condition = dia_garvell_perm_condition;
	information = dia_garvell_perm_info;
	permanent = TRUE;
	description = "Co siê dzieje w porcie?";
};


func int dia_garvell_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_garvell_mission))
	{
		return TRUE;
	};
};

func void dia_garvell_perm_info()
{
	AI_Output(other,self,"DIA_Garvell_Perm_15_00");	//Co siê dzieje w porcie?
	if(MIS_GARVELL_INFOS != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Garvell_Perm_04_01");	//Orkowie depcz¹ nam po piêtach, a ty pytasz, co siê dzieje w porcie?
		AI_Output(other,self,"DIA_Garvell_Perm_15_02");	//Chcia³em tylko...
		AI_Output(self,other,"DIA_Garvell_Perm_04_03");	//Najwiêkszy problem w tym, ¿e w porcie jest zbyt ma³o statków, ¿eby wszyscy mogli siê ewakuowaæ.
		AI_Output(self,other,"DIA_Garvell_Perm_04_04");	//Szczerze mówi¹c, to jest tu tylko jeden statek, i w dodatku nale¿y do paladynów.
	}
	else
	{
		AI_Output(self,other,"DIA_Garvell_Perm_04_05");	//Mo¿esz siê rozejrzeæ. Jak widzisz, nic siê tu nie dzieje.
	};
};

