
instance DIA_Agon_EXIT(C_Info)
{
	npc = NOV_603_Agon;
	nr = 999;
	condition = DIA_Agon_EXIT_Condition;
	information = DIA_Agon_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Agon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Agon_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Agon_Hello(C_Info)
{
	npc = NOV_603_Agon;
	nr = 2;
	condition = DIA_Agon_Hello_Condition;
	information = DIA_Agon_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Agon_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_SCHNITZELJAGD == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Agon_Hello_Info()
{
	AI_Output(self,other,"DIA_Agon_Hello_07_00");	//Czego chcesz?
};


instance DIA_Agon_Wurst(C_Info)
{
	npc = NOV_603_Agon;
	nr = 2;
	condition = DIA_Agon_Wurst_Condition;
	information = DIA_Agon_Wurst_Info;
	permanent = FALSE;
	description = "Masz, mam dla ciebie kie�bas� z barana.";
};


func int DIA_Agon_Wurst_Condition()
{
	if((Kapitel < 3) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Agon_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_Agon_Wurst_15_00");	//Masz, mam dla ciebie kie�bas� z barana.
	AI_Output(self,other,"DIA_Agon_Wurst_07_01");	//Kie�basa z owcy, owczy ser, owcze mleko... Nie mog� ju� na to patrze�.
	AI_Output(other,self,"DIA_Agon_Wurst_15_02");	//No to chcesz t� kie�bas� czy nie?
	AI_Output(self,other,"DIA_Agon_Wurst_07_03");	//Och, dawaj!
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
	NovizeLeft = IntToString(13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft,PRINT_NovizenLeft);
	PrintS_Ext(NovizeText, White());
};


instance DIA_Agon_New(C_Info)
{
	npc = NOV_603_Agon;
	nr = 1;
	condition = DIA_Agon_New_Condition;
	information = DIA_Agon_New_Info;
	permanent = FALSE;
	description = "Jestem tu nowy.";
};


func int DIA_Agon_New_Condition()
{
	if((MIS_SCHNITZELJAGD == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Agon_New_Info()
{
	AI_Output(other,self,"DIA_Agon_New_15_00");	//Jestem tu nowy.
	AI_Output(self,other,"DIA_Agon_New_07_01");	//To widz�.
	AI_Output(self,other,"DIA_Agon_New_07_02");	//Je�li nadal nie masz pracy, porozmawiaj z Parlanem. On ci jak�� przydzieli.
};


instance DIA_Agon_YouAndBabo(C_Info)
{
	npc = NOV_603_Agon;
	nr = 1;
	condition = DIA_Agon_YouAndBabo_Condition;
	information = DIA_Agon_YouAndBabo_Info;
	permanent = FALSE;
	description = "Co zasz�o mi�dzy tob� a Babo?";
};


func int DIA_Agon_YouAndBabo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Opolos_Monastery) && (MIS_SCHNITZELJAGD == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Agon_YouAndBabo_Info()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_15_00");	//Co zasz�o mi�dzy tob� a Babo?
	AI_Output(self,other,"DIA_Agon_YouAndBabo_07_01");	//Nie powiniene� wierzy� we wszystko co s�yszysz.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_07_02");	//Postawmy spraw� jasno. P�jd� w�asn� drog�. Drog�, kt�r� przeznaczy� mi Innos.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_07_03");	//Nie pozwol�, �eby kto� mi przeszkodzi�, a ju� na pewno nie ten prostak Babo.
	Info_ClearChoices(DIA_Agon_YouAndBabo);
	Info_AddChoice(DIA_Agon_YouAndBabo,"Czy my, nowicjusze, nie powinni�my trzyma� si� razem?",DIA_Agon_YouAndBabo_AllTogether);
	Info_AddChoice(DIA_Agon_YouAndBabo,"Tylko Innos zna �cie�ki, kt�rymi pod��amy.",DIA_Agon_YouAndBabo_InnosWay);
	Info_AddChoice(DIA_Agon_YouAndBabo,"Dobrze si� rozumiemy.",DIA_Agon_YouAndBabo_Understand);
};

func void DIA_Agon_YouAndBabo_AllTogether()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_AllTogether_15_00");	//Czy my, nowicjusze, nie powinni�my trzyma� si� razem?
	AI_Output(self,other,"DIA_Agon_YouAndBabo_AllTogether_07_01");	//Wy wszyscy mo�ecie trzyma� si� razem, je�li chcecie.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_AllTogether_07_02");	//Ale prosz�, nie marnujcie mojego czasu. I niech nikt mi nie wchodzi w drog�.
	Info_ClearChoices(DIA_Agon_YouAndBabo);
};

func void DIA_Agon_YouAndBabo_InnosWay()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_InnosWay_15_00");	//Tylko Innos zna �cie�ki, kt�rymi pod��amy.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_InnosWay_07_01");	//Moja rodzina zawsze cieszy�a si� �ask� Innosa i to si� nie zmieni.
	Info_ClearChoices(DIA_Agon_YouAndBabo);
};

func void DIA_Agon_YouAndBabo_Understand()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_Understand_15_00");	//Dobrze si� rozumiemy.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_Understand_07_01");	//Mam nadziej�. Kiedy zostan� magiem, wstawi� si� za tob�.
	Info_ClearChoices(DIA_Agon_YouAndBabo);
};


instance DIA_Agon_GetHerb(C_Info)
{
	npc = NOV_603_Agon;
	nr = 1;
	condition = DIA_Agon_GetHerb_Condition;
	information = DIA_Agon_GetHerb_Info;
	permanent = TRUE;
	description = "Co tu sadzicie?";
};


func int DIA_Agon_GetHerb_Condition()
{
	if(MIS_SCHNITZELJAGD == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Agon_GetHerb_Info()
{
	AI_Output(other,self,"DIA_Agon_GetHerb_15_00");	//Co tu sadzicie?
	AI_Output(self,other,"DIA_Agon_GetHerb_07_01");	//Pr�bujemy wyhodowa� zio�a lecznicze, kt�rych Mistrz Neoras u�ywa do warzenia mikstur.
};


instance DIA_Agon_GolemDead(C_Info)
{
	npc = NOV_603_Agon;
	nr = 1;
	condition = DIA_Agon_GolemDead_Condition;
	information = DIA_Agon_GolemDead_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Agon_GolemDead_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) && Npc_IsDead(Magic_Golem))
	{
		return TRUE;
	};
};

func void DIA_Agon_GolemDead_Info()
{
	AI_Output(self,other,"DIA_Agon_GolemDead_07_00");	//Przyby�e� za p�no!
	AI_Output(self,other,"DIA_Agon_GolemDead_07_01");	//By�em pierwszy! Wygra�em!
	Info_ClearChoices(DIA_Agon_GolemDead);
	Info_AddChoice(DIA_Agon_GolemDead,"(gro�nie) Tylko wtedy, je�li wyjdziesz st�d �ywy.",DIA_Agon_GolemDead_NoWay);
	Info_AddChoice(DIA_Agon_GolemDead,"Zamknij si�!",DIA_Agon_GolemDead_ShutUp);
	Info_AddChoice(DIA_Agon_GolemDead,"Moje gratulacje, naprawd� na nie zas�ugujesz.",DIA_Agon_GolemDead_Congrat);
};

func void DIA_Agon_GolemDead_NoWay()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_NoWay_15_00");	//Tylko wtedy, je�li wyjdziesz st�d �ywy.
	AI_Output(self,other,"DIA_Agon_GolemDead_NoWay_07_01");	//Chcesz mnie zabi�? Nie uda ci si�.
	self.level = 5;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Agon_GolemDead_ShutUp()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_15_00");	//Zamknij si�!
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_07_01");	//To beznadziejne, przegra�e�! Pog�d� si� z tym.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_07_02");	//Tylko mnie jest przeznaczone zosta� magiem.
	Info_ClearChoices(DIA_Agon_GolemDead);
	Info_AddChoice(DIA_Agon_GolemDead,"Mam w dupie przeznaczenie. Skrzynia jest moja.",DIA_Agon_GolemDead_ShutUp_MyChest);
	Info_AddChoice(DIA_Agon_GolemDead,"Wygra�e�.",DIA_Agon_GolemDead_ShutUp_YouWin);
};

func void DIA_Agon_GolemDead_ShutUp_MyChest()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_MyChest_15_00");	//Mam w dupie przeznaczenie. Skrzynia jest moja.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_MyChest_07_01");	//Nie, nie mo�esz tego zrobi�, wcze�niej ci� zabij�.
	self.level = 5;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Agon_GolemDead_ShutUp_YouWin()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_YouWin_15_00");	//Wygra�e�.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_YouWin_07_01");	//Nie, nie zwiedziesz mnie. Pr�bujesz si� mnie pozby�.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_YouWin_07_02");	//Nie pozwol� na to!
	self.level = 5;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Agon_GolemDead_Congrat()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_Congrat_15_00");	//Moje gratulacje, naprawd� na nie zas�ugujesz.
	AI_Output(self,other,"DIA_Agon_GolemDead_Congrat_07_01");	//Co to znaczy? Co zamierzasz?
	AI_Output(other,self,"DIA_Agon_GolemDead_Congrat_15_02");	//O czym ty m�wisz?
	AI_Output(self,other,"DIA_Agon_GolemDead_Congrat_07_03");	//Chcesz podwa�y� moje zwyci�stwo. Chcesz mnie zabi� i sobie przypisa� chwa��!
	AI_Output(self,other,"DIA_Agon_GolemDead_Congrat_07_04");	//Nigdy ci si� to nie uda!
	self.level = 5;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Agon_GolemLives(C_Info)
{
	npc = NOV_603_Agon;
	nr = 1;
	condition = DIA_Agon_GolemLives_Condition;
	information = DIA_Agon_GolemLives_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Agon_GolemLives_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) && (Npc_IsDead(Magic_Golem) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Agon_GolemLives_Info()
{
	AI_Output(self,other,"DIA_Agon_GolemLives_07_00");	//Znalaz�e� kryj�wk� przede mn�. To niemo�liwe...
	AI_Output(self,other,"DIA_Agon_GolemLives_07_01");	//Tak nie powinno by�! Nie pozwol� na to.
	AI_Output(self,other,"DIA_Agon_GolemLives_07_02");	//Nikt nawet nie znajdzie twoich zw�ok.
	self.level = 5;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};


instance DIA_Agon_Perm(C_Info)
{
	npc = NOV_603_Agon;
	nr = 2;
	condition = DIA_Agon_Perm_Condition;
	information = DIA_Agon_Perm_Info;
	permanent = TRUE;
	description = "I jak idzie?";
};


func int DIA_Agon_Perm_Condition()
{
	if((Kapitel >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Agon_Perm_Info()
{
	AI_Output(other,self,"DIA_Agon_Perm_15_00");	//I jak idzie?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Agon_Perm_07_01");	//Och, dzi�kuj� za trosk�, Panie Paladynie. Raduje mnie praca i jestem pewien, �e wkr�tce zostan� magiem.
	}
	else
	{
		AI_Output(self,other,"DIA_Agon_Perm_07_02");	//Jeste� tylko go�ciem w klasztorze Innosa. Dlatego powiniene� zachowywa� si� w�a�ciwie i nie przeszkadza� mi w pracy. Do widzenia.
	};
};


instance DIA_Agon_PICKPOCKET(C_Info)
{
	npc = NOV_603_Agon;
	nr = 900;
	condition = DIA_Agon_PICKPOCKET_Condition;
	information = DIA_Agon_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Agon_PICKPOCKET_Condition()
{
	return C_Beklauen(23,12);
};

func void DIA_Agon_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Agon_PICKPOCKET);
	Info_AddChoice(DIA_Agon_PICKPOCKET,Dialog_Back,DIA_Agon_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Agon_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Agon_PICKPOCKET_DoIt);
};

func void DIA_Agon_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Agon_PICKPOCKET);
};

func void DIA_Agon_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Agon_PICKPOCKET);
};

