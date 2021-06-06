
instance DIA_Babo_Kap1_EXIT(C_Info)
{
	npc = NOV_612_Babo;
	nr = 999;
	condition = DIA_Babo_Kap1_EXIT_Condition;
	information = DIA_Babo_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Babo_Kap1_EXIT_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Babo_Hello(C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = DIA_Babo_Hello_Condition;
	information = DIA_Babo_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Babo_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_Hello_Info()
{
	AI_Output(self,other,"DIA_Babo_Hello_03_00");	//Ty te� tu jeste� nowy, prawda?
	AI_Output(other,self,"DIA_Babo_Hello_15_01");	//Tak. D�ugo tu jeste�?
	AI_Output(self,other,"DIA_Babo_Hello_03_02");	//Od czterech tygodni. Dosta�e� ju� kij do walki?
	AI_Output(other,self,"DIA_Babo_Hello_15_03");	//Jeszcze nie.
	AI_Output(self,other,"DIA_Babo_Hello_03_04");	//No to we� ten. Wszyscy nowicjusze nosz� takie kije jako znak, �e potrafimy si� broni�. Potrafisz walczy�?
	AI_Output(other,self,"DIA_Babo_Hello_15_05");	//No c�, mia�em ju� kiedy� w r�kach bro�...
	AI_Output(self,other,"DIA_Babo_Hello_03_06");	//Je�li chcesz, mog� ci� czego� nauczy�. Ale mam pro�b�...
	CreateInvItems(other,ItMw_1h_Nov_Mace,1);
	B_GiveInvItems(self,other,ItRw_Arrow,1);
	Npc_RemoveInvItems(other,ItRw_Arrow,1);
};


instance DIA_Babo_Anliegen(C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = DIA_Babo_Anliegen_Condition;
	information = DIA_Babo_Anliegen_Info;
	permanent = FALSE;
	description = "Co to za pro�ba?";
};


func int DIA_Babo_Anliegen_Condition()
{
	if((other.guild == GIL_NOV) && Npc_KnowsInfo(other,DIA_Babo_Hello))
	{
		return TRUE;
	};
};

func void DIA_Babo_Anliegen_Info()
{
	AI_Output(other,self,"DIA_Babo_Anliegen_15_00");	//Co to za pro�ba?
	AI_Output(self,other,"DIA_Babo_Anliegen_03_01");	//No c�, jeden z paladyn�w, Sergio, jest w tej chwili w klasztorze.
	AI_Output(self,other,"DIA_Babo_Anliegen_03_02");	//Je�li nam�wisz go, �eby ze mn� troch� po�wiczy�, to ci� wyszkol�.
	AI_Output(other,self,"DIA_Babo_Anliegen_15_03");	//Zobacz�, co da si� zrobi�.
	Log_CreateTopic(Topic_BaboTrain,LOG_MISSION);
	Log_SetTopicStatus(Topic_BaboTrain,LOG_Running);
	B_LogEntry(Topic_BaboTrain,"Je�li przekonam paladyna Sergia, aby po�wiczy� z Babo, ten ostatni nauczy mnie walczy� or�em dwur�cznym.");
};


instance DIA_Babo_Sergio(C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = DIA_Babo_Sergio_Condition;
	information = DIA_Babo_Sergio_Info;
	permanent = FALSE;
	description = "Rozmawia�em z Sergiem.";
};


func int DIA_Babo_Sergio_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sergio_Babo) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_Sergio_Info()
{
	AI_Output(other,self,"DIA_Babo_Sergio_15_00");	//Rozmawia�em z Sergiem. Codziennie rano b�dzie z tob� trenowa� przez dwie godziny, od pi�tej.
	AI_Output(self,other,"DIA_Babo_Sergio_03_01");	//Dzi�kuj�! To dla mnie zaszczyt!
	AI_Output(self,other,"DIA_Babo_Sergio_03_02");	//Je�li chcesz, wyja�ni� ci te� tajniki walki.
	Babo_TeachPlayer = TRUE;
	Babo_Training = TRUE;
	B_GivePlayerXP(XP_Ambient * 2);
	Log_CreateTopic(Topic_KlosterTeacher,LOG_NOTE);
	B_LogEntry(Topic_KlosterTeacher,"Babo mo�e mnie nauczy� walki or�em dwur�cznym.");
};


instance DIA_Babo_Teach(C_Info)
{
	npc = NOV_612_Babo;
	nr = 100;
	condition = DIA_Babo_Teach_Condition;
	information = DIA_Babo_Teach_Info;
	permanent = TRUE;
	description = "Jestem got�w do treningu.";
};


var int DIA_Babo_Teach_permanent;
var int Babo_Labercount;

func int DIA_Babo_Teach_Condition()
{
	if(((Babo_TeachPlayer == TRUE) && (DIA_Babo_Teach_permanent == FALSE)) || (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int babo_merk2h;

func void DIA_Babo_Teach_Info()
{
	babo_merk2h = other.HitChance[NPC_TALENT_2H];
	AI_Output(other,self,"DIA_Babo_Teach_15_00");	//Jestem got�w do treningu.
	Info_ClearChoices(DIA_Babo_Teach);
	Info_AddChoice(DIA_Babo_Teach,Dialog_Back,DIA_Babo_Teach_Back);
	Info_AddChoice(DIA_Babo_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H)),DIA_Babo_Teach_2H_1);
	Info_AddChoice(DIA_Babo_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H) * 5),DIA_Babo_Teach_2H_5);
};

func void DIA_Babo_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_2H] >= 35)
	{
		AI_Output(self,other,"DIA_DIA_Babo_Teach_Back_03_00");	//Przekaza�em ci ju� ca�� swoj� wiedz� o walce or�em obur�cznym.
		DIA_Babo_Teach_permanent = TRUE;
	};
	Info_ClearChoices(DIA_Babo_Teach);
};

func void DIA_Babo_Teach_2H_1()
{
	if(Kapitel >= 3)
	{
		B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,35);
	}
	else
	{
		B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,20);
	};
	if(other.HitChance[NPC_TALENT_2H] > babo_merk2h)
	{
		if(Babo_Labercount == 0)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_00");	//Walcz za Innosa. Innos jest naszym �yciem, a wiara - najpot�niejszym or�em.
		};
		if(Babo_Labercount == 1)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_01");	//S�uga Innosa nigdy nie prowokuje swojego przeciwnika - zawsze dzia�a z zaskoczenia!
		};
		if(Babo_Labercount == 2)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_02");	//Wsz�dzie, gdzie si� udasz, miej ze sob� sw�j kostur.
		};
		if(Babo_Labercount == 3)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_03");	//S�uga Innosa zawsze jest got�w do walki. Je�li nie posiadasz mocy magicznej, twoj� podstawow� broni� jest kostur.
		};
		Babo_Labercount = Babo_Labercount + 1;
		if(Babo_Labercount >= 3)
		{
			Babo_Labercount = 0;
		};
	};
	Info_ClearChoices(DIA_Babo_Teach);
	Info_AddChoice(DIA_Babo_Teach,Dialog_Back,DIA_Babo_Teach_Back);
	Info_AddChoice(DIA_Babo_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H)),DIA_Babo_Teach_2H_1);
	Info_AddChoice(DIA_Babo_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H) * 5),DIA_Babo_Teach_2H_5);
};

func void DIA_Babo_Teach_2H_5()
{
	if(Kapitel >= 3)
	{
		B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,35);
	}
	else
	{
		B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,20);
	};
	if(other.HitChance[NPC_TALENT_2H] > babo_merk2h)
	{
		if(Babo_Labercount == 0)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_00");	//Broni� s�ugi Innosa jest nie tylko jego kostur, lecz r�wnie� waleczne serce.
		};
		if(Babo_Labercount == 1)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_01");	//Musisz wiedzie�, kiedy mo�esz si� wycofa�.
		};
		if(Babo_Labercount == 2)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_02");	//Pami�taj, dobra walka to taka, w kt�rej to ty kontrolujesz swojego przeciwnika, nie daj�c mu najmniejszej szansy na przej�cie kontroli nad tob�.
		};
		if(Babo_Labercount == 3)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_03");	//Przegrywasz tylko wtedy, gdy si� poddasz.
		};
		Babo_Labercount = Babo_Labercount + 1;
		if(Babo_Labercount >= 3)
		{
			Babo_Labercount = 0;
		};
	};
	Info_ClearChoices(DIA_Babo_Teach);
	Info_AddChoice(DIA_Babo_Teach,Dialog_Back,DIA_Babo_Teach_Back);
	Info_AddChoice(DIA_Babo_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H)),DIA_Babo_Teach_2H_1);
	Info_AddChoice(DIA_Babo_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H) * 5),DIA_Babo_Teach_2H_5);
};


instance DIA_Babo_Wurst(C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = DIA_Babo_Wurst_Condition;
	information = DIA_Babo_Wurst_Info;
	permanent = FALSE;
	description = "Prosz�, we� kie�bas�.";
};


func int DIA_Babo_Wurst_Condition()
{
	if((Kapitel < 3) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Babo_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_Babo_Wurst_15_00");	//Prosz�, we� kie�bas�.
	AI_Output(self,other,"DIA_Babo_Wurst_03_01");	//Och, kie�basy z barana, wspaniale! S� najlepsze - no, daj mi jeszcze jedn�!
	AI_Output(other,self,"DIA_Babo_Wurst_15_02");	//Wtedy nie wystarczy dla pozosta�ych.
	AI_Output(self,other,"DIA_Babo_Wurst_03_03");	//I tak masz o jedn� za du�o. T�, kt�ra jest dla ciebie. A co znaczy jedna kie�baska dla przyjaciela?
	AI_Output(self,other,"DIA_Babo_Wurst_03_04");	//Daj spok�j. Dam ci za ni� zw�j z czarem 'Ognista strza�a'.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
	NovizeLeft = IntToString(13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft,PRINT_NovizenLeft);
	PrintS_Ext(NovizeText, White());
	Info_ClearChoices(DIA_Babo_Wurst);
	Info_AddChoice(DIA_Babo_Wurst,"Dobrze, we� jeszcze jedn�.",DIA_Babo_Wurst_JA);
	Info_AddChoice(DIA_Babo_Wurst,"Nie, nie zrobi� tego.",DIA_Babo_Wurst_NEIN);
};

func void DIA_Babo_Wurst_JA()
{
	AI_Output(other,self,"DIA_Babo_Wurst_JA_15_00");	//Dobrze, we� jeszcze jedn�.
	AI_Output(self,other,"DIA_Babo_Wurst_JA_03_01");	//Dobrze. Oto tw�j zw�j z czarem.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	B_GiveInvItems(self,other,ItSc_Firebolt,1);
	Info_ClearChoices(DIA_Babo_Wurst);
};

func void DIA_Babo_Wurst_NEIN()
{
	AI_Output(other,self,"DIA_Babo_Wurst_NEIN_15_00");	//Nie, nie zrobi� tego.
	AI_Output(self,other,"DIA_Babo_Wurst_NEIN_03_01");	//Cz�owieku, jeste� z tych, co to s� zawsze bardzo skrupulatni, no nie?
	Info_ClearChoices(DIA_Babo_Wurst);
};


instance DIA_Babo_YouAndAgon(C_Info)
{
	npc = NOV_612_Babo;
	nr = 3;
	condition = DIA_Babo_YouAndAgon_Condition;
	information = DIA_Babo_YouAndAgon_Info;
	permanent = FALSE;
	description = "Co zasz�o mi�dzy tob� i Agonem?";
};


func int DIA_Babo_YouAndAgon_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Opolos_Monastery) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_YouAndAgon_Info()
{
	AI_Output(other,self,"DIA_Babo_YouAndAgon_15_00");	//Co zasz�o mi�dzy tob� i Agonem?
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_01");	//Och, mieli�my odmienne pogl�dy na  temat ognistych pokrzyw.
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_02");	//Agon za bardzo je podlewa� i zgni�y im korzenie.
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_03");	//A kiedy tak si� sta�o, mnie za to obwini�.
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_04");	//Od tej pory ka�� mi przez ca�y dzie� zamiata� dziedziniec.
};


instance DIA_Babo_WhyDidAgon(C_Info)
{
	npc = NOV_612_Babo;
	nr = 4;
	condition = DIA_Babo_WhyDidAgon_Condition;
	information = DIA_Babo_WhyDidAgon_Info;
	permanent = FALSE;
	description = "Dlaczego Agon to zrobi�?";
};


func int DIA_Babo_WhyDidAgon_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Babo_YouAndAgon) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_WhyDidAgon_Info()
{
	AI_Output(other,self,"DIA_Babo_WhyDidAgon_15_00");	//Dlaczego Agon to zrobi�?
	AI_Output(self,other,"DIA_Babo_WhyDidAgon_03_01");	//Musisz go o to zapyta�. Wydaje mi si�, �e on po prostu nie znosi, kiedy kto� jest lepszy od niego.
};


instance DIA_Babo_PlantLore(C_Info)
{
	npc = NOV_612_Babo;
	nr = 5;
	condition = DIA_Babo_PlantLore_Condition;
	information = DIA_Babo_PlantLore_Info;
	permanent = FALSE;
	description = "Wygl�da na to, �e wiesz co nieco o ro�linach?";
};


func int DIA_Babo_PlantLore_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Babo_YouAndAgon) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_PlantLore_Info()
{
	AI_Output(other,self,"DIA_Babo_PlantLore_15_00");	//Wygl�da na to, �e wiesz co nieco o ro�linach?
	AI_Output(self,other,"DIA_Babo_PlantLore_03_01");	//Mieli�my ogr�d z zio�ami i tam nauczy�em si� paru sztuczek od mojego dziadka.
	AI_Output(self,other,"DIA_Babo_PlantLore_03_02");	//Naprawd� wola�bym znowu pracowa� w ogrodzie.
	MIS_HelpBabo = LOG_Running;
	Log_CreateTopic(Topic_BaboGaertner,LOG_MISSION);
	Log_SetTopicStatus(Topic_BaboGaertner,LOG_Running);
	B_LogEntry(Topic_BaboGaertner,"Babo wola�by pracowa� w ogrodzie, ni� zamiata� podw�rze.");
};


instance DIA_Babo_Fegen(C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = DIA_Babo_Fegen_Condition;
	information = DIA_Babo_Fegen_Info;
	permanent = FALSE;
	description = "Mam posprz�ta� komnaty nowicjuszy.";
};


func int DIA_Babo_Fegen_Condition()
{
	if(MIS_ParlanFegen == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Babo_Fegen_Info()
{
	AI_Output(other,self,"DIA_Babo_Fegen_15_00");	//Mam posprz�ta� komnaty nowicjuszy.
	AI_Output(self,other,"DIA_Babo_Fegen_03_01");	//Wzi��e� spory ci�ar na barki. Wiesz co - pomog� ci. Sam nigdy tego nie sko�czysz.
	AI_Output(self,other,"DIA_Babo_Fegen_03_02");	//Ale naprawd� potrzebuj� zwoju z czarem 'Pi�� wichru' - wiesz, mia�em szcz�cie i pozwolili mi przeczyta� o tym ksi��k�.
	AI_Output(self,other,"DIA_Babo_Fegen_03_03");	//No i teraz, oczywi�cie, chc� wypr�bowa� ten czar. Wi�c przynie� mi ten zw�j, a ch�tnie ci pomog�.
	B_LogEntry(Topic_ParlanFegen,"Babo pomo�e mi pozamiata� komnaty nowicjuszy, je�li przynios� mu zw�j Pi�ci wichru.");
};


instance DIA_Babo_Windfaust(C_Info)
{
	npc = NOV_612_Babo;
	nr = 3;
	condition = DIA_Babo_Windfaust_Condition;
	information = DIA_Babo_Windfaust_Info;
	permanent = TRUE;
	description = "Co do tego zwoju... (oddaj zw�j Pi�ci wichru)";
};


var int DIA_Babo_Windfaust_permanent;

func int DIA_Babo_Windfaust_Condition()
{
	if((MIS_ParlanFegen == LOG_Running) && Npc_KnowsInfo(other,DIA_Babo_Fegen) && (DIA_Babo_Windfaust_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Babo_Windfaust_Info()
{
	AI_Output(other,self,"DIA_Babo_Windfaust_15_00");	//Co do tego zwoju z zakl�ciem...
	AI_Output(self,other,"DIA_Babo_Windfaust_03_01");	//Czy masz dla mnie zakl�cie 'Pi�� wichru'?
	if(B_GiveInvItems(other,self,ItSc_Windfist,1))
	{
		AI_Output(other,self,"DIA_Babo_Windfaust_15_02");	//Tu jest zw�j, o kt�ry ci chodzi�o.
		AI_Output(self,other,"DIA_Babo_Windfaust_03_03");	//To dobrze. A wi�c pomog� ci posprz�ta� komnaty.
		NOV_Helfer = NOV_Helfer + 1;
		DIA_Babo_Windfaust_permanent = TRUE;
		B_GivePlayerXP(XP_Feger);
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FEGEN");
		B_LogEntry(Topic_ParlanFegen,"Babo pomo�e mi pozamiata� komnaty nowicjuszy.");
	}
	else
	{
		AI_Output(other,self,"DIA_Babo_Windfaust_15_04");	//Nie, jeszcze nie.
		AI_Output(self,other,"DIA_Babo_Windfaust_03_05");	//A wi�c poczekam, a� je zdob�dziesz.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Babo_Life(C_Info)
{
	npc = NOV_612_Babo;
	nr = 10;
	condition = DIA_Babo_Life_Condition;
	information = DIA_Babo_Life_Info;
	permanent = TRUE;
	description = "Jak tu si� �yje, w klasztorze?";
};


func int DIA_Babo_Life_Condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_Babo_Life_Info()
{
	AI_Output(other,self,"DIA_Babo_Life_15_00");	//Jak tu si� �yje, w klasztorze?
	AI_Output(self,other,"DIA_Babo_Life_03_01");	//Nie chc� narzeka�, ale nie s�dzi�em, �e obowi�zuje tutaj taki rygor. Je�li nie trzymasz si� �ci�le zasad, spotyka ci� kara.
	AI_Output(self,other,"DIA_Babo_Life_03_02");	//Oczywi�cie, wielu nowicjuszy chce studiowa� nauki Innosa w bibliotece. Pragn� by� gotowi, kiedy zostan� wybrani.
	AI_Output(self,other,"DIA_Babo_Life_03_03");	//Ale ja my�l�, �e najlepszym przygotowaniem do Pr�by Magii jest wykonywanie w�asnych zada�.
	if(Npc_KnowsInfo(other,DIA_Igaranz_Choosen) == FALSE)
	{
		AI_Output(other,self,"DIA_Babo_Life_15_04");	//O co chodzi z tym Wybranym i Pr�b�?
		AI_Output(self,other,"DIA_Babo_Life_03_05");	//Porozmawiaj z bratem Igarazem. On wie du�o na ten temat.
	};
};


instance DIA_Babo_HowIsIt(C_Info)
{
	npc = NOV_612_Babo;
	nr = 1;
	condition = DIA_Babo_HowIsIt_Condition;
	information = DIA_Babo_HowIsIt_Info;
	permanent = TRUE;
	description = "Jak si� masz?";
};


func int DIA_Babo_HowIsIt_Condition()
{
	if((hero.guild == GIL_KDF) && (Kapitel < 3))
	{
		return TRUE;
	};
};


var int Babo_XPgiven;

func void DIA_Babo_HowIsIt_Info()
{
	AI_Output(other,self,"DIA_Babo_HowIsIt_15_00");	//Jak si� masz?
	if(MIS_HelpBabo == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_01");	//Dzi�kuj� magom za moje zadanie.
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_02");	//Cieszy mnie praca w ogrodzie i mam nadziej�, �e magowie s� ze mnie zadowoleni, Panie.
		if(Babo_XPgiven == FALSE)
		{
			B_GivePlayerXP(XP_Ambient);
			Babo_XPgiven = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_03");	//D... d... dobrze, Panie.
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_04");	//Pracuj� ci�ko i staram si� nie zawie�� mag�w.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Babo_Kap2_EXIT(C_Info)
{
	npc = NOV_612_Babo;
	nr = 999;
	condition = DIA_Babo_Kap2_EXIT_Condition;
	information = DIA_Babo_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Babo_Kap2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Babo_Kap3_EXIT(C_Info)
{
	npc = NOV_612_Babo;
	nr = 999;
	condition = DIA_Babo_Kap3_EXIT_Condition;
	information = DIA_Babo_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Babo_Kap3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Babo_Kap3_Hello(C_Info)
{
	npc = NOV_612_Babo;
	nr = 31;
	condition = DIA_Babo_Kap3_Hello_Condition;
	information = DIA_Babo_Kap3_Hello_Info;
	permanent = FALSE;
	description = "Co tu porabiasz?";
};


func int DIA_Babo_Kap3_Hello_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_Hello_Info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Hello_15_00");	//Co tu robisz?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Hello_03_01");	//Staram si� wykona� moje zadania dla dobra klasztoru.
	}
	else
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Hello_03_02");	//Nie wolno mi z tob� rozmawia�. Naszym prze�o�onym nie podoba si�, kiedy kontaktujemy si� z obcymi.
	};
};


instance DIA_Babo_Kap3_KeepTheFaith(C_Info)
{
	npc = NOV_612_Babo;
	nr = 31;
	condition = DIA_Babo_Kap3_KeepTheFaith_Condition;
	information = DIA_Babo_Kap3_KeepTheFaith_Info;
	permanent = FALSE;
	description = "Nie wolno ci traci� wiary.";
};


func int DIA_Babo_Kap3_KeepTheFaith_Condition()
{
	if((Kapitel >= 3) && Npc_KnowsInfo(other,DIA_Babo_Kap3_Hello) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_KeepTheFaith_Info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_KeepTheFaith_15_00");	//Nie wolno ci traci� wiary.
	AI_Output(self,other,"DIA_Babo_Kap3_KeepTheFaith_03_01");	//Nie... To znaczy, nigdy bym czego� takiego nie zrobi�. Naprawd�!
	AI_Output(other,self,"DIA_Babo_Kap3_KeepTheFaith_15_02");	//Ka�dy z nas wystawiany jest na ci�kie pr�by.
	AI_Output(self,other,"DIA_Babo_Kap3_KeepTheFaith_03_03");	//Tak, Panie. B�d� o tym pami�ta�. Dzi�kuj� ci.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Babo_Kap3_Unhappy(C_Info)
{
	npc = NOV_612_Babo;
	nr = 31;
	condition = DIA_Babo_Kap3_Unhappy_Condition;
	information = DIA_Babo_Kap3_Unhappy_Info;
	permanent = FALSE;
	description = "To nie brzmia�o, jakby� by� zadowolony.";
};


func int DIA_Babo_Kap3_Unhappy_Condition()
{
	if((Kapitel >= 3) && (hero.guild != GIL_KDF) && Npc_KnowsInfo(other,DIA_Babo_Kap3_Hello))
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_Unhappy_Info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_15_00");	//To nie brzmia�o, jakby� by� zadowolony.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_03_01");	//No c�... To znaczy, wszystko w porz�dku, naprawd�.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_03_02");	//Tylko... Och, nie chc� narzeka�.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"Wi�c przesta� j�cze�.",DIA_Babo_Kap3_Unhappy_Lament);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"No dalej, mnie mo�esz powiedzie�.",DIA_Babo_Kap3_Unhappy_TellMe);
};

func void DIA_Babo_Kap3_Unhappy_Lament()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Lament_15_00");	//Wi�c przesta� j�cze�.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Lament_03_01");	//Tylko... prosz�... nie m�w magom.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Lament_03_02");	//Nie chc�, �eby mnie znowu ukarali.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Lament_15_03");	//Zastanowi� si�.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
};

func void DIA_Babo_Kap3_Unhappy_TellMe()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_00");	//No dalej, mnie mo�esz powiedzie�.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_01");	//I naprawd� nie dasz zna� magom?
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_02");	//Czy wygl�dam na takiego, kt�ry by to zrobi�?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_03");	//W porz�dku. Mam problem z jednym z nowicjuszy. Ma mnie w gar�ci.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_04");	//No dalej, wykrztu� to z siebie.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_05");	//Igaraz, tak si� nazywa, znalaz� moje prywatne dokumenty.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_06");	//Zagrozi�, �e da je magom, je�li nie b�d� robi�, co mi ka�e.
	MIS_BabosDocs = LOG_Running;
	Log_CreateTopic(Topic_BabosDocs,LOG_MISSION);
	Log_SetTopicStatus(Topic_BabosDocs,LOG_Running);
	B_LogEntry(Topic_BabosDocs,"Igaraz szanta�uje nowicjusza Babo jakimi� dokumentami.");
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"S�dz�, �e to zbyt osobista sprawa.",DIA_Babo_Kap3_Unhappy_Privat);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"Co masz dla niego zrobi�?",DIA_Babo_Kap3_Unhappy_ShouldDo);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"Co to za dokumenty?",DIA_Babo_Kap3_Unhappy_Documents);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"Mog� ci jako� pom�c?",DIA_Babo_Kap3_Unhappy_CanHelpYou);
};

func void DIA_Babo_Kap3_Unhappy_Privat()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Privat_15_00");	//S�dz�, �e to zbyt osobista sprawa.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Privat_03_01");	//Rozumiem, nie chcesz mie� k�opot�w. Wi�c b�d� musia� si� tym sam zaj��.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Privat_15_02");	//Jako� sobie poradzisz.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
};

func void DIA_Babo_Kap3_Unhappy_ShouldDo()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_ShouldDo_15_00");	//Co masz dla niego zrobi�?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_01");	//Nie lubi� o tym m�wi�. W ka�dym razie, nie spodoba�oby si� to Innosowi.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_02");	//Wol� nie my�le�, co by si� sta�o, gdyby to wysz�o na jaw.
};

func void DIA_Babo_Kap3_Unhappy_Documents()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_00");	//Co to za dokumenty?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Documents_03_01");	//To wy��cznie moja prywatna sprawa.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_02");	//No dalej, powiedz mi.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Documents_03_03");	//To s�, eee... ca�kiem zwyczajne dokumenty. Nic szczeg�lnego.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_04");	//Nie b�d� wi�cej pyta�.
};

func void DIA_Babo_Kap3_Unhappy_CanHelpYou()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_00");	//Mog� ci jako� pom�c?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_01");	//Zrobi�by� to?
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_02");	//To zale�y, oczywi�cie.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_03");	//Oczywi�cie, zap�ac� ci za to.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_04");	//Ile?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_05");	//Rzecz jasna, nie mam wiele pieni�dzy, ale mog� da� ci zw�j z czarem. Mam czar leczniczy.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"Wola�bym si� w to nie miesza�",DIA_Babo_Kap3_Unhappy_No);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"Zobacz�, co da si� zrobi�.",DIA_Babo_Kap3_Unhappy_Yes);
};

func void DIA_Babo_Kap3_Unhappy_No()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_No_15_00");	//Wola�bym si� w to nie miesza�
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_No_03_01");	//A wi�c nie mam wyboru, musz� ta�czy�, jak mi zagraj�.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
};

func void DIA_Babo_Kap3_Unhappy_Yes()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Yes_15_00");	//Zobacz�, co da si� zrobi�.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Yes_03_01");	//Naprawd�, to si� musi uda�. Musi!
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Yes_03_02");	//Musisz si� tylko dowiedzie�, gdzie Igaraz schowa� te rzeczy. Potem je zakosisz i wszystko b�dzie w porz�dku.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Yes_15_03");	//Spokojnie. Wr�� do swoich zaj��. Ja zajm� si� reszt�.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
};


instance DIA_Babo_Kap3_HaveYourDocs(C_Info)
{
	npc = NOV_612_Babo;
	nr = 31;
	condition = DIA_Babo_Kap3_HaveYourDocs_Condition;
	information = DIA_Babo_Kap3_HaveYourDocs_Info;
	permanent = FALSE;
	description = "Mam twoje dokumenty.";
};


func int DIA_Babo_Kap3_HaveYourDocs_Condition()
{
	if(((MIS_BabosDocs == LOG_Running) && (Npc_HasItems(other,ItWr_BabosDocs_MIS) >= 1)) || ((Npc_HasItems(other,ItWr_BabosPinUp_MIS) >= 1) && (Npc_HasItems(other,ItWr_BabosLetter_MIS) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_HaveYourDocs_Info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_15_00");	//Mam twoje dokumenty.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_03_01");	//Naprawd�? Dzi�ki, uratowa�e� mnie. Nie wiem, jak ci dzi�kowa�.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_15_02");	//Tak, tak, uspok�j si�.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_03_03");	//To na pewno moje? Jeste� pewien? Poka�.
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Zamierzam je na razie zatrzyma�.",DIA_Babo_Kap3_HaveYourDocs_KeepThem);
	if(BabosDocsOpen == TRUE)
	{
		Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Pewne okoliczno�ci spowodowa�y, �e cena posz�a w g�r�.",DIA_Babo_Kap3_HaveYourDocs_IWantMore);
	};
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Trzymaj.",DIA_Babo_Kap3_HaveYourDocs_HereTheyAre);
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_15_00");	//Zamierzam je na razie zatrzyma�.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_03_01");	//Co?! Co to ma znaczy�?! Co zamierzasz?
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Tylko �artowa�em.",DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"To ju� moje zmartwienie.",DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern);
	if(Igaraz_ISPartner == LOG_SUCCESS)
	{
		Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Igaraz to m�j wsp�lnik.",DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner);
	};
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_00");	//Tylko �artowa�em.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_01");	//Ha, ha, jako� mnie to nie �mieszy. A wi�c gdzie one s�?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_02");	//Tutaj.
	if(Npc_HasItems(other,ItWr_BabosDocs_MIS) >= 1)
	{
		B_GiveInvItems(other,self,ItWr_BabosDocs_MIS,1);
	}
	else
	{
		B_GiveInvItems(other,self,ItWr_BabosPinUp_MIS,1);
		B_GiveInvItems(other,self,ItWr_BabosLetter_MIS,1);
	};
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_03");	//Nie chcia�em ci� obrazi�, ale ca�a ta sytuacja troch� mnie niepokoi.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_04");	//W porz�dku. Mi�ej zabawy z tymi DOKUMENTAMI.
	MIS_BabosDocs = LOG_SUCCESS;
	B_GivePlayerXP(XP_BabosDocs);
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_00");	//To moja sprawa.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_03_01");	//Te dokumenty s� moje. Nie masz prawa ich zatrzymywa�.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_02");	//Na razie.
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_00");	//Igaraz jest teraz moim wsp�lnikiem.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_03_01");	//Co?! Nie mo�esz tego zrobi�.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_02");	//Wygl�da na to, �e mog�. Zatrzymam te papiery i nic si� nie zmieni.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_03");	//Kwestie finansowe za�atwi� z Igarazem.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_04");	//No c�, zatem dbaj dobrze o ro�liny.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_03_05");	//Jeste� �wini�. N�dzn�, chciw� �wini�. Innos ci� uka�e.
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,Dialog_Ende,DIA_Babo_Kap3_HaveYourDocs_End);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Uwa�aj na to, co m�wisz.",DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Nie masz co robi�?",DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_NothingToDo);
};

func void DIA_Babo_Kap3_HaveYourDocs_End()
{
	AI_StopProcessInfos(self);
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_15_00");	//Uwa�aj na to, co m�wisz.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_03_01");	//Jestem jak zwykle zbyt uprzejmy.
	AI_StopProcessInfos(self);
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_NothingToDo()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_NothingToDo_15_00");	//Nie masz co robi�?
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_NothingToDo_03_01");	//Dobrze to rozumiem, ale uwierz mi, to b�dzie mia�o pewne konsekwencje.
	AI_StopProcessInfos(self);
};

func void DIA_Babo_Kap3_HaveYourDocs_IWantMore()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_00");	//Pewne okoliczno�ci spowodowa�y, �e cena posz�a w g�r�.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_01");	//Nie jeste� lepszy od pozosta�ych. Czego chcesz?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_02");	//Co masz?
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_03");	//Mog� ci da� 121 sztuk z�ota. To wszystko, co mam.
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"To nie wystarczy.",DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Zgoda.",DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough);
};

func void DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_15_00");	//To nie wystarczy.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_03_01");	//Ale ja ju� nie mam pieni�dzy. Gdybym przypuszcza�, �e tak si� stanie, nigdy nie wszed�bym do tego klasztoru.
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};

func void DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_15_00");	//Zgoda.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_03_01");	//Tu masz pieni�dze i zw�j z czarem.
	CreateInvItems(self,ItSc_MediumHeal,1);
	CreateInvItems(self,ItMi_Gold,121);
	B_GiveInvItems(self,other,ItSc_MediumHeal,1);
	B_GiveInvItems(self,other,ItMi_Gold,121);
	MIS_BabosDocs = LOG_SUCCESS;
	B_GivePlayerXP(XP_BabosDocs);
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};

func void DIA_Babo_Kap3_HaveYourDocs_HereTheyAre()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_00");	//Trzymaj.
	if(Npc_HasItems(other,ItWr_BabosDocs_MIS) >= 1)
	{
		B_GiveInvItems(other,self,ItWr_BabosDocs_MIS,1);
	}
	else
	{
		B_GiveInvItems(other,self,ItWr_BabosPinUp_MIS,1);
		B_GiveInvItems(other,self,ItWr_BabosLetter_MIS,1);
	};
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_01");	//Tak, s� w komplecie.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_02");	//Zagl�da�e� do nich?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_03");	//A czy to jaka� r�nica?
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_04");	//Nie, pod warunkiem, �e dostan� je z powrotem.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_05");	//Mam nadziej�, �e teraz b�d� m�g� odpocz�� w spokoju.
	CreateInvItems(self,ItSc_MediumHeal,1);
	B_GiveInvItems(self,other,ItSc_MediumHeal,1);
	MIS_BabosDocs = LOG_SUCCESS;
	B_GivePlayerXP(XP_BabosDocs);
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};


instance DIA_Babo_Kap3_Perm(C_Info)
{
	npc = NOV_612_Babo;
	nr = 39;
	condition = DIA_Babo_Kap3_Perm_Condition;
	information = DIA_Babo_Kap3_Perm_Info;
	permanent = TRUE;
	description = "Czy jeste� zadowolony ze swojego zadania?";
};


func int DIA_Babo_Kap3_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Babo_Kap3_Hello))
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_Perm_Info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Perm_15_00");	//Czy jeste� zadowolony ze swojego zadania?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_01");	//Tak, oczywi�cie. Wiara w m�dro�� i pot�g� Innosa daje mi si��.
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_02");	//Nie chc� okaza� braku szacunku, ale mam dzi� du�o do zrobienia.
		AI_Output(other,self,"DIA_Babo_Kap3_Perm_15_03");	//Mo�esz kontynuowa�.
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_04");	//Dzi�kuj�.
	}
	else
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_05");	//Jako� idzie, ale musz� wraca� do pracy, bo w przeciwnym razie dzisiaj jej nie sko�cz�.
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_06");	//Nie chc� znowu pracowa� przez p� nocy, �eby wype�ni� moje obowi�zki i unikn�� k�opot�w.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Babo_Kap4_EXIT(C_Info)
{
	npc = NOV_612_Babo;
	nr = 999;
	condition = DIA_Babo_Kap4_EXIT_Condition;
	information = DIA_Babo_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Babo_Kap4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Babo_Kap5_EXIT(C_Info)
{
	npc = NOV_612_Babo;
	nr = 999;
	condition = DIA_Babo_Kap5_EXIT_Condition;
	information = DIA_Babo_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Babo_Kap5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Babo_PICKPOCKET(C_Info)
{
	npc = NOV_612_Babo;
	nr = 900;
	condition = DIA_Babo_PICKPOCKET_Condition;
	information = DIA_Babo_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Babo_PICKPOCKET_Condition()
{
	return C_Beklauen(17,25);
};

func void DIA_Babo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Babo_PICKPOCKET);
	Info_AddChoice(DIA_Babo_PICKPOCKET,Dialog_Back,DIA_Babo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Babo_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Babo_PICKPOCKET_DoIt);
};

func void DIA_Babo_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Babo_PICKPOCKET);
};

func void DIA_Babo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Babo_PICKPOCKET);
};

