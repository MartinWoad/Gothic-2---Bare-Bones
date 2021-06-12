
instance DIA_Dyrian_EXIT(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 999;
	condition = DIA_Dyrian_EXIT_Condition;
	information = DIA_Dyrian_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dyrian_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Dyrian_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dyrian_Hello(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 2;
	condition = DIA_Dyrian_Hello_Condition;
	information = DIA_Dyrian_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dyrian_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Hello_Info()
{
	AI_Output(self,other,"DIA_Dyrian_Hello_13_00");	//Czego chcesz?
};


instance DIA_Dyrian_Wurst(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_Wurst_Condition;
	information = DIA_Dyrian_Wurst_Info;
	permanent = FALSE;
	description = "Jestem zaj�ty roznoszeniem kie�bas.";
};


func int DIA_Dyrian_Wurst_Condition()
{
	if((Kapitel < 3) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_Dyrian_Wurst_15_00");	//Jestem zaj�ty roznoszeniem kie�bas.
	AI_Output(self,other,"DIA_Dyrian_Wurst_13_01");	//Dzi�kuj�. Mam nadziej�, �e to nie jest ostatnia kie�basa, jak� przyjdzie mi tutaj zje��.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
	NovizeLeft = IntToString(13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft,PRINT_NovizenLeft);
	PrintS_Ext(NovizeText, White());
};


instance DIA_Dyrian_Job(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 1;
	condition = DIA_Dyrian_Job_Condition;
	information = DIA_Dyrian_Job_Info;
	permanent = FALSE;
	description = "Co tu porabiasz?";
};


func int DIA_Dyrian_Job_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Dyrian_Hello) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Job_Info()
{
	AI_Output(other,self,"DIA_Dyrian_Job_15_00");	//Co tu robisz?
	AI_Output(self,other,"DIA_Dyrian_Job_13_01");	//Pope�ni�em wykroczenie przeciw spo�eczno�ci.
	AI_Output(self,other,"DIA_Dyrian_Job_13_02");	//Teraz oczekuj�, a� Najwy�sza Rada zdecyduje, czy b�d� m�g� pozosta� w klasztorze.
};


instance DIA_Dyrian_WhatDone(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_WhatDone_Condition;
	information = DIA_Dyrian_WhatDone_Info;
	permanent = FALSE;
	description = "Opowiedz mi, co zasz�o.";
};


func int DIA_Dyrian_WhatDone_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dyrian_Job) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_WhatDone_Info()
{
	AI_Output(other,self,"DIA_Dyrian_WhatDone_15_00");	//Opowiedz mi, co zasz�o.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_01");	//Podczas zamiatania zabra�em z pokoju jednego z mag�w ksi��k�, aby j� p�niej przeczyta�.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_02");	//Mistrz Hyglas oczywi�cie od razu to zauwa�y� i poprosi� mnie o jej zwrot.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_03");	//Poniewa� obawia�em si� kary, powiedzia�em mu, �e jej nie mam, ale jeszcze tego samego dnia Mistrz przy�apa� mnie z ksi�g� w mojej komnacie.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_04");	//Bardzo si� zdenerwowa� i powiadomi� Najwy�sz� Rad�. Teraz obraduj� nad tym, czy pozwoli� mi tu zosta�.
};


instance DIA_Dyrian_CanHelp(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 4;
	condition = DIA_Dyrian_CanHelp_Condition;
	information = DIA_Dyrian_CanHelp_Info;
	permanent = TRUE;
	description = "Czy mog� ci jako� pom�c?";
};


func int DIA_Dyrian_CanHelp_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Dyrian_Job) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_CanHelp_Info()
{
	AI_Output(other,self,"DIA_Dyrian_CanHelp_15_00");	//Czy mog� ci jako� pom�c?
	AI_Output(self,other,"DIA_Dyrian_CanHelp_13_01");	//Nie, m�j los zale�y jedynie od �aski Innosa i mag�w.
};


instance DIA_Dyrian_Scroll(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 1;
	condition = DIA_Dyrian_Scroll_Condition;
	information = DIA_Dyrian_Scroll_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dyrian_Scroll_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) || (MIS_RUNE == LOG_Running) || (MIS_GOLEM == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Scroll_Info()
{
	AI_Output(self,other,"DIA_Dyrian_Scroll_13_00");	//Hej, czy to prawda, �e za��da�e� Pr�by Ognia?
	AI_Output(other,self,"DIA_Dyrian_Scroll_15_01");	//Tak. I zamierzam j� przej��.
	AI_Output(self,other,"DIA_Dyrian_Scroll_13_02");	//Dobrze. Mo�e b�d� w stanie ci pom�c. Mam tu bardzo przydatny zw�j magiczny. Zw�j SNU. Zainteresowany?
	Info_ClearChoices(DIA_Dyrian_Scroll);
	Info_AddChoice(DIA_Dyrian_Scroll,"Nie, nie potrzebuj� twojej pomocy.",DIA_Dyrian_Scroll_No);
	Info_AddChoice(DIA_Dyrian_Scroll,"Czego ��dasz?",DIA_Dyrian_Scroll_How);
	Info_AddChoice(DIA_Dyrian_Scroll,"Co mog� z tym zrobi�?",DIA_Dyrian_Scroll_What);
};

func void DIA_Dyrian_Scroll_What()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_What_15_00");	//Co mog� z tym zrobi�?
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_01");	//Przy pomocy tego zakl�cia b�dziesz m�g� u�pi� na kr�tki czas ka�dego, kto posiada wol� s�absz� od twojej.
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_02");	//To mo�e okaza� si� niezwykle przydatne, je�li kto� stanie ci na drodze...
	AI_Output(other,self,"DIA_Dyrian_Scroll_What_15_03");	//A sk�d b�d� wiedzia�, czy kto� ma wol� s�absz� od mojej?
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_04");	//Mo�esz sobie darowa� pr�by u�pienia mag�w. Ale na wi�kszo�� nowicjuszy powinno podzia�a�.
};

func void DIA_Dyrian_Scroll_No()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_No_15_00");	//Nie, nie potrzebuj� twojej pomocy.
	AI_Output(self,other,"DIA_Dyrian_Scroll_No_13_01");	//Je�li zmienisz zdanie, mo�esz w ka�dej chwili wr�ci�.
	Info_ClearChoices(DIA_Dyrian_Scroll);
};

func void DIA_Dyrian_Scroll_How()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_How_15_00");	//Co za to chcesz?
	AI_Output(self,other,"DIA_Dyrian_Scroll_How_13_01");	//Ka�dy nowy mag ma prawo do jednego �yczenia.
	AI_Output(self,other,"DIA_Dyrian_Scroll_How_13_02");	//Je�li rzeczywi�cie uda ci si� przej�� Pr�b� Ognia, mo�esz sobie za�yczy�, aby pozwolono mi zosta� w klasztorze.
	Info_ClearChoices(DIA_Dyrian_Scroll);
	Info_AddChoice(DIA_Dyrian_Scroll,"Nie, nie potrzebuj� twojej pomocy.",DIA_Dyrian_Scroll_No);
	Info_AddChoice(DIA_Dyrian_Scroll,"Dobrze, daj mi ten zw�j.",DIA_Dyrian_Scroll_Yes);
};

func void DIA_Dyrian_Scroll_Yes()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_Yes_15_00");	//Dobrze, daj mi ten zw�j.
	AI_Output(self,other,"DIA_Dyrian_Scroll_Yes_13_01");	//Powodzenia w czasie pr�by. Niech ci� Innos prowadzi.
	B_GiveInvItems(self,other,ItSc_Sleep,1);
	MIS_HelpDyrian = LOG_Running;
	Log_CreateTopic(Topic_DyrianDrin,LOG_MISSION);
	Log_SetTopicStatus(Topic_DyrianDrin,LOG_Running);
	B_LogEntry(Topic_DyrianDrin,"Dyrian da� mi magiczny zw�j snu. Je�li zostan� magiem, mam si� odwdzi�czy�, zapewniaj�c mu miejsce w klasztorze.");
	Info_ClearChoices(DIA_Dyrian_Scroll);
};


instance DIA_Dyrian_Doch(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 4;
	condition = DIA_Dyrian_Doch_Condition;
	information = DIA_Dyrian_Doch_Info;
	permanent = TRUE;
	description = "Zmieni�em zdanie. Daj mi zakl�cie nasenne.";
};


func int DIA_Dyrian_Doch_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Dyrian_Scroll) && (MIS_HelpDyrian != LOG_Running) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Doch_Info()
{
	AI_Output(other,self,"DIA_Dyrian_Doch_15_00");	//Zmieni�em zdanie. Daj mi zakl�cie nasenne.
	AI_Output(self,other,"DIA_Dyrian_Doch_13_01");	//Dobrze, je�li przejdziesz pr�b�, b�dziesz m�g� dopilnowa�, aby pozwolono mi zosta� w klasztorze.
	B_GiveInvItems(self,other,ItSc_Sleep,1);
	MIS_HelpDyrian = LOG_Running;
};


instance DIA_Dyrian_HelloAgain(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 2;
	condition = DIA_Dyrian_HelloAgain_Condition;
	information = DIA_Dyrian_HelloAgain_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dyrian_HelloAgain_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (other.guild == GIL_KDF) && (MIS_HelpDyrian == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_HelloAgain_Info()
{
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_00");	//Dzi�kuj�, uratowa�e� mnie!
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_01");	//Och - wybacz, Mistrzu - nie chcia�em si� narzuca�.
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_02");	//Dzi�kuj� z ca�ego serca za umo�liwienie mi pozostania w klasztorze. Od dzi� moje �ycie si� zmieni...
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};

func void B_Dyrian_PlayerHowIsIt()
{
	AI_Output(other,self,"DIA_Dyrian_HowIsIt_15_00");	//Jak leci?
};


instance DIA_Dyrian_HowIsIt(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_HowIsIt_Condition;
	information = DIA_Dyrian_HowIsIt_Info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int DIA_Dyrian_HowIsIt_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dyrian_HelloAgain))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_HowIsIt_Info()
{
	B_Dyrian_PlayerHowIsIt();
	AI_Output(self,other,"DIA_Dyrian_HowIsIt_13_01");	//Dobrze. Naprawd� lubi� t� prac�, Mistrzu.
	AI_StopProcessInfos(self);
};


instance DIA_Dyrian_other(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_other_Condition;
	information = DIA_Dyrian_other_Info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int DIA_Dyrian_other_Condition()
{
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_other_Info()
{
	B_Dyrian_PlayerHowIsIt();
	AI_Output(self,other,"DIA_Dyrian_HowIsIt_13_02");	//Dzi�kuj� Innosowi, �e mog� przebywa� tutaj, w klasztorze.
	AI_StopProcessInfos(self);
};


instance DIA_Dyrian_Kneipe(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_Kneipe_Condition;
	information = DIA_Dyrian_Kneipe_Info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int DIA_Dyrian_Kneipe_Condition()
{
	if((MIS_HelpDyrian == LOG_FAILED) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Kneipe_Info()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_15_00");	//Jak leci?
	AI_Output(self,other,"DIA_Dyrian_Kneipe_13_01");	//�e te� w og�le o to pytasz... Pok�ada�em w tobie wszystkie moje nadzieje, a ty zostawi�e� mnie na lodzie.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_13_02");	//Nic mi ju� nie pozosta�o, opr�cz alkoholu. I to wszystko twoja wina!
	Info_ClearChoices(DIA_Dyrian_Kneipe);
	Info_AddChoice(DIA_Dyrian_Kneipe,"Prosz�, oto 5 sztuk z�ota dla ciebie.",DIA_Dyrian_Kneipe_Gold);
	Info_AddChoice(DIA_Dyrian_Kneipe,"Mog� wszystko wyja�ni�.",DIA_Dyrian_Kneipe_CanExplain);
	Info_AddChoice(DIA_Dyrian_Kneipe,"Uwa�aj, co m�wisz.",DIA_Dyrian_Kneipe_ShutUp);
};

func void DIA_Dyrian_Kneipe_Gold()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_Gold_15_00");	//Prosz�, oto 5 sztuk z�ota.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_Gold_13_01");	//5 sztuk z�ota? Dajesz mi 5 sztuk z�ota i uwa�asz, �e to wystarczaj�ca rekompensata za moje zmarnowane �ycie?
	AI_Output(self,other,"DIA_Dyrian_Kneipe_Gold_13_02");	//Zabior� ca�e twoje z�oto!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};

func void DIA_Dyrian_Kneipe_CanExplain()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_CanExplain_15_00");	//Mog� wszystko wyja�ni�.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_CanExplain_13_01");	//Oszcz�d� sobie naiwnych wym�wek.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_CanExplain_13_02");	//K�amiesz za ka�dym razem, kiedy tylko otwierasz usta. Zostaw mnie w spokoju.
	AI_StopProcessInfos(self);
};

func void DIA_Dyrian_Kneipe_ShutUp()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_ShutUp_15_00");	//Uwa�aj, co m�wisz.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_01");	//Bardzo prosz�, mo�esz mi grozi�. Nic ci to nie da.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_02");	//Powiem ca�emu �wiatu, jaki z ciebie bezduszny, zak�amany dra�! Tylko najpierw sko�cz� t� flaszk�...
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_03");	//Zejd� mi z oczu! Brzydz� si� tob�!
	AI_StopProcessInfos(self);
};


instance DIA_Dyrian_nachher(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_nachher_Condition;
	information = DIA_Dyrian_nachher_Info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int DIA_Dyrian_nachher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dyrian_Kneipe))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_nachher_Info()
{
	AI_Output(other,self,"DIA_Dyrian_nachher_15_00");	//Co tam?
	AI_Output(self,other,"DIA_Dyrian_nachher_13_01");	//Po prostu zostaw mnie w spokoju! Nie chc� mie� z tob� wi�cej nic wsp�lnego!
	AI_StopProcessInfos(self);
};


instance DIA_Dyrian_PICKPOCKET(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 900;
	condition = DIA_Dyrian_PICKPOCKET_Condition;
	information = DIA_Dyrian_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Dyrian_PICKPOCKET_Condition()
{
	return C_Beklauen(10,15);
};

func void DIA_Dyrian_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Dyrian_PICKPOCKET);
	Info_AddChoice(DIA_Dyrian_PICKPOCKET,Dialog_Back,DIA_Dyrian_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Dyrian_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Dyrian_PICKPOCKET_DoIt);
};

func void DIA_Dyrian_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Dyrian_PICKPOCKET);
};

func void DIA_Dyrian_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Dyrian_PICKPOCKET);
};

