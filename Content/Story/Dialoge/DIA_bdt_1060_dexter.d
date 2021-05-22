
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
	B_LogEntry(Topic_Bandits,"Listy go�cze by�y rozdawane przez Dextera, kt�ry dzia�a� na polecenie m�czyzn w czarnych kapturach.");
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
	description = "Nie wierz� nawet w jedno twoje s�owo.";
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
	AI_Output(other,self,"DIA_Dexter_Glaube_15_00");	//Nie wierz� nawet w jedno twoje s�owo.
	AI_Output(self,other,"DIA_Dexter_Glaube_09_01");	//Hej, to prawda. Przysi�gam na gr�b mojej matki!
};


instance DIA_DEXTER_WO(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 3;
	condition = dia_dexter_wo_condition;
	information = dia_dexter_wo_info;
	permanent = FALSE;
	description = "Gdzie mog� go znale��?";
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
	AI_Output(other,self,"DIA_Dexter_Wo_15_00");	//Gdzie mog� go znale��?
	if(Kapitel < 3)
	{
		AI_Output(self,other,"DIA_Dexter_Wo_09_01");	//S�dz�, �e jest gdzie� w G�rniczej Dolinie.
	}
	else
	{
		AI_Output(self,other,"DIA_Dexter_Wo_09_02");	//Jest tutaj! I nie przyby� sam. Wsz�dzie pe�no jego ludzi. Szukaj� ci�.
	};
};


instance DIA_Dexter_Vor(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 2;
	condition = DIA_Dexter_Vor_Condition;
	information = DIA_Dexter_Vor_Info;
	permanent = FALSE;
	description = "Co zamierzasz zrobi�?";
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
	AI_Output(other,self,"DIA_Dexter_Vor_15_00");	//I co zamierzasz zrobi�? Zabi� mnie?
	AI_Output(self,other,"DIA_Dexter_Vor_09_01");	//Tak. Ale ty nas uwolni�e�. Dlatego postanowi�em da� ci jeszcze jedn� szans�. Wyno� si� st�d - zniknij, ulotnij si�, zapadnij pod ziemi�. Id� i nigdy wi�cej nie pokazuj mi si� na oczy.
	AI_Output(self,other,"DIA_Dexter_Vor_09_02");	//Je�li jeszcze raz ci� tutaj zobacz�, zabij� bez wahania.
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
		AI_Output(self,other,"DIA_Dexter_Kill_09_00");	//Ostrzega�em ci�. Je�li ja nie zabij� ciebie, to on zabije mnie. Nie pozostawiasz mi wyboru.
	}
	else
	{
		AI_Output(self,other,"DIA_Dexter_Kill_09_01");	//By�oby lepiej, gdyby� si� tutaj nie pokazywa�. Po prostu znalaz�e� si� w niew�a�ciwym miejscu w niew�a�ciwym czasie.
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

