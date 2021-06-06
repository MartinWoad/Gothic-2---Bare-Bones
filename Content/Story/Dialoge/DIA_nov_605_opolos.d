
instance DIA_Opolos_Kap1_EXIT(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 999;
	condition = DIA_Opolos_Kap1_EXIT_Condition;
	information = DIA_Opolos_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Opolos_Kap1_EXIT_Condition()
{
	if(Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Opolos_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_Hello(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 1;
	condition = DIA_Opolos_Hello_Condition;
	information = DIA_Opolos_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Opolos_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Opolos_Hello_Info()
{
	AI_Output(self,other,"DIA_Opolos_Hello_12_00");	//Witaj, a wi�c to ty jeste� ten nowy.
	AI_Output(self,other,"DIA_Opolos_Hello_12_01");	//Jestem Opolos. Zajmuj� si� owcami.
};


instance DIA_Opolos_Wurst(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 2;
	condition = DIA_Opolos_Wurst_Condition;
	information = DIA_Opolos_Wurst_Info;
	permanent = FALSE;
	description = "Mam tu kie�bas� z baraniny...";
};


func int DIA_Opolos_Wurst_Condition()
{
	if((Kapitel < 3) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Opolos_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_Opolos_Wurst_15_00");	//Mam tu kie�bas� z baraniny...
	AI_Output(self,other,"DIA_Opolos_Wurst_12_01");	//To fantastycznie. Uwielbiam kie�bas� z baraniny.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
	NovizeLeft = IntToString(13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft,PRINT_NovizenLeft);
	PrintS_Ext(NovizeText, White());
};


instance DIA_Opolos_HowLong(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 1;
	condition = DIA_Opolos_HowLong_Condition;
	information = DIA_Opolos_HowLong_Info;
	permanent = FALSE;
	description = "Od jak dawna jeste� w klasztorze?";
};


func int DIA_Opolos_HowLong_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Opolos_Hello))
	{
		return TRUE;
	};
};

func void DIA_Opolos_HowLong_Info()
{
	AI_Output(other,self,"DIA_Opolos_HowLong_15_00");	//Od jak dawna jeste� w klasztorze?
	AI_Output(self,other,"DIA_Opolos_HowLong_12_01");	//Mieszkam tu ju� trzy lata. Ale, cho� bardzo bym tego chcia�, nie zacz��em jeszcze nauki.
	AI_Output(other,self,"DIA_Opolos_HowLong_15_02");	//Dlaczego?
	AI_Output(self,other,"DIA_Opolos_HowLong_12_03");	//Zajmuj� si� pilnowaniem owiec, a nie studiowaniem manuskrypt�w.
	AI_Output(self,other,"DIA_Opolos_HowLong_12_04");	//Dop�ki Mistrz Parlan nie zwolni mnie z tych obowi�zk�w, nie mog� korzysta� z biblioteki.
	MIS_HelpOpolos = LOG_Running;
	Log_CreateTopic(Topic_OpolosStudy,LOG_MISSION);
	Log_SetTopicStatus(Topic_OpolosStudy,LOG_Running);
	B_LogEntry(Topic_OpolosStudy,"Opolos strze�e owiec. Bardzo chcia�by m�c studiowa� pisma w bibliotece.");
};


instance DIA_Opolos_Monastery(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 3;
	condition = DIA_Opolos_Monastery_Condition;
	information = DIA_Opolos_Monastery_Info;
	permanent = FALSE;
	description = "Jak mam si� zachowywa� w klasztorze?";
};


func int DIA_Opolos_Monastery_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Opolos_Hello) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Opolos_Monastery_Info()
{
	AI_Output(other,self,"DIA_Opolos_Monastery_15_00");	//Jak mam si� zachowywa� w klasztorze?
	AI_Output(self,other,"DIA_Opolos_Monastery_12_01");	//Nigdy nie ok�amuj mag�w. Nie knuj tak�e przeciwko braciom.
	AI_Output(self,other,"DIA_Opolos_Monastery_12_02");	//Zawsze szanuj w�asno�� zgromadzenia. Je�li z�amiesz kt�r�� z tych zasad, b�dziesz musia� zap�aci� grzywn� Mistrzowi Parlanowi.
	AI_Output(self,other,"DIA_Opolos_Monastery_12_03");	//Trzymaj si� te� z dala od Agona, inaczej sko�czysz jak Babo.
};


instance DIA_Opolos_beibringen(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 3;
	condition = DIA_Opolos_beibringen_Condition;
	information = DIA_Opolos_beibringen_Info;
	permanent = FALSE;
	description = "Czy m�g�by� mnie czego� nauczy�?";
};


func int DIA_Opolos_beibringen_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Opolos_Hello) && ((other.guild == GIL_NOV) || (other.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Opolos_beibringen_Info()
{
	AI_Output(other,self,"DIA_Opolos_beibringen_15_00");	//Czy m�g�by� mnie czego� nauczy�?
	AI_Output(self,other,"DIA_Opolos_beibringen_12_01");	//Jasne, zawsze by�em dobry w bitce. Mog� ci pokaza�, jak wzmocni� mi�nie ramion.
	AI_Output(self,other,"DIA_Opolos_beibringen_12_02");	//Chcia�bym si� jednak dowiedzie� czego� o miksturach, szczeg�lnie tych magicznych.
	AI_Output(other,self,"DIA_Opolos_beibringen_15_03");	//Jak m�g�bym ci w tym pom�c?
	AI_Output(self,other,"DIA_Opolos_beibringen_12_04");	//C�, m�g�by� 'po�yczy�' od Neorasa na chwil� kt�r�� z jego receptur.
	AI_Output(self,other,"DIA_Opolos_beibringen_12_05");	//Je�li mi j� przyniesiesz, b�d� ci� trenowa�.
	Log_CreateTopic(Topic_OpolosRezept,LOG_MISSION);
	Log_SetTopicStatus(Topic_OpolosRezept,LOG_Running);
	B_LogEntry(Topic_OpolosRezept,"Opolos chce rzuci� okiem na receptur� mikstury many. Pracuj�c dla Neorasa, m�g�bym j� po�yczy�.");
};


instance DIA_Opolos_rezept(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 3;
	condition = DIA_Opolos_rezept_Condition;
	information = DIA_Opolos_rezept_Info;
	permanent = TRUE;
	description = "Co do tej receptury...";
};


var int DIA_Opolos_rezept_permanent;

func int DIA_Opolos_rezept_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Opolos_beibringen) && (other.guild == GIL_NOV) && (DIA_Opolos_rezept_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Opolos_rezept_Info()
{
	if(Npc_HasItems(other,ItWr_ManaRezept) >= 1)
	{
		AI_Output(other,self,"DIA_Opolos_rezept_15_00");	//Mam tu receptur�, o kt�r� prosi�e�.
		AI_Output(self,other,"DIA_Opolos_rezept_12_01");	//Dobrze, niech na ni� spojrz�.
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Opolos_rezept_12_02");	//Aha... hm... tak... rozumiem... no, no...
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Opolos_rezept_12_03");	//Doskonale, wielkie dzi�ki. Je�li chcesz, mo�emy razem potrenowa�.
		DIA_Opolos_rezept_permanent = TRUE;
		Opolos_TeachSTR = TRUE;
		Opolos_Rezept = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient);
		Log_CreateTopic(Topic_KlosterTeacher,LOG_NOTE);
		B_LogEntry(Topic_KlosterTeacher,"Opolos mo�e mi pokaza�, jak sta� si� silniejszym.");
	}
	else if(MIS_NeorasRezept == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Opolos_rezept_15_04");	//Odnios�em ju� receptur� Neorasowi.
		AI_Output(self,other,"DIA_Opolos_rezept_12_05");	//O cholera - chyba nigdy niczego si� tu nie naucz�. Niewa�ne. Pomog� ci mimo to.
		Opolos_Rezept = LOG_FAILED;
		DIA_Opolos_rezept_permanent = TRUE;
		Opolos_TeachSTR = TRUE;
		Log_CreateTopic(Topic_KlosterTeacher,LOG_NOTE);
		B_LogEntry(Topic_KlosterTeacher,"Opolos mo�e mi pokaza�, jak sta� si� silniejszym.");
	}
	else
	{
		AI_Output(other,self,"DIA_Opolos_rezept_15_06");	//Wr�cimy do tego p�niej.
	};
};


instance DIA_Opolos_TEACH_STR(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 99;
	condition = DIA_Opolos_TEACH_STR_Condition;
	information = DIA_Opolos_TEACH_STR_Info;
	permanent = TRUE;
	description = "Chc� by� silniejszy.";
};


func int DIA_Opolos_TEACH_STR_Condition()
{
	if(((hero.guild == GIL_KDF) || (hero.guild == GIL_NOV)) && (Opolos_TeachSTR == TRUE) && (other.attribute[ATR_STRENGTH] <= 25))
	{
		return TRUE;
	};
};

func void DIA_Opolos_TEACH_STR_Info()
{
	AI_Output(other,self,"DIA_Opolos_TEACH_STR_15_00");	//Chcia�bym sta� si� silniejszy.
	Info_ClearChoices(DIA_Opolos_TEACH_STR);
	Info_AddChoice(DIA_Opolos_TEACH_STR,Dialog_Back,DIA_Opolos_TEACH_STR_BACK);
	Info_AddChoice(DIA_Opolos_TEACH_STR,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Opolos_TEACH_STR_1);
	Info_AddChoice(DIA_Opolos_TEACH_STR,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Opolos_TEACH_STR_5);
};

func void DIA_Opolos_TEACH_STR_BACK()
{
	if((other.attribute[ATR_STRENGTH] - ATTRIBUTEBONUS[4] - ATTRIBUTEFROMEQUIPMENT[4]) >= 25)
	{
		AI_Output(self,other,"DIA_Opolos_TEACH_STR_12_00");	//Jeste� ju� do�� silny. Niczego wi�cej nie mog� ci� nauczy�.
	};
	Info_ClearChoices(DIA_Opolos_TEACH_STR);
};

func void DIA_Opolos_TEACH_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,25);
	Info_ClearChoices(DIA_Opolos_TEACH_STR);
	Info_AddChoice(DIA_Opolos_TEACH_STR,Dialog_Back,DIA_Opolos_TEACH_STR_BACK);
	Info_AddChoice(DIA_Opolos_TEACH_STR,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Opolos_TEACH_STR_1);
	Info_AddChoice(DIA_Opolos_TEACH_STR,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Opolos_TEACH_STR_5);
};

func void DIA_Opolos_TEACH_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,25);
	Info_ClearChoices(DIA_Opolos_TEACH_STR);
	Info_AddChoice(DIA_Opolos_TEACH_STR,Dialog_Back,DIA_Opolos_TEACH_STR_BACK);
	Info_AddChoice(DIA_Opolos_TEACH_STR,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Opolos_TEACH_STR_1);
	Info_AddChoice(DIA_Opolos_TEACH_STR,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Opolos_TEACH_STR_5);
};


instance DIA_Opolos_Agon(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 4;
	condition = DIA_Opolos_Agon_Condition;
	information = DIA_Opolos_Agon_Info;
	permanent = FALSE;
	description = "Kim s� Agon i Babo?";
};


func int DIA_Opolos_Agon_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Opolos_Monastery) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Opolos_Agon_Info()
{
	AI_Output(other,self,"DIA_Opolos_Agon_15_00");	//Kim s� Agon i Babo?
	AI_Output(self,other,"DIA_Opolos_Agon_12_01");	//Agon opiekuje si� ogrodem z zio�ami. Jest jeszcze nowicjuszem, ale zachowuje si� tak, jakby by� przynajmniej wybra�cem.
	AI_Output(self,other,"DIA_Opolos_Agon_12_02");	//Babo przyby� do klasztoru na kr�tko przed tob�. Na pocz�tku pomaga� Agonowi w ogrodzie.
	AI_Output(self,other,"DIA_Opolos_Agon_12_03");	//Musieli si� chyba pok��ci�. Od tamtego czasu Babo zamiata dziedziniec.
	AI_Output(other,self,"DIA_Opolos_Agon_15_04");	//Wiesz, co si� sta�o?
	AI_Output(self,other,"DIA_Opolos_Agon_12_05");	//Nie do ko�ca. Musisz sam ich zapyta�. Jednak s�owa Agona znacz� tu wi�cej ni� s�owa innych nowicjuszy - jest siostrze�cem gubernatora.
};


instance DIA_Opolos_LIESEL(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 2;
	condition = DIA_Opolos_LIESEL_Condition;
	information = DIA_Opolos_LIESEL_Info;
	permanent = TRUE;
	description = "Sp�jrz, przyprowadzi�em Betsy.";
};


func int DIA_Opolos_LIESEL_Condition()
{
	if((other.guild == GIL_NOV) && (Liesel_Giveaway == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Opolos_LIESEL_Info()
{
	AI_Output(other,self,"DIA_Opolos_LIESEL_15_00");	//Sp�jrz, przyprowadzi�em Betsy. Zaopiekujesz si� ni�?
	Npc_PerceiveAll(self);
	if(Wld_DetectNpc(self,Follow_Sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 800))
	{
		other.aivar[AIV_PARTYMEMBER] = FALSE;
		other.aivar[AIV_TAPOSITION] = TRUE;
		other.wp = "FP_ROAM_MONASTERY_04";
		other.start_aistate = ZS_MM_AllScheduler;
		Liesel_Giveaway = TRUE;
		AI_Output(self,hero,"DIA_Opolos_LIESEL_12_01");	//Oczywi�cie. Bardzo �adne zwierz�. Dobrze si� ni� zajm�.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Opolos_Add_15_00");	//Hm... Gdzie� mi si� chyba zapodzia�a. Wr�c� p�niej.
	};
};


instance DIA_Opolos_Biblothek(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 98;
	condition = DIA_Opolos_Biblothek_Condition;
	information = DIA_Opolos_Biblothek_Info;
	permanent = TRUE;
	description = "Je�li chodzi o bibliotek�...";
};


func int DIA_Opolos_Biblothek_Condition()
{
	if((other.guild == GIL_NOV) && Npc_KnowsInfo(other,DIA_Opolos_HowLong))
	{
		return TRUE;
	};
};

func void DIA_Opolos_Biblothek_Info()
{
	AI_Output(other,self,"DIA_Opolos_Biblothek_15_00");	//Je�li chodzi o bibliotek�...
	if(Parlan_Erlaubnis == FALSE)
	{
		AI_Output(self,other,"DIA_Opolos_Biblothek_12_01");	//To ta zamkni�ta sala na lewo, obok bramy.
		AI_Output(self,other,"DIA_Opolos_Biblothek_12_02");	//Klucz do niej dostaniesz jednak tylko wtedy, kiedy Mistrz Parlan uzna, �e mo�esz rozpocz�� nauki.
	}
	else
	{
		AI_Output(self,other,"DIA_Opolos_Biblothek_12_03");	//Szcz�ciarzu! Masz klucz do biblioteki, mimo �e jeste� tu tak kr�tko.
		AI_Output(self,other,"DIA_Opolos_Biblothek_12_04");	//Wykorzystaj swoj� szans�, poczytaj dok�adnie stare manuskrypty.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_HelloAgain(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 2;
	condition = DIA_Opolos_HelloAgain_Condition;
	information = DIA_Opolos_HelloAgain_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Opolos_HelloAgain_Condition()
{
	if((other.guild == GIL_KDF) && (MIS_HelpOpolos == LOG_SUCCESS) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Opolos_HelloAgain_Info()
{
	AI_Output(self,other,"DIA_Opolos_HelloAgain_12_00");	//Witam. Dzi�kuj� za pomoc. Postaram si� skorzysta� z szansy, jak� otrzyma�em, i nauczy� si� jak najwi�cej.
	AI_Output(self,other,"DIA_Opolos_HelloAgain_12_01");	//Nie masz pewnie czasu, �eby rozmawia� ze zwyk�ym nowicjuszem, Mistrzu.
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_HowIsIt(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 3;
	condition = DIA_Opolos_HowIsIt_Condition;
	information = DIA_Opolos_HowIsIt_Info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int DIA_Opolos_HowIsIt_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Opolos_HowIsIt_Info()
{
	AI_Output(other,self,"DIA_Opolos_HowIsIt_15_00");	//Jak leci?
	if(MIS_HelpOpolos == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Opolos_HowIsIt_12_01");	//Wspaniale. Odk�d mog� si� uczy�, wszystko jest w jak najlepszym porz�dku.
	}
	else
	{
		AI_Output(self,other,"DIA_Opolos_HowIsIt_12_02");	//Lojalnie wype�niam zlecone mi zadania, Mistrzu.
		AI_Output(self,other,"DIA_Opolos_HowIsIt_12_03");	//Co dzie� Innos stawia przede mn� nowe wyzwania. B�d� nadal pracowa� nad doskonaleniem siebie.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_Kap2_EXIT(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 999;
	condition = DIA_Opolos_Kap2_EXIT_Condition;
	information = DIA_Opolos_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Opolos_Kap2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Opolos_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_Kap3_EXIT(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 999;
	condition = DIA_Opolos_Kap3_EXIT_Condition;
	information = DIA_Opolos_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Opolos_Kap3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Opolos_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_Kap3_PERM(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 39;
	condition = DIA_Opolos_Kap3_PERM_Condition;
	information = DIA_Opolos_Kap3_PERM_Info;
	permanent = TRUE;
	description = "Jak tam owce?";
};


func int DIA_Opolos_Kap3_PERM_Condition()
{
	if((Kapitel >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Opolos_Kap3_PERM_Info()
{
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_15_00");	//Jak tam owce?
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_12_01");	//A jak ci si� wydaje? Chodz� sobie i skubi� traw�.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_12_02");	//Zastanawiam si�, co si� dzieje na zewn�trz. Magowie wydaj� si� niespokojni.
	Info_ClearChoices(DIA_Opolos_Kap3_PERM);
	Info_AddChoice(DIA_Opolos_Kap3_PERM,Dialog_Back,DIA_Opolos_Kap3_PERM_BACK);
	Info_AddChoice(DIA_Opolos_Kap3_PERM,"W G�rniczej Dolinie pojawi�y si� smoki.",DIA_Opolos_Kap3_PERM_DRAGONS);
	Info_AddChoice(DIA_Opolos_Kap3_PERM,"Po kraju w�druj� dziwni przybysze w czarnych szatach.",DIA_Opolos_Kap3_PERM_DMT);
	if(MIS_NovizenChase == LOG_Running)
	{
		Info_AddChoice(DIA_Opolos_Kap3_PERM,"Pedro nas zdradzi�.",DIA_Opolos_Kap3_PERM_PEDRO);
	};
};

func void DIA_Opolos_Kap3_PERM_BACK()
{
	Info_ClearChoices(DIA_Opolos_Kap3_PERM);
};


var int Opolos_Dragons;

func void DIA_Opolos_Kap3_PERM_DRAGONS()
{
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DRAGONS_15_00");	//W G�rniczej Dolinie pojawi�y si� smoki. Wraz z armi� ork�w oblegaj� oddzia�y kr�lewskie.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_DRAGONS_12_01");	//Smoki - zawsze my�la�em, �e istniej� jedynie w strasznych opowie�ciach.
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DRAGONS_15_02");	//S� prawdziwe, uwierz mi.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_DRAGONS_12_03");	//Kr�lewscy paladyni chyba sobie z nimi poradz�, prawda?
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DRAGONS_15_04");	//Zobaczymy.
	if(Opolos_Dragons == FALSE)
	{
		B_GivePlayerXP(XP_Ambient);
		Opolos_Dragons = TRUE;
	};
};


var int Opolos_DMT;

func void DIA_Opolos_Kap3_PERM_DMT()
{
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DMT_15_00");	//Po kraju w�druj� dziwni przybysze w czarnych szatach.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_DMT_12_01");	//Co masz na my�li? Jacy przybysze?
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DMT_15_02");	//Nikt nie wie, sk�d si� wzi�li. Nosz� d�ugie, czarne szaty i zakrywaj� sobie twarze.
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DMT_15_03");	//Wygl�da na to, �e s� jakiego� rodzaju magami. A przynajmniej znaj� czary.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_DMT_12_04");	//To brzmi niepokoj�co. Mam jednak nadziej�, �e Najwy�sza Rada poradzi sobie z tym problemem.
	if(Opolos_DMT == FALSE)
	{
		B_GivePlayerXP(XP_Ambient);
		Opolos_DMT = TRUE;
	};
};


var int Opolos_Pedro;

func void DIA_Opolos_Kap3_PERM_PEDRO()
{
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_PEDRO_15_00");	//Pedro nas zdradzi�.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_PEDRO_12_01");	//S�ysza�em, nie wiedzia�em jednak, �e i ty o tym wiesz. Dlatego w�a�nie nic nie m�wi�em.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_PEDRO_12_02");	//Czy wr�g jest silniejszy od nas - to znaczy, czy mo�emy go jako� pokona�?
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_PEDRO_15_03");	//Wszystko jest mo�liwe. P�ki �ycia, p�ty nadziei.
	if(Opolos_Pedro == FALSE)
	{
		B_GivePlayerXP(XP_Ambient);
		Opolos_Pedro = TRUE;
	};
};


instance DIA_Opolos_Kap4_EXIT(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 999;
	condition = DIA_Opolos_Kap4_EXIT_Condition;
	information = DIA_Opolos_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Opolos_Kap4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Opolos_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_Kap5_EXIT(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 999;
	condition = DIA_Opolos_Kap5_EXIT_Condition;
	information = DIA_Opolos_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Opolos_Kap5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Opolos_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_PICKPOCKET(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 900;
	condition = DIA_Opolos_PICKPOCKET_Condition;
	information = DIA_Opolos_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Opolos_PICKPOCKET_Condition()
{
	return C_Beklauen(54,70);
};

func void DIA_Opolos_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Opolos_PICKPOCKET);
	Info_AddChoice(DIA_Opolos_PICKPOCKET,Dialog_Back,DIA_Opolos_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Opolos_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Opolos_PICKPOCKET_DoIt);
};

func void DIA_Opolos_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Opolos_PICKPOCKET);
};

func void DIA_Opolos_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Opolos_PICKPOCKET);
};

