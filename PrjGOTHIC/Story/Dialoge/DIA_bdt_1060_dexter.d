
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
	AI_Output(self,other,"DIA_Dexter_Hallo_09_00");	//Prosz�, prosz�, kogo tutaj mamy. Nasz wielki liberator we w�asnej osobie! Co tu robisz, bohaterze?
	AI_Output(other,self,"DIA_Dexter_Hallo_15_01");	//Potrzebuj� paru odpowiedzi.
	AI_Output(other,self,"DIA_Dexter_Hallo_15_02");	//Kto� rozprowadza ulotki z moj� podobizn�. I kto� mi powiedzia�, �e to w�a�nie ty.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_03");	//Kto� tu gada za du�o.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_04");	//To prawda. Rozda�em swoim ch�opcom listy go�cze. Nie mia�em innego wyboru.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_05");	//Kiedy ucieka�em z G�rniczej Doliny, �o�nierze zauwa�yli mnie i zwabili w pu�apk�.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_06");	//My�la�em, �e ju� po mnie, kiedy nagle z ciemno�ci wy�oni�a si� ta... posta�.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_07");	//By� to m�czyzna ubrany w p�aszcz z kapturem i mask�. Przem�wi� do mnie g�osem, kt�ry zupe�nie nie przypomina� ludzkiego.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_08");	//Dzi�ki jego pomocy uda�o mi si� wydosta� z doliny. Kiedy ju� by�em bezpieczny, zaoferowa� mi tysi�c sztuk z�ota w zamian za twoj� g�ow�.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_09");	//Co wed�ug ciebie mia�em zrobi�? Gdybym odm�wi�, prawdopodobnie zabi�by mnie na miejscu!
	b_logentry(TOPIC_BANDITS,"Listy go�cze by�y rozdawane przez Dextera, kt�ry dzia�a� na polecenie m�czyzn w czarnych kapturach.");
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
	description = "Nie wierz� nawet w jedno twoje s�owo.";
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
	AI_Output(other,self,"DIA_Dexter_Glaube_15_00");	//Nie wierz� nawet w jedno twoje s�owo.
	AI_Output(self,other,"DIA_Dexter_Glaube_09_01");	//Hej, to prawda. Przysi�gam na gr�b mojej matki!
};


instance DIA_DEXTER_WO(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 3;
	condition = dia_dexter_wo_condition;
	information = dia_dexter_wo_info;
	permanent = FALSE;
	description = "Gdzie mog� go znale��?";
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
	AI_Output(other,self,"DIA_Dexter_Wo_15_00");	//Gdzie mog� go znale��?
	if(KAPITEL < 3)
	{
		AI_Output(self,other,"DIA_Dexter_Wo_09_01");	//S�dz�, �e jest gdzie� w G�rniczej Dolinie.
	}
	else
	{
		AI_Output(self,other,"DIA_Dexter_Wo_09_02");	//Jest tutaj! I nie przyby� sam. Wsz�dzie pe�no jego ludzi. Szukaj� ci�.
	};
};


instance DIA_DEXTER_VOR(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 2;
	condition = dia_dexter_vor_condition;
	information = dia_dexter_vor_info;
	permanent = FALSE;
	description = "Co zamierzasz zrobi�?";
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
	AI_Output(other,self,"DIA_Dexter_Vor_15_00");	//I co zamierzasz zrobi�? Zabi� mnie?
	AI_Output(self,other,"DIA_Dexter_Vor_09_01");	//Tak. Ale ty nas uwolni�e�. Dlatego postanowi�em da� ci jeszcze jedn� szans�. Wyno� si� st�d - zniknij, ulotnij si�, zapadnij pod ziemi�. Id� i nigdy wi�cej nie pokazuj mi si� na oczy.
	AI_Output(self,other,"DIA_Dexter_Vor_09_02");	//Je�li jeszcze raz ci� tutaj zobacz�, zabij� bez wahania.
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
		AI_Output(self,other,"DIA_Dexter_Kill_09_00");	//Ostrzega�em ci�. Je�li ja nie zabij� ciebie, to on zabije mnie. Nie pozostawiasz mi wyboru.
	}
	else
	{
		AI_Output(self,other,"DIA_Dexter_Kill_09_01");	//By�oby lepiej, gdyby� si� tutaj nie pokazywa�. Po prostu znalaz�e� si� w niew�a�ciwym miejscu w niew�a�ciwym czasie.
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

