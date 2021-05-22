
instance DIA_Coragon_EXIT(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 999;
	condition = DIA_Coragon_EXIT_Condition;
	information = DIA_Coragon_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Coragon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Coragon_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Coragon_PICKPOCKET(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 900;
	condition = DIA_Coragon_PICKPOCKET_Condition;
	information = DIA_Coragon_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Coragon_PICKPOCKET_Condition()
{
	return C_Beklauen(40,45);
};

func void DIA_Coragon_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Coragon_PICKPOCKET);
	Info_AddChoice(DIA_Coragon_PICKPOCKET,Dialog_Back,DIA_Coragon_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Coragon_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Coragon_PICKPOCKET_DoIt);
};

func void DIA_Coragon_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Coragon_PICKPOCKET);
};

func void DIA_Coragon_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Coragon_PICKPOCKET);
};


instance DIA_Coragon_HALLO(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 2;
	condition = DIA_Coragon_HALLO_Condition;
	information = DIA_Coragon_HALLO_Info;
	permanent = FALSE;
	description = "Czy mogê kupiæ coœ do picia?";
};


func int DIA_Coragon_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Coragon_HALLO_Info()
{
	AI_Output(other,self,"DIA_Coragon_HALLO_15_00");	//Czy mogê kupiæ coœ do picia?
	AI_Output(self,other,"DIA_Coragon_Add_05_00");	//Dopóki masz z³oto, mo¿esz tu nawet jadaæ posi³ki.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Jedzenie i napoje mogê kupiæ u w³aœciciela gospody, Coragona.");
};


instance DIA_Coragon_Trade(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 2;
	condition = DIA_Coragon_Trade_Condition;
	information = DIA_Coragon_Trade_Info;
	permanent = TRUE;
	description = "Poka¿ mi swoje towary.";
	trade = TRUE;
};


func int DIA_Coragon_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Coragon_Trade_15_00");	//Poka¿ mi swoje towary.
};


instance DIA_Coragon_WhatsUp(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 3;
	condition = DIA_Coragon_WhatsUp_Condition;
	information = DIA_Coragon_WhatsUp_Info;
	permanent = FALSE;
	description = "Jak id¹ interesy?";
};


func int DIA_Coragon_WhatsUp_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Coragon_WhatsUp_Info()
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


instance DIA_Coragon_Bestohlen(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 4;
	condition = DIA_Coragon_Bestohlen_Condition;
	information = DIA_Coragon_Bestohlen_Info;
	permanent = FALSE;
	description = "Obrabowano ciê?";
};


func int DIA_Coragon_Bestohlen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_WhatsUp))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Bestohlen_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_08");	//Obrabowano ciê?
	AI_Output(self,other,"DIA_Coragon_Add_05_09");	//To by³o ju¿ jakiœ czas temu. Tej nocy w knajpie siedzia³o pe³no ludzi, a ja odszed³em tylko na moment, ¿eby roznieœæ zamówione piwo.
	AI_Output(self,other,"DIA_Coragon_Add_05_10");	//Jednak tym draniom wystarczy³a nawet krótka chwila.
	AI_Output(self,other,"DIA_Coragon_Add_05_11");	//Zawiadomi³em stra¿, ale oczywiœcie nic nie znaleŸli. Ich interesuje tylko darmowe piwsko.
	MIS_Coragon_Silber = LOG_Running;
};


var int Coragon_Bier;

func void B_Coragon_Bier()
{
	Coragon_Bier = Coragon_Bier + 1;
	AI_Output(self,other,"DIA_Coragon_Add_05_14");	//Proszê, przyjmij to jako nagrodê.
	B_GiveInvItems(self,other,ItFo_CoragonsBeer,1);
	if(Coragon_Bier < 2)
	{
		AI_Output(self,other,"DIA_Coragon_Add_05_21");	//To nie jest zwyk³e piwo. Pochodzi z mojej ostatniej beczki.
	}
	else
	{
		AI_Output(self,other,"DIA_Coragon_Add_05_22");	//To wszystko, co pozosta³o!
	};
};


instance DIA_Coragon_BringSilber(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 5;
	condition = DIA_Coragon_BringSilber_Condition;
	information = DIA_Coragon_BringSilber_Info;
	permanent = FALSE;
	description = "Mam twoje srebra.";
};


func int DIA_Coragon_BringSilber_Condition()
{
	if((MIS_Coragon_Silber == LOG_Running) && (Npc_HasItems(other,ItMi_CoragonsSilber) >= 8))
	{
		return TRUE;
	};
};

func void DIA_Coragon_BringSilber_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_12");	//Mam twoje srebra.
	B_GiveInvItems(other,self,ItMi_CoragonsSilber,8);
	AI_Output(self,other,"DIA_Coragon_Add_05_13");	//Doprawdy!
	B_GivePlayerXP(XP_CoragonsSilber);
	B_Coragon_Bier();
	MIS_Coragon_Silber = LOG_SUCCESS;
};


instance DIA_Coragon_Schuldenbuch(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 6;
	condition = DIA_Coragon_Schuldenbuch_Condition;
	information = DIA_Coragon_Schuldenbuch_Info;
	permanent = FALSE;
	description = "Popatrz, co tutaj mam.";
};


func int DIA_Coragon_Schuldenbuch_Condition()
{
	if(Npc_HasItems(other,ItWr_Schuldenbuch) > 0)
	{
		return TRUE;
	};
};

func void DIA_Coragon_Schuldenbuch_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_15");	//Popatrz, co tutaj mam.
	AI_Output(self,other,"DIA_Coragon_Add_05_16");	//Mmm? Ale¿ to ksiêga rachunkowa Lehmara!
	AI_Output(self,other,"DIA_Coragon_Add_05_17");	//Co zamierzasz z tym zrobiæ?
};


instance DIA_Coragon_GiveBook(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 7;
	condition = DIA_Coragon_GiveBook_Condition;
	information = DIA_Coragon_GiveBook_Info;
	permanent = FALSE;
	description = "Oto ksiêga.";
};


func int DIA_Coragon_GiveBook_Condition()
{
	if(Npc_HasItems(other,ItWr_Schuldenbuch) > 0)
	{
		return TRUE;
	};
};

func void DIA_Coragon_GiveBook_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_18");	//Oto twoja ksiêga.
	B_GiveInvItems(other,self,ItWr_Schuldenbuch,1);
	Npc_RemoveInvItems(self,ItWr_Schuldenbuch,1);
	AI_Output(self,other,"DIA_Coragon_Add_05_19");	//Dziêkujê! Ocali³eœ mój ty³ek. Lehmar potrafi byæ bardzo niemi³y.
	B_GivePlayerXP(XP_Schuldenbuch);
	B_Coragon_Bier();
};


instance DIA_Coragon_ToOV(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 9;
	condition = DIA_Coragon_ToOV_Condition;
	information = DIA_Coragon_ToOV_Info;
	permanent = FALSE;
	description = "W jaki sposób mogê siê dostaæ do górnego miasta?";
};


func int DIA_Coragon_ToOV_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_WhatsUp) && (other.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Coragon_ToOV_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_23");	//W jaki sposób mogê siê dostaæ do górnego miasta?
	AI_Output(self,other,"DIA_Coragon_Add_05_24");	//Musisz zostaæ obywatelem miasta. ZnajdŸ sobie jak¹œ robotê.
	AI_Output(self,other,"DIA_Coragon_Add_05_25");	//Najlepiej bêdzie, jeœli rozejrzysz siê w dolnej czêœci miasta. Sporo tam rzemieœlników - zostañ jednym z nich, a uzyskasz obywatelstwo.
	AI_Output(self,other,"DIA_Coragon_Add_05_26");	//Jeœli to ci nie wystarczy, idŸ porozmawiaæ z Lordem Andre - znajdziesz go w koszarach.
	AI_Output(self,other,"DIA_Coragon_Add_05_27");	//Mo¿e przyjmie ciê do stra¿y. Stra¿nicy maj¹ wstêp równie¿ do górnego miasta.
};


instance DIA_Coragon_Valentino(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 8;
	condition = DIA_Coragon_Valentino_Condition;
	information = DIA_Coragon_Valentino_Info;
	permanent = FALSE;
	description = "O co chodzi z tym Valentinem?";
};


func int DIA_Coragon_Valentino_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_WhatsUp))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Valentino_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_28");	//O co chodzi z tym Valentinem?
	AI_Output(self,other,"DIA_Coragon_Add_05_29");	//Jest obrzydliwie bogaty i nie musi pracowaæ. Zreszt¹ opowiada o tym ka¿demu, kogo tylko spotka.
	AI_Output(self,other,"DIA_Coragon_Add_05_30");	//Niezale¿nie od tego, czy ta osoba chce go s³uchaæ.
	AI_Output(self,other,"DIA_Coragon_Add_05_31");	//Zawsze siedzi w knajpie a¿ do rana, wypijaj¹c ogromne iloœci alkoholu, a bladym œwitem wraca chwiejnym krokiem do górnego miasta.
	AI_Output(self,other,"DIA_Coragon_Add_05_32");	//Codziennie jest tak samo.
};


instance DIA_Coragon_News(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 1;
	condition = DIA_Coragon_News_Condition;
	information = DIA_Coragon_News_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Coragon_News_Condition()
{
	if(Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		if(Regis_Ring == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Coragon_News_Info()
{
	AI_Output(self,other,"DIA_Coragon_Add_05_33");	//Wczoraj Valentino nie chcia³ zap³aciæ rachunku.
	if(Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
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


instance DIA_Coragon_Ring(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 10;
	condition = DIA_Coragon_Ring_Condition;
	information = DIA_Coragon_Ring_Info;
	permanent = FALSE;
	description = "Proszê - przyjmij ten pierœcieñ.";
};


func int DIA_Coragon_Ring_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_News) && (Npc_HasItems(other,ItRi_ValentinosRing) > 0))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Ring_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_39");	//Proszê - przyjmij ten pierœcieñ.
	B_GiveInvItems(other,self,ItRi_ValentinosRing,1);
	AI_Output(self,other,"DIA_Coragon_Add_05_40");	//Co? Nie rozumiem...
	AI_Output(other,self,"DIA_Coragon_Add_15_41");	//Nale¿a³ do Valentina.
	AI_Output(other,self,"DIA_Coragon_Add_15_42");	//Zawsze mo¿esz ofiarowaæ ten pierœcieñ komuœ, kto zdo³a go schwytaæ...
	B_GivePlayerXP(300);
	AI_StopProcessInfos(self);
};

