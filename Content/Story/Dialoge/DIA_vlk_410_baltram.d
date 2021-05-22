
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
	AI_Output(self,other,"DIA_Baltram_Sperre_01_00");	//Czego chcesz? Jesteœ skazañcem z kolonii górniczej. Nie... Nie bêdê z tob¹ robi³ interesów!
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
		AI_Output(self,other,"DIA_Baltram_Hallo_01_00");	//Witaj, przybyszu. Nazywam siê Baltram. Przyszed³eœ uzupe³niæ zapasy jedzenia?
		AI_Output(self,other,"DIA_Baltram_Hallo_01_01");	//Niestety, muszê ciê rozczarowaæ. W tej chwili nie mam zbyt wielu zapasów.
		AI_Output(self,other,"DIA_Baltram_Hallo_01_02");	//Ale wkrótce dostanê now¹ dostawê.
	}
	else
	{
		AI_Output(self,other,"DIA_Baltram_Hallo_01_03");	//Jeœli przyszed³eœ, ¿eby kupiæ jedzenie, to mo¿esz ju¿ odejœæ.
		AI_Output(self,other,"DIA_Baltram_Hallo_01_04");	//Wy, najemnicy, nic mnie nie obchodzicie! Mam przez was tylko k³opoty.
	};
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Baltram sprzedaje na targowisku ¿ywnoœæ.");
};


instance DIA_Baltram_Job(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 3;
	condition = DIA_Baltram_Job_Condition;
	information = DIA_Baltram_Job_Info;
	permanent = FALSE;
	description = "Masz dla mnie jak¹œ robotê?";
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
	AI_Output(other,self,"DIA_Baltram_Job_15_00");	//Masz dla mnie jak¹œ pracê?
	AI_Output(self,other,"DIA_Baltram_Job_01_01");	//Nie, mam ju¿ ch³opca na posy³ki. Porozmawiaj z innymi kupcami.
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
	AI_Output(self,other,"DIA_Baltram_Trick_01_02");	//Mój ch³opiec na posy³ki nie wróci³, a czekam na dostawê od farmera Akila.
	AI_Output(other,self,"DIA_Baltram_Trick_15_03");	//A ile na tym zarobiê?
	AI_Output(self,other,"DIA_Baltram_Trick_01_04");	//Dam ci 50 sztuk z³ota.
	AI_Output(other,self,"DIA_Baltram_Trick_15_05");	//Œwietnie, zajmê siê tym.
	AI_Output(self,other,"DIA_Baltram_Trick_01_06");	//W porz¹dku, powiedz Akilowi, ¿e ja ciê przys³a³em. Dostaniesz od niego paczkê. Przynieœ j¹ do mnie.
	MIS_Baltram_ScoutAkil = LOG_Running;
	B_LogEntry(TOPIC_Nagur,"Baltram zatrudni³ mnie jako ch³opca na posy³ki. Mam przynieœæ przesy³kê z farmy Akila.");
	Log_CreateTopic(TOPIC_Baltram,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Baltram,LOG_Running);
	B_LogEntry(TOPIC_Baltram,"Jeœli przyniosê Baltramowi przesy³kê, zap³aci mi 50 sztuk z³ota.");
};


instance DIA_Baltram_WAREZ(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 2;
	condition = DIA_Baltram_WAREZ_Condition;
	information = DIA_Baltram_WAREZ_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Poka¿ mi swoje towary.";
};


func int DIA_Baltram_WAREZ_Condition()
{
	return TRUE;
};

func void DIA_Baltram_WAREZ_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Baltram_WAREZ_15_00");	//Poka¿ mi swoje towary.
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_01");	//Nie powinni byli do tego dopuœciæ. No i jeden z najemników zamordowa³ paladyna.
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_02");	//Coœ siê musia³o w koñcu staæ!
	};
	if((MIS_BaltramTrade != LOG_SUCCESS) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_03");	//Tacy jak ty nic ode mnie nie dostan¹.
		AI_Output(other,self,"DIA_Baltram_WAREZ_15_04");	//Dlaczego?
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_05");	//Najpierw podjudzasz wieœniaków, a potem udajesz, ¿e nic siê nie sta³o.
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_06");	//A teraz zje¿d¿aj, odstraszasz mi klientów.
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
	description = "Jak trafiæ do gospodarstwa Akila?";
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
	AI_Output(other,self,"DIA_Baltram_AkilsHof_15_00");	//Jak trafiæ do gospodarstwa Akila?
	AI_Output(self,other,"DIA_Baltram_AkilsHof_01_01");	//WyjdŸ st¹d przez wschodni¹ bramê i idŸ drog¹ na po³udniowy wschód.
	AI_Output(self,other,"DIA_Baltram_AkilsHof_01_02");	//Po chwili dojdziesz do kamiennych schodów. WejdŸ po nich i zobaczysz gospodarstwo Akila.
};


instance DIA_Baltram_Lieferung(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 5;
	condition = DIA_Baltram_Lieferung_Condition;
	information = DIA_Baltram_Lieferung_Info;
	permanent = FALSE;
	description = "Mam przesy³kê od Akila.";
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
	AI_Output(other,self,"DIA_Baltram_Lieferung_15_00");	//Mam przesy³kê od Akila.
	AI_Output(self,other,"DIA_Baltram_Lieferung_01_01");	//Doskonale. Znowu mogê oferowaæ œwie¿y towar. Oto twoje 50 sztuk z³ota.
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
	description = "Nie mo¿emy mimo wszystko robiæ wspólnie interesów?";
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
	AI_Output(other,self,"DIA_Baltram_LetUsTrade_15_00");	//Nie mo¿emy mimo wszystko robiæ wspólnie interesów?
	AI_Output(self,other,"DIA_Baltram_LetUsTrade_01_01");	//S³uchaj, jeœli dostarczysz mi 10 szynek i 10 butelek wina, to znowu ubijemy interes.
	AI_Output(other,self,"DIA_Baltram_LetUsTrade_15_02");	//Zobaczê, co siê da zrobiæ.
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
	description = "Mam to, czego chcia³eœ.";
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
	AI_Output(other,self,"DIA_Baltram_HaveYourWarez_15_00");	//Mam to, czego chcia³eœ.
	AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_01");	//Poka¿.
	if(Npc_HasItems(other,ItFo_Bacon) < 10)
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_02");	//Umówiliœmy siê na 10 szynek. PrzyjdŸ do mnie, jak bêdziesz tyle mia³.
		BaltramEnoughBacon = FALSE;
	}
	else
	{
		BaltramEnoughBacon = TRUE;
	};
	if(Npc_HasItems(other,ItFo_Wine) < 10)
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_03");	//A co z 10 butelkami wina? Zapomnia³eœ?
		BaltramEnoughWine = FALSE;
	}
	else
	{
		BaltramEnoughWine = TRUE;
	};
	if((BaltramEnoughBacon == TRUE) && (BaltramEnoughWine == TRUE))
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_04");	//Hmmm, nie jest najlepsze, ale w dzisiejszych czasach nie mo¿na byæ zbyt wybrednym.
		B_GiveInvItems(other,self,ItFo_Bacon,10);
		B_GiveInvItems(other,self,ItFo_Wine,10);
		MIS_BaltramTrade = LOG_SUCCESS;
		B_GivePlayerXP(XP_BaltramTrade);
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_05");	//No, teraz mo¿emy przejœæ do interesów.
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

