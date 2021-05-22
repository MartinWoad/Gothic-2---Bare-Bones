
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
	description = "Czy mog� kupi� co� do picia?";
};


func int DIA_Coragon_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Coragon_HALLO_Info()
{
	AI_Output(other,self,"DIA_Coragon_HALLO_15_00");	//Czy mog� kupi� co� do picia?
	AI_Output(self,other,"DIA_Coragon_Add_05_00");	//Dop�ki masz z�oto, mo�esz tu nawet jada� posi�ki.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Jedzenie i napoje mog� kupi� u w�a�ciciela gospody, Coragona.");
};


instance DIA_Coragon_Trade(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 2;
	condition = DIA_Coragon_Trade_Condition;
	information = DIA_Coragon_Trade_Info;
	permanent = TRUE;
	description = "Poka� mi swoje towary.";
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
	AI_Output(other,self,"DIA_Coragon_Trade_15_00");	//Poka� mi swoje towary.
};


instance DIA_Coragon_WhatsUp(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 3;
	condition = DIA_Coragon_WhatsUp_Condition;
	information = DIA_Coragon_WhatsUp_Info;
	permanent = FALSE;
	description = "Jak id� interesy?";
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
	AI_Output(other,self,"DIA_Coragon_Gelaber_15_00");	//Jak id� interesy?
	AI_Output(self,other,"DIA_Coragon_Add_05_01");	//Ech, nie przypominaj mi. Lord Andre serwuje na placu wisielc�w darmowe piwo.
	AI_Output(self,other,"DIA_Coragon_Add_05_02");	//Prawie nikt tu ju� nie zagl�da, opr�cz paru bogaczy z g�rnego miasta.
	AI_Output(other,self,"DIA_Coragon_Add_15_03");	//Co� z nimi nie tak?
	AI_Output(self,other,"DIA_Coragon_Add_05_04");	//Niekt�rzy z tych elegancik�w potrafi� by� naprawd� denerwuj�cy.
	AI_Output(self,other,"DIA_Coragon_Add_05_05");	//Na przyk�ad taki Valentino - nie mog� na niego patrze�.
	AI_Output(self,other,"DIA_Coragon_Add_05_06");	//Niestety, nie mog� sobie pozwoli� na selekcj� klient�w. Potrzebuj� ka�dej monety, jak� mog� zarobi�.
	AI_Output(self,other,"DIA_Coragon_Add_05_07");	//Wszystko, co zdo�a�em zaoszcz�dzi�, zosta�o skradzione wraz z moimi srebrami.
};


instance DIA_Coragon_Bestohlen(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 4;
	condition = DIA_Coragon_Bestohlen_Condition;
	information = DIA_Coragon_Bestohlen_Info;
	permanent = FALSE;
	description = "Obrabowano ci�?";
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
	AI_Output(other,self,"DIA_Coragon_Add_15_08");	//Obrabowano ci�?
	AI_Output(self,other,"DIA_Coragon_Add_05_09");	//To by�o ju� jaki� czas temu. Tej nocy w knajpie siedzia�o pe�no ludzi, a ja odszed�em tylko na moment, �eby roznie�� zam�wione piwo.
	AI_Output(self,other,"DIA_Coragon_Add_05_10");	//Jednak tym draniom wystarczy�a nawet kr�tka chwila.
	AI_Output(self,other,"DIA_Coragon_Add_05_11");	//Zawiadomi�em stra�, ale oczywi�cie nic nie znale�li. Ich interesuje tylko darmowe piwsko.
	MIS_Coragon_Silber = LOG_Running;
};


var int Coragon_Bier;

func void B_Coragon_Bier()
{
	Coragon_Bier = Coragon_Bier + 1;
	AI_Output(self,other,"DIA_Coragon_Add_05_14");	//Prosz�, przyjmij to jako nagrod�.
	B_GiveInvItems(self,other,ItFo_CoragonsBeer,1);
	if(Coragon_Bier < 2)
	{
		AI_Output(self,other,"DIA_Coragon_Add_05_21");	//To nie jest zwyk�e piwo. Pochodzi z mojej ostatniej beczki.
	}
	else
	{
		AI_Output(self,other,"DIA_Coragon_Add_05_22");	//To wszystko, co pozosta�o!
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
	AI_Output(self,other,"DIA_Coragon_Add_05_16");	//Mmm? Ale� to ksi�ga rachunkowa Lehmara!
	AI_Output(self,other,"DIA_Coragon_Add_05_17");	//Co zamierzasz z tym zrobi�?
};


instance DIA_Coragon_GiveBook(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 7;
	condition = DIA_Coragon_GiveBook_Condition;
	information = DIA_Coragon_GiveBook_Info;
	permanent = FALSE;
	description = "Oto ksi�ga.";
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
	AI_Output(other,self,"DIA_Coragon_Add_15_18");	//Oto twoja ksi�ga.
	B_GiveInvItems(other,self,ItWr_Schuldenbuch,1);
	Npc_RemoveInvItems(self,ItWr_Schuldenbuch,1);
	AI_Output(self,other,"DIA_Coragon_Add_05_19");	//Dzi�kuj�! Ocali�e� m�j ty�ek. Lehmar potrafi by� bardzo niemi�y.
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
	description = "W jaki spos�b mog� si� dosta� do g�rnego miasta?";
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
	AI_Output(other,self,"DIA_Coragon_Add_15_23");	//W jaki spos�b mog� si� dosta� do g�rnego miasta?
	AI_Output(self,other,"DIA_Coragon_Add_05_24");	//Musisz zosta� obywatelem miasta. Znajd� sobie jak�� robot�.
	AI_Output(self,other,"DIA_Coragon_Add_05_25");	//Najlepiej b�dzie, je�li rozejrzysz si� w dolnej cz�ci miasta. Sporo tam rzemie�lnik�w - zosta� jednym z nich, a uzyskasz obywatelstwo.
	AI_Output(self,other,"DIA_Coragon_Add_05_26");	//Je�li to ci nie wystarczy, id� porozmawia� z Lordem Andre - znajdziesz go w koszarach.
	AI_Output(self,other,"DIA_Coragon_Add_05_27");	//Mo�e przyjmie ci� do stra�y. Stra�nicy maj� wst�p r�wnie� do g�rnego miasta.
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
	AI_Output(self,other,"DIA_Coragon_Add_05_29");	//Jest obrzydliwie bogaty i nie musi pracowa�. Zreszt� opowiada o tym ka�demu, kogo tylko spotka.
	AI_Output(self,other,"DIA_Coragon_Add_05_30");	//Niezale�nie od tego, czy ta osoba chce go s�ucha�.
	AI_Output(self,other,"DIA_Coragon_Add_05_31");	//Zawsze siedzi w knajpie a� do rana, wypijaj�c ogromne ilo�ci alkoholu, a bladym �witem wraca chwiejnym krokiem do g�rnego miasta.
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
	AI_Output(self,other,"DIA_Coragon_Add_05_33");	//Wczoraj Valentino nie chcia� zap�aci� rachunku.
	if(Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
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


instance DIA_Coragon_Ring(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 10;
	condition = DIA_Coragon_Ring_Condition;
	information = DIA_Coragon_Ring_Info;
	permanent = FALSE;
	description = "Prosz� - przyjmij ten pier�cie�.";
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
	AI_Output(other,self,"DIA_Coragon_Add_15_39");	//Prosz� - przyjmij ten pier�cie�.
	B_GiveInvItems(other,self,ItRi_ValentinosRing,1);
	AI_Output(self,other,"DIA_Coragon_Add_05_40");	//Co? Nie rozumiem...
	AI_Output(other,self,"DIA_Coragon_Add_15_41");	//Nale�a� do Valentina.
	AI_Output(other,self,"DIA_Coragon_Add_15_42");	//Zawsze mo�esz ofiarowa� ten pier�cie� komu�, kto zdo�a go schwyta�...
	B_GivePlayerXP(300);
	AI_StopProcessInfos(self);
};

