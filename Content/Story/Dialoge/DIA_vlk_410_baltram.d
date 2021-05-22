
instance DIA_Baltram_EXIT(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 999;
	condition = DIA_Baltram_EXIT_Condition;
	information = DIA_Baltram_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Baltram_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Baltram_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BALTRAM_SPERRE(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 1;
	condition = dia_baltram_sperre_condition;
	information = dia_baltram_sperre_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_baltram_sperre_condition()
{
	if((Canthar_Sperre == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_baltram_sperre_info()
{
	AI_Output(self,other,"DIA_Baltram_Sperre_01_00");	//Czego chcesz? Jeste� skaza�cem z kolonii g�rniczej. Nie... Nie b�d� z tob� robi� interes�w!
	AI_StopProcessInfos(self);
};


instance DIA_Baltram_Hallo(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 2;
	condition = DIA_Baltram_Hallo_Condition;
	information = DIA_Baltram_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Baltram_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Canthar_Sperre == FALSE) && (MIS_Nagur_Bote == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Baltram_Hallo_Info()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Baltram_Hallo_01_00");	//Witaj, przybyszu. Nazywam si� Baltram. Przyszed�e� uzupe�ni� zapasy jedzenia?
		AI_Output(self,other,"DIA_Baltram_Hallo_01_01");	//Niestety, musz� ci� rozczarowa�. W tej chwili nie mam zbyt wielu zapas�w.
		AI_Output(self,other,"DIA_Baltram_Hallo_01_02");	//Ale wkr�tce dostan� now� dostaw�.
	}
	else
	{
		AI_Output(self,other,"DIA_Baltram_Hallo_01_03");	//Je�li przyszed�e�, �eby kupi� jedzenie, to mo�esz ju� odej��.
		AI_Output(self,other,"DIA_Baltram_Hallo_01_04");	//Wy, najemnicy, nic mnie nie obchodzicie! Mam przez was tylko k�opoty.
	};
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Baltram sprzedaje na targowisku �ywno��.");
};


instance DIA_Baltram_Job(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 3;
	condition = DIA_Baltram_Job_Condition;
	information = DIA_Baltram_Job_Info;
	permanent = FALSE;
	description = "Masz dla mnie jak�� robot�?";
};


func int DIA_Baltram_Job_Condition()
{
	if((MIS_Nagur_Bote != LOG_Running) && (MIS_Nagur_Bote != LOG_SUCCESS) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Baltram_Job_Info()
{
	AI_Output(other,self,"DIA_Baltram_Job_15_00");	//Masz dla mnie jak�� prac�?
	AI_Output(self,other,"DIA_Baltram_Job_01_01");	//Nie, mam ju� ch�opca na posy�ki. Porozmawiaj z innymi kupcami.
};


instance DIA_Baltram_Trick(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 4;
	condition = DIA_Baltram_Trick_Condition;
	information = DIA_Baltram_Trick_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Baltram_Trick_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_Nagur_Bote == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Baltram_Trick_Info()
{
	AI_Output(self,other,"DIA_Baltram_Trick_01_00");	//Szukasz pracy?
	AI_Output(other,self,"DIA_Baltram_Trick_15_01");	//Jasne, a o co chodzi?
	AI_Output(self,other,"DIA_Baltram_Trick_01_02");	//M�j ch�opiec na posy�ki nie wr�ci�, a czekam na dostaw� od farmera Akila.
	AI_Output(other,self,"DIA_Baltram_Trick_15_03");	//A ile na tym zarobi�?
	AI_Output(self,other,"DIA_Baltram_Trick_01_04");	//Dam ci 50 sztuk z�ota.
	AI_Output(other,self,"DIA_Baltram_Trick_15_05");	//�wietnie, zajm� si� tym.
	AI_Output(self,other,"DIA_Baltram_Trick_01_06");	//W porz�dku, powiedz Akilowi, �e ja ci� przys�a�em. Dostaniesz od niego paczk�. Przynie� j� do mnie.
	MIS_Baltram_ScoutAkil = LOG_Running;
	B_LogEntry(TOPIC_Nagur,"Baltram zatrudni� mnie jako ch�opca na posy�ki. Mam przynie�� przesy�k� z farmy Akila.");
	Log_CreateTopic(TOPIC_Baltram,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Baltram,LOG_Running);
	B_LogEntry(TOPIC_Baltram,"Je�li przynios� Baltramowi przesy�k�, zap�aci mi 50 sztuk z�ota.");
};


instance DIA_Baltram_WAREZ(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 2;
	condition = DIA_Baltram_WAREZ_Condition;
	information = DIA_Baltram_WAREZ_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Poka� mi swoje towary.";
};


func int DIA_Baltram_WAREZ_Condition()
{
	return TRUE;
};

func void DIA_Baltram_WAREZ_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Baltram_WAREZ_15_00");	//Poka� mi swoje towary.
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_01");	//Nie powinni byli do tego dopu�ci�. No i jeden z najemnik�w zamordowa� paladyna.
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_02");	//Co� si� musia�o w ko�cu sta�!
	};
	if((MIS_BaltramTrade != LOG_SUCCESS) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_03");	//Tacy jak ty nic ode mnie nie dostan�.
		AI_Output(other,self,"DIA_Baltram_WAREZ_15_04");	//Dlaczego?
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_05");	//Najpierw podjudzasz wie�niak�w, a potem udajesz, �e nic si� nie sta�o.
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_06");	//A teraz zje�d�aj, odstraszasz mi klient�w.
		MIS_BaltramTrade = LOG_FAILED;
		AI_StopProcessInfos(self);
	};
};


instance DIA_Baltram_AkilsHof(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 4;
	condition = DIA_Baltram_AkilsHof_Condition;
	information = DIA_Baltram_AkilsHof_Info;
	permanent = FALSE;
	description = "Jak trafi� do gospodarstwa Akila?";
};


func int DIA_Baltram_AkilsHof_Condition()
{
	if(MIS_Baltram_ScoutAkil == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Baltram_AkilsHof_Info()
{
	AI_Output(other,self,"DIA_Baltram_AkilsHof_15_00");	//Jak trafi� do gospodarstwa Akila?
	AI_Output(self,other,"DIA_Baltram_AkilsHof_01_01");	//Wyjd� st�d przez wschodni� bram� i id� drog� na po�udniowy wsch�d.
	AI_Output(self,other,"DIA_Baltram_AkilsHof_01_02");	//Po chwili dojdziesz do kamiennych schod�w. Wejd� po nich i zobaczysz gospodarstwo Akila.
};


instance DIA_Baltram_Lieferung(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 5;
	condition = DIA_Baltram_Lieferung_Condition;
	information = DIA_Baltram_Lieferung_Info;
	permanent = FALSE;
	description = "Mam przesy�k� od Akila.";
};


func int DIA_Baltram_Lieferung_Condition()
{
	if(Npc_HasItems(other,ItMi_BaltramPaket) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Baltram_Lieferung_Info()
{
	AI_Output(other,self,"DIA_Baltram_Lieferung_15_00");	//Mam przesy�k� od Akila.
	AI_Output(self,other,"DIA_Baltram_Lieferung_01_01");	//Doskonale. Znowu mog� oferowa� �wie�y towar. Oto twoje 50 sztuk z�ota.
	B_GiveInvItems(other,self,ItMi_BaltramPaket,1);
	B_GiveInvItems(self,other,ItMi_Gold,50);
	MIS_Baltram_ScoutAkil = LOG_SUCCESS;
	MIS_Nagur_Bote = LOG_FAILED;
	B_GivePlayerXP(XP_Baltram_ScoutAkil);
	Npc_RemoveInvItems(self,ItMi_BaltramPaket,1);
	CreateInvItems(self,ItFo_Cheese,5);
	CreateInvItems(self,ItFo_Apple,10);
	CreateInvItems(self,ItFo_Beer,5);
	CreateInvItems(self,ItFo_Bacon,5);
	CreateInvItems(self,ItFo_Sausage,5);
};


instance DIA_Baltram_LetUsTrade(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 6;
	condition = DIA_Baltram_LetUsTrade_Condition;
	information = DIA_Baltram_LetUsTrade_Info;
	permanent = FALSE;
	description = "Nie mo�emy mimo wszystko robi� wsp�lnie interes�w?";
};


func int DIA_Baltram_LetUsTrade_Condition()
{
	if(MIS_BaltramTrade == LOG_FAILED)
	{
		return TRUE;
	};
};

func void DIA_Baltram_LetUsTrade_Info()
{
	AI_Output(other,self,"DIA_Baltram_LetUsTrade_15_00");	//Nie mo�emy mimo wszystko robi� wsp�lnie interes�w?
	AI_Output(self,other,"DIA_Baltram_LetUsTrade_01_01");	//S�uchaj, je�li dostarczysz mi 10 szynek i 10 butelek wina, to znowu ubijemy interes.
	AI_Output(other,self,"DIA_Baltram_LetUsTrade_15_02");	//Zobacz�, co si� da zrobi�.
	MIS_BaltramTrade = LOG_Running;
};


var int BaltramEnoughBacon;
var int BaltramEnoughWine;

instance DIA_Baltram_HaveYourWarez(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 6;
	condition = DIA_Baltram_HaveYourWarez_Condition;
	information = DIA_Baltram_HaveYourWarez_Info;
	permanent = TRUE;
	description = "Mam to, czego chcia�e�.";
};


func int DIA_Baltram_HaveYourWarez_Condition()
{
	if((MIS_BaltramTrade == LOG_Running) && (MIS_BaltramTrade != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Baltram_HaveYourWarez_Info()
{
	AI_Output(other,self,"DIA_Baltram_HaveYourWarez_15_00");	//Mam to, czego chcia�e�.
	AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_01");	//Poka�.
	if(Npc_HasItems(other,ItFo_Bacon) < 10)
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_02");	//Um�wili�my si� na 10 szynek. Przyjd� do mnie, jak b�dziesz tyle mia�.
		BaltramEnoughBacon = FALSE;
	}
	else
	{
		BaltramEnoughBacon = TRUE;
	};
	if(Npc_HasItems(other,ItFo_Wine) < 10)
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_03");	//A co z 10 butelkami wina? Zapomnia�e�?
		BaltramEnoughWine = FALSE;
	}
	else
	{
		BaltramEnoughWine = TRUE;
	};
	if((BaltramEnoughBacon == TRUE) && (BaltramEnoughWine == TRUE))
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_04");	//Hmmm, nie jest najlepsze, ale w dzisiejszych czasach nie mo�na by� zbyt wybrednym.
		B_GiveInvItems(other,self,ItFo_Bacon,10);
		B_GiveInvItems(other,self,ItFo_Wine,10);
		MIS_BaltramTrade = LOG_SUCCESS;
		B_GivePlayerXP(XP_BaltramTrade);
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_05");	//No, teraz mo�emy przej�� do interes�w.
	};
};


instance DIA_Baltram_PICKPOCKET(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 900;
	condition = DIA_Baltram_PICKPOCKET_Condition;
	information = DIA_Baltram_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Baltram_PICKPOCKET_Condition()
{
	return C_Beklauen(76,175);
};

func void DIA_Baltram_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Baltram_PICKPOCKET);
	Info_AddChoice(DIA_Baltram_PICKPOCKET,Dialog_Back,DIA_Baltram_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Baltram_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Baltram_PICKPOCKET_DoIt);
};

func void DIA_Baltram_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Baltram_PICKPOCKET);
};

func void DIA_Baltram_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Baltram_PICKPOCKET);
};

