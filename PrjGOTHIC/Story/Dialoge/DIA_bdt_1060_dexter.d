
instance DIA_DEXTER_EXIT(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 999;
	condition = dia_dexter_exit_condition;
	information = dia_dexter_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dexter_exit_condition()
{
	return TRUE;
};

func void dia_dexter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DEXTER_HALLO(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 1;
	condition = dia_dexter_hallo_condition;
	information = dia_dexter_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dexter_hallo_condition()
{
	if(KNOWS_DEXTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_dexter_hallo_info()
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
	b_logentry(TOPIC_BANDITS,"Listy goñcze by³y rozdawane przez Dextera, który dzia³a³ na polecenie mê¿czyzn w czarnych kapturach.");
	MIS_STECKBRIEFE = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_DEXTER_GLAUBE(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 2;
	condition = dia_dexter_glaube_condition;
	information = dia_dexter_glaube_info;
	permanent = FALSE;
	description = "Nie wierzê nawet w jedno twoje s³owo.";
};


func int dia_dexter_glaube_condition()
{
	if((Npc_KnowsInfo(other,dia_dexter_wo) == FALSE) && (KNOWS_DEXTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_dexter_glaube_info()
{
	AI_Output(other,self,"DIA_Dexter_Glaube_15_00");	//Nie wierzê nawet w jedno twoje s³owo.
	AI_Output(self,other,"DIA_Dexter_Glaube_09_01");	//Hej, to prawda. Przysiêgam na grób mojej matki!
};


instance DIA_DEXTER_WO(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 3;
	condition = dia_dexter_wo_condition;
	information = dia_dexter_wo_info;
	permanent = FALSE;
	description = "Gdzie mogê go znaleŸæ?";
};


func int dia_dexter_wo_condition()
{
	if((Npc_KnowsInfo(other,dia_dexter_glaube) == FALSE) && (KNOWS_DEXTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_dexter_wo_info()
{
	AI_Output(other,self,"DIA_Dexter_Wo_15_00");	//Gdzie mogê go znaleŸæ?
	if(KAPITEL < 3)
	{
		AI_Output(self,other,"DIA_Dexter_Wo_09_01");	//S¹dzê, ¿e jest gdzieœ w Górniczej Dolinie.
	}
	else
	{
		AI_Output(self,other,"DIA_Dexter_Wo_09_02");	//Jest tutaj! I nie przyby³ sam. Wszêdzie pe³no jego ludzi. Szukaj¹ ciê.
	};
};


instance DIA_DEXTER_VOR(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 2;
	condition = dia_dexter_vor_condition;
	information = dia_dexter_vor_info;
	permanent = FALSE;
	description = "Co zamierzasz zrobiæ?";
};


func int dia_dexter_vor_condition()
{
	if(Npc_KnowsInfo(other,dia_dexter_glaube) || Npc_KnowsInfo(other,dia_dexter_wo))
	{
		return TRUE;
	};
};

func void dia_dexter_vor_info()
{
	AI_Output(other,self,"DIA_Dexter_Vor_15_00");	//I co zamierzasz zrobiæ? Zabiæ mnie?
	AI_Output(self,other,"DIA_Dexter_Vor_09_01");	//Tak. Ale ty nas uwolni³eœ. Dlatego postanowi³em daæ ci jeszcze jedn¹ szansê. Wynoœ siê st¹d - zniknij, ulotnij siê, zapadnij pod ziemiê. IdŸ i nigdy wiêcej nie pokazuj mi siê na oczy.
	AI_Output(self,other,"DIA_Dexter_Vor_09_02");	//Jeœli jeszcze raz ciê tutaj zobaczê, zabijê bez wahania.
	AI_StopProcessInfos(self);
};


instance DIA_DEXTER_KILL(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 2;
	condition = dia_dexter_kill_condition;
	information = dia_dexter_kill_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dexter_kill_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_KnowsInfo(other,dia_dexter_vor) || (KNOWS_DEXTER == FALSE)))
	{
		return TRUE;
	};
};

func void dia_dexter_kill_info()
{
	if(KNOWS_DEXTER == TRUE)
	{
		AI_Output(self,other,"DIA_Dexter_Kill_09_00");	//Ostrzega³em ciê. Jeœli ja nie zabijê ciebie, to on zabije mnie. Nie pozostawiasz mi wyboru.
	}
	else
	{
		AI_Output(self,other,"DIA_Dexter_Kill_09_01");	//By³oby lepiej, gdybyœ siê tutaj nie pokazywa³. Po prostu znalaz³eœ siê w niew³aœciwym miejscu w niew³aœciwym czasie.
	};
	MIS_STECKBRIEFE = LOG_OBSOLETE;
	b_checklog();
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,0);
};


instance DIA_DEXTER_PICKPOCKET(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 900;
	condition = dia_dexter_pickpocket_condition;
	information = dia_dexter_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_dexter_pickpocket_condition()
{
	return c_beklauen(96,370);
};

func void dia_dexter_pickpocket_info()
{
	Info_ClearChoices(dia_dexter_pickpocket);
	Info_AddChoice(dia_dexter_pickpocket,DIALOG_BACK,dia_dexter_pickpocket_back);
	Info_AddChoice(dia_dexter_pickpocket,DIALOG_PICKPOCKET,dia_dexter_pickpocket_doit);
};

func void dia_dexter_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_dexter_pickpocket);
};

func void dia_dexter_pickpocket_back()
{
	Info_ClearChoices(dia_dexter_pickpocket);
};

