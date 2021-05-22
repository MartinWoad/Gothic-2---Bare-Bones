
var int lutero_talked;

instance DIA_LUTERO_EXIT(C_INFO)
{
	npc = vlk_404_lutero;
	nr = 999;
	condition = dia_lutero_exit_condition;
	information = dia_lutero_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lutero_exit_condition()
{
	return TRUE;
};

func void dia_lutero_exit_info()
{
	AI_StopProcessInfos(self);
	if((LUTERO_KRALLEN == LOG_RUNNING) && (MIS_FAJETH_KILL_SNAPPER == LOG_SUCCESS) && (Npc_KnowsInfo(other,dia_bilgot_knowsleadsnapper) == FALSE))
	{
		LUTERO_KRALLEN = LOG_OBSOLETE;
		b_checklog();
	};
};


instance DIA_LUTERO_GETLOST(C_INFO)
{
	npc = vlk_404_lutero;
	nr = 4;
	condition = dia_lutero_getlost_condition;
	information = dia_lutero_getlost_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_lutero_getlost_condition()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	if(((Npc_HasEquippedArmor(other) == FALSE) || (Hlp_IsItem(heroarmor,itar_bau_l) == TRUE) || (Hlp_IsItem(heroarmor,itar_bau_m) == TRUE) || (Hlp_IsItem(heroarmor,itar_nov_l) == TRUE)) && Npc_IsInState(self,zs_talk) && (LUTERO_TALKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_lutero_getlost_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	if(Hlp_IsItem(heroarmor,itar_nov_l) == FALSE)
	{
		AI_Output(self,other,"DIA_Lutero_GetLost_13_00");	//Wynocha st¹d! Nie masz co robiæ? ZnajdŸ sobie jak¹œ pracê, darmozjadzie - tylko jak najdalej st¹d!
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_GetLost_13_01");	//Czego tu szukasz, nowicjuszu? Czy nie powinieneœ przebywaæ w klasztorze?
	};
	AI_StopProcessInfos(self);
};


instance DIA_LUTERO_HALLO(C_INFO)
{
	npc = vlk_404_lutero;
	nr = 5;
	condition = dia_lutero_hallo_condition;
	information = dia_lutero_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lutero_hallo_condition()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	if((Npc_HasEquippedArmor(other) == TRUE) && (Hlp_IsItem(heroarmor,itar_bau_l) == FALSE) && (Hlp_IsItem(heroarmor,itar_bau_m) == FALSE) && (Hlp_IsItem(heroarmor,itar_nov_l) == FALSE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_lutero_hallo_info()
{
	AI_Output(self,other,"DIA_Lutero_Hallo_13_00");	//Nazywam siê Lutero. Zajmujê siê skupem i sprzeda¿¹ najró¿niejszych rzeczy.
	AI_Output(other,self,"DIA_Lutero_Hallo_15_01");	//Co mo¿esz mi zaoferowaæ?
	AI_Output(self,other,"DIA_Lutero_Hallo_13_02");	//Mam tu wyj¹tkowo rzadkie i niespotykane towary. Jeszcze nigdy nie zdarzy³o mi siê zawieœæ oczekiwañ klienta.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	LUTERO_TALKED = TRUE;
	b_logentry(TOPIC_CITYTRADER,"Lutero sprzedaje w górnym mieœcie rzadkie towary.");
};


instance DIA_LUTERO_SNAPPER(C_INFO)
{
	npc = vlk_404_lutero;
	nr = 5;
	condition = dia_lutero_snapper_condition;
	information = dia_lutero_snapper_info;
	permanent = FALSE;
	description = "Szukasz czegoœ konkretnego?";
};


func int dia_lutero_snapper_condition()
{
	return TRUE;
};

func void dia_lutero_snapper_info()
{
	AI_Output(other,self,"DIA_Lutero_Snapper_15_00");	//Szukasz czegoœ konkretnego?
	AI_Output(self,other,"DIA_Lutero_Snapper_13_01");	//Tak, potrzebne mi s¹ pazury zêbacza.
	AI_Output(self,other,"DIA_Lutero_Snapper_13_02");	//Jednak nie chodzi mi o jakiekolwiek pazury. To musi byæ coœ specjalnego, szpony potê¿nej bestii, która zabi³a dziesi¹tki myœliwych, albo coœ takiego.
	AI_Output(other,self,"DIA_Lutero_Snapper_15_03");	//Gdzie mogê znaleŸæ zêbacze?
	AI_Output(self,other,"DIA_Lutero_Snapper_13_04");	//Kilka z nich zamieszkuje tê wyspê, ale wiêkszoœæ grasuje w Górniczej Dolinie.
	AI_Output(other,self,"DIA_Lutero_Snapper_15_05");	//Co z tego bêdê mia³?
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_06");	//Mogê znaleŸæ dla ciebie kamieñ runiczny.
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_07");	//Mogê daæ ci pierœcieñ nietykalnoœci.
	};
	AI_Output(other,self,"DIA_Lutero_Hello_15_08");	//Zobaczê, co siê da zrobiæ.
	Log_CreateTopic(TOPIC_LUTERO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LUTERO,LOG_RUNNING);
	b_logentry(TOPIC_LUTERO,"Kupiec Lutero poszukuje pazurów wyj¹tkowo silnego zêbacza.");
	LUTERO_KRALLEN = LOG_RUNNING;
};


instance DIA_LUTERO_KRALLE(C_INFO)
{
	npc = vlk_404_lutero;
	nr = 5;
	condition = dia_lutero_kralle_condition;
	information = dia_lutero_kralle_info;
	permanent = FALSE;
	description = "Mam tu dla ciebie pazury bardzo niezwyk³ego zêbacza.";
};


func int dia_lutero_kralle_condition()
{
	if((Npc_HasItems(other,itat_clawleader) >= 1) && Npc_KnowsInfo(other,dia_lutero_snapper))
	{
		return TRUE;
	};
};

func void dia_lutero_kralle_info()
{
	AI_Output(other,self,"DIA_Lutero_Kralle_15_00");	//Mam tu dla ciebie pazury bardzo niezwyk³ego zêbacza.
	LUTERO_KRALLEN = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
	AI_Output(self,other,"DIA_Lutero_Kralle_13_01");	//Moi klienci siê uciesz¹.
	b_giveinvitems(other,self,5743,1);
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_02");	//Nie mam tutaj kamienia runicznego. Ale wiem, gdzie go mo¿na znaleŸæ.
		AI_Output(self,other,"DIA_Lutero_Hello_13_03");	//W drodze z miasta do gospody, bêdziesz przechodzi³ pod mostem.
		AI_Output(self,other,"DIA_Lutero_Hello_13_04");	//Jest tam jaskinia, w której jeden z moich przyjació³ ukry³ skrzyniê z kamieniem runicznym. Oto klucz.
		b_giveinvitems(self,other,5749,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_05");	//Oto pierœcieñ, który ci obieca³em.
		b_giveinvitems(self,other,5359,1);
	};
};


instance DIA_LUTERO_TRADE(C_INFO)
{
	npc = vlk_404_lutero;
	nr = 5;
	condition = dia_lutero_trade_condition;
	information = dia_lutero_trade_info;
	permanent = TRUE;
	description = "Poka¿ mi swoje towary.";
	trade = TRUE;
};


func int dia_lutero_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_lutero_hallo))
	{
		return TRUE;
	};
};

func void dia_lutero_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Lutero_Trade_15_00");	//Poka¿ mi swoje towary.
};


instance DIA_LUTERO_PICKPOCKET(C_INFO)
{
	npc = vlk_404_lutero;
	nr = 900;
	condition = dia_lutero_pickpocket_condition;
	information = dia_lutero_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_lutero_pickpocket_condition()
{
	return c_beklauen(58,65);
};

func void dia_lutero_pickpocket_info()
{
	Info_ClearChoices(dia_lutero_pickpocket);
	Info_AddChoice(dia_lutero_pickpocket,DIALOG_BACK,dia_lutero_pickpocket_back);
	Info_AddChoice(dia_lutero_pickpocket,DIALOG_PICKPOCKET,dia_lutero_pickpocket_doit);
};

func void dia_lutero_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_lutero_pickpocket);
};

func void dia_lutero_pickpocket_back()
{
	Info_ClearChoices(dia_lutero_pickpocket);
};

