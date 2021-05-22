
instance DIA_Dexter_EXIT(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 999;
	condition = DIA_Dexter_EXIT_Condition;
	information = DIA_Dexter_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dexter_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Dexter_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dexter_Hallo(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 1;
	condition = DIA_Dexter_Hallo_Condition;
	information = DIA_Dexter_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dexter_Hallo_Condition()
{
	if(Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dexter_Hallo_Info()
{
	AI_Output(self,other,"DIA_Dexter_Hallo_09_00");	//Proszê, proszê, kogo tutaj mamy. Nasz wielki liberator we w³asnej osobie! Co tu robisz, bohaterze?
	AI_Output(other,self,"DIA_Dexter_Hallo_15_01");	//Potrzebujê paru odpowiedzi.
	AI_Output(other,self,"DIA_Dexter_Hallo_15_02");	//Ktoœ rozprowadza ulotki z moj¹ podobizn¹. I ktoœ mi powiedzia³, ¿e to w³aœnie ty.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_03");	//Ktoœ tu gada za du¿o.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_04");	//To prawda. Rozda³em swoim ch³opcom listy goñcze. Nie mia³em innego wyboru.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_05");	//Kiedy ucieka³em z Górniczej Doliny, ¿o³nierze zauwa¿yli mnie i zwabili w pu³apkê.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_06");	//Myœla³em, ¿e ju¿ po mnie, kiedy nagle z ciemnoœci wy³oni³a siê ta... postaæ.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_07");	//By³ to mê¿czyzna ubrany w p³aszcz z kapturem i maskê. Przemówi³ do mnie g³osem, który zupe³nie nie przypomina³ ludzkiego.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_08");	//Dziêki jego pomocy uda³o mi siê wydostaæ z doliny. Kiedy ju¿ by³em bezpieczny, zaoferowa³ mi tysi¹c sztuk z³ota w zamian za twoj¹ g³owê.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_09");	//Co wed³ug ciebie mia³em zrobiæ? Gdybym odmówi³, prawdopodobnie zabi³by mnie na miejscu!
	B_LogEntry(Topic_Bandits,"Listy goñcze by³y rozdawane przez Dextera, który dzia³a³ na polecenie mê¿czyzn w czarnych kapturach.");
	MIS_Steckbriefe = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Dexter_Glaube(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 2;
	condition = DIA_Dexter_Glaube_Condition;
	information = DIA_Dexter_Glaube_Info;
	permanent = FALSE;
	description = "Nie wierzê nawet w jedno twoje s³owo.";
};


func int DIA_Dexter_Glaube_Condition()
{
	if((Npc_KnowsInfo(other,dia_dexter_wo) == FALSE) && (Knows_Dexter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Dexter_Glaube_Info()
{
	AI_Output(other,self,"DIA_Dexter_Glaube_15_00");	//Nie wierzê nawet w jedno twoje s³owo.
	AI_Output(self,other,"DIA_Dexter_Glaube_09_01");	//Hej, to prawda. Przysiêgam na grób mojej matki!
};


instance DIA_DEXTER_WO(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 3;
	condition = dia_dexter_wo_condition;
	information = dia_dexter_wo_info;
	permanent = FALSE;
	description = "Gdzie mogê go znaleŸæ?";
};


func int dia_dexter_wo_condition()
{
	if((Npc_KnowsInfo(other,DIA_Dexter_Glaube) == FALSE) && (Knows_Dexter == TRUE))
	{
		return TRUE;
	};
};

func void dia_dexter_wo_info()
{
	AI_Output(other,self,"DIA_Dexter_Wo_15_00");	//Gdzie mogê go znaleŸæ?
	if(Kapitel < 3)
	{
		AI_Output(self,other,"DIA_Dexter_Wo_09_01");	//S¹dzê, ¿e jest gdzieœ w Górniczej Dolinie.
	}
	else
	{
		AI_Output(self,other,"DIA_Dexter_Wo_09_02");	//Jest tutaj! I nie przyby³ sam. Wszêdzie pe³no jego ludzi. Szukaj¹ ciê.
	};
};


instance DIA_Dexter_Vor(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 2;
	condition = DIA_Dexter_Vor_Condition;
	information = DIA_Dexter_Vor_Info;
	permanent = FALSE;
	description = "Co zamierzasz zrobiæ?";
};


func int DIA_Dexter_Vor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dexter_Glaube) || Npc_KnowsInfo(other,dia_dexter_wo))
	{
		return TRUE;
	};
};

func void DIA_Dexter_Vor_Info()
{
	AI_Output(other,self,"DIA_Dexter_Vor_15_00");	//I co zamierzasz zrobiæ? Zabiæ mnie?
	AI_Output(self,other,"DIA_Dexter_Vor_09_01");	//Tak. Ale ty nas uwolni³eœ. Dlatego postanowi³em daæ ci jeszcze jedn¹ szansê. Wynoœ siê st¹d - zniknij, ulotnij siê, zapadnij pod ziemiê. IdŸ i nigdy wiêcej nie pokazuj mi siê na oczy.
	AI_Output(self,other,"DIA_Dexter_Vor_09_02");	//Jeœli jeszcze raz ciê tutaj zobaczê, zabijê bez wahania.
	AI_StopProcessInfos(self);
};


instance DIA_Dexter_Kill(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 2;
	condition = DIA_Dexter_Kill_Condition;
	information = DIA_Dexter_Kill_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dexter_Kill_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_KnowsInfo(other,DIA_Dexter_Vor) || (Knows_Dexter == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Dexter_Kill_Info()
{
	if(Knows_Dexter == TRUE)
	{
		AI_Output(self,other,"DIA_Dexter_Kill_09_00");	//Ostrzega³em ciê. Jeœli ja nie zabijê ciebie, to on zabije mnie. Nie pozostawiasz mi wyboru.
	}
	else
	{
		AI_Output(self,other,"DIA_Dexter_Kill_09_01");	//By³oby lepiej, gdybyœ siê tutaj nie pokazywa³. Po prostu znalaz³eœ siê w niew³aœciwym miejscu w niew³aœciwym czasie.
	};
	MIS_Steckbriefe = LOG_OBSOLETE;
	B_CheckLog();
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,0);
};


instance DIA_Dexter_PICKPOCKET(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 900;
	condition = DIA_Dexter_PICKPOCKET_Condition;
	information = DIA_Dexter_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Dexter_PICKPOCKET_Condition()
{
	return C_Beklauen(96,370);
};

func void DIA_Dexter_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Dexter_PICKPOCKET);
	Info_AddChoice(DIA_Dexter_PICKPOCKET,Dialog_Back,DIA_Dexter_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Dexter_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Dexter_PICKPOCKET_DoIt);
};

func void DIA_Dexter_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Dexter_PICKPOCKET);
};

func void DIA_Dexter_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Dexter_PICKPOCKET);
};

