
instance DIA_Neoras_Kap1_EXIT(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 999;
	condition = DIA_Neoras_Kap1_EXIT_Condition;
	information = DIA_Neoras_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Neoras_Kap1_EXIT_Condition()
{
	if(Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Neoras_Hallo(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 2;
	condition = DIA_Neoras_Hallo_Condition;
	information = DIA_Neoras_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Neoras_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Neoras_Hallo_Info()
{
	AI_Output(self,other,"DIA_Neoras_Hallo_01_00");	//Co... co si� sta�o? Nie widzisz, �e w�a�nie przeprowadzam niezwykle skomplikowany eksperyment?
	AI_Output(other,self,"DIA_Neoras_Hallo_15_01");	//Nie chc� przeszkadza�.
	AI_Output(self,other,"DIA_Neoras_Hallo_01_02");	//Ju� przeszkodzi�e�... C�, m�w, czego chcesz?
};


instance DIA_Neoras_Arbeit(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 5;
	condition = DIA_Neoras_Arbeit_Condition;
	information = DIA_Neoras_Arbeit_Info;
	permanent = FALSE;
	description = "Czy masz dla mnie jak�� prac�?";
};


func int DIA_Neoras_Arbeit_Condition()
{
	if(MIS_KlosterArbeit == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Arbeit_Info()
{
	AI_Output(other,self,"DIA_Neoras_Arbeit_15_00");	//Czy masz dla mnie jak�� prac�?
	AI_Output(self,other,"DIA_Neoras_Arbeit_01_01");	//Tak, potrzebuj� pewnych ro�lin do moich eksperyment�w, a dok�adnie - musz� mie� ogniste pokrzywy.
	AI_Output(self,other,"DIA_Neoras_Arbeit_01_02");	//Wystarczy siedem kwiat�w. Przynie� mi je, prosz�. Ach, i jeszcze jedno, zapodzia�em gdzie� receptur� magicznych mikstur.
	AI_Output(self,other,"DIA_Neoras_Arbeit_01_03");	//Je�li j� znajdziesz, b�d� dozgonnie wdzi�czny.
	MIS_NeorasPflanzen = LOG_Running;
	MIS_NeorasRezept = LOG_Running;
	Log_CreateTopic(Topic_NeorasPflanzen,LOG_MISSION);
	Log_SetTopicStatus(Topic_NeorasPflanzen,LOG_Running);
	B_LogEntry(Topic_NeorasPflanzen,"Mam przynie�� Mistrzowi Neorasowi siedem ognistych pokrzyw.");
	Log_CreateTopic(Topic_Neorasrezept,LOG_MISSION);
	Log_SetTopicStatus(Topic_Neorasrezept,LOG_Running);
	B_LogEntry(Topic_Neorasrezept,"Mistrz Neoras nie mo�e znale�� receptury na mikstur� many.");
	if(Npc_KnowsInfo(other,DIA_Opolos_beibringen))
	{
		B_LogEntry(Topic_Neorasrezept,"To musi by� receptura, kt�r� chcia� pozna� Opolos.");
	};
};


instance DIA_Neoras_Rezept(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 6;
	condition = DIA_Neoras_Rezept_Condition;
	information = DIA_Neoras_Rezept_Info;
	permanent = TRUE;
	description = "Co do twojej receptury...";
};


func int DIA_Neoras_Rezept_Condition()
{
	if(MIS_NeorasRezept == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Rezept_Info()
{
	AI_Output(other,self,"DIA_Neoras_Rezept_15_00");	//Co do twojej receptury...
	if(B_GiveInvItems(other,self,ItWr_ManaRezept,1))
	{
		AI_Output(other,self,"DIA_Neoras_Rezept_15_01");	//Uda�o mi si� j� odnale��.
		AI_Output(self,other,"DIA_Neoras_Rezept_01_02");	//Doskonale, obawia�em si�, �e przepad�a na dobre.
		AI_Output(self,other,"DIA_Neoras_Rezept_01_03");	//Przyjmij, prosz�, t� mikstur� w dow�d mojej wdzi�czno�ci.
		MIS_NeorasRezept = LOG_SUCCESS;
		B_GivePlayerXP(XP_NeorasRezept);
		B_GiveInvItems(self,other,ItPo_Mana_02,1);
	}
	else
	{
		AI_Output(other,self,"DIA_Neoras_Rezept_15_04");	//Jeszcze jej nie znalaz�em.
		AI_Output(self,other,"DIA_Neoras_Rezept_01_05");	//C�, mam nadziej�, �e pr�dzej czy p�niej ci si� uda.
	};
};


instance DIA_Neoras_Flieder(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 7;
	condition = DIA_Neoras_Flieder_Condition;
	information = DIA_Neoras_Flieder_Info;
	permanent = TRUE;
	description = "Mam dla ciebie ogniste pokrzywy.";
};


func int DIA_Neoras_Flieder_Condition()
{
	if(MIS_NeorasPflanzen == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Flieder_Info()
{
	AI_Output(other,self,"DIA_Neoras_Flieder_15_00");	//Mam dla ciebie ogniste pokrzywy.
	if(B_GiveInvItems(other,self,ItPl_Mana_Herb_01,7))
	{
		AI_Output(self,other,"DIA_Neoras_Flieder_01_01");	//Doskonale, przydadz� mi si� w badaniach. W zamian we� ten zw�j 'Pi�� wichru', na pewno oka�e si� pomocny.
		MIS_NeorasPflanzen = LOG_SUCCESS;
		B_GivePlayerXP(XP_NeorasPflanzen);
		B_GiveInvItems(self,other,ItSc_Windfist,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_Flieder_01_02");	//Naprawd�? Och, masz ich za ma�o. Potrzebuj� SIEDMIU ro�lin.
	};
};


instance DIA_Neoras_TEACH(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 10;
	condition = DIA_Neoras_TEACH_Condition;
	information = DIA_Neoras_TEACH_Info;
	permanent = TRUE;
	description = "Czy m�g�bym si� u ciebie uczy�?";
};


func int DIA_Neoras_TEACH_Condition()
{
	return TRUE;
};

func void DIA_Neoras_TEACH_Info()
{
	AI_Output(other,self,"DIA_Neoras_TEACH_15_00");	//Czy m�g�bym si� u ciebie uczy�?
	if((other.guild == GIL_KDF) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Neoras_TEACH_01_01");	//Zdradz� ci arkana sztuk alchemicznych.
		Info_ClearChoices(DIA_Neoras_TEACH);
		Info_AddChoice(DIA_Neoras_TEACH,Dialog_Back,DIA_Neoras_TEACH_BACK);
		if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
		{
			Info_AddChoice(DIA_Neoras_TEACH,B_BuildLearnString("Esencja lecznicza",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY)),DIA_Neoras_TEACH_HEALTH_01);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,B_BuildLearnString("Ekstrakt leczniczy",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY)),DIA_Neoras_TEACH_Health_02);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,B_BuildLearnString("Eliksir leczniczy",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY)),DIA_Neoras_TEACH_Health_03);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,B_BuildLearnString("Eliksir �ycia",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY)),DIA_Neoras_TEACH_Perm_Health);
		};
		if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
		{
			Info_AddChoice(DIA_Neoras_TEACH,B_BuildLearnString("Esencja many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY)),DIA_Neoras_TEACH_Mana_01);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,B_BuildLearnString("Ekstrakt many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY)),DIA_Neoras_TEACH_Mana_02);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,B_BuildLearnString("Eliksir many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY)),DIA_Neoras_TEACH_Mana_03);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,B_BuildLearnString("Eliksir ducha",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY)),DIA_Neoras_TEACH_Perm_Mana);
		};
	}
	else if(hero.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Neoras_TEACH_01_02");	//Nie ucz� nowicjuszy. Je�li, pewnego dnia, zostaniesz przyj�ty do Kr�gu Ognia...
		AI_Output(self,other,"DIA_Neoras_TEACH_01_03");	//wtedy poka�� ci, jak tworzy� pot�ne mikstury.
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_TEACH_01_04");	//Swoj� wiedz� przekazuj� jedynie cz�onkom naszego ko�cio�a.
	};
};

func void DIA_Neoras_TEACH_BACK()
{
	Info_ClearChoices(DIA_Neoras_TEACH);
};

func void DIA_Neoras_TEACH_HEALTH_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
};

func void DIA_Neoras_TEACH_Health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
};

func void DIA_Neoras_TEACH_Health_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_03);
};

func void DIA_Neoras_TEACH_Perm_Health()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Health);
};

func void DIA_Neoras_TEACH_Mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
};

func void DIA_Neoras_TEACH_Mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
};

func void DIA_Neoras_TEACH_Mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
};

func void DIA_Neoras_TEACH_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
};


instance DIA_Neoras_Kap2_EXIT(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 999;
	condition = DIA_Neoras_Kap2_EXIT_Condition;
	information = DIA_Neoras_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Neoras_Kap2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Neoras_Kap3_EXIT(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 999;
	condition = DIA_Neoras_Kap3_EXIT_Condition;
	information = DIA_Neoras_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Neoras_Kap3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Neoras_BrewPotion(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 39;
	condition = DIA_Neoras_BrewPotion_Condition;
	information = DIA_Neoras_BrewPotion_Info;
	permanent = TRUE;
	description = "Czy m�g�by� przyrz�dzi� dla mnie jak�� mikstur�?";
};


func int DIA_Neoras_BrewPotion_Condition()
{
	if(NeorasBrewsForYou == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Neoras_BrewPotion_Info()
{
	AI_Output(other,self,"DIA_Neoras_BrewPotion_15_00");	//Czy m�g�by� przyrz�dzi� dla mnie jak�� mikstur�?
	if(hero.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_01");	//Jak na nowicjusza, jeste� strasznie impertynencki. Wracaj lepiej do swoich obowi�zk�w.
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_02");	//Wszystko, czego potrzebujesz, mo�esz kupi� u Goraxa.
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_03");	//Czy�by� w�tpi� w moje umiej�tno�ci? Potrafi� przygotowa� ka�d� mikstur�.
		AI_Output(other,self,"DIA_Neoras_BrewPotion_15_04");	//Doskonale.
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_05");	//Nie tak szybko. Wpierw musisz mi dostarczy� odpowiednie sk�adniki, no i zap�aci� za odczynniki i robocizn�.
		AI_Output(other,self,"DIA_Neoras_BrewPotion_15_06");	//Ile ��dasz?
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_07");	//Za samo sporz�dzenie mikstury - 10 sztuk z�ota.
		NeorasBrewsForYou = TRUE;
	};
};


instance DIA_Neoras_BrewForMe(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 39;
	condition = DIA_Neoras_BrewForMe_Condition;
	information = DIA_Neoras_BrewForMe_Info;
	permanent = TRUE;
	description = "Uwarz dla mnie...";
};


func int DIA_Neoras_BrewForMe_Condition()
{
	if(NeorasBrewsForYou == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Neoras_BrewForMe_Info()
{
	Info_ClearChoices(DIA_Neoras_BrewForMe);
	Info_AddChoice(DIA_Neoras_BrewForMe,Dialog_Back,DIA_Neoras_BrewForMe_Back);
	Info_AddChoice(DIA_Neoras_BrewForMe,"mikstur� szybko�ci.",DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice(DIA_Neoras_BrewForMe,"ekstrakt many.",DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice(DIA_Neoras_BrewForMe,"ekstrakt leczniczy.",DIA_Neoras_BrewForMe_Health);
};

func void DIA_Neoras_BrewForMe_Back()
{
	Info_ClearChoices(DIA_Neoras_BrewForMe);
};

func void DIA_Neoras_BrewForMe_Speed()
{
	AI_Output(other,self,"DIA_Neoras_BrewForMe_Speed_15_00");	//Czy mo�esz przyrz�dzi� dla mnie mikstur� szybko�ci?
	AI_Output(self,other,"DIA_Neoras_BrewForMe_Speed_01_01");	//Oczywi�cie, a masz potrzebne sk�adniki i z�oto?
	if((Npc_HasItems(other,ItPl_Speed_Herb_01) >= 1) && (Npc_HasItems(other,ItPl_Temp_Herb) >= 1) && (Npc_HasItems(other,ItMi_Gold) >= 10))
	{
		AI_Output(other,self,"DIA_Neoras_BrewForMe_Speed_15_02");	//Oto one.
		B_GiveInvItems(other,self,ItPl_Speed_Herb_01,1);
		B_GiveInvItems(other,self,ItPl_Temp_Herb,1);
		B_GiveInvItems(other,self,ItMi_Gold,10);
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Speed_01_03");	//�wietnie, dzi�kuj�. Zaraz dam ci mikstur�, nie b�dziesz musia� d�ugo czeka�.
		B_GiveInvItems(self,other,ItPo_Speed,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Speed_01_04");	//Nie masz odpowiednich sk�adnik�w. Wr��, kiedy je zgromadzisz.
	};
	Info_ClearChoices(DIA_Neoras_BrewForMe);
	Info_AddChoice(DIA_Neoras_BrewForMe,Dialog_Back,DIA_Neoras_BrewForMe_Back);
	Info_AddChoice(DIA_Neoras_BrewForMe,"Uwarz dla mnie mikstur� wielkiej szybko�ci.",DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice(DIA_Neoras_BrewForMe,"Czy mo�esz przyrz�dzi� dla mnie mikstur� many?",DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice(DIA_Neoras_BrewForMe,"Czy mo�esz przyrz�dzi� dla mnie eliksir leczniczy?",DIA_Neoras_BrewForMe_Health);
};

func void DIA_Neoras_BrewForMe_Mana()
{
	AI_Output(other,self,"DIA_Neoras_BrewForMe_Mana_15_00");	//Czy mo�esz przyrz�dzi� dla mnie mikstur� many?
	AI_Output(self,other,"DIA_Neoras_BrewForMe_Mana_01_01");	//Oczywi�cie, a masz potrzebne sk�adniki i z�oto?
	if((Npc_HasItems(other,ItPl_Mana_Herb_02) >= 2) && (Npc_HasItems(other,ItPl_Temp_Herb) >= 1) && (Npc_HasItems(other,ItMi_Gold) >= 10))
	{
		AI_Output(other,self,"DIA_Neoras_BrewForMe_Mana_15_02");	//Tak, oto one.
		B_GiveInvItems(other,self,ItPl_Mana_Herb_02,2);
		B_GiveInvItems(other,self,ItPl_Temp_Herb,1);
		B_GiveInvItems(other,self,ItMi_Gold,10);
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Mana_01_03");	//�wietnie. Zaraz dam ci mikstur�, nie b�dziesz musia� d�ugo czeka�.
		B_GiveInvItems(self,other,ItPo_Mana_02,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Mana_01_04");	//Nie masz odpowiednich sk�adnik�w. Wr��, kiedy je zgromadzisz.
	};
	Info_ClearChoices(DIA_Neoras_BrewForMe);
	Info_AddChoice(DIA_Neoras_BrewForMe,Dialog_Back,DIA_Neoras_BrewForMe_Back);
	Info_AddChoice(DIA_Neoras_BrewForMe,"Czy mo�esz przyrz�dzi� dla mnie mikstur� szybko�ci?",DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice(DIA_Neoras_BrewForMe,"Czy mo�esz przyrz�dzi� dla mnie mikstur� many?",DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice(DIA_Neoras_BrewForMe,"Czy mo�esz przyrz�dzi� dla mnie eliksir leczniczy?",DIA_Neoras_BrewForMe_Health);
};

func void DIA_Neoras_BrewForMe_Health()
{
	AI_Output(other,self,"DIA_Neoras_BrewForMe_Health_15_00");	//Czy mo�esz przyrz�dzi� dla mnie eliksir leczniczy?
	AI_Output(self,other,"DIA_Neoras_BrewForMe_Health_01_01");	//Oczywi�cie, a masz potrzebne sk�adniki i z�oto?
	if((Npc_HasItems(other,ItPl_Health_Herb_02) >= 2) && (Npc_HasItems(other,ItPl_Temp_Herb) >= 1) && (Npc_HasItems(other,ItMi_Gold) >= 10))
	{
		AI_Output(other,self,"DIA_Neoras_BrewForMe_Health_15_02");	//Tak, oto one.
		B_GiveInvItems(other,self,ItPl_Health_Herb_02,2);
		B_GiveInvItems(other,self,ItPl_Temp_Herb,1);
		B_GiveInvItems(other,self,ItMi_Gold,10);
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Health_01_03");	//�wietnie. Zaraz dam ci eliksir, nie b�dziesz musia� d�ugo czeka�.
		B_GiveInvItems(self,other,ItPo_Health_02,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Health_01_04");	//Nie masz odpowiednich sk�adnik�w. Wr��, kiedy je zgromadzisz.
	};
	Info_ClearChoices(DIA_Neoras_BrewForMe);
	Info_AddChoice(DIA_Neoras_BrewForMe,Dialog_Back,DIA_Neoras_BrewForMe_Back);
	Info_AddChoice(DIA_Neoras_BrewForMe,"Czy mo�esz przyrz�dzi� dla mnie mikstur� szybko�ci?",DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice(DIA_Neoras_BrewForMe,"Czy mo�esz przyrz�dzi� dla mnie mikstur� many?",DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice(DIA_Neoras_BrewForMe,"Czy mo�esz przyrz�dzi� dla mnie eliksir leczniczy?",DIA_Neoras_BrewForMe_Health);
};


instance DIA_Neoras_Kap4_EXIT(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 999;
	condition = DIA_Neoras_Kap4_EXIT_Condition;
	information = DIA_Neoras_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Neoras_Kap4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Neoras_DRACHENEIER(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 40;
	condition = DIA_Neoras_DRACHENEIER_Condition;
	information = DIA_Neoras_DRACHENEIER_Info;
	permanent = TRUE;
	description = "Wygl�dasz na zm�czonego.";
};


func int DIA_Neoras_DRACHENEIER_Condition()
{
	if((Kapitel >= 4) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)) && (MIS_Neoras_DragonEgg == 0))
	{
		return TRUE;
	};
};

func void DIA_Neoras_DRACHENEIER_Info()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_15_00");	//Wygl�dasz na zm�czonego.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_01_01");	//To prawda, jestem kompletnie wycie�czony. Od tygodni m�cz� si� nad pewn� przekl�t� mieszank�. I nic, nie dzia�a.
	Info_ClearChoices(DIA_Neoras_DRACHENEIER);
	Info_AddChoice(DIA_Neoras_DRACHENEIER,"To nie m�j problem.",DIA_Neoras_DRACHENEIER_no);
	Info_AddChoice(DIA_Neoras_DRACHENEIER,"Co to ma niby by� za mikstura?",DIA_Neoras_DRACHENEIER_trank);
	Info_AddChoice(DIA_Neoras_DRACHENEIER,"Jaki� problem?",DIA_Neoras_DRACHENEIER_ei);
};

func void DIA_Neoras_DRACHENEIER_ei()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_15_00");	//W czym problem?
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_01_01");	//Receptura m�wi co� o smoczym jaju. Niestety, nie mam tego sk�adnika.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_01_02");	//Pr�buj� zast�pi� go innym, jednak, jak na razie, z mizernym skutkiem.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_01_03");	//Je�li uda�oby ci si� na nie natkn��, pomy�l o mnie.
	Info_AddChoice(DIA_Neoras_DRACHENEIER,"Czego u�ywasz zamiast smoczych jaj?",DIA_Neoras_DRACHENEIER_ei_statt);
	Info_AddChoice(DIA_Neoras_DRACHENEIER,"Zobacz�, co da si� zrobi�.",DIA_Neoras_DRACHENEIER_ei_jep);
};

func void DIA_Neoras_DRACHENEIER_ei_jep()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_jep_15_00");	//Zobacz�, co si� da zrobi�.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_jep_01_01");	//Spokojnie, tylko �artowa�em. W�tpi�, by uda�o ci si� znale�� jajo smoka.
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_jep_15_02");	//Sk�d ta pewno��?
	Info_ClearChoices(DIA_Neoras_DRACHENEIER);
	Log_CreateTopic(TOPIC_DRACHENEIERNeoras,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENEIERNeoras,LOG_Running);
	B_LogEntry(TOPIC_DRACHENEIERNeoras,"Neoras potrzebuje smoczego jaja do swoich eksperyment�w. Niewykluczone, �e uda mi si� je znale�� w jakiej� jaskini.");
	MIS_Neoras_DragonEgg = LOG_Running;
};

func void DIA_Neoras_DRACHENEIER_ei_statt()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_statt_15_00");	//Czego u�ywasz zamiast smoczych jaj?
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_statt_01_01");	//Wierz mi, nie chcesz wiedzie�.
};

func void DIA_Neoras_DRACHENEIER_trank()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_trank_15_00");	//O jakiej miksturze w�a�ciwie m�wisz?
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_trank_01_01");	//Receptur� kupi�em od obwo�nego kupca. Jej tre�� jest wielce dziwaczna, a zarazem ciekawa.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_trank_01_02");	//Nie mam pewno�ci co do efektu dzia�ania mikstury, jednak ciekawo�� nie pozwala mi przerwa� bada�.
};

func void DIA_Neoras_DRACHENEIER_no()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_no_15_00");	//To nie moja sprawa.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_no_01_01");	//W takim razie nie zawracaj mi g�owy.
	Info_ClearChoices(DIA_Neoras_DRACHENEIER);
};


instance DIA_Neoras_FOUNDDRAGONEGG(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 3;
	condition = DIA_Neoras_FOUNDDRAGONEGG_Condition;
	information = DIA_Neoras_FOUNDDRAGONEGG_Info;
	description = "Prosz�, mam dla ciebie jajo smoka.";
};


func int DIA_Neoras_FOUNDDRAGONEGG_Condition()
{
	if(Npc_HasItems(other,ItAt_DragonEgg_MIS) && (MIS_Neoras_DragonEgg == LOG_Running))
	{
		return TRUE;
	};
};


var int Neoras_DragonEggDrink_Day;

func void DIA_Neoras_FOUNDDRAGONEGG_Info()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_15_00");	//Prosz�, mam dla ciebie jajo smoka.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_01_01");	//Raczysz sobie �artowa�.
	B_GiveInvItems(other,self,ItAt_DragonEgg_MIS,1);
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_01_02");	//Jest prawdziwe! Sk�d je masz?! Jak je znalaz�e�?
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_15_03");	//Wola�bym zachowa� to dla siebie.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_01_04");	//Jak uwa�asz. Co za nie chcesz?
	MIS_Neoras_DragonEgg = LOG_SUCCESS;
	B_GivePlayerXP(XP_Neoras_DragonEgg);
	Info_ClearChoices(DIA_Neoras_FOUNDDRAGONEGG);
	Info_AddChoice(DIA_Neoras_FOUNDDRAGONEGG,"Zaskocz mnie.",DIA_Neoras_FOUNDDRAGONEGG_irgendwas);
	Info_AddChoice(DIA_Neoras_FOUNDDRAGONEGG,"Mo�e mikstury lecznicze?",DIA_Neoras_FOUNDDRAGONEGG_heil);
	Info_AddChoice(DIA_Neoras_FOUNDDRAGONEGG,"Daj mi troch� mikstury, kiedy b�dzie gotowa.",DIA_Neoras_FOUNDDRAGONEGG_trank);
};


var int Neoras_SCWantsDragonEggDrink;

func void DIA_Neoras_FOUNDDRAGONEGG_trank()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_trank_15_00");	//Daj mi troch� mikstury, kiedy b�dzie gotowa.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_trank_01_01");	//W porz�dku. Ale pami�taj, co ci powiedzia�em, nie wiem, jaki b�dzie rezultat tego eksperymentu.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_trank_01_02");	//Przyjd� p�niej, kiedy sko�cz�.
	Neoras_DragonEggDrink_Day = Wld_GetDay();
	Neoras_SCWantsDragonEggDrink = TRUE;
	Info_ClearChoices(DIA_Neoras_FOUNDDRAGONEGG);
};

func void DIA_Neoras_FOUNDDRAGONEGG_heil()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_heil_15_00");	//Mo�e mikstury lecznicze?
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_heil_01_01");	//Doskona�y wyb�r. Prosz�, oto one. Na pewno ci si� przydadz�.
	CreateInvItems(self,ItPo_Health_03,3);
	B_GiveInvItems(self,other,ItPo_Health_03,3);
	Info_ClearChoices(DIA_Neoras_FOUNDDRAGONEGG);
};

func void DIA_Neoras_FOUNDDRAGONEGG_irgendwas()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_irgendwas_15_00");	//Zaskocz mnie.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_irgendwas_01_01");	//Mmm. W porz�dku. We� ten magiczny pier�cie�. Na pewno przyda si� w starciach z wrogami.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_irgendwas_01_02");	//B�dzie ci� chroni� przed atakami magicznych istot.
	CreateInvItems(self,ItRi_Prot_Mage_02,1);
	B_GiveInvItems(self,other,ItRi_Prot_Mage_02,1);
	Info_ClearChoices(DIA_Neoras_FOUNDDRAGONEGG);
};


instance DIA_Neoras_DRAGONEGGDRINK(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 3;
	condition = DIA_Neoras_DRAGONEGGDRINK_Condition;
	information = DIA_Neoras_DRAGONEGGDRINK_Info;
	description = "Przychodz� po straszliw� mikstur� ze smoczego jaja.";
};


func int DIA_Neoras_DRAGONEGGDRINK_Condition()
{
	if((Neoras_DragonEggDrink_Day <= (Wld_GetDay() - 2)) && (Neoras_SCWantsDragonEggDrink == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Neoras_DRAGONEGGDRINK_Info()
{
	AI_Output(other,self,"DIA_Neoras_DRAGONEGGDRINK_15_00");	//Przychodz� po straszliw� mikstur� ze smoczego jaja.
	AI_Output(self,other,"DIA_Neoras_DRAGONEGGDRINK_01_01");	//Ach tak, w�a�nie j� przygotowa�em. Nie mia�em jednak czasu jej przetestowa� i nie wezm� odpowiedzialno�ci za niepo��dane efekty.
	AI_Output(other,self,"DIA_Neoras_DRAGONEGGDRINK_15_02");	//Oddaj mi j� natychmiast.
	AI_Output(self,other,"DIA_Neoras_DRAGONEGGDRINK_01_03");	//Dobrze ju�, dobrze. Mam tylko nadziej�, �e nie eksploduje ci od niej g�owa.
	CreateInvItems(self,ItPo_DragonEggDrinkNeoras_MIS,1);
	B_GiveInvItems(self,other,ItPo_DragonEggDrinkNeoras_MIS,1);
};


instance DIA_Neoras_USEDDRAGONEGGDRINK(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 3;
	condition = DIA_Neoras_USEDDRAGONEGGDRINK_Condition;
	information = DIA_Neoras_USEDDRAGONEGGDRINK_Info;
	description = "Wypr�bowa�em mikstur� ze smoczych jaj. �wietna sprawa!";
};


func int DIA_Neoras_USEDDRAGONEGGDRINK_Condition()
{
	if(Neoras_SCUsedDragonEggDrink == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Neoras_USEDDRAGONEGGDRINK_Info()
{
	AI_Output(other,self,"DIA_Neoras_USEDDRAGONEGGDRINK_15_00");	//Wypr�bowa�em mikstur� ze smoczych jaj. �wietna sprawa!
	AI_Output(self,other,"DIA_Neoras_USEDDRAGONEGGDRINK_01_01");	//Mmm. Zaiste ciekawe. Musz� si� zaraz wzi�� do dalszych bada�, absolutnie!
	AI_Output(other,self,"DIA_Neoras_USEDDRAGONEGGDRINK_15_02");	//Czy mo�esz zrobi� jej dla mnie wi�cej?
	AI_Output(self,other,"DIA_Neoras_USEDDRAGONEGGDRINK_01_03");	//Poczekajmy kilka tygodni, nim znowu j� wypr�bujemy. No, chyba �e chcesz, by wyros�y ci rogi.
};


instance DIA_Neoras_Kap5_EXIT(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 999;
	condition = DIA_Neoras_Kap5_EXIT_Condition;
	information = DIA_Neoras_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Neoras_Kap5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Neoras_PICKPOCKET(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 900;
	condition = DIA_Neoras_PICKPOCKET_Condition;
	information = DIA_Neoras_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Neoras_PICKPOCKET_Condition()
{
	return C_Beklauen(72,140);
};

func void DIA_Neoras_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Neoras_PICKPOCKET);
	Info_AddChoice(DIA_Neoras_PICKPOCKET,Dialog_Back,DIA_Neoras_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Neoras_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Neoras_PICKPOCKET_DoIt);
};

func void DIA_Neoras_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Neoras_PICKPOCKET);
};

func void DIA_Neoras_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Neoras_PICKPOCKET);
};

