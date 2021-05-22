
instance DIA_CORAGON_EXIT(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 999;
	condition = dia_coragon_exit_condition;
	information = dia_coragon_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_coragon_exit_condition()
{
	return TRUE;
};

func void dia_coragon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CORAGON_PICKPOCKET(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 900;
	condition = dia_coragon_pickpocket_condition;
	information = dia_coragon_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_coragon_pickpocket_condition()
{
	return c_beklauen(40,45);
};

func void dia_coragon_pickpocket_info()
{
	Info_ClearChoices(dia_coragon_pickpocket);
	Info_AddChoice(dia_coragon_pickpocket,DIALOG_BACK,dia_coragon_pickpocket_back);
	Info_AddChoice(dia_coragon_pickpocket,DIALOG_PICKPOCKET,dia_coragon_pickpocket_doit);
};

func void dia_coragon_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_coragon_pickpocket);
};

func void dia_coragon_pickpocket_back()
{
	Info_ClearChoices(dia_coragon_pickpocket);
};


instance DIA_CORAGON_HALLO(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 2;
	condition = dia_coragon_hallo_condition;
	information = dia_coragon_hallo_info;
	permanent = FALSE;
	description = "Czy mog� kupi� co� do picia?";
};


func int dia_coragon_hallo_condition()
{
	return TRUE;
};

func void dia_coragon_hallo_info()
{
	AI_Output(other,self,"DIA_Coragon_HALLO_15_00");	//Czy mog� kupi� co� do picia?
	AI_Output(self,other,"DIA_Coragon_Add_05_00");	//Dop�ki masz z�oto, mo�esz tu nawet jada� posi�ki.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Jedzenie i napoje mog� kupi� u w�a�ciciela gospody, Coragona.");
};


instance DIA_CORAGON_TRADE(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 2;
	condition = dia_coragon_trade_condition;
	information = dia_coragon_trade_info;
	permanent = TRUE;
	description = "Poka� mi swoje towary.";
	trade = TRUE;
};


func int dia_coragon_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_hallo))
	{
		return TRUE;
	};
};

func void dia_coragon_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Coragon_Trade_15_00");	//Poka� mi swoje towary.
};


instance DIA_CORAGON_WHATSUP(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 3;
	condition = dia_coragon_whatsup_condition;
	information = dia_coragon_whatsup_info;
	permanent = FALSE;
	description = "Jak id� interesy?";
};


func int dia_coragon_whatsup_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_hallo))
	{
		return TRUE;
	};
};

func void dia_coragon_whatsup_info()
{
	AI_Output(other,self,"DIA_Coragon_Gelaber_15_00");	//Jak id� interesy?
	AI_Output(self,other,"DIA_Coragon_Add_05_01");	//Ech, nie przypominaj mi. Lord Andre serwuje na placu wisielc�w darmowe piwo.
	AI_Output(self,other,"DIA_Coragon_Add_05_02");	//Prawie nikt tu ju� nie zagl�da, opr�cz paru bogaczy z g�rnego miasta.
	AI_Output(other,self,"DIA_Coragon_Add_15_03");	//Co� z nimi nie tak?
	AI_Output(self,other,"DIA_Coragon_Add_05_04");	//Niekt�rzy z tych elegancik�w potrafi� by� naprawd� denerwuj�cy.
	AI_Output(self,other,"DIA_Coragon_Add_05_05");	//Na przyk�ad taki Valentino - nie mog� na niego patrze�.
	AI_Output(self,other,"DIA_Coragon_Add_05_06");	//Niestety, nie mog� sobie pozwoli� na selekcj� klient�w. Potrzebuj� ka�dej monety, jak� mog� zarobi�.
	AI_Output(self,other,"DIA_Coragon_Add_05_07");	//Wszystko, co zdo�a�em zaoszcz�dzi�, zosta�o skradzione wraz z moimi srebrami.
};


instance DIA_CORAGON_BESTOHLEN(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 4;
	condition = dia_coragon_bestohlen_condition;
	information = dia_coragon_bestohlen_info;
	permanent = FALSE;
	description = "Obrabowano ci�?";
};


func int dia_coragon_bestohlen_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_whatsup))
	{
		return TRUE;
	};
};

func void dia_coragon_bestohlen_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_08");	//Obrabowano ci�?
	AI_Output(self,other,"DIA_Coragon_Add_05_09");	//To by�o ju� jaki� czas temu. Tej nocy w knajpie siedzia�o pe�no ludzi, a ja odszed�em tylko na moment, �eby roznie�� zam�wione piwo.
	AI_Output(self,other,"DIA_Coragon_Add_05_10");	//Jednak tym draniom wystarczy�a nawet kr�tka chwila.
	AI_Output(self,other,"DIA_Coragon_Add_05_11");	//Zawiadomi�em stra�, ale oczywi�cie nic nie znale�li. Ich interesuje tylko darmowe piwsko.
	MIS_CORAGON_SILBER = LOG_RUNNING;
};


var int coragon_bier;

func void b_coragon_bier()
{
	CORAGON_BIER = CORAGON_BIER + 1;
	AI_Output(self,other,"DIA_Coragon_Add_05_14");	//Prosz�, przyjmij to jako nagrod�.
	b_giveinvitems(self,other,4910,1);
	if(CORAGON_BIER < 2)
	{
		AI_Output(self,other,"DIA_Coragon_Add_05_21");	//To nie jest zwyk�e piwo. Pochodzi z mojej ostatniej beczki.
	}
	else
	{
		AI_Output(self,other,"DIA_Coragon_Add_05_22");	//To wszystko, co pozosta�o!
	};
};


instance DIA_CORAGON_BRINGSILBER(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 5;
	condition = dia_coragon_bringsilber_condition;
	information = dia_coragon_bringsilber_info;
	permanent = FALSE;
	description = "Mam twoje srebra.";
};


func int dia_coragon_bringsilber_condition()
{
	if((MIS_CORAGON_SILBER == LOG_RUNNING) && (Npc_HasItems(other,itmi_coragonssilber) >= 8))
	{
		return TRUE;
	};
};

func void dia_coragon_bringsilber_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_12");	//Mam twoje srebra.
	b_giveinvitems(other,self,5643,8);
	AI_Output(self,other,"DIA_Coragon_Add_05_13");	//Doprawdy!
	b_giveplayerxp(XP_CORAGONSSILBER);
	b_coragon_bier();
	MIS_CORAGON_SILBER = LOG_SUCCESS;
};


instance DIA_CORAGON_SCHULDENBUCH(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 6;
	condition = dia_coragon_schuldenbuch_condition;
	information = dia_coragon_schuldenbuch_info;
	permanent = FALSE;
	description = "Popatrz, co tutaj mam.";
};


func int dia_coragon_schuldenbuch_condition()
{
	if(Npc_HasItems(other,itwr_schuldenbuch) > 0)
	{
		return TRUE;
	};
};

func void dia_coragon_schuldenbuch_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_15");	//Popatrz, co tutaj mam.
	AI_Output(self,other,"DIA_Coragon_Add_05_16");	//Mmm? Ale� to ksi�ga rachunkowa Lehmara!
	AI_Output(self,other,"DIA_Coragon_Add_05_17");	//Co zamierzasz z tym zrobi�?
};


instance DIA_CORAGON_GIVEBOOK(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 7;
	condition = dia_coragon_givebook_condition;
	information = dia_coragon_givebook_info;
	permanent = FALSE;
	description = "Oto ksi�ga.";
};


func int dia_coragon_givebook_condition()
{
	if(Npc_HasItems(other,itwr_schuldenbuch) > 0)
	{
		return TRUE;
	};
};

func void dia_coragon_givebook_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_18");	//Oto twoja ksi�ga.
	b_giveinvitems(other,self,5721,1);
	Npc_RemoveInvItems(self,itwr_schuldenbuch,1);
	AI_Output(self,other,"DIA_Coragon_Add_05_19");	//Dzi�kuj�! Ocali�e� m�j ty�ek. Lehmar potrafi by� bardzo niemi�y.
	b_giveplayerxp(XP_SCHULDENBUCH);
	b_coragon_bier();
};


instance DIA_CORAGON_TOOV(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 9;
	condition = dia_coragon_toov_condition;
	information = dia_coragon_toov_info;
	permanent = FALSE;
	description = "W jaki spos�b mog� si� dosta� do g�rnego miasta?";
};


func int dia_coragon_toov_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_whatsup) && (other.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_coragon_toov_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_23");	//W jaki spos�b mog� si� dosta� do g�rnego miasta?
	AI_Output(self,other,"DIA_Coragon_Add_05_24");	//Musisz zosta� obywatelem miasta. Znajd� sobie jak�� robot�.
	AI_Output(self,other,"DIA_Coragon_Add_05_25");	//Najlepiej b�dzie, je�li rozejrzysz si� w dolnej cz�ci miasta. Sporo tam rzemie�lnik�w - zosta� jednym z nich, a uzyskasz obywatelstwo.
	AI_Output(self,other,"DIA_Coragon_Add_05_26");	//Je�li to ci nie wystarczy, id� porozmawia� z Lordem Andre - znajdziesz go w koszarach.
	AI_Output(self,other,"DIA_Coragon_Add_05_27");	//Mo�e przyjmie ci� do stra�y. Stra�nicy maj� wst�p r�wnie� do g�rnego miasta.
};


instance DIA_CORAGON_VALENTINO(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 8;
	condition = dia_coragon_valentino_condition;
	information = dia_coragon_valentino_info;
	permanent = FALSE;
	description = "O co chodzi z tym Valentinem?";
};


func int dia_coragon_valentino_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_whatsup))
	{
		return TRUE;
	};
};

func void dia_coragon_valentino_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_28");	//O co chodzi z tym Valentinem?
	AI_Output(self,other,"DIA_Coragon_Add_05_29");	//Jest obrzydliwie bogaty i nie musi pracowa�. Zreszt� opowiada o tym ka�demu, kogo tylko spotka.
	AI_Output(self,other,"DIA_Coragon_Add_05_30");	//Niezale�nie od tego, czy ta osoba chce go s�ucha�.
	AI_Output(self,other,"DIA_Coragon_Add_05_31");	//Zawsze siedzi w knajpie a� do rana, wypijaj�c ogromne ilo�ci alkoholu, a bladym �witem wraca chwiejnym krokiem do g�rnego miasta.
	AI_Output(self,other,"DIA_Coragon_Add_05_32");	//Codziennie jest tak samo.
};


instance DIA_CORAGON_NEWS(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 1;
	condition = dia_coragon_news_condition;
	information = dia_coragon_news_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_coragon_news_condition()
{
	if(valentino.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		if(REGIS_RING == TRUE)
		{
			return TRUE;
		};
	};
};

func void dia_coragon_news_info()
{
	AI_Output(self,other,"DIA_Coragon_Add_05_33");	//Wczoraj Valentino nie chcia� zap�aci� rachunku.
	if(valentino.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Coragon_Add_05_34");	//Gada� co� o tym, �e zosta� obrabowany i zap�aci p�niej...
	}
	else
	{
		AI_Output(self,other,"DIA_Coragon_Add_05_35");	//A jeszcze poprzedniej nocy przechwala� si�, jaki to on jest bogaty.
		AI_Output(self,other,"DIA_Coragon_Add_05_36");	//Potem w�o�y� r�k� do kieszeni i zrobi� naprawd� idiotyczn� min�. Okaza�o si�, �e pieni�dze znikn�y...
	};
	AI_Output(other,self,"DIA_Coragon_Add_15_37");	//No... I co zrobi�e�?
	AI_Output(self,other,"DIA_Coragon_Add_05_38");	//Spu�ci�em mu porz�dne lanie, i tyle.
};


instance DIA_CORAGON_RING(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 10;
	condition = dia_coragon_ring_condition;
	information = dia_coragon_ring_info;
	permanent = FALSE;
	description = "Prosz� - przyjmij ten pier�cie�.";
};


func int dia_coragon_ring_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_news) && (Npc_HasItems(other,itri_valentinosring) > 0))
	{
		return TRUE;
	};
};

func void dia_coragon_ring_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_39");	//Prosz� - przyjmij ten pier�cie�.
	b_giveinvitems(other,self,5647,1);
	AI_Output(self,other,"DIA_Coragon_Add_05_40");	//Co? Nie rozumiem...
	AI_Output(other,self,"DIA_Coragon_Add_15_41");	//Nale�a� do Valentina.
	AI_Output(other,self,"DIA_Coragon_Add_15_42");	//Zawsze mo�esz ofiarowa� ten pier�cie� komu�, kto zdo�a go schwyta�...
	b_giveplayerxp(300);
	AI_StopProcessInfos(self);
};

