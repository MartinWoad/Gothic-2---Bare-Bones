
instance DIA_Garwig_EXIT(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 999;
	condition = DIA_Garwig_EXIT_Condition;
	information = DIA_Garwig_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Garwig_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Garwig_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Garwig_Wurst(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 3;
	condition = DIA_Garwig_Wurst_Condition;
	information = DIA_Garwig_Wurst_Info;
	permanent = FALSE;
	description = "Chcesz spr�bowa� kie�basy?";
};


func int DIA_Garwig_Wurst_Condition()
{
	if((Kapitel < 3) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Garwig_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_Garwig_Wurst_15_00");	//Chcesz spr�bowa� kie�basy?
	AI_Output(self,other,"DIA_Garwig_Wurst_06_01");	//Jest pyszna. Bardzo dzi�kuj�, Bracie.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
	NovizeLeft = IntToString(13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft,PRINT_NovizenLeft);
	PrintS_Ext(NovizeText, White());
};


instance DIA_Garwig_Hello(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 3;
	condition = DIA_Garwig_Hello_Condition;
	information = DIA_Garwig_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Garwig_Hello_Condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_Garwig_Hello_Info()
{
	AI_Output(self,other,"DIA_Garwig_Hello_06_00");	//Niech Innos b�dzie z tob�. Nie znam ci�, jeste� tu nowy?
	AI_Output(other,self,"DIA_Garwig_Hello_15_01");	//Tak, dopiero si� do was przy��czy�em.
	AI_Output(self,other,"DIA_Garwig_Hello_06_02");	//W takim wypadku mam nadziej�, �e pr�dko si� tutaj zadomowisz. Daj mi zna�, je�li b�d� m�g� ci w czym� pom�c.
};


instance DIA_Garwig_Room(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 5;
	condition = DIA_Garwig_Room_Condition;
	information = DIA_Garwig_Room_Info;
	permanent = FALSE;
	description = "Co to za pomieszczenie?";
};


func int DIA_Garwig_Room_Condition()
{
	return TRUE;
};

func void DIA_Garwig_Room_Info()
{
	AI_Output(other,self,"DIA_Garwig_Room_15_00");	//Co to za pomieszczenie?
	AI_Output(self,other,"DIA_Garwig_Room_06_01");	//Tutaj przechowywane s� klasztorne relikwie.
	AI_Output(other,self,"DIA_Garwig_Room_15_02");	//Jakie relikwie?
	AI_Output(self,other,"DIA_Garwig_Room_06_03");	//Tu spoczywa M�ot Innosa oraz Tarcza Ognia, najwa�niejsze relikwie Ko�cio�a Innosa poza stolic� kr�lestwa.
};


instance DIA_Garwig_Hammer(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 99;
	condition = DIA_Garwig_Hammer_Condition;
	information = DIA_Garwig_Hammer_Info;
	permanent = TRUE;
	description = "Opowiedz mi o tym M�ocie.";
};


func int DIA_Garwig_Hammer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garwig_Room))
	{
		return TRUE;
	};
};

func void DIA_Garwig_Hammer_Info()
{
	AI_Output(other,self,"DIA_Garwig_Hammer_15_00");	//Opowiedz mi o tym M�ocie.
	AI_Output(self,other,"DIA_Garwig_Hammer_06_01");	//Oto �wi�ty M�ot Innosa. To w�a�nie nim �wi�ty Rhobar zabi� Kamiennego Stra�nika.
	AI_Output(self,other,"DIA_Garwig_Hammer_06_02");	//�wi�te Pisma twierdz�, �e Kamienny Stra�nik by� niezniszczalny. Bro� wyszczerbia�a si� na jego kamiennej sk�rze, nie czyni�c mu �adnej krzywdy.
	AI_Output(self,other,"DIA_Garwig_Hammer_06_03");	//Z imieniem Innosa na ustach Rhobar rzuci� si� na potwora i zmia�d�y� go jednym pot�nym ciosem m�ota.
};


instance DIA_Garwig_Shield(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 98;
	condition = DIA_Garwig_Shield_Condition;
	information = DIA_Garwig_Shield_Info;
	permanent = FALSE;
	description = "Opowiedz mi o tej Tarczy.";
};


func int DIA_Garwig_Shield_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garwig_Room))
	{
		return TRUE;
	};
};

func void DIA_Garwig_Shield_Info()
{
	AI_Output(other,self,"DIA_Garwig_Shield_15_00");	//Opowiedz mi o tej Tarczy.
	AI_Output(self,other,"DIA_Garwig_Shield_06_01");	//Tarcza Ognia zosta�a u�yta przez Dominique w czasie bitwy na Po�udniowych Wyspach.
	AI_Output(self,other,"DIA_Garwig_Shield_06_02");	//Nikt nie ma prawa korzysta� z jej mocy - dlatego przybili�my j� do �ciany.
};


instance DIA_Garwig_Auge(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 4;
	condition = DIA_Garwig_Auge_Condition;
	information = DIA_Garwig_Auge_Info;
	permanent = FALSE;
	description = "Czy znajduje si� tutaj tak�e Oko Innosa?";
};


func int DIA_Garwig_Auge_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garwig_Room) && (Kapitel <= 2))
	{
		return TRUE;
	};
};

func void DIA_Garwig_Auge_Info()
{
	AI_Output(other,self,"DIA_Garwig_Auge_15_00");	//Czy znajduje si� tutaj tak�e Oko Innosa?
	AI_Output(self,other,"DIA_Garwig_Auge_06_01");	//Oczywi�cie, �e nie. Co za dziwaczny pomys�. Nikt nie wie, gdzie si� znajduje naj�wi�tszy artefakt.
};


instance DIA_Garwig_SLEEP(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 23;
	condition = DIA_Garwig_SLEEP_Condition;
	information = DIA_Garwig_SLEEP_Info;
	permanent = TRUE;
	description = "Co tu porabiasz?";
};


func int DIA_Garwig_SLEEP_Condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_Garwig_SLEEP_Info()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_15_00");	//Czym si� tu zajmujesz?
	AI_Output(self,other,"DIA_Garwig_SLEEP_06_01");	//Jestem stra�nikiem �wi�tych artefakt�w.
	Info_ClearChoices(DIA_Garwig_SLEEP);
	Info_AddChoice(DIA_Garwig_SLEEP,Dialog_Back,DIA_Garwig_SLEEP_BACK);
	Info_AddChoice(DIA_Garwig_SLEEP,"Chcesz, �ebym na moment ci� zast�pi�?",DIA_Garwig_SLEEP_EXCHANGE);
	Info_AddChoice(DIA_Garwig_SLEEP,"Czemu te artefakty s� tak pilnie strze�one?",DIA_Garwig_SLEEP_THIEF);
	Info_AddChoice(DIA_Garwig_SLEEP,"Czy ty nigdy nie sypiasz?",DIA_Garwig_SLEEP_NEVER);
};

func void DIA_Garwig_SLEEP_BACK()
{
	Info_ClearChoices(DIA_Garwig_SLEEP);
};

func void DIA_Garwig_SLEEP_EXCHANGE()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_EXCHANGE_15_00");	//Chcesz, �ebym na moment ci� zast�pi�?
	AI_Output(self,other,"DIA_Garwig_SLEEP_EXCHANGE_06_01");	//Czy to jaka� pr�ba? Magowie ci� tu przys�ali, aby� wystawi� mnie na pr�b�, prawda? Och - wiedzia�em od pocz�tku!
	AI_Output(self,other,"DIA_Garwig_SLEEP_EXCHANGE_06_02");	//Ale ja si� nie ugn�. Powiedz swoim magom, �e stoj� tu na stra�y niewzruszony niczym kamienny pos�g, opieraj�c si� wszelkim pokusom, albowiem jestem godny tej zaszczytnej misji.
};

func void DIA_Garwig_SLEEP_THIEF()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_THIEF_15_00");	//Czemu te artefakty s� tak pilnie strze�one? Czy istnieje jakie� niebezpiecze�stwo, �e kto� chcia�by je ukra��?
	AI_Output(self,other,"DIA_Garwig_SLEEP_THIEF_06_01");	//Co za niezwyk�y pomys�. Czemu kto� mia�by je ukra��?
	AI_Output(self,other,"DIA_Garwig_SLEEP_THIEF_06_02");	//Tylko s�udzy Innosa maj� wst�p do klasztoru. Zapewniam ci�, �e �aden wyznawca nie odwa�y�by si� na takie �wi�tokradztwo.
};

func void DIA_Garwig_SLEEP_NEVER()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_NEVER_15_00");	//Nigdy nie �pisz?
	AI_Output(self,other,"DIA_Garwig_SLEEP_NEVER_06_01");	//Co za dziwne pytanie. Oczywi�cie, �e nigdy nie sypiam. Innos sprawia, �e nie potrzebuj� snu.
	AI_Output(self,other,"DIA_Garwig_SLEEP_NEVER_06_02");	//Jak inaczej m�g�bym pe�ni� moje �wi�te powo�anie stra�nika?
	Info_ClearChoices(DIA_Garwig_SLEEP);
	Info_AddChoice(DIA_Garwig_SLEEP,"Naprawd� NIGDY nie sypiasz?",DIA_Garwig_SLEEP_AGAIN);
};

func void DIA_Garwig_SLEEP_AGAIN()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_AGAIN_15_00");	//Naprawd� NIGDY nie sypiasz?
	AI_Output(self,other,"DIA_Garwig_SLEEP_AGAIN_06_01");	//Nie. Je�li stra�nik zapada w sen, oznacza to jego ca�kowit� pora�k�.
	AI_Output(self,other,"DIA_Garwig_SLEEP_AGAIN_06_02");	//Ale ja nie zawiod�, albowiem Innos zapewnia mi si�� i wytrwa�o��, abym m�g� wiecznie trwa� na posterunku.
};


instance DIA_Garwig_THIEF(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 2;
	condition = DIA_Garwig_THIEF_Condition;
	information = DIA_Garwig_THIEF_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Garwig_THIEF_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_HasItems(hero,Holy_Hammer_MIS) == 1))
	{
		return TRUE;
	};
};

func void DIA_Garwig_THIEF_Info()
{
	if(Hammer_Taken == TRUE)
	{
		AI_Output(self,other,"DIA_Garwig_THIEF_06_00");	//Z�odzieju! Zniewa�y�e� nie tylko mnie i siebie, lecz r�wnie� ca�y ten klasztor!
		AI_Output(self,other,"DIA_Garwig_THIEF_06_01");	//Odpokutujesz za to �wi�tokradztwo. Ale przede wszystkim - ODDAJ MI TEN M�OT!!!
	}
	else
	{
		AI_Output(self,other,"DIA_Garwig_THIEF_06_02");	//M�ot znikn�� - jak to si� mog�o sta�?
		AI_Output(self,other,"DIA_Garwig_THIEF_06_03");	//Zawiod�em, i kara Innosa mnie nie ominie!
	};
};


instance DIA_Garwig_Abgeben(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 2;
	condition = DIA_Garwig_Abgeben_Condition;
	information = DIA_Garwig_Abgeben_Info;
	permanent = TRUE;
	description = "Przyszed�em odda� ci tw�j M�ot.";
};


func int DIA_Garwig_Abgeben_Condition()
{
	if(Npc_HasItems(other,Holy_Hammer_MIS) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Garwig_Abgeben_Info()
{
	AI_Output(other,self,"DIA_Garwig_Abgeben_15_00");	//Przyszed�em odda� ci tw�j M�ot.
	if(Hammer_Taken == TRUE)
	{
		AI_Output(self,other,"DIA_Garwig_Abgeben_06_01");	//Ty wstr�tny z�odzieju!
	}
	else
	{
		AI_Output(self,other,"DIA_Garwig_Abgeben_06_02");	//A wi�c to ty mnie okrad�e�...
	};
	AI_Output(self,other,"DIA_Garwig_Abgeben_06_03");	//Jednak nie mnie s�dzi� twoje czyny. Innos b�dzie twym s�dzi� i ze�le na ciebie sprawiedliw� kar�!
	B_GiveInvItems(other,self,Holy_Hammer_MIS,1);
	Hammer_Taken = FALSE;
};


instance DIA_Garwig_PICKPOCKET(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 900;
	condition = DIA_Garwig_PICKPOCKET_Condition;
	information = DIA_Garwig_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Garwig_PICKPOCKET_Condition()
{
	return C_Beklauen(52,80);
};

func void DIA_Garwig_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Garwig_PICKPOCKET);
	Info_AddChoice(DIA_Garwig_PICKPOCKET,Dialog_Back,DIA_Garwig_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Garwig_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Garwig_PICKPOCKET_DoIt);
};

func void DIA_Garwig_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Garwig_PICKPOCKET);
};

func void DIA_Garwig_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Garwig_PICKPOCKET);
};

