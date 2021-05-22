
instance DIA_JOE_EXIT(C_INFO)
{
	npc = vlk_448_joe;
	nr = 999;
	condition = dia_joe_exit_condition;
	information = dia_joe_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_joe_exit_condition()
{
	return TRUE;
};

func void dia_joe_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JOE_PICKPOCKET(C_INFO)
{
	npc = vlk_448_joe;
	nr = 900;
	condition = dia_joe_pickpocket_condition;
	information = dia_joe_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_joe_pickpocket_condition()
{
	return c_beklauen(25,25);
};

func void dia_joe_pickpocket_info()
{
	Info_ClearChoices(dia_joe_pickpocket);
	Info_AddChoice(dia_joe_pickpocket,DIALOG_BACK,dia_joe_pickpocket_back);
	Info_AddChoice(dia_joe_pickpocket,DIALOG_PICKPOCKET,dia_joe_pickpocket_doit);
};

func void dia_joe_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_joe_pickpocket);
};

func void dia_joe_pickpocket_back()
{
	Info_ClearChoices(dia_joe_pickpocket);
};


instance DIA_JOE_HALLO(C_INFO)
{
	npc = vlk_448_joe;
	nr = 2;
	condition = dia_joe_hallo_condition;
	information = dia_joe_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_joe_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_joe_hallo_info()
{
	AI_Output(self,other,"DIA_Joe_Hallo_10_00");	//Hej, dzi�ki, cz�owieku! Naprawd� wielkie dzi�ki. Ju� my�la�em, �e nigdy si� st�d nie wydostan�...
	b_giveplayerxp(XP_AMBIENT * 4);
	AI_Output(other,self,"DIA_Joe_Hallo_15_01");	//Co ty TUTAJ robisz?
	AI_Output(self,other,"DIA_Joe_Hallo_10_02");	//Da�em si� zamkn��. Drzwi by�y otwarte i chcia�em si� jedynie troch� rozejrze�, ale kiedy tylko wszed�em do �rodka, pojawi�a si� stra� i zamkn�a te cholerne drzwi.
	AI_Output(self,other,"DIA_Joe_Hallo_10_03");	//To do�� kr�puj�ca sytuacja. By�bym bardzo wdzi�czny, gdyby pozosta�o to mi�dzy nami.
	AI_Output(other,self,"DIA_Joe_Hallo_15_04");	//Rozumiem, to rzeczywi�cie nie jest pow�d do dumy.
	AI_Output(self,other,"DIA_Joe_Hallo_10_05");	//Chyba musz� si� napi�.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_JOE_PERM(C_INFO)
{
	npc = vlk_448_joe;
	nr = 2;
	condition = dia_joe_perm_condition;
	information = dia_joe_perm_info;
	permanent = TRUE;
	description = "Wszystko w porz�dku?";
};


func int dia_joe_perm_condition()
{
	if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_08") <= 500)
	{
		return TRUE;
	};
};

func void dia_joe_perm_info()
{
	AI_Output(other,self,"DIA_Joe_Perm_15_00");	//Wszystko w porz�dku?
	AI_Output(self,other,"DIA_Joe_Perm_10_01");	//Dzi�ki za uwolnienie.
	AI_StopProcessInfos(self);
};


instance DIA_JOE_SIGN(C_INFO)
{
	npc = vlk_448_joe;
	nr = 2;
	condition = dia_joe_sign_condition;
	information = dia_joe_sign_info;
	permanent = FALSE;
	description = "(Poka� z�odziejski gest)";
};


func int dia_joe_sign_condition()
{
	if((Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_08") <= 500) && (KNOWS_SECRETSIGN == TRUE))
	{
		return TRUE;
	};
};

func void dia_joe_sign_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Joe_Sign_10_00");	//Hej, wiesz co - mamy wsp�lnych znajomych. W takim razie pozw�l mi wyrazi� wdzi�czno�� za uratowanie.
	AI_Output(self,other,"DIA_Joe_Sign_10_01");	//Prosz�, we� te wytrychy. Na pewno ci si� przydadz�.
	b_giveinvitems(self,other,4932,5);
	AI_StopProcessInfos(self);
};

