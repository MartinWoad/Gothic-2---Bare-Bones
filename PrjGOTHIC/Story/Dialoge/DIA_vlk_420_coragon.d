
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
	description = "Czy mogê kupiæ coœ do picia?";
};


func int dia_coragon_hallo_condition()
{
	return TRUE;
};

func void dia_coragon_hallo_info()
{
	AI_Output(other,self,"DIA_Coragon_HALLO_15_00");	//Czy mogê kupiæ coœ do picia?
	AI_Output(self,other,"DIA_Coragon_Add_05_00");	//Dopóki masz z³oto, mo¿esz tu nawet jadaæ posi³ki.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Jedzenie i napoje mogê kupiæ u w³aœciciela gospody, Coragona.");
};


instance DIA_CORAGON_TRADE(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 2;
	condition = dia_coragon_trade_condition;
	information = dia_coragon_trade_info;
	permanent = TRUE;
	description = "Poka¿ mi swoje towary.";
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
	AI_Output(other,self,"DIA_Coragon_Trade_15_00");	//Poka¿ mi swoje towary.
};


instance DIA_CORAGON_WHATSUP(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 3;
	condition = dia_coragon_whatsup_condition;
	information = dia_coragon_whatsup_info;
	permanent = FALSE;
	description = "Jak id¹ interesy?";
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
	AI_Output(other,self,"DIA_Coragon_Gelaber_15_00");	//Jak id¹ interesy?
	AI_Output(self,other,"DIA_Coragon_Add_05_01");	//Ech, nie przypominaj mi. Lord Andre serwuje na placu wisielców darmowe piwo.
	AI_Output(self,other,"DIA_Coragon_Add_05_02");	//Prawie nikt tu ju¿ nie zagl¹da, oprócz paru bogaczy z górnego miasta.
	AI_Output(other,self,"DIA_Coragon_Add_15_03");	//Coœ z nimi nie tak?
	AI_Output(self,other,"DIA_Coragon_Add_05_04");	//Niektórzy z tych elegancików potrafi¹ byæ naprawdê denerwuj¹cy.
	AI_Output(self,other,"DIA_Coragon_Add_05_05");	//Na przyk³ad taki Valentino - nie mogê na niego patrzeæ.
	AI_Output(self,other,"DIA_Coragon_Add_05_06");	//Niestety, nie mogê sobie pozwoliæ na selekcjê klientów. Potrzebujê ka¿dej monety, jak¹ mogê zarobiæ.
	AI_Output(self,other,"DIA_Coragon_Add_05_07");	//Wszystko, co zdo³a³em zaoszczêdziæ, zosta³o skradzione wraz z moimi srebrami.
};


instance DIA_CORAGON_BESTOHLEN(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 4;
	condition = dia_coragon_bestohlen_condition;
	information = dia_coragon_bestohlen_info;
	permanent = FALSE;
	description = "Obrabowano ciê?";
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
	AI_Output(other,self,"DIA_Coragon_Add_15_08");	//Obrabowano ciê?
	AI_Output(self,other,"DIA_Coragon_Add_05_09");	//To by³o ju¿ jakiœ czas temu. Tej nocy w knajpie siedzia³o pe³no ludzi, a ja odszed³em tylko na moment, ¿eby roznieœæ zamówione piwo.
	AI_Output(self,other,"DIA_Coragon_Add_05_10");	//Jednak tym draniom wystarczy³a nawet krótka chwila.
	AI_Output(self,other,"DIA_Coragon_Add_05_11");	//Zawiadomi³em stra¿, ale oczywiœcie nic nie znaleŸli. Ich interesuje tylko darmowe piwsko.
	MIS_CORAGON_SILBER = LOG_RUNNING;
};


var int coragon_bier;

func void b_coragon_bier()
{
	CORAGON_BIER = CORAGON_BIER + 1;
	AI_Output(self,other,"DIA_Coragon_Add_05_14");	//Proszê, przyjmij to jako nagrodê.
	b_giveinvitems(self,other,4910,1);
	if(CORAGON_BIER < 2)
	{
		AI_Output(self,other,"DIA_Coragon_Add_05_21");	//To nie jest zwyk³e piwo. Pochodzi z mojej ostatniej beczki.
	}
	else
	{
		AI_Output(self,other,"DIA_Coragon_Add_05_22");	//To wszystko, co pozosta³o!
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
	AI_Output(self,other,"DIA_Coragon_Add_05_16");	//Mmm? Ale¿ to ksiêga rachunkowa Lehmara!
	AI_Output(self,other,"DIA_Coragon_Add_05_17");	//Co zamierzasz z tym zrobiæ?
};


instance DIA_CORAGON_GIVEBOOK(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 7;
	condition = dia_coragon_givebook_condition;
	information = dia_coragon_givebook_info;
	permanent = FALSE;
	description = "Oto ksiêga.";
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
	AI_Output(other,self,"DIA_Coragon_Add_15_18");	//Oto twoja ksiêga.
	b_giveinvitems(other,self,5721,1);
	Npc_RemoveInvItems(self,itwr_schuldenbuch,1);
	AI_Output(self,other,"DIA_Coragon_Add_05_19");	//Dziêkujê! Ocali³eœ mój ty³ek. Lehmar potrafi byæ bardzo niemi³y.
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
	description = "W jaki sposób mogê siê dostaæ do górnego miasta?";
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
	AI_Output(other,self,"DIA_Coragon_Add_15_23");	//W jaki sposób mogê siê dostaæ do górnego miasta?
	AI_Output(self,other,"DIA_Coragon_Add_05_24");	//Musisz zostaæ obywatelem miasta. ZnajdŸ sobie jak¹œ robotê.
	AI_Output(self,other,"DIA_Coragon_Add_05_25");	//Najlepiej bêdzie, jeœli rozejrzysz siê w dolnej czêœci miasta. Sporo tam rzemieœlników - zostañ jednym z nich, a uzyskasz obywatelstwo.
	AI_Output(self,other,"DIA_Coragon_Add_05_26");	//Jeœli to ci nie wystarczy, idŸ porozmawiaæ z Lordem Andre - znajdziesz go w koszarach.
	AI_Output(self,other,"DIA_Coragon_Add_05_27");	//Mo¿e przyjmie ciê do stra¿y. Stra¿nicy maj¹ wstêp równie¿ do górnego miasta.
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
	AI_Output(self,other,"DIA_Coragon_Add_05_29");	//Jest obrzydliwie bogaty i nie musi pracowaæ. Zreszt¹ opowiada o tym ka¿demu, kogo tylko spotka.
	AI_Output(self,other,"DIA_Coragon_Add_05_30");	//Niezale¿nie od tego, czy ta osoba chce go s³uchaæ.
	AI_Output(self,other,"DIA_Coragon_Add_05_31");	//Zawsze siedzi w knajpie a¿ do rana, wypijaj¹c ogromne iloœci alkoholu, a bladym œwitem wraca chwiejnym krokiem do górnego miasta.
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
	AI_Output(self,other,"DIA_Coragon_Add_05_33");	//Wczoraj Valentino nie chcia³ zap³aciæ rachunku.
	if(valentino.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Coragon_Add_05_34");	//Gada³ coœ o tym, ¿e zosta³ obrabowany i zap³aci póŸniej...
	}
	else
	{
		AI_Output(self,other,"DIA_Coragon_Add_05_35");	//A jeszcze poprzedniej nocy przechwala³ siê, jaki to on jest bogaty.
		AI_Output(self,other,"DIA_Coragon_Add_05_36");	//Potem w³o¿y³ rêkê do kieszeni i zrobi³ naprawdê idiotyczn¹ minê. Okaza³o siê, ¿e pieni¹dze zniknê³y...
	};
	AI_Output(other,self,"DIA_Coragon_Add_15_37");	//No... I co zrobi³eœ?
	AI_Output(self,other,"DIA_Coragon_Add_05_38");	//Spuœci³em mu porz¹dne lanie, i tyle.
};


instance DIA_CORAGON_RING(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 10;
	condition = dia_coragon_ring_condition;
	information = dia_coragon_ring_info;
	permanent = FALSE;
	description = "Proszê - przyjmij ten pierœcieñ.";
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
	AI_Output(other,self,"DIA_Coragon_Add_15_39");	//Proszê - przyjmij ten pierœcieñ.
	b_giveinvitems(other,self,5647,1);
	AI_Output(self,other,"DIA_Coragon_Add_05_40");	//Co? Nie rozumiem...
	AI_Output(other,self,"DIA_Coragon_Add_15_41");	//Nale¿a³ do Valentina.
	AI_Output(other,self,"DIA_Coragon_Add_15_42");	//Zawsze mo¿esz ofiarowaæ ten pierœcieñ komuœ, kto zdo³a go schwytaæ...
	b_giveplayerxp(300);
	AI_StopProcessInfos(self);
};

