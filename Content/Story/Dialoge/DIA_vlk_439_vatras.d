
var int vatras_schickeleuteweg;
var int vatras_heal_day;

instance DIA_VATRAS_EXIT(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 999;
	condition = dia_vatras_exit_condition;
	information = dia_vatras_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vatras_exit_condition()
{
	return TRUE;
};

func void dia_vatras_exit_info()
{
	AI_StopProcessInfos(self);
	if(VATRAS_SCHICKELEUTEWEG == TRUE)
	{
		b_startotherroutine(vlk_455_buerger,"VATRASAWAY");
		b_startotherroutine(vlk_454_buerger,"VATRASAWAY");
		b_startotherroutine(vlk_428_buergerin,"VATRASAWAY");
		b_startotherroutine(vlk_450_buerger,"VATRASAWAY");
		b_startotherroutine(vlk_426_buergerin,"VATRASAWAY");
		b_startotherroutine(vlk_421_valentino,"VATRASAWAY");
		VATRAS_SCHICKELEUTEWEG = FALSE;
	};
};


instance DIA_VATRAS_PICKPOCKET(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 900;
	condition = dia_vatras_pickpocket_condition;
	information = dia_vatras_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_vatras_pickpocket_condition()
{
	return c_beklauen(91,250);
};

func void dia_vatras_pickpocket_info()
{
	Info_ClearChoices(dia_vatras_pickpocket);
	Info_AddChoice(dia_vatras_pickpocket,DIALOG_BACK,dia_vatras_pickpocket_back);
	Info_AddChoice(dia_vatras_pickpocket,DIALOG_PICKPOCKET,dia_vatras_pickpocket_doit);
};

func void dia_vatras_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_vatras_pickpocket);
};

func void dia_vatras_pickpocket_back()
{
	Info_ClearChoices(dia_vatras_pickpocket);
};


instance DIA_VATRAS_GREET(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_vatras_greet_condition;
	information = dia_vatras_greet_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_vatras_greet_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_greet_info()
{
	AI_Output(self,other,"DIA_Vatras_GREET_05_00");	//Niech �aska Adanosa b�dzie z tob�.
	AI_Output(other,self,"DIA_Vatras_GREET_15_01");	//Kim jeste�?
	AI_Output(self,other,"DIA_Vatras_GREET_05_02");	//Nazywam si� Vatras. Jestem s�ug� Adanosa, stra�nika niebia�skiej i ziemskiej harmonii.
	AI_Output(self,other,"DIA_Vatras_GREET_05_03");	//Co mog� dla ciebie zrobi�?
};


instance DIA_VATRAS_INFLUENCE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_vatras_influence_condition;
	information = dia_vatras_influence_info;
	permanent = FALSE;
	description = "Przybywam, by prosi� ci� o b�ogos�awie�stwo.";
};


func int dia_vatras_influence_condition()
{
	if((MIS_THORBEN_GETBLESSINGS == LOG_RUNNING) && (PLAYER_ISAPPRENTICE == APP_NONE) && (KAPITEL <= 1))
	{
		return TRUE;
	};
};

func void dia_vatras_influence_info()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_00");	//Przybywam, by prosi� ci� o b�ogos�awie�stwo.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_01");	//Dlaczeg� mia�bym ci� pob�ogos�awi�, nieznajomy?
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_02");	//Chc� zosta� czeladnikiem u jednego z mistrz�w w dolnej cz�ci miasta.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_03");	//Mog� udzieli� ci b�ogos�awie�stwa, przybyszu, ale przecie� nic o tobie nie wiem! Opowiedz mi troch� o sobie.
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_04");	//A co chcia�by� wiedzie�?
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_05");	//Powiedz mi, sk�d pochodzisz... i co sprowadza ci� do tego miasta.
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_06");	//Mam wa�n� wiadomo�� dla przyw�dcy paladyn�w.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_07");	//Co to za wiadomo��?
	Info_ClearChoices(dia_vatras_influence);
	Info_AddChoice(dia_vatras_influence,"Przyby�y smoki...",dia_vatras_influence_first_truth);
	Info_AddChoice(dia_vatras_influence,"Wkr�tce wydarz� si� straszliwe rzeczy.",dia_vatras_influence_first_lie);
};

func void dia_vatras_influence_first_truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_15_00");	//Niedaleko st�d zbiera si� pot�na armia. Jej przyw�dcami s� smoki, a celem podb�j ca�ego kraju.
	if(VATRAS_FIRST == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_01");	//Hmmm. Je�li m�wisz prawd�, to r�wnowaga na tych ziemiach zosta�a zak��cona. Kto ci o tym powiedzia�?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_02");	//Smoki? M�wisz o istotach, o kt�rych zwykle wspominaj� tylko legendy. Kto ci o tym powiedzia�?
	};
	Info_ClearChoices(dia_vatras_influence);
	Info_AddChoice(dia_vatras_influence,"Ach, s�ysza�em jakie� plotki...",dia_vatras_influence_second_lie);
	Info_AddChoice(dia_vatras_influence,"Powiedzia� mi o tym mag Xardas...",dia_vatras_influence_second_truth);
	VATRAS_FIRST = TRUE;
};

func void dia_vatras_influence_first_lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_LIE_15_00");	//Wkr�tce wydarz� si� straszliwe rzeczy.
	if(VATRAS_FIRST == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_01");	//Aha! A kto ci o tym powiedzia�?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_02");	//Straszliwe rzeczy, tak? A sk�d to przypuszczenie?
	};
	Info_ClearChoices(dia_vatras_influence);
	Info_AddChoice(dia_vatras_influence,"Ach, s�ysza�em jakie� plotki...",dia_vatras_influence_second_lie);
	Info_AddChoice(dia_vatras_influence,"Powiedzia� mi o tym mag Xardas...",dia_vatras_influence_second_truth);
	VATRAS_FIRST = 2;
};

func void dia_vatras_influence_second_truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_15_00");	//Powiedzia� mi o tym mag Xardas. To on wys�a� mnie, bym ostrzeg� paladyn�w.
	if(VATRAS_SECOND == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_01");	//Wiem, �e jest on m�drym i pot�nym mistrzem magii. Powiedz mi jeszcze, sk�d przybywasz?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_02");	//Ten nekromanta... A wi�c �yje... i on ci� tu przys�a�? Kim jeste� naprawd�?
	};
	Info_ClearChoices(dia_vatras_influence);
	Info_AddChoice(dia_vatras_influence,"Podr�nikiem z dalekiego po�udnia...",dia_vatras_influence_third_lie);
	Info_AddChoice(dia_vatras_influence,"Dawnym skaza�cem...",dia_vatras_influence_third_truth);
	VATRAS_SECOND = TRUE;
};

func void dia_vatras_influence_second_lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_LIE_15_00");	//Ach, s�ysza�em jakie� plotki...
	if(VATRAS_SECOND == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_01");	//A pami�tasz chocia�, GDZIE je s�ysza�e�?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_02");	//Tak... I dlatego wyruszy�e� w t� podr�? Kim jeste� naprawd�?
	};
	Info_ClearChoices(dia_vatras_influence);
	Info_AddChoice(dia_vatras_influence,"Podr�nikiem z dalekiego po�udnia...",dia_vatras_influence_third_lie);
	Info_AddChoice(dia_vatras_influence,"Dawnym skaza�cem...",dia_vatras_influence_third_truth);
	VATRAS_SECOND = 2;
};

func void dia_vatras_influence_third_truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_TRUTH_15_00");	//Dawnym skaza�cem z wi�ziennej kolonii Khorinis.
	Info_ClearChoices(dia_vatras_influence);
	Info_AddChoice(dia_vatras_influence,"Udzielisz mi teraz swojego b�ogos�awie�stwa?",dia_vatras_influence_repeat);
	VATRAS_THIRD = TRUE;
};

func void dia_vatras_influence_third_lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_LIE_15_00");	//Podr�nikiem z dalekiego po�udnia...
	Info_ClearChoices(dia_vatras_influence);
	Info_AddChoice(dia_vatras_influence,"Udzielisz mi teraz swojego b�ogos�awie�stwa?",dia_vatras_influence_repeat);
	VATRAS_THIRD = 2;
};

func void dia_vatras_influence_repeat()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_REPEAT_15_00");	//Czy udzielisz mi teraz swojego b�ogos�awie�stwa?
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_01");	//Dobrze, podsumujmy:
	if(VATRAS_THIRD == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_02");	//Jeste� zbieg�ym wi�niem, ...
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_03");	//Jeste� podr�nikiem z dalekiego po�udnia, ...
	};
	if(VATRAS_SECOND == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_04");	//... kt�remu nekromanta Xardas powiedzia�, ...
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_05");	//... kt�ry us�ysza� plotki, ...
	};
	if(VATRAS_FIRST == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_06");	//... �e armia smok�w zamierza podbi� ca�y kraj.
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_07");	//... �e wydarz� si� wkr�tce straszliwe rzeczy.
	};
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_08");	//I zamierzasz ostrzec o tym paladyn�w.
	if((VATRAS_FIRST == TRUE) && (VATRAS_SECOND == TRUE) && (VATRAS_THIRD == TRUE))
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_09");	//Brzmi to do�� niewiarygodnie, ale nie wyczuwam, by� pr�bowa� mnie ok�ama�.
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_10");	//Dlatego musz� przyj��, �e kieruj� tob� szlachetne pobudki.
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_11");	//Id� wi�c z b�ogos�awie�stwem Adanosa, m�j synu!
		Snd_Play("LevelUp");
		b_giveplayerxp(XP_VATRASTRUTH);
		VATRAS_SEGEN = TRUE;
		b_logentry(TOPIC_THORBEN,"Vatras, Mag Wody, udzieli� mi b�ogos�awie�stwa.");
	}
	else if(VATRAS_CHANCE == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_Add_05_00");	//My�l�, �e co� przede mn� ukrywasz.
		AI_Output(self,other,"DIA_Vatras_Add_05_01");	//Je�li obawiasz si�, �e przeka�� komu� to, co mi powiesz, mo�esz by� spokojny.
		AI_Output(self,other,"DIA_Vatras_Add_05_02");	//Przysi�g�em zachowywa� wszystkie powierzane mi tajemnice dla siebie.
		if(Wld_IsTime(5,5,20,10))
		{
			AI_Output(other,self,"DIA_Vatras_Add_15_03");	//A co z tymi wszystkimi lud�mi?
			AI_Output(self,other,"DIA_Vatras_Add_05_04");	//Oni nie rozumiej� nawet po�owy z tego, czego ich nauczam. Nie musisz si� obawia�.
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_05");	//Zacznijmy jeszcze raz, od pocz�tku. Co to za wiadomo��?
		VATRAS_CHANCE = TRUE;
		Info_ClearChoices(dia_vatras_influence);
		Info_AddChoice(dia_vatras_influence,"Przyby�y smoki...",dia_vatras_influence_first_truth);
		Info_AddChoice(dia_vatras_influence,"Wkr�tce wydarz� si� straszliwe rzeczy.",dia_vatras_influence_first_lie);
	}
	else if(VATRAS_CHANCE == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_13");	//Da�em ci dwie szanse na powiedzenie prawdy, ale najwyra�niej bardzo si� przed tym wzbraniasz. Nie dostaniesz mojego b�ogos�awie�stwa.
	};
};


instance DIA_VATRAS_WOKDF(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 3;
	condition = dia_vatras_wokdf_condition;
	information = dia_vatras_wokdf_info;
	permanent = FALSE;
	description = "Gdzie mog� znale�� jakiego� kap�ana Innosa?";
};


func int dia_vatras_wokdf_condition()
{
	if((VATRAS_SEGEN == TRUE) && (KAPITEL <= 1))
	{
		return TRUE;
	};
};

func void dia_vatras_wokdf_info()
{
	AI_Output(other,self,"DIA_Vatras_WoKdF_15_00");	//Gdzie mog� znale�� jakiego� kap�ana Innosa?
	AI_Output(self,other,"DIA_Vatras_WoKdF_05_01");	//Najlepiej rozejrzyj si� po targowisku. Znajdziesz tam wys�annika klasztoru.
};


instance DIA_VATRAS_SPENDE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 3;
	condition = dia_vatras_spende_condition;
	information = dia_vatras_spende_info;
	permanent = TRUE;
	description = "Chcia�bym przekaza� datek na �wi�tyni� Adanosa!";
};


func int dia_vatras_spende_condition()
{
	return TRUE;
};

func void dia_vatras_spende_info()
{
	AI_Output(other,self,"DIA_Vatras_Spende_15_00");	//Chcia�bym przekaza� datek na �wi�tyni� Adanosa!
	AI_Output(self,other,"DIA_Vatras_Spende_05_01");	//Datek na �wi�tyni� Adanosa mo�e zmaza� cz�� przewin, kt�re pope�ni�e� w przesz�o�ci, m�j synu.
	AI_Output(self,other,"DIA_Vatras_Spende_05_02");	//Jak� sum� zechcesz przekaza�?
	Info_ClearChoices(dia_vatras_spende);
	Info_AddChoice(dia_vatras_spende,"Chwilowo nie mam pieni�dzy...",dia_vatras_spende_back);
	if(Npc_HasItems(other,itmi_gold) >= 50)
	{
		Info_AddChoice(dia_vatras_spende,"Mam 50 sztuk z�ota...",dia_vatras_spende_50);
	};
	if(Npc_HasItems(other,itmi_gold) >= 100)
	{
		Info_AddChoice(dia_vatras_spende,"Mam 100 sztuk z�ota...",dia_vatras_spende_100);
	};
};

func void dia_vatras_spende_back()
{
	AI_Output(other,self,"DIA_Vatras_Spende_BACK_15_00");	//Chwilowo nie mam pieni�dzy...
	AI_Output(self,other,"DIA_Vatras_Spende_BACK_05_01");	//Nic si� nie sta�o. Adanos zawsze ucieszy si� z twojej ofiary.
	Info_ClearChoices(dia_vatras_spende);
};

func void dia_vatras_spende_50()
{
	AI_Output(other,self,"DIA_Vatras_Spende_50_15_00");	//Mam 50 sztuk z�ota...
	AI_Output(self,other,"DIA_Vatras_Spende_50_05_01");	//Dzi�kuj� ci w imieniu Adanosa, m�j synu. Twoje z�oto zostanie przekazane potrzebuj�cym.
	b_giveinvitems(other,self,5113,50);
	Info_ClearChoices(dia_vatras_spende);
};

func void dia_vatras_spende_100()
{
	AI_Output(other,self,"DIA_Vatras_Spende_100_15_00");	//Mam 100 sztuk z�ota...
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_01");	//B�d� b�ogos�awiony, m�j synu! Dzi�ki ci za tw� hojno��.
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_02");	//Niech Adanos strze�e ci� zawsze od z�ej przygody.
	b_giveinvitems(other,self,5113,100);
	VATRAS_SEGEN = TRUE;
	Info_ClearChoices(dia_vatras_spende);
	if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
	{
		b_logentry(TOPIC_THORBEN,"Vatras, Mag Wody, udzieli� mi b�ogos�awie�stwa.");
	};
};


instance DIA_VATRAS_DI_VATRASMURDERER(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 1;
	condition = dia_vatras_di_vatrasmurderer_condition;
	information = dia_vatras_di_vatrasmurderer_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_vatras_di_vatrasmurderer_condition()
{
	if(Npc_IsInState(self,zs_talk) && ((PETZCOUNTER_OLDCAMP_MURDER > 0) || (PETZCOUNTER_CITY_MURDER > 0) || (PETZCOUNTER_MONASTERY_MURDER > 0) || (PETZCOUNTER_FARM_MURDER > 0)))
	{
		return TRUE;
	};
};

func void dia_vatras_di_vatrasmurderer_info()
{
	AI_Output(self,other,"DIA_Vatras_DI_VatrasSucked_05_00");	//Zejd� mi z oczu, morderco. Na moj� pomoc nie masz co liczy�.
	AI_StopProcessInfos(self);
};


instance DIA_VATRAS_CANTEACH(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_vatras_canteach_condition;
	information = dia_vatras_canteach_info;
	permanent = FALSE;
	description = "Mo�esz nauczy� mnie czego� o magii?";
};


func int dia_vatras_canteach_condition()
{
	return TRUE;
};

func void dia_vatras_canteach_info()
{
	AI_Output(other,self,"DIA_Vatras_CanTeach_15_00");	//Mo�esz nauczy� mnie czego� o magii?
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_01");	//Tylko Wybra�cy Innosa i Wybra�cy Adanosa mog� pos�ugiwa� si� magi� run.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_02");	//Ale magia dost�pna jest tak�e zwyk�ym �miertelnikom, pod postaci� magicznych zwoj�w.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_03");	//Mog� ci� nauczy�, jak lepiej wykorzystywa� dost�pn� ci magiczn� moc.
	VATRAS_TEACHMANA = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Vatras, Mag Wody, mo�e pom�c mi w zwi�kszeniu magicznych zdolno�ci.");
};


instance DIA_VATRAS_TEACH(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 100;
	condition = dia_vatras_teach_condition;
	information = dia_vatras_teach_info;
	permanent = TRUE;
	description = "Chc� zwi�kszy� moj� magiczn� moc.";
};


func int dia_vatras_teach_condition()
{
	if(VATRAS_TEACHMANA == TRUE)
	{
		return TRUE;
	};
};

func void dia_vatras_teach_info()
{
	AI_Output(other,self,"DIA_Vatras_Teach_15_00");	//Chc� zwi�kszy� moj� magiczn� moc.
	Info_ClearChoices(dia_vatras_teach);
	Info_AddChoice(dia_vatras_teach,DIALOG_BACK,dia_vatras_teach_back);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_vatras_teach_1);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_vatras_teach_5);
};

func void dia_vatras_teach_back()
{
	if(other.attribute[ATR_MANA_MAX] >= 50)
	{
		AI_Output(self,other,"DIA_Vatras_Teach_05_00");	//Jeste� ju� zbyt pot�ny, bym m�g� ci� czego� nauczy�.
	};
	Info_ClearChoices(dia_vatras_teach);
};

func void dia_vatras_teach_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,50);
	Info_ClearChoices(dia_vatras_teach);
	Info_AddChoice(dia_vatras_teach,DIALOG_BACK,dia_vatras_teach_back);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_vatras_teach_1);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_vatras_teach_5);
};

func void dia_vatras_teach_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,50);
	Info_ClearChoices(dia_vatras_teach);
	Info_AddChoice(dia_vatras_teach,DIALOG_BACK,dia_vatras_teach_back);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_vatras_teach_1);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_vatras_teach_5);
};


instance DIA_VATRAS_GODS(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 98;
	condition = dia_vatras_gods_condition;
	information = dia_vatras_gods_info;
	permanent = TRUE;
	description = "Opowiedz mi o bogach.";
};


func int dia_vatras_gods_condition()
{
	return TRUE;
};

func void dia_vatras_gods_info()
{
	AI_Output(other,self,"DIA_Vatras_GODS_15_00");	//Opowiedz mi o bogach.
	AI_Output(self,other,"DIA_Vatras_GODS_05_01");	//A co dok�adnie chcia�by� o nich wiedzie�?
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Innosie.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Adanosie.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Beliarze.",dia_vatras_gods_beliar);
};

func void dia_vatras_gods_back()
{
	Info_ClearChoices(dia_vatras_gods);
};

func void dia_vatras_gods_innos()
{
	AI_Output(other,self,"DIA_Vatras_GODS_INNOS_15_00");	//Opowiedz mi o Innosie.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_01");	//Dobrze. Innos jest pierwszym i najpot�niejszym z bog�w. To on da� �wiatu S�o�ce.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_02");	//W jego w�adaniu znajduj� si� �wiat�o i ogie�, kt�re podarowa� ludzko�ci. Innos jest te� sprawiedliwo�ci� i prawem.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_03");	//Jego kap�anami s� Magowie Ognia, a wojownikami - m�ni paladyni.
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Innosie.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Adanosie.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Beliarze.",dia_vatras_gods_beliar);
};

func void dia_vatras_gods_adanos()
{
	AI_Output(other,self,"DIA_Vatras_GODS_ADANOS_15_00");	//Opowiedz mi o Adanosie.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_01");	//Adanos jest bogiem harmonii. To boski stra�nik r�wnowagi pomi�dzy Innosem i Beliarem.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_02");	//Jest te� wielkim sprawc� zmian i panem w�d wszystkich m�rz, rzek i jezior.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_03");	//Jego oddanymi s�ugami s� moi bracia, Magowie Wody.
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Innosie.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Adanosie.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Beliarze.",dia_vatras_gods_beliar);
};

func void dia_vatras_gods_beliar()
{
	AI_Output(other,self,"DIA_Vatras_GODS_BELIAR_15_00");	//Opowiedz mi o Beliarze.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_01");	//Beliar jest mrocznym bogiem �mierci, zniszczenia i wszystkich rzeczy nienaturalnych.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_02");	//Toczy on wieczn� wojn� z Innosem, ale Adanos dba, by ich si�y zawsze by�y wyr�wnane.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_03");	//Niewielu ludzi pozostaje w s�u�bie Beliara, ale s� oni niezwykle pot�ni.
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Innosie.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Adanosie.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Beliarze.",dia_vatras_gods_beliar);
};


instance DIA_VATRAS_HEAL(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 99;
	condition = dia_vatras_heal_condition;
	information = dia_vatras_heal_info;
	permanent = TRUE;
	description = "Mo�esz mnie uzdrowi�?";
};


func int dia_vatras_heal_condition()
{
	return TRUE;
};

func void dia_vatras_heal_info()
{
	AI_Output(other,self,"DIA_Vatras_HEAL_15_00");	//Mo�esz mnie uzdrowi�?
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		if(VATRAS_HEAL_DAY == Wld_GetDay())
		{
			AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_02");	//Pami�taj jednak, �e mog� ci pom�c tylko ograniczon� liczb� razy.
			AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_02");	//Tak, wiem.
		}
		else
		{
			VATRAS_HEAL_DAY = Wld_GetDay();
			AI_Output(self,other,"DIA_Vatras_HEAL_05_01");	//Adanosie, pob�ogos�aw to cia�o, uwolnij je od ran i tchnij w nie nowe �ycie!
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			PrintScreen(PRINT_FULLYHEALED,-1,-1,FONT_SCREEN,2);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_HEAL_05_02");	//Nie potrzebujesz pomocy uzdrowiciela.
	};
};

func void b_sayvatrasgo()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_13");	//Dobrze. Ruszaj teraz w drog� do Mistrza Isgarotha.
};


instance DIA_VATRAS_MISSION(C_INFO)
{
	npc = vlk_439_vatras;
	condition = dia_vatras_mission_condition;
	information = dia_vatras_mission_info;
	important = TRUE;
};


func int dia_vatras_mission_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_vatras_mission_info()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_10");	//Mam wiadomo�� dla Mistrza Isgarotha. Strze�e on kaplicy przed klasztorem.
	AI_Output(self,other,"DIA_Vatras_MISSION_05_01");	//Je�li podejmiesz si� wykona� to zadanie, b�dziesz m�g� sam sobie wybra� nagrod�.
	Info_ClearChoices(dia_vatras_mission);
	Info_AddChoice(dia_vatras_mission,"Poszukaj sobie innego ch�opca na posy�ki, starcze.",dia_vatras_mission_no);
	Info_AddChoice(dia_vatras_mission,"Mo�esz na mnie liczy�.",dia_vatras_mission_yes);
};

func void dia_vatras_mission_yes()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_YES_15_00");	//Mo�esz na mnie liczy�.
	AI_Output(self,other,"DIA_Vatras_Add_05_11");	//�wietnie. Zabierz zatem t� wiadomo�� i wybierz jeden ze zwoj�w z zakl�ciami.
	AI_Output(self,other,"DIA_Vatras_Add_05_12");	//Gdy dostarczysz wiadomo��, otrzymasz odpowiedni� nagrod�.
	b_giveinvitems(self,hero,5673,1);
	MIS_VATRAS_MESSAGE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BOTSCHAFT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BOTSCHAFT,LOG_RUNNING);
	b_logentry(TOPIC_BOTSCHAFT,"Vatras da� mi wiadomo�� dla Mistrza Isgarotha, kt�rego znajd� w kaplicy przed klasztorem.");
	Info_ClearChoices(dia_vatras_mission);
	Info_AddChoice(dia_vatras_mission,"Wezm� zakl�cie �wiat�a.",dia_vatras_mission_light);
	Info_AddChoice(dia_vatras_mission,"Wybieram zakl�cie uzdrawiaj�ce.",dia_vatras_mission_heal);
	Info_AddChoice(dia_vatras_mission,"Daj mi Lodow� Strza��.",dia_vatras_mission_ice);
};

func void dia_vatras_mission_no()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_NO_15_00");	//Poszukaj sobie innego ch�opca na posy�ki, starcze.
	MIS_VATRAS_MESSAGE = LOG_OBSOLETE;
	Info_ClearChoices(dia_vatras_mission);
};

func void dia_vatras_mission_heal()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_HEAL_15_00");	//Wybieram zakl�cie uzdrawiaj�ce.
	b_sayvatrasgo();
	b_giveinvitems(self,hero,5555,1);
	Info_ClearChoices(dia_vatras_mission);
};

func void dia_vatras_mission_ice()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_ICE_15_00");	//Daj mi Lodow� Strza��.
	b_sayvatrasgo();
	b_giveinvitems(self,hero,5554,1);
	Info_ClearChoices(dia_vatras_mission);
};

func void dia_vatras_mission_light()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_LIGHT_15_00");	//Wezm� zakl�cie �wiat�a.
	b_sayvatrasgo();
	b_giveinvitems(self,hero,5552,1);
	Info_ClearChoices(dia_vatras_mission);
};


instance DIA_VATRAS_MESSAGE_SUCCESS(C_INFO)
{
	npc = vlk_439_vatras;
	condition = dia_vatras_message_success_condition;
	information = dia_vatras_message_success_info;
	description = "Dostarczy�em twoj� wiadomo��.";
};


func int dia_vatras_message_success_condition()
{
	if((MIS_VATRAS_MESSAGE == LOG_RUNNING) && (VATRAS_RETURN == TRUE))
	{
		return TRUE;
	};
};

func void dia_vatras_message_success_info()
{
	AI_Output(other,self,"DIA_Vatras_MESSAGE_SUCCESS_15_00");	//Dostarczy�em twoj� wiadomo��.
	AI_Output(self,other,"DIA_Vatras_Add_05_14");	//Przyjmij wi�c moje podzi�kowanie. Mo�esz teraz wybra� swoj� nagrod�.
	MIS_VATRAS_MESSAGE = LOG_SUCCESS;
	b_giveplayerxp(XP_VATRAS_MESSAGE);
	Info_ClearChoices(dia_vatras_message_success);
	Info_AddChoice(dia_vatras_message_success,"1 szczaw kr�lewski",dia_vatras_message_success_plant);
	Info_AddChoice(dia_vatras_message_success,"Pier�cie� zr�czno�ci",dia_vatras_message_success_ring);
	Info_AddChoice(dia_vatras_message_success,"1 bry�ka rudy",dia_vatras_message_success_ore);
};

func void dia_vatras_message_success_plant()
{
	b_giveinvitems(self,hero,5215,1);
	Info_ClearChoices(dia_vatras_message_success);
};

func void dia_vatras_message_success_ring()
{
	b_giveinvitems(self,hero,5365,1);
	Info_ClearChoices(dia_vatras_message_success);
};

func void dia_vatras_message_success_ore()
{
	b_giveinvitems(self,hero,5112,1);
	Info_ClearChoices(dia_vatras_message_success);
};


const int KURZ = 0;
const int LANG = 1;
var int vatras_einmallangweg;

func void b_vatras_geheweg(var int dauer)
{
	if(VATRAS_EINMALLANGWEG == TRUE)
	{
		return;
	};
	if((Npc_GetDistToWP(self,"NW_CITY_MERCHANT_TEMPLE_FRONT") <= 500) && Npc_WasInState(self,zs_preach_vatras))
	{
		b_stoplookat(self);
		AI_AlignToWP(self);
		AI_Output(self,other,"DIA_Vatras_Add_05_06");	//S�uchajcie, moi drodzy! Jestem potrzebny gdzie indziej.
		if(dauer == KURZ)
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_07");	//To nie potrwa d�ugo. Po powrocie opowiem wam reszt� tej historii.
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_08");	//Nie wiem, kiedy powr�c�. Je�li chcecie pozna� zako�czenie tej historii, przeczytajcie odpowiednie pisma.
			VATRAS_EINMALLANGWEG = TRUE;
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_09");	//Niech Adanos b�dzie z wami!
		b_turntonpc(self,other);
	};
	VATRAS_SCHICKELEUTEWEG = TRUE;
};


instance DIA_VATRAS_INNOSEYEKAPUTT(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 32;
	condition = dia_vatras_innoseyekaputt_condition;
	information = dia_vatras_innoseyekaputt_info;
	description = "Oko Innosa zosta�o uszkodzone.";
};


func int dia_vatras_innoseyekaputt_condition()
{
	if((Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_vatras_innoseyekaputt_info()
{
	if(MIS_PYROKAR_GOTOVATRASINNOSEYE == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_00");	//Przysy�a mnie Pyrokar.
	}
	else if(MIS_XARDAS_GOTOVATRASINNOSEYE == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_01");	//Przysy�a mnie Xardas.
	};
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_02");	//Oko Innosa zosta�o uszkodzone.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_03");	//Wiem. Donie�li mi o tym napotkani nowicjusze.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_04");	//Poszukiwacze wykorzystali w tym celu �wi�ty S�oneczny Kr�g Mag�w Ognia.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_05");	//To znak, �e nieprzyjaciel znacznie ur�s� w si��.
	Info_ClearChoices(dia_vatras_innoseyekaputt);
	Info_AddChoice(dia_vatras_innoseyekaputt,"Wie�ci szybko si� roznosz�.",dia_vatras_innoseyekaputt_schnellenachrichten);
	if((hero.guild == GIL_KDF) && (MIS_PYROKAR_GOTOVATRASINNOSEYE == LOG_RUNNING))
	{
		Info_AddChoice(dia_vatras_innoseyekaputt,"Dlaczego Pyrokar przys�a� mnie w�a�nie do ciebie - Maga Wody?",dia_vatras_innoseyekaputt_warumdu);
	};
	Info_AddChoice(dia_vatras_innoseyekaputt,"Co si� teraz stanie z Okiem?",dia_vatras_innoseyekaputt_auge);
};

func void dia_vatras_innoseyekaputt_auge()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_15_00");	//Co si� teraz stanie z Okiem?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_01");	//Musimy spr�bowa� je naprawi�. Nie b�dzie to jednak �atwe zadanie.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_02");	//Oprawa p�k�a na dwie cz�ci. Zr�czny kowal zdo�a zapewne po��czy� je z powrotem.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_03");	//Ale to mniejsza cz�� problemu. Bardziej martwi mnie sam klejnot.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_04");	//Jest matowy, pozbawiony blasku. Nieprzyjaciel dok�adnie wiedzia�, jak unieszkodliwi� amulet.
	Info_AddChoice(dia_vatras_innoseyekaputt,"Gdzie znajd� kowala, kt�ry zdo�a naprawi� opraw� amuletu?",dia_vatras_innoseyekaputt_auge_schmied);
	Info_AddChoice(dia_vatras_innoseyekaputt,"Czy mo�emy przywr�ci� klejnotowi dawn� moc?",dia_vatras_innoseyekaputt_auge_stein);
};

func void dia_vatras_innoseyekaputt_auge_stein()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_15_00");	//Czy mo�emy przywr�ci� klejnotowi dawn� moc?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_01");	//Jest tylko jeden na to spos�b - po��czone moce wszystkich trzech bog�w powinny tego dokona�.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_02");	//W miejscu zniszczenia amuletu nale�y przeprowadzi� odpowiedni rytua� odwracaj�cy. Mo�e wtedy klejnot odzyska sw�j ogie�.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_03");	//Problem w tym, �e musisz sprowadzi� do tego miejsca ziemskich przedstawicieli wszystkich trzech bog�w.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_04");	//Potrzebujemy te� znacznej ilo�ci bagiennego ziela. My�l�, �e nie mniej ni� 3 ro�liny.
	Info_AddChoice(dia_vatras_innoseyekaputt,"Kim maj� by� ci trzej przedstawiciele bog�w?",dia_vatras_innoseyekaputt_auge_stein_wer);
	Info_AddChoice(dia_vatras_innoseyekaputt,"Gdzie mog� znale�� to bagienne ziele?",dia_vatras_innoseyekaputt_auge_stein_kraut);
};

func void dia_vatras_innoseyekaputt_auge_stein_kraut()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_15_00");	//Gdzie mog� znale�� to bagienne ziele?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_01");	//Podobno w tych lasach mieszka stara wied�ma imieniem Sagitta. Mo�e u niej znajdziesz takie ziele.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_02");	//Ewentualnie rozejrzyj si� troch� na przystani.
};

func void dia_vatras_innoseyekaputt_auge_stein_wer()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_15_00");	//Kim maj� by� ci trzej przedstawiciele bog�w?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_01");	//Adanosa mog� reprezentowa� osobi�cie.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_02");	//Przedstawicielem Innosa powinien by� Pyrokar, najwy�szy z Mag�w Ognia.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_03");	//Ale nie wiem, kto m�g�by reprezentowa� Beliara. Potrzebujemy prawdziwego mistrza czarnej magii.
	Info_AddChoice(dia_vatras_innoseyekaputt,"Czarnej magii? Mo�e Xardas?",dia_vatras_innoseyekaputt_auge_stein_wer_xardas);
};

func void dia_vatras_innoseyekaputt_auge_stein_wer_xardas()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_15_00");	//Czarnej magii? Mo�e Xardas?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_01");	//Tak! To si� powinno uda�!
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_02");	//Nie wiem tylko, czy uda ci si� sprowadzi� obydwu.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_03");	//Ju� widz� wyraz twarzy Pyrokara, gdy dowie si�, �e musi wsp�pracowa� z Xardasem.
	Info_AddChoice(dia_vatras_innoseyekaputt,"Musz� ju� i��.",dia_vatras_innoseyekaputt_auge_stein_wer_xardas_weiter);
};

func void dia_vatras_innoseyekaputt_auge_schmied()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_15_00");	//Gdzie znajd� kowala, kt�ry zdo�a naprawi� opraw� amuletu?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_05_01");	//Musisz popyta� ludzi o kowala, kt�ry zna si� na jubilerstwie.
};

func void dia_vatras_innoseyekaputt_warumdu()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_15_00");	//Dlaczego Pyrokar przys�a� mnie w�a�nie do ciebie - Maga Wody?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_01");	//Podejrzewa�em, �e pr�dzej czy p�niej dojdzie do czego� takiego.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_02");	//Pyrokar ma si� za tak pot�nego i niezwyci�onego, �e cz�sto zachowuje si� wr�cz nieodpowiedzialnie.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_03");	//I zosta� za to ukarany - straci� Oko Innosa.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_04");	//My�l� jednak, �e pod�wiadomie polega na mocy powierzonej mi przez Adanosa.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_05");	//Lepiej nie my�le�, co by si� sta�o, gdyby mnie teraz zabrak�o.
};

func void dia_vatras_innoseyekaputt_schnellenachrichten()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_15_00");	//Wie�ci szybko si� rozchodz�.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_05_01");	//I bardzo dobrze. Nieprzyjaciel te� nie b�dzie czeka� bezczynnie.
};

func void dia_vatras_innoseyekaputt_auge_stein_wer_xardas_weiter()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_weiter_15_00");	//Musz� ju� i��.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_01");	//Ja te� wyrusz� w drog�, by przygotowa� S�oneczny Kr�g do ceremonii.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_02");	//Przy�lij do mnie Xardasa i Pyrokara. I nie zapomnij o bagiennym zielu! Licz� na ciebie.
	b_logentry(TOPIC_INNOSEYE,"Vatras chce odprawi� rytua� w Kr�gu Ognia, aby uzdrowi� Oko. Musz� przekona� Xardasa i Pyrokara, aby wzi�li udzia� w tym przedsi�wzi�ciu. Powinienem tak�e znale�� kowala, kt�ry naprawi p�kni�t� opraw� amuletu.");
	MIS_RITUALINNOSEYEREPAIR = LOG_RUNNING;
	Info_ClearChoices(dia_vatras_innoseyekaputt);
	Npc_ExchangeRoutine(self,"RITUALINNOSEYEREPAIR");
	b_vatras_geheweg(KURZ);
	dmt_1201.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1202.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1203.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1204.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1205.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1206.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1207.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1208.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1209.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1210.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1211.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_startotherroutine(dmt_1201,"AfterRitual");
	b_startotherroutine(dmt_1202,"AfterRitual");
	b_startotherroutine(dmt_1203,"AfterRitual");
	b_startotherroutine(dmt_1204,"AfterRitual");
	b_startotherroutine(dmt_1205,"AfterRitual");
	b_startotherroutine(dmt_1206,"AfterRitual");
	b_startotherroutine(dmt_1207,"AfterRitual");
	b_startotherroutine(dmt_1208,"AfterRitual");
	b_startotherroutine(dmt_1209,"AfterRitual");
	b_startotherroutine(dmt_1210,"AfterRitual");
	b_startotherroutine(dmt_1211,"AfterRitual");
};


instance DIA_VATRAS_RITUALINNOSEYEREPAIR(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 33;
	condition = dia_vatras_ritualinnoseyerepair_condition;
	information = dia_vatras_ritualinnoseyerepair_info;
	permanent = TRUE;
	description = "Co z Okiem Innosa?";
};


func int dia_vatras_ritualinnoseyerepair_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_vatras_ritualinnoseyerepair_info()
{
	AI_Output(other,self,"DIA_Vatras_RitualInnosEyeRepair_15_00");	//Co z Okiem Innosa?
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_01");	//Tylko rytua� odwr�cenia odprawiony w S�onecznym Kr�gu przeze mnie, Xardasa i Pyrokara mo�e przywr�ci� Oku dawn� moc.
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_02");	//Pami�taj, �eby przynie�� Oko z naprawion� opraw�.
};


instance DIA_VATRAS_BEGINN(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 31;
	condition = dia_vatras_beginn_condition;
	information = dia_vatras_beginn_info;
	description = "Zrobi�em wszystko, o co prosi�e�.";
};


func int dia_vatras_beginn_condition()
{
	if((KAPITEL == 3) && (Npc_GetDistToWP(self,"NW_TROLLAREA_RITUAL_02") < 2000) && (Npc_GetDistToWP(xardas,"NW_TROLLAREA_RITUAL_02") < 2000) && (Npc_GetDistToWP(pyrokar,"NW_TROLLAREA_RITUAL_02") < 2000) && Npc_HasItems(other,itmi_innoseye_broken_mis) && (MIS_BENNET_INNOSEYEREPAIREDSETTING == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_vatras_beginn_info()
{
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_00");	//Zrobi�em wszystko, o co prosi�e�. Oto naprawione Oko.
	b_giveplayerxp(XP_RITUALINNOSEYERUNS);
	b_giveinvitems(other,self,5773,1);
	Npc_RemoveInvItem(self,itmi_innoseye_broken_mis);
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_01");	//�wietnie. Mo�emy zatem przyst�pi� do odprawienia rytua�u.
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_02");	//A co z bagiennym zielem?
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_03");	//Ach, tak. Przynios�e� dla mnie trzy ro�liny?
	if(b_giveinvitems(other,self,5183,3))
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_04");	//Tak. Oto one.
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_05");	//Znakomicie.
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_06");	//Nie. Niestety, nie.
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_07");	//Trudno. Poradzimy sobie jako� bez nich.
	};
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_08");	//Dobrze si� spisa�e�, ale teraz odsu� si� na bok, by�my mogli przyst�pi� do ceremonii. Niech zjednocz� si� nasze si�y!
	Info_ClearChoices(dia_vatras_beginn);
	Info_AddChoice(dia_vatras_beginn,DIALOG_ENDE,dia_vatras_beginn_los);
};

func void dia_vatras_beginn_los()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RITUALINNOSEYE");
	b_startotherroutine(xardas,"RITUALINNOSEYE");
	b_startotherroutine(pyrokar,"RITUALINNOSEYE");
	Npc_SetRefuseTalk(self,60);
	RITUALINNOSEYERUNS = LOG_RUNNING;
};


instance DIA_VATRAS_AUGEGEHEILT(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 33;
	condition = dia_vatras_augegeheilt_condition;
	information = dia_vatras_augegeheilt_info;
	important = TRUE;
};


func int dia_vatras_augegeheilt_condition()
{
	if((KAPITEL == 3) && (RITUALINNOSEYERUNS == LOG_RUNNING) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_augegeheilt_info()
{
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_00");	//Ju� po wszystkim. Uda�o si� nam pokrzy�owa� plan nieprzyjaciela. Oko odzyska�o sw� moc!
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_01");	//Pyrokar wyja�ni ci, jak u�ywa� Oka.
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_02");	//Mam nadziej�, �e spotkamy si� jeszcze, gdy wype�nisz ju� swoj� misj�. Bywaj!
	b_logentry(TOPIC_INNOSEYE,"Oko zosta�o uzdrowione. Kiedy Pyrokar mi je wr�czy, udam si� na polowanie na smoki.");
	AI_StopProcessInfos(self);
	RITUALINNOSEYERUNS = LOG_SUCCESS;
	MIS_RITUALINNOSEYEREPAIR = LOG_SUCCESS;
	b_startotherroutine(pyrokar,"RitualInnosEyeRepair");
	b_startotherroutine(xardas,"RitualInnosEyeRepair");
	b_startotherroutine(vlk_455_buerger,"START");
	b_startotherroutine(vlk_454_buerger,"START");
	b_startotherroutine(vlk_428_buergerin,"START");
	b_startotherroutine(vlk_450_buerger,"START");
	b_startotherroutine(vlk_426_buergerin,"START");
	b_startotherroutine(vlk_421_valentino,"START");
};


instance DIA_VATRAS_PERMKAP3(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 33;
	condition = dia_vatras_permkap3_condition;
	information = dia_vatras_permkap3_info;
	description = "Dzi�ki ci za pomoc w naprawieniu Oka Innosa.";
};


func int dia_vatras_permkap3_condition()
{
	if(MIS_RITUALINNOSEYEREPAIR == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_vatras_permkap3_info()
{
	AI_Output(other,self,"DIA_Vatras_PERMKAP3_15_00");	//Dzi�ki ci za pomoc w naprawieniu Oka Innosa.
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_01");	//Zachowaj podzi�kowania na p�niej. Czeka ci� teraz najwi�ksze wyzwanie.
	if(MIS_READYFORCHAPTER4 == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_02");	//Porozmawiaj z Pyrokarem. On ci wszystko wyt�umaczy.
	};
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_03");	//Mam nadziej�, �e jeszcze si� kiedy� spotkamy, m�j synu.
};


instance DIA_VATRAS_HILDAKRANK(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 34;
	condition = dia_vatras_hildakrank_condition;
	information = dia_vatras_hildakrank_info;
	description = "�ona Lobarta, Hilda, zachorowa�a.";
};


func int dia_vatras_hildakrank_condition()
{
	if((MIS_HEALHILDA == LOG_RUNNING) && Npc_KnowsInfo(other,dia_vatras_greet))
	{
		return TRUE;
	};
};

func void dia_vatras_hildakrank_info()
{
	AI_Output(other,self,"DIA_Vatras_HILDAKRANK_15_00");	//�ona Lobarta, Hilda, zachorowa�a.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_01");	//Co? Znowu? Ta biedna kobieta powinna bardziej na siebie uwa�a�.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_02");	//Jeszcze jedna ci�ka zima, a odejdzie z tego �wiata. Dobrze. Dam jej lekarstwo, kt�re zmniejszy gor�czk�.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_03");	//Hmmm... Skoro ju� tu jeste�, m�g�by� jej zanie�� lekarstwo?
	CreateInvItems(self,itpo_healhilda_mis,1);
	b_giveinvitems(self,other,5790,1);
};


instance DIA_VATRAS_OBSESSION(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 35;
	condition = dia_vatras_obsession_condition;
	information = dia_vatras_obsession_info;
	description = "Chyba mam dreszcze.";
};


func int dia_vatras_obsession_condition()
{
	if((SC_ISOBSESSED == TRUE) && (SC_OBSESSIONTIMES < 1))
	{
		return TRUE;
	};
};

func void dia_vatras_obsession_info()
{
	AI_Output(other,self,"DIA_Vatras_OBSESSION_15_00");	//Chyba mam dreszcze.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_01");	//Nie wygl�dasz najlepiej. Chyba zbyt d�ugo wystawia�e� si� na czarne spojrzenia Poszukiwaczy.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_02");	//Mog� uzdrowi� twoje cia�o, ale spok�j duszy odzyskasz jedynie w klasztorze. Porozmawiaj z Pyrokarem. On ci pomo�e.
};


instance DIA_VATRAS_ALLDRAGONSDEAD(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 59;
	condition = dia_vatras_alldragonsdead_condition;
	information = dia_vatras_alldragonsdead_info;
	description = "Nie musimy ju� obawia� si� smok�w.";
};


func int dia_vatras_alldragonsdead_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_vatras_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_00");	//Nie musimy ju� obawia� si� smok�w.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_01");	//Wiedzia�em, �e wr�cisz ca�y i zdrowy! Jednak najwi�ksze wyzwanie dopiero przed tob�.
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_02");	//Tak, wiem.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_03");	//Zatem wyposa� si� odpowiednio i przyjd� do mnie, gdyby� potrzebowa� pomocy. Zawsze miej przy sobie Oko Innosa! Niech Adanos b�dzie z tob�.
};


instance DIA_VATRAS_KNOWWHEREENEMY(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 55;
	condition = dia_vatras_knowwhereenemy_condition;
	information = dia_vatras_knowwhereenemy_info;
	permanent = TRUE;
	description = "Wiem, gdzie czai si� nasz nieprzyjaciel.";
};


func int dia_vatras_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (VATRAS_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_00");	//Wiem, gdzie czai si� nasz nieprzyjaciel.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_01");	//Zatem nie tra�my czasu i pierwsi si� z nim rozprawmy.
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_02");	//Chcesz mi towarzyszy�?
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_03");	//D�ugo si� nad tym zastanawia�em, ale teraz nie mam w�tpliwo�ci. Chc� wyruszy� z tob�.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Vatras, ku mojemu zaskoczeniu, chce mi towarzyszy� w mojej wyprawie. Tak do�wiadczony towarzysz by�by dla mnie prawdziwym skarbem.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_04");	//Moja za�oga jest i tak bardzo liczna. Obawiam si�, �e mo�e dla ciebie zabrakn�� miejsca.
		AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_05");	//Zatem zwolnij dla mnie miejsce. B�d� ci potrzebny.
	}
	else
	{
		Info_ClearChoices(dia_vatras_knowwhereenemy);
		Info_AddChoice(dia_vatras_knowwhereenemy,"Musz� to sobie jeszcze przemy�le�.",dia_vatras_knowwhereenemy_no);
		Info_AddChoice(dia_vatras_knowwhereenemy,"Jestem zaszczycony twoj� propozycj�.",dia_vatras_knowwhereenemy_yes);
	};
};

func void dia_vatras_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_Yes_15_00");	//Jestem zaszczycony twoj� propozycj�. Spotkamy si� na przystani.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_Yes_05_01");	//Spiesz si�. Nieprzyjaciel nie zasypia gruszek w popiele.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	self.flags = NPC_FLAG_IMMORTAL;
	VATRAS_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	b_vatras_geheweg(LANG);
	Info_ClearChoices(dia_vatras_knowwhereenemy);
};

func void dia_vatras_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_No_15_00");	//Musz� to sobie jeszcze przemy�le�.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_No_05_01");	//Jak uwa�asz. Wr�� do mnie, gdy ju� podejmiesz decyzj�.
	VATRAS_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_vatras_knowwhereenemy);
};


instance DIA_VATRAS_LEAVEMYSHIP(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 55;
	condition = dia_vatras_leavemyship_condition;
	information = dia_vatras_leavemyship_info;
	permanent = TRUE;
	description = "Lepiej b�dzie, je�li tu zostaniesz. To miasto ci� potrzebuje.";
};


func int dia_vatras_leavemyship_condition()
{
	if((VATRAS_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_leavemyship_info()
{
	AI_Output(other,self,"DIA_Vatras_LeaveMyShip_15_00");	//Lepiej b�dzie, je�li tu zostaniesz. To miasto ci� potrzebuje.
	AI_Output(self,other,"DIA_Vatras_LeaveMyShip_05_01");	//Mo�e masz racj�... Mimo to, je�li zechcesz, wyrusz� z tob�! Pami�taj o tym.
	VATRAS_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"PRAY");
};


instance DIA_VATRAS_STILLNEEDYOU(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 55;
	condition = dia_vatras_stillneedyou_condition;
	information = dia_vatras_stillneedyou_info;
	permanent = TRUE;
	description = "Chc� ci� zabra� na wysp� nieprzyjaciela.";
};


func int dia_vatras_stillneedyou_condition()
{
	if(((VATRAS_ISONBOARD == LOG_OBSOLETE) || (VATRAS_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_vatras_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Vatras_StillNeedYou_15_00");	//Chc� ci� zabra� na wysp� nieprzyjaciela.
	AI_Output(self,other,"DIA_Vatras_StillNeedYou_05_01");	//M�dra decyzja. Mam nadziej�, �e ostateczna?
	self.flags = NPC_FLAG_IMMORTAL;
	VATRAS_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	b_vatras_geheweg(LANG);
	AI_StopProcessInfos(self);
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};

