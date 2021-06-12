
instance DIA_NOV_8_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_NOV_8_EXIT_Condition;
	information = DIA_NOV_8_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_NOV_8_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NOV_8_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NOV_8_Fegen(C_Info)
{
	nr = 2;
	condition = DIA_NOV_8_Fegen_Condition;
	information = DIA_NOV_8_Fegen_Info;
	permanent = TRUE;
	description = "Potrzebuj� pomocy w sprz�taniu sal nowicjuszy.";
};


func int DIA_NOV_8_Fegen_Condition()
{
	if((Kapitel < 3) && (MIS_KlosterArbeit == LOG_Running) && (NOV_Helfer < 4))
	{
		return TRUE;
	};
};


var int Feger3_Permanent;

func void DIA_NOV_8_Fegen_Info()
{
	AI_Output(other,self,"DIA_NOV_8_Fegen_15_00");	//Potrzebuj� pomocy w sprz�taniu sal nowicjuszy.
	if(Hlp_GetInstanceID(Feger3) == Hlp_GetInstanceID(self))
	{
		if(Feger3_Permanent == FALSE)
		{
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_01");	//Nie�le, ledwo� przyszed�, a oni ju� zap�dzili ci� do sprz�tania?
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_02");	//Nie martw si�, ze mn� by�o dok�adnie tak samo. Dlatego w�a�nie ci pomog�. G�upio by wygl�da�o, gdyby�my sobie nie poradzili.
			NOV_Helfer = NOV_Helfer + 1;
			Feger3_Permanent = TRUE;
			B_GivePlayerXP(XP_Feger);
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"FEGEN");
			B_LogEntry(Topic_ParlanFegen,"Znalaz�em nowicjusza, kt�ry zechcia� mi pom�c w sprz�taniu komnat.");
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_03");	//Bracie, wiem dok�adnie, o czym m�wisz. Powiedzia�em ci ju�, �e pomog�. Przecie� robi� to ca�y czas.
		};
	};
	if(Hlp_GetInstanceID(Feger3) == Hlp_GetInstanceID(self) == FALSE)
	{
		AI_Output(self,other,"DIA_NOV_8_Fegen_08_04");	//Zrozum, zrobi�bym to, ale jestem naprawd� zaj�ty.
	};
};


instance DIA_NOV_8_Wurst(C_Info)
{
	nr = 3;
	condition = DIA_NOV_8_Wurst_Condition;
	information = DIA_NOV_8_Wurst_Info;
	permanent = TRUE;
	description = "Co powiesz na pyszn� barani� kie�bas�?";
};


func int DIA_NOV_8_Wurst_Condition()
{
	if((Kapitel < 3) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_NOV_8_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_NOV_8_Wurst_15_00");	//Co powiesz na pyszn� barani� kie�bas�?
	AI_Output(self,other,"DIA_NOV_8_Wurst_08_01");	//Nie odm�wi�. Dzi�ki, tego w�a�nie by�o mi potrzeba.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
	NovizeLeft = IntToString(13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft,PRINT_NovizenLeft);
	PrintS_Ext(NovizeText, White());
};


instance DIA_NOV_8_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_NOV_8_JOIN_Condition;
	information = DIA_NOV_8_JOIN_Info;
	permanent = TRUE;
	description = "Co musz� zrobi�, by zosta� magiem?";
};


func int DIA_NOV_8_JOIN_Condition()
{
	if(hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_NOV_8_JOIN_Info()
{
	AI_Output(other,self,"DIA_NOV_8_JOIN_15_00");	//Co musz� zrobi�, by zosta� magiem?
	AI_Output(self,other,"DIA_NOV_8_JOIN_08_01");	//Zostaniesz Wybra�cem Innosa jedynie wtedy, gdy tak� wol� wyra�� Najwy�si Magowie Ognia.
	AI_Output(self,other,"DIA_NOV_8_JOIN_08_02");	//Jako nowicjuszom nie wolno nam studiowa� magii runicznej, za� stare manuskrypty mo�emy przegl�da� jedynie za zgod� mag�w.
};


instance DIA_NOV_8_PEOPLE(C_Info)
{
	nr = 5;
	condition = DIA_NOV_8_PEOPLE_Condition;
	information = DIA_NOV_8_PEOPLE_Info;
	permanent = TRUE;
	description = "Kto sprawuje w�adz� w klasztorze?";
};


func int DIA_NOV_8_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_NOV_8_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_NOV_8_PEOPLE_15_00");	//Kto sprawuje w�adz� w klasztorze?
	AI_Output(self,other,"DIA_NOV_8_PEOPLE_08_01");	//Najwy�sza Rada. W jej sk�ad wchodz� trzej najpot�niejsi magowie naszego zgromadzenia. To oni nadzoruj� dzia�ania klasztoru.
	AI_Output(self,other,"DIA_NOV_8_PEOPLE_08_02");	//Wszyscy Wybra�cy Innosa s� magami. Innos tchn�� w ka�dego z nich cz�stk� siebie, dzi�ki czemu mog� stanowi� jego wol� tu, w �wiecie �miertelnik�w.
};


instance DIA_NOV_8_LOCATION(C_Info)
{
	nr = 6;
	condition = DIA_NOV_8_LOCATION_Condition;
	information = DIA_NOV_8_LOCATION_Info;
	permanent = TRUE;
	description = "Opowiedz mi co� o tym klasztorze.";
};


func int DIA_NOV_8_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_NOV_8_LOCATION_Info()
{
	AI_Output(other,self,"DIA_NOV_8_LOCATION_15_00");	//Opowiedz mi co� o tym klasztorze.
	AI_Output(self,other,"DIA_NOV_8_LOCATION_08_01");	//To staro�ytna budowla. Pochodzi jeszcze z czas�w przed Rhobarem Pierwszym.
	AI_Output(self,other,"DIA_NOV_8_LOCATION_08_02");	//Pod klasztorem znajduj� si� katakumby, rozci�gaj�ce si� do wn�trza g�ry.
};


instance DIA_NOV_8_STANDARD(C_Info)
{
	nr = 10;
	condition = DIA_NOV_8_STANDARD_Condition;
	information = DIA_NOV_8_STANDARD_Info;
	permanent = TRUE;
	description = "Czy masz jakie� nowe informacje?";
};


func int DIA_NOV_8_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_NOV_8_STANDARD_Info()
{
	AI_Output(other,self,"DIA_NOV_8_STANDARD_15_00");	//Czy masz jakie� nowe informacje?
	if(Kapitel == 1)
	{
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_01");	//Mo�na by tak powiedzie�. Od ponad stu lat �aden nowicjusz nie zosta� tak szybko przyj�ty do Kr�gu Ognia.
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_02");	//Mam nadziej�, �e i mnie, pewnego dnia, spotka ten zaszczyt.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_03");	//Do Khorinis przyby�a niedawno grupa paladyn�w. Jeden jest tu, w klasztorze... Modli si�.
		};
	};
	if((Kapitel == 2) || (Kapitel == 3))
	{
		if((Pedro_Traitor == TRUE) && (MIS_NovizenChase != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_04");	//Wci�� nie mog� uwierzy�, �e jeden z nas zdradzi� klasztor i zabra� Oko Innosa.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_05");	//Mieli�my stworzy� spo�eczno��, byli�my jednak zbyt s�abi. Dlatego w�a�nie Beliarowi uda�o si� przeci�gn�� jednego z nas na �cie�k� Z�a.
		}
		else if(MIS_NovizenChase == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_06");	//Jedynie nieskalana wiara w Innosa pozwoli nam odzyska� Oko z r�k wroga.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_07");	//Twoja odwaga jest natchnieniem dla tych, kt�rzy zatracili si� w rozpaczy, dzi�ki tobie mo�e uda im si� przetrwa� te mroczne chwile.
		}
		else if(MIS_OLDWORLD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_08");	//S�ysza�em co� tak�e o smokach i armii Z�a. Niech Innos ma nas w swojej opiece.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_09");	//Sytuacja, w jakiej znale�li si� paladyni, bardzo zmartwi�a Rad�. Od wielu ju� dni nie mamy �adnych informacji z G�rniczej Doliny.
		};
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_10");	//Dzi�kuj� za to naszemu Panu. Dzi�ki Oku Innosa b�dziemy mogli pokona� smoki!
	};
	if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_11");	//Tak. Pokonali�my smoki. Innos po raz kolejny pokaza� nam, �e nie wolno traci� nadziei.
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_12");	//Wci�� jednak �wiat osnuwaj� cienie, a naszym celem jest nie�� �wiat�o wsz�dzie tam, gdzie s� potrzebuj�cy.
	};
};

func void B_AssignAmbientInfos_NOV_8(var C_Npc slf)
{
	dia_nov_8_exit.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_join.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_people.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_location.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_standard.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_8_Fegen.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_8_Wurst.npc = Hlp_GetInstanceID(slf);
};

