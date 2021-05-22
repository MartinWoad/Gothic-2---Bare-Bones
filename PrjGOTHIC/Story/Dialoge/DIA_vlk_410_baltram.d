
instance DIA_BALTRAM_EXIT(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 999;
	condition = dia_baltram_exit_condition;
	information = dia_baltram_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_baltram_exit_condition()
{
	return TRUE;
};

func void dia_baltram_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BALTRAM_SPERRE(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 1;
	condition = dia_baltram_sperre_condition;
	information = dia_baltram_sperre_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_baltram_sperre_condition()
{
	if((CANTHAR_SPERRE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_baltram_sperre_info()
{
	AI_Output(self,other,"DIA_Baltram_Sperre_01_00");	//Czego chcesz? Jeste� skaza�cem z kolonii g�rniczej. Nie... Nie b�d� z tob� robi� interes�w!
	AI_StopProcessInfos(self);
};


instance DIA_BALTRAM_HALLO(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 2;
	condition = dia_baltram_hallo_condition;
	information = dia_baltram_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baltram_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (CANTHAR_SPERRE == FALSE) && (MIS_NAGUR_BOTE == FALSE))
	{
		return TRUE;
	};
};

func void dia_baltram_hallo_info()
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
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Baltram sprzedaje na targowisku �ywno��.");
};


instance DIA_BALTRAM_JOB(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 3;
	condition = dia_baltram_job_condition;
	information = dia_baltram_job_info;
	permanent = FALSE;
	description = "Masz dla mnie jak�� robot�?";
};


func int dia_baltram_job_condition()
{
	if((MIS_NAGUR_BOTE != LOG_RUNNING) && (MIS_NAGUR_BOTE != LOG_SUCCESS) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_baltram_job_info()
{
	AI_Output(other,self,"DIA_Baltram_Job_15_00");	//Masz dla mnie jak�� prac�?
	AI_Output(self,other,"DIA_Baltram_Job_01_01");	//Nie, mam ju� ch�opca na posy�ki. Porozmawiaj z innymi kupcami.
};


instance DIA_BALTRAM_TRICK(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 4;
	condition = dia_baltram_trick_condition;
	information = dia_baltram_trick_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baltram_trick_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_NAGUR_BOTE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_baltram_trick_info()
{
	AI_Output(self,other,"DIA_Baltram_Trick_01_00");	//Szukasz pracy?
	AI_Output(other,self,"DIA_Baltram_Trick_15_01");	//Jasne, a o co chodzi?
	AI_Output(self,other,"DIA_Baltram_Trick_01_02");	//M�j ch�opiec na posy�ki nie wr�ci�, a czekam na dostaw� od farmera Akila.
	AI_Output(other,self,"DIA_Baltram_Trick_15_03");	//A ile na tym zarobi�?
	AI_Output(self,other,"DIA_Baltram_Trick_01_04");	//Dam ci 50 sztuk z�ota.
	AI_Output(other,self,"DIA_Baltram_Trick_15_05");	//�wietnie, zajm� si� tym.
	AI_Output(self,other,"DIA_Baltram_Trick_01_06");	//W porz�dku, powiedz Akilowi, �e ja ci� przys�a�em. Dostaniesz od niego paczk�. Przynie� j� do mnie.
	MIS_BALTRAM_SCOUTAKIL = LOG_RUNNING;
	b_logentry(TOPIC_NAGUR,"Baltram zatrudni� mnie jako ch�opca na posy�ki. Mam przynie�� przesy�k� z farmy Akila.");
	Log_CreateTopic(TOPIC_BALTRAM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BALTRAM,LOG_RUNNING);
	b_logentry(TOPIC_BALTRAM,"Je�li przynios� Baltramowi przesy�k�, zap�aci mi 50 sztuk z�ota.");
};


instance DIA_BALTRAM_WAREZ(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 2;
	condition = dia_baltram_warez_condition;
	information = dia_baltram_warez_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Poka� mi swoje towary.";
};


func int dia_baltram_warez_condition()
{
	return TRUE;
};

func void dia_baltram_warez_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Baltram_WAREZ_15_00");	//Poka� mi swoje towary.
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_01");	//Nie powinni byli do tego dopu�ci�. No i jeden z najemnik�w zamordowa� paladyna.
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_02");	//Co� si� musia�o w ko�cu sta�!
	};
	if((MIS_BALTRAMTRADE != LOG_SUCCESS) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_03");	//Tacy jak ty nic ode mnie nie dostan�.
		AI_Output(other,self,"DIA_Baltram_WAREZ_15_04");	//Dlaczego?
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_05");	//Najpierw podjudzasz wie�niak�w, a potem udajesz, �e nic si� nie sta�o.
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_06");	//A teraz zje�d�aj, odstraszasz mi klient�w.
		MIS_BALTRAMTRADE = LOG_FAILED;
		AI_StopProcessInfos(self);
	};
};


instance DIA_BALTRAM_AKILSHOF(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 4;
	condition = dia_baltram_akilshof_condition;
	information = dia_baltram_akilshof_info;
	permanent = FALSE;
	description = "Jak trafi� do gospodarstwa Akila?";
};


func int dia_baltram_akilshof_condition()
{
	if(MIS_BALTRAM_SCOUTAKIL == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_baltram_akilshof_info()
{
	AI_Output(other,self,"DIA_Baltram_AkilsHof_15_00");	//Jak trafi� do gospodarstwa Akila?
	AI_Output(self,other,"DIA_Baltram_AkilsHof_01_01");	//Wyjd� st�d przez wschodni� bram� i id� drog� na po�udniowy wsch�d.
	AI_Output(self,other,"DIA_Baltram_AkilsHof_01_02");	//Po chwili dojdziesz do kamiennych schod�w. Wejd� po nich i zobaczysz gospodarstwo Akila.
};


instance DIA_BALTRAM_LIEFERUNG(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 5;
	condition = dia_baltram_lieferung_condition;
	information = dia_baltram_lieferung_info;
	permanent = FALSE;
	description = "Mam przesy�k� od Akila.";
};


func int dia_baltram_lieferung_condition()
{
	if(Npc_HasItems(other,itmi_baltrampaket) >= 1)
	{
		return TRUE;
	};
};

func void dia_baltram_lieferung_info()
{
	AI_Output(other,self,"DIA_Baltram_Lieferung_15_00");	//Mam przesy�k� od Akila.
	AI_Output(self,other,"DIA_Baltram_Lieferung_01_01");	//Doskonale. Znowu mog� oferowa� �wie�y towar. Oto twoje 50 sztuk z�ota.
	b_giveinvitems(other,self,5703,1);
	b_giveinvitems(self,other,5113,50);
	MIS_BALTRAM_SCOUTAKIL = LOG_SUCCESS;
	MIS_NAGUR_BOTE = LOG_FAILED;
	b_giveplayerxp(XP_BALTRAM_SCOUTAKIL);
	Npc_RemoveInvItems(self,itmi_baltrampaket,1);
	CreateInvItems(self,itfo_cheese,5);
	CreateInvItems(self,itfo_apple,10);
	CreateInvItems(self,itfo_beer,5);
	CreateInvItems(self,itfo_bacon,5);
	CreateInvItems(self,itfo_sausage,5);
};


instance DIA_BALTRAM_LETUSTRADE(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 6;
	condition = dia_baltram_letustrade_condition;
	information = dia_baltram_letustrade_info;
	permanent = FALSE;
	description = "Nie mo�emy mimo wszystko robi� wsp�lnie interes�w?";
};


func int dia_baltram_letustrade_condition()
{
	if(MIS_BALTRAMTRADE == LOG_FAILED)
	{
		return TRUE;
	};
};

func void dia_baltram_letustrade_info()
{
	AI_Output(other,self,"DIA_Baltram_LetUsTrade_15_00");	//Nie mo�emy mimo wszystko robi� wsp�lnie interes�w?
	AI_Output(self,other,"DIA_Baltram_LetUsTrade_01_01");	//S�uchaj, je�li dostarczysz mi 10 szynek i 10 butelek wina, to znowu ubijemy interes.
	AI_Output(other,self,"DIA_Baltram_LetUsTrade_15_02");	//Zobacz�, co si� da zrobi�.
	MIS_BALTRAMTRADE = LOG_RUNNING;
};


var int baltramenoughbacon;
var int baltramenoughwine;

instance DIA_BALTRAM_HAVEYOURWAREZ(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 6;
	condition = dia_baltram_haveyourwarez_condition;
	information = dia_baltram_haveyourwarez_info;
	permanent = TRUE;
	description = "Mam to, czego chcia�e�.";
};


func int dia_baltram_haveyourwarez_condition()
{
	if((MIS_BALTRAMTRADE == LOG_RUNNING) && (MIS_BALTRAMTRADE != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_baltram_haveyourwarez_info()
{
	AI_Output(other,self,"DIA_Baltram_HaveYourWarez_15_00");	//Mam to, czego chcia�e�.
	AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_01");	//Poka�.
	if(Npc_HasItems(other,itfo_bacon) < 10)
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_02");	//Um�wili�my si� na 10 szynek. Przyjd� do mnie, jak b�dziesz tyle mia�.
		BALTRAMENOUGHBACON = FALSE;
	}
	else
	{
		BALTRAMENOUGHBACON = TRUE;
	};
	if(Npc_HasItems(other,itfo_wine) < 10)
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_03");	//A co z 10 butelkami wina? Zapomnia�e�?
		BALTRAMENOUGHWINE = FALSE;
	}
	else
	{
		BALTRAMENOUGHWINE = TRUE;
	};
	if((BALTRAMENOUGHBACON == TRUE) && (BALTRAMENOUGHWINE == TRUE))
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_04");	//Hmmm, nie jest najlepsze, ale w dzisiejszych czasach nie mo�na by� zbyt wybrednym.
		b_giveinvitems(other,self,4896,10);
		b_giveinvitems(other,self,4924,10);
		MIS_BALTRAMTRADE = LOG_SUCCESS;
		b_giveplayerxp(XP_BALTRAMTRADE);
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_05");	//No, teraz mo�emy przej�� do interes�w.
	};
};


instance DIA_BALTRAM_PICKPOCKET(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 900;
	condition = dia_baltram_pickpocket_condition;
	information = dia_baltram_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_baltram_pickpocket_condition()
{
	return c_beklauen(76,175);
};

func void dia_baltram_pickpocket_info()
{
	Info_ClearChoices(dia_baltram_pickpocket);
	Info_AddChoice(dia_baltram_pickpocket,DIALOG_BACK,dia_baltram_pickpocket_back);
	Info_AddChoice(dia_baltram_pickpocket,DIALOG_PICKPOCKET,dia_baltram_pickpocket_doit);
};

func void dia_baltram_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_baltram_pickpocket);
};

func void dia_baltram_pickpocket_back()
{
	Info_ClearChoices(dia_baltram_pickpocket);
};

