
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
	AI_Output(self,other,"DIA_Vatras_GREET_05_00");	//Niech ³aska Adanosa bêdzie z tob¹.
	AI_Output(other,self,"DIA_Vatras_GREET_15_01");	//Kim jesteœ?
	AI_Output(self,other,"DIA_Vatras_GREET_05_02");	//Nazywam siê Vatras. Jestem s³ug¹ Adanosa, stra¿nika niebiañskiej i ziemskiej harmonii.
	AI_Output(self,other,"DIA_Vatras_GREET_05_03");	//Co mogê dla ciebie zrobiæ?
};


instance DIA_VATRAS_INFLUENCE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_vatras_influence_condition;
	information = dia_vatras_influence_info;
	permanent = FALSE;
	description = "Przybywam, by prosiæ ciê o b³ogos³awieñstwo.";
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
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_00");	//Przybywam, by prosiæ ciê o b³ogos³awieñstwo.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_01");	//Dlaczegó¿ mia³bym ciê pob³ogos³awiæ, nieznajomy?
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_02");	//Chcê zostaæ czeladnikiem u jednego z mistrzów w dolnej czêœci miasta.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_03");	//Mogê udzieliæ ci b³ogos³awieñstwa, przybyszu, ale przecie¿ nic o tobie nie wiem! Opowiedz mi trochê o sobie.
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_04");	//A co chcia³byœ wiedzieæ?
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_05");	//Powiedz mi, sk¹d pochodzisz... i co sprowadza ciê do tego miasta.
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_06");	//Mam wa¿n¹ wiadomoœæ dla przywódcy paladynów.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_07");	//Co to za wiadomoœæ?
	Info_ClearChoices(dia_vatras_influence);
	Info_AddChoice(dia_vatras_influence,"Przyby³y smoki...",dia_vatras_influence_first_truth);
	Info_AddChoice(dia_vatras_influence,"Wkrótce wydarz¹ siê straszliwe rzeczy.",dia_vatras_influence_first_lie);
};

func void dia_vatras_influence_first_truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_15_00");	//Niedaleko st¹d zbiera siê potê¿na armia. Jej przywódcami s¹ smoki, a celem podbój ca³ego kraju.
	if(VATRAS_FIRST == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_01");	//Hmmm. Jeœli mówisz prawdê, to równowaga na tych ziemiach zosta³a zak³ócona. Kto ci o tym powiedzia³?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_02");	//Smoki? Mówisz o istotach, o których zwykle wspominaj¹ tylko legendy. Kto ci o tym powiedzia³?
	};
	Info_ClearChoices(dia_vatras_influence);
	Info_AddChoice(dia_vatras_influence,"Ach, s³ysza³em jakieœ plotki...",dia_vatras_influence_second_lie);
	Info_AddChoice(dia_vatras_influence,"Powiedzia³ mi o tym mag Xardas...",dia_vatras_influence_second_truth);
	VATRAS_FIRST = TRUE;
};

func void dia_vatras_influence_first_lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_LIE_15_00");	//Wkrótce wydarz¹ siê straszliwe rzeczy.
	if(VATRAS_FIRST == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_01");	//Aha! A kto ci o tym powiedzia³?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_02");	//Straszliwe rzeczy, tak? A sk¹d to przypuszczenie?
	};
	Info_ClearChoices(dia_vatras_influence);
	Info_AddChoice(dia_vatras_influence,"Ach, s³ysza³em jakieœ plotki...",dia_vatras_influence_second_lie);
	Info_AddChoice(dia_vatras_influence,"Powiedzia³ mi o tym mag Xardas...",dia_vatras_influence_second_truth);
	VATRAS_FIRST = 2;
};

func void dia_vatras_influence_second_truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_15_00");	//Powiedzia³ mi o tym mag Xardas. To on wys³a³ mnie, bym ostrzeg³ paladynów.
	if(VATRAS_SECOND == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_01");	//Wiem, ¿e jest on m¹drym i potê¿nym mistrzem magii. Powiedz mi jeszcze, sk¹d przybywasz?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_02");	//Ten nekromanta... A wiêc ¿yje... i on ciê tu przys³a³? Kim jesteœ naprawdê?
	};
	Info_ClearChoices(dia_vatras_influence);
	Info_AddChoice(dia_vatras_influence,"Podró¿nikiem z dalekiego po³udnia...",dia_vatras_influence_third_lie);
	Info_AddChoice(dia_vatras_influence,"Dawnym skazañcem...",dia_vatras_influence_third_truth);
	VATRAS_SECOND = TRUE;
};

func void dia_vatras_influence_second_lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_LIE_15_00");	//Ach, s³ysza³em jakieœ plotki...
	if(VATRAS_SECOND == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_01");	//A pamiêtasz chocia¿, GDZIE je s³ysza³eœ?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_02");	//Tak... I dlatego wyruszy³eœ w tê podró¿? Kim jesteœ naprawdê?
	};
	Info_ClearChoices(dia_vatras_influence);
	Info_AddChoice(dia_vatras_influence,"Podró¿nikiem z dalekiego po³udnia...",dia_vatras_influence_third_lie);
	Info_AddChoice(dia_vatras_influence,"Dawnym skazañcem...",dia_vatras_influence_third_truth);
	VATRAS_SECOND = 2;
};

func void dia_vatras_influence_third_truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_TRUTH_15_00");	//Dawnym skazañcem z wiêziennej kolonii Khorinis.
	Info_ClearChoices(dia_vatras_influence);
	Info_AddChoice(dia_vatras_influence,"Udzielisz mi teraz swojego b³ogos³awieñstwa?",dia_vatras_influence_repeat);
	VATRAS_THIRD = TRUE;
};

func void dia_vatras_influence_third_lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_LIE_15_00");	//Podró¿nikiem z dalekiego po³udnia...
	Info_ClearChoices(dia_vatras_influence);
	Info_AddChoice(dia_vatras_influence,"Udzielisz mi teraz swojego b³ogos³awieñstwa?",dia_vatras_influence_repeat);
	VATRAS_THIRD = 2;
};

func void dia_vatras_influence_repeat()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_REPEAT_15_00");	//Czy udzielisz mi teraz swojego b³ogos³awieñstwa?
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_01");	//Dobrze, podsumujmy:
	if(VATRAS_THIRD == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_02");	//Jesteœ zbieg³ym wiêŸniem, ...
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_03");	//Jesteœ podró¿nikiem z dalekiego po³udnia, ...
	};
	if(VATRAS_SECOND == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_04");	//... któremu nekromanta Xardas powiedzia³, ...
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_05");	//... który us³ysza³ plotki, ...
	};
	if(VATRAS_FIRST == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_06");	//... ¿e armia smoków zamierza podbiæ ca³y kraj.
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_07");	//... ¿e wydarz¹ siê wkrótce straszliwe rzeczy.
	};
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_08");	//I zamierzasz ostrzec o tym paladynów.
	if((VATRAS_FIRST == TRUE) && (VATRAS_SECOND == TRUE) && (VATRAS_THIRD == TRUE))
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_09");	//Brzmi to doœæ niewiarygodnie, ale nie wyczuwam, byæ próbowa³ mnie ok³amaæ.
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_10");	//Dlatego muszê przyj¹æ, ¿e kieruj¹ tob¹ szlachetne pobudki.
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_11");	//IdŸ wiêc z b³ogos³awieñstwem Adanosa, mój synu!
		Snd_Play("LevelUp");
		b_giveplayerxp(XP_VATRASTRUTH);
		VATRAS_SEGEN = TRUE;
		b_logentry(TOPIC_THORBEN,"Vatras, Mag Wody, udzieli³ mi b³ogos³awieñstwa.");
	}
	else if(VATRAS_CHANCE == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_Add_05_00");	//Myœlê, ¿e coœ przede mn¹ ukrywasz.
		AI_Output(self,other,"DIA_Vatras_Add_05_01");	//Jeœli obawiasz siê, ¿e przeka¿ê komuœ to, co mi powiesz, mo¿esz byæ spokojny.
		AI_Output(self,other,"DIA_Vatras_Add_05_02");	//Przysi¹g³em zachowywaæ wszystkie powierzane mi tajemnice dla siebie.
		if(Wld_IsTime(5,5,20,10))
		{
			AI_Output(other,self,"DIA_Vatras_Add_15_03");	//A co z tymi wszystkimi ludŸmi?
			AI_Output(self,other,"DIA_Vatras_Add_05_04");	//Oni nie rozumiej¹ nawet po³owy z tego, czego ich nauczam. Nie musisz siê obawiaæ.
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_05");	//Zacznijmy jeszcze raz, od pocz¹tku. Co to za wiadomoœæ?
		VATRAS_CHANCE = TRUE;
		Info_ClearChoices(dia_vatras_influence);
		Info_AddChoice(dia_vatras_influence,"Przyby³y smoki...",dia_vatras_influence_first_truth);
		Info_AddChoice(dia_vatras_influence,"Wkrótce wydarz¹ siê straszliwe rzeczy.",dia_vatras_influence_first_lie);
	}
	else if(VATRAS_CHANCE == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_13");	//Da³em ci dwie szanse na powiedzenie prawdy, ale najwyraŸniej bardzo siê przed tym wzbraniasz. Nie dostaniesz mojego b³ogos³awieñstwa.
	};
};


instance DIA_VATRAS_WOKDF(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 3;
	condition = dia_vatras_wokdf_condition;
	information = dia_vatras_wokdf_info;
	permanent = FALSE;
	description = "Gdzie mogê znaleŸæ jakiegoœ kap³ana Innosa?";
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
	AI_Output(other,self,"DIA_Vatras_WoKdF_15_00");	//Gdzie mogê znaleŸæ jakiegoœ kap³ana Innosa?
	AI_Output(self,other,"DIA_Vatras_WoKdF_05_01");	//Najlepiej rozejrzyj siê po targowisku. Znajdziesz tam wys³annika klasztoru.
};


instance DIA_VATRAS_SPENDE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 3;
	condition = dia_vatras_spende_condition;
	information = dia_vatras_spende_info;
	permanent = TRUE;
	description = "Chcia³bym przekazaæ datek na œwi¹tyniê Adanosa!";
};


func int dia_vatras_spende_condition()
{
	return TRUE;
};

func void dia_vatras_spende_info()
{
	AI_Output(other,self,"DIA_Vatras_Spende_15_00");	//Chcia³bym przekazaæ datek na œwi¹tyniê Adanosa!
	AI_Output(self,other,"DIA_Vatras_Spende_05_01");	//Datek na œwi¹tyniê Adanosa mo¿e zmazaæ czêœæ przewin, które pope³ni³eœ w przesz³oœci, mój synu.
	AI_Output(self,other,"DIA_Vatras_Spende_05_02");	//Jak¹ sumê zechcesz przekazaæ?
	Info_ClearChoices(dia_vatras_spende);
	Info_AddChoice(dia_vatras_spende,"Chwilowo nie mam pieniêdzy...",dia_vatras_spende_back);
	if(Npc_HasItems(other,itmi_gold) >= 50)
	{
		Info_AddChoice(dia_vatras_spende,"Mam 50 sztuk z³ota...",dia_vatras_spende_50);
	};
	if(Npc_HasItems(other,itmi_gold) >= 100)
	{
		Info_AddChoice(dia_vatras_spende,"Mam 100 sztuk z³ota...",dia_vatras_spende_100);
	};
};

func void dia_vatras_spende_back()
{
	AI_Output(other,self,"DIA_Vatras_Spende_BACK_15_00");	//Chwilowo nie mam pieniêdzy...
	AI_Output(self,other,"DIA_Vatras_Spende_BACK_05_01");	//Nic siê nie sta³o. Adanos zawsze ucieszy siê z twojej ofiary.
	Info_ClearChoices(dia_vatras_spende);
};

func void dia_vatras_spende_50()
{
	AI_Output(other,self,"DIA_Vatras_Spende_50_15_00");	//Mam 50 sztuk z³ota...
	AI_Output(self,other,"DIA_Vatras_Spende_50_05_01");	//Dziêkujê ci w imieniu Adanosa, mój synu. Twoje z³oto zostanie przekazane potrzebuj¹cym.
	b_giveinvitems(other,self,5113,50);
	Info_ClearChoices(dia_vatras_spende);
};

func void dia_vatras_spende_100()
{
	AI_Output(other,self,"DIA_Vatras_Spende_100_15_00");	//Mam 100 sztuk z³ota...
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_01");	//B¹dŸ b³ogos³awiony, mój synu! Dziêki ci za tw¹ hojnoœæ.
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_02");	//Niech Adanos strze¿e ciê zawsze od z³ej przygody.
	b_giveinvitems(other,self,5113,100);
	VATRAS_SEGEN = TRUE;
	Info_ClearChoices(dia_vatras_spende);
	if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
	{
		b_logentry(TOPIC_THORBEN,"Vatras, Mag Wody, udzieli³ mi b³ogos³awieñstwa.");
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
	AI_Output(self,other,"DIA_Vatras_DI_VatrasSucked_05_00");	//ZejdŸ mi z oczu, morderco. Na moj¹ pomoc nie masz co liczyæ.
	AI_StopProcessInfos(self);
};


instance DIA_VATRAS_CANTEACH(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_vatras_canteach_condition;
	information = dia_vatras_canteach_info;
	permanent = FALSE;
	description = "Mo¿esz nauczyæ mnie czegoœ o magii?";
};


func int dia_vatras_canteach_condition()
{
	return TRUE;
};

func void dia_vatras_canteach_info()
{
	AI_Output(other,self,"DIA_Vatras_CanTeach_15_00");	//Mo¿esz nauczyæ mnie czegoœ o magii?
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_01");	//Tylko Wybrañcy Innosa i Wybrañcy Adanosa mog¹ pos³ugiwaæ siê magi¹ run.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_02");	//Ale magia dostêpna jest tak¿e zwyk³ym œmiertelnikom, pod postaci¹ magicznych zwojów.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_03");	//Mogê ciê nauczyæ, jak lepiej wykorzystywaæ dostêpn¹ ci magiczn¹ moc.
	VATRAS_TEACHMANA = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Vatras, Mag Wody, mo¿e pomóc mi w zwiêkszeniu magicznych zdolnoœci.");
};


instance DIA_VATRAS_TEACH(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 100;
	condition = dia_vatras_teach_condition;
	information = dia_vatras_teach_info;
	permanent = TRUE;
	description = "Chcê zwiêkszyæ moj¹ magiczn¹ moc.";
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
	AI_Output(other,self,"DIA_Vatras_Teach_15_00");	//Chcê zwiêkszyæ moj¹ magiczn¹ moc.
	Info_ClearChoices(dia_vatras_teach);
	Info_AddChoice(dia_vatras_teach,DIALOG_BACK,dia_vatras_teach_back);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_vatras_teach_1);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_vatras_teach_5);
};

func void dia_vatras_teach_back()
{
	if(other.attribute[ATR_MANA_MAX] >= 50)
	{
		AI_Output(self,other,"DIA_Vatras_Teach_05_00");	//Jesteœ ju¿ zbyt potê¿ny, bym móg³ ciê czegoœ nauczyæ.
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
	AI_Output(self,other,"DIA_Vatras_GODS_05_01");	//A co dok³adnie chcia³byœ o nich wiedzieæ?
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
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_01");	//Dobrze. Innos jest pierwszym i najpotê¿niejszym z bogów. To on da³ œwiatu S³oñce.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_02");	//W jego w³adaniu znajduj¹ siê œwiat³o i ogieñ, które podarowa³ ludzkoœci. Innos jest te¿ sprawiedliwoœci¹ i prawem.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_03");	//Jego kap³anami s¹ Magowie Ognia, a wojownikami - mê¿ni paladyni.
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Innosie.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Adanosie.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Beliarze.",dia_vatras_gods_beliar);
};

func void dia_vatras_gods_adanos()
{
	AI_Output(other,self,"DIA_Vatras_GODS_ADANOS_15_00");	//Opowiedz mi o Adanosie.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_01");	//Adanos jest bogiem harmonii. To boski stra¿nik równowagi pomiêdzy Innosem i Beliarem.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_02");	//Jest te¿ wielkim sprawc¹ zmian i panem wód wszystkich mórz, rzek i jezior.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_03");	//Jego oddanymi s³ugami s¹ moi bracia, Magowie Wody.
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Innosie.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Adanosie.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"Opowiedz mi o Beliarze.",dia_vatras_gods_beliar);
};

func void dia_vatras_gods_beliar()
{
	AI_Output(other,self,"DIA_Vatras_GODS_BELIAR_15_00");	//Opowiedz mi o Beliarze.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_01");	//Beliar jest mrocznym bogiem œmierci, zniszczenia i wszystkich rzeczy nienaturalnych.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_02");	//Toczy on wieczn¹ wojnê z Innosem, ale Adanos dba, by ich si³y zawsze by³y wyrównane.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_03");	//Niewielu ludzi pozostaje w s³u¿bie Beliara, ale s¹ oni niezwykle potê¿ni.
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
	description = "Mo¿esz mnie uzdrowiæ?";
};


func int dia_vatras_heal_condition()
{
	return TRUE;
};

func void dia_vatras_heal_info()
{
	AI_Output(other,self,"DIA_Vatras_HEAL_15_00");	//Mo¿esz mnie uzdrowiæ?
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		if(VATRAS_HEAL_DAY == Wld_GetDay())
		{
			AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_02");	//Pamiêtaj jednak, ¿e mogê ci pomóc tylko ograniczon¹ liczbê razy.
			AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_02");	//Tak, wiem.
		}
		else
		{
			VATRAS_HEAL_DAY = Wld_GetDay();
			AI_Output(self,other,"DIA_Vatras_HEAL_05_01");	//Adanosie, pob³ogos³aw to cia³o, uwolnij je od ran i tchnij w nie nowe ¿ycie!
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
	AI_Output(self,other,"DIA_Vatras_Add_05_13");	//Dobrze. Ruszaj teraz w drogê do Mistrza Isgarotha.
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
	AI_Output(self,other,"DIA_Vatras_Add_05_10");	//Mam wiadomoœæ dla Mistrza Isgarotha. Strze¿e on kaplicy przed klasztorem.
	AI_Output(self,other,"DIA_Vatras_MISSION_05_01");	//Jeœli podejmiesz siê wykonaæ to zadanie, bêdziesz móg³ sam sobie wybraæ nagrodê.
	Info_ClearChoices(dia_vatras_mission);
	Info_AddChoice(dia_vatras_mission,"Poszukaj sobie innego ch³opca na posy³ki, starcze.",dia_vatras_mission_no);
	Info_AddChoice(dia_vatras_mission,"Mo¿esz na mnie liczyæ.",dia_vatras_mission_yes);
};

func void dia_vatras_mission_yes()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_YES_15_00");	//Mo¿esz na mnie liczyæ.
	AI_Output(self,other,"DIA_Vatras_Add_05_11");	//Œwietnie. Zabierz zatem tê wiadomoœæ i wybierz jeden ze zwojów z zaklêciami.
	AI_Output(self,other,"DIA_Vatras_Add_05_12");	//Gdy dostarczysz wiadomoœæ, otrzymasz odpowiedni¹ nagrodê.
	b_giveinvitems(self,hero,5673,1);
	MIS_VATRAS_MESSAGE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BOTSCHAFT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BOTSCHAFT,LOG_RUNNING);
	b_logentry(TOPIC_BOTSCHAFT,"Vatras da³ mi wiadomoœæ dla Mistrza Isgarotha, którego znajdê w kaplicy przed klasztorem.");
	Info_ClearChoices(dia_vatras_mission);
	Info_AddChoice(dia_vatras_mission,"Wezmê zaklêcie œwiat³a.",dia_vatras_mission_light);
	Info_AddChoice(dia_vatras_mission,"Wybieram zaklêcie uzdrawiaj¹ce.",dia_vatras_mission_heal);
	Info_AddChoice(dia_vatras_mission,"Daj mi Lodow¹ Strza³ê.",dia_vatras_mission_ice);
};

func void dia_vatras_mission_no()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_NO_15_00");	//Poszukaj sobie innego ch³opca na posy³ki, starcze.
	MIS_VATRAS_MESSAGE = LOG_OBSOLETE;
	Info_ClearChoices(dia_vatras_mission);
};

func void dia_vatras_mission_heal()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_HEAL_15_00");	//Wybieram zaklêcie uzdrawiaj¹ce.
	b_sayvatrasgo();
	b_giveinvitems(self,hero,5555,1);
	Info_ClearChoices(dia_vatras_mission);
};

func void dia_vatras_mission_ice()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_ICE_15_00");	//Daj mi Lodow¹ Strza³ê.
	b_sayvatrasgo();
	b_giveinvitems(self,hero,5554,1);
	Info_ClearChoices(dia_vatras_mission);
};

func void dia_vatras_mission_light()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_LIGHT_15_00");	//Wezmê zaklêcie œwiat³a.
	b_sayvatrasgo();
	b_giveinvitems(self,hero,5552,1);
	Info_ClearChoices(dia_vatras_mission);
};


instance DIA_VATRAS_MESSAGE_SUCCESS(C_INFO)
{
	npc = vlk_439_vatras;
	condition = dia_vatras_message_success_condition;
	information = dia_vatras_message_success_info;
	description = "Dostarczy³em twoj¹ wiadomoœæ.";
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
	AI_Output(other,self,"DIA_Vatras_MESSAGE_SUCCESS_15_00");	//Dostarczy³em twoj¹ wiadomoœæ.
	AI_Output(self,other,"DIA_Vatras_Add_05_14");	//Przyjmij wiêc moje podziêkowanie. Mo¿esz teraz wybraæ swoj¹ nagrodê.
	MIS_VATRAS_MESSAGE = LOG_SUCCESS;
	b_giveplayerxp(XP_VATRAS_MESSAGE);
	Info_ClearChoices(dia_vatras_message_success);
	Info_AddChoice(dia_vatras_message_success,"1 szczaw królewski",dia_vatras_message_success_plant);
	Info_AddChoice(dia_vatras_message_success,"Pierœcieñ zrêcznoœci",dia_vatras_message_success_ring);
	Info_AddChoice(dia_vatras_message_success,"1 bry³ka rudy",dia_vatras_message_success_ore);
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
		AI_Output(self,other,"DIA_Vatras_Add_05_06");	//S³uchajcie, moi drodzy! Jestem potrzebny gdzie indziej.
		if(dauer == KURZ)
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_07");	//To nie potrwa d³ugo. Po powrocie opowiem wam resztê tej historii.
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_08");	//Nie wiem, kiedy powrócê. Jeœli chcecie poznaæ zakoñczenie tej historii, przeczytajcie odpowiednie pisma.
			VATRAS_EINMALLANGWEG = TRUE;
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_09");	//Niech Adanos bêdzie z wami!
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
	description = "Oko Innosa zosta³o uszkodzone.";
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
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_00");	//Przysy³a mnie Pyrokar.
	}
	else if(MIS_XARDAS_GOTOVATRASINNOSEYE == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_01");	//Przysy³a mnie Xardas.
	};
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_02");	//Oko Innosa zosta³o uszkodzone.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_03");	//Wiem. Donieœli mi o tym napotkani nowicjusze.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_04");	//Poszukiwacze wykorzystali w tym celu œwiêty S³oneczny Kr¹g Magów Ognia.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_05");	//To znak, ¿e nieprzyjaciel znacznie urós³ w si³ê.
	Info_ClearChoices(dia_vatras_innoseyekaputt);
	Info_AddChoice(dia_vatras_innoseyekaputt,"Wieœci szybko siê roznosz¹.",dia_vatras_innoseyekaputt_schnellenachrichten);
	if((hero.guild == GIL_KDF) && (MIS_PYROKAR_GOTOVATRASINNOSEYE == LOG_RUNNING))
	{
		Info_AddChoice(dia_vatras_innoseyekaputt,"Dlaczego Pyrokar przys³a³ mnie w³aœnie do ciebie - Maga Wody?",dia_vatras_innoseyekaputt_warumdu);
	};
	Info_AddChoice(dia_vatras_innoseyekaputt,"Co siê teraz stanie z Okiem?",dia_vatras_innoseyekaputt_auge);
};

func void dia_vatras_innoseyekaputt_auge()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_15_00");	//Co siê teraz stanie z Okiem?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_01");	//Musimy spróbowaæ je naprawiæ. Nie bêdzie to jednak ³atwe zadanie.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_02");	//Oprawa pêk³a na dwie czêœci. Zrêczny kowal zdo³a zapewne po³¹czyæ je z powrotem.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_03");	//Ale to mniejsza czêœæ problemu. Bardziej martwi mnie sam klejnot.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_04");	//Jest matowy, pozbawiony blasku. Nieprzyjaciel dok³adnie wiedzia³, jak unieszkodliwiæ amulet.
	Info_AddChoice(dia_vatras_innoseyekaputt,"Gdzie znajdê kowala, który zdo³a naprawiæ oprawê amuletu?",dia_vatras_innoseyekaputt_auge_schmied);
	Info_AddChoice(dia_vatras_innoseyekaputt,"Czy mo¿emy przywróciæ klejnotowi dawn¹ moc?",dia_vatras_innoseyekaputt_auge_stein);
};

func void dia_vatras_innoseyekaputt_auge_stein()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_15_00");	//Czy mo¿emy przywróciæ klejnotowi dawn¹ moc?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_01");	//Jest tylko jeden na to sposób - po³¹czone moce wszystkich trzech bogów powinny tego dokonaæ.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_02");	//W miejscu zniszczenia amuletu nale¿y przeprowadziæ odpowiedni rytua³ odwracaj¹cy. Mo¿e wtedy klejnot odzyska swój ogieñ.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_03");	//Problem w tym, ¿e musisz sprowadziæ do tego miejsca ziemskich przedstawicieli wszystkich trzech bogów.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_04");	//Potrzebujemy te¿ znacznej iloœci bagiennego ziela. Myœlê, ¿e nie mniej ni¿ 3 roœliny.
	Info_AddChoice(dia_vatras_innoseyekaputt,"Kim maj¹ byæ ci trzej przedstawiciele bogów?",dia_vatras_innoseyekaputt_auge_stein_wer);
	Info_AddChoice(dia_vatras_innoseyekaputt,"Gdzie mogê znaleŸæ to bagienne ziele?",dia_vatras_innoseyekaputt_auge_stein_kraut);
};

func void dia_vatras_innoseyekaputt_auge_stein_kraut()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_15_00");	//Gdzie mogê znaleŸæ to bagienne ziele?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_01");	//Podobno w tych lasach mieszka stara wiedŸma imieniem Sagitta. Mo¿e u niej znajdziesz takie ziele.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_02");	//Ewentualnie rozejrzyj siê trochê na przystani.
};

func void dia_vatras_innoseyekaputt_auge_stein_wer()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_15_00");	//Kim maj¹ byæ ci trzej przedstawiciele bogów?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_01");	//Adanosa mogê reprezentowaæ osobiœcie.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_02");	//Przedstawicielem Innosa powinien byæ Pyrokar, najwy¿szy z Magów Ognia.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_03");	//Ale nie wiem, kto móg³by reprezentowaæ Beliara. Potrzebujemy prawdziwego mistrza czarnej magii.
	Info_AddChoice(dia_vatras_innoseyekaputt,"Czarnej magii? Mo¿e Xardas?",dia_vatras_innoseyekaputt_auge_stein_wer_xardas);
};

func void dia_vatras_innoseyekaputt_auge_stein_wer_xardas()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_15_00");	//Czarnej magii? Mo¿e Xardas?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_01");	//Tak! To siê powinno udaæ!
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_02");	//Nie wiem tylko, czy uda ci siê sprowadziæ obydwu.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_03");	//Ju¿ widzê wyraz twarzy Pyrokara, gdy dowie siê, ¿e musi wspó³pracowaæ z Xardasem.
	Info_AddChoice(dia_vatras_innoseyekaputt,"Muszê ju¿ iœæ.",dia_vatras_innoseyekaputt_auge_stein_wer_xardas_weiter);
};

func void dia_vatras_innoseyekaputt_auge_schmied()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_15_00");	//Gdzie znajdê kowala, który zdo³a naprawiæ oprawê amuletu?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_05_01");	//Musisz popytaæ ludzi o kowala, który zna siê na jubilerstwie.
};

func void dia_vatras_innoseyekaputt_warumdu()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_15_00");	//Dlaczego Pyrokar przys³a³ mnie w³aœnie do ciebie - Maga Wody?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_01");	//Podejrzewa³em, ¿e prêdzej czy póŸniej dojdzie do czegoœ takiego.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_02");	//Pyrokar ma siê za tak potê¿nego i niezwyciê¿onego, ¿e czêsto zachowuje siê wrêcz nieodpowiedzialnie.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_03");	//I zosta³ za to ukarany - straci³ Oko Innosa.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_04");	//Myœlê jednak, ¿e podœwiadomie polega na mocy powierzonej mi przez Adanosa.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_05");	//Lepiej nie myœleæ, co by siê sta³o, gdyby mnie teraz zabrak³o.
};

func void dia_vatras_innoseyekaputt_schnellenachrichten()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_15_00");	//Wieœci szybko siê rozchodz¹.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_05_01");	//I bardzo dobrze. Nieprzyjaciel te¿ nie bêdzie czeka³ bezczynnie.
};

func void dia_vatras_innoseyekaputt_auge_stein_wer_xardas_weiter()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_weiter_15_00");	//Muszê ju¿ iœæ.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_01");	//Ja te¿ wyruszê w drogê, by przygotowaæ S³oneczny Kr¹g do ceremonii.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_02");	//Przyœlij do mnie Xardasa i Pyrokara. I nie zapomnij o bagiennym zielu! Liczê na ciebie.
	b_logentry(TOPIC_INNOSEYE,"Vatras chce odprawiæ rytua³ w Krêgu Ognia, aby uzdrowiæ Oko. Muszê przekonaæ Xardasa i Pyrokara, aby wziêli udzia³ w tym przedsiêwziêciu. Powinienem tak¿e znaleŸæ kowala, który naprawi pêkniêt¹ oprawê amuletu.");
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
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_01");	//Tylko rytua³ odwrócenia odprawiony w S³onecznym Krêgu przeze mnie, Xardasa i Pyrokara mo¿e przywróciæ Oku dawn¹ moc.
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_02");	//Pamiêtaj, ¿eby przynieœæ Oko z naprawion¹ opraw¹.
};


instance DIA_VATRAS_BEGINN(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 31;
	condition = dia_vatras_beginn_condition;
	information = dia_vatras_beginn_info;
	description = "Zrobi³em wszystko, o co prosi³eœ.";
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
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_00");	//Zrobi³em wszystko, o co prosi³eœ. Oto naprawione Oko.
	b_giveplayerxp(XP_RITUALINNOSEYERUNS);
	b_giveinvitems(other,self,5773,1);
	Npc_RemoveInvItem(self,itmi_innoseye_broken_mis);
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_01");	//Œwietnie. Mo¿emy zatem przyst¹piæ do odprawienia rytua³u.
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_02");	//A co z bagiennym zielem?
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_03");	//Ach, tak. Przynios³eœ dla mnie trzy roœliny?
	if(b_giveinvitems(other,self,5183,3))
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_04");	//Tak. Oto one.
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_05");	//Znakomicie.
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_06");	//Nie. Niestety, nie.
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_07");	//Trudno. Poradzimy sobie jakoœ bez nich.
	};
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_08");	//Dobrze siê spisa³eœ, ale teraz odsuñ siê na bok, byœmy mogli przyst¹piæ do ceremonii. Niech zjednocz¹ siê nasze si³y!
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
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_00");	//Ju¿ po wszystkim. Uda³o siê nam pokrzy¿owaæ plan nieprzyjaciela. Oko odzyska³o sw¹ moc!
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_01");	//Pyrokar wyjaœni ci, jak u¿ywaæ Oka.
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_02");	//Mam nadziejê, ¿e spotkamy siê jeszcze, gdy wype³nisz ju¿ swoj¹ misjê. Bywaj!
	b_logentry(TOPIC_INNOSEYE,"Oko zosta³o uzdrowione. Kiedy Pyrokar mi je wrêczy, udam siê na polowanie na smoki.");
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
	description = "Dziêki ci za pomoc w naprawieniu Oka Innosa.";
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
	AI_Output(other,self,"DIA_Vatras_PERMKAP3_15_00");	//Dziêki ci za pomoc w naprawieniu Oka Innosa.
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_01");	//Zachowaj podziêkowania na póŸniej. Czeka ciê teraz najwiêksze wyzwanie.
	if(MIS_READYFORCHAPTER4 == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_02");	//Porozmawiaj z Pyrokarem. On ci wszystko wyt³umaczy.
	};
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_03");	//Mam nadziejê, ¿e jeszcze siê kiedyœ spotkamy, mój synu.
};


instance DIA_VATRAS_HILDAKRANK(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 34;
	condition = dia_vatras_hildakrank_condition;
	information = dia_vatras_hildakrank_info;
	description = "¯ona Lobarta, Hilda, zachorowa³a.";
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
	AI_Output(other,self,"DIA_Vatras_HILDAKRANK_15_00");	//¯ona Lobarta, Hilda, zachorowa³a.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_01");	//Co? Znowu? Ta biedna kobieta powinna bardziej na siebie uwa¿aæ.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_02");	//Jeszcze jedna ciê¿ka zima, a odejdzie z tego œwiata. Dobrze. Dam jej lekarstwo, które zmniejszy gor¹czkê.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_03");	//Hmmm... Skoro ju¿ tu jesteœ, móg³byœ jej zanieœæ lekarstwo?
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
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_01");	//Nie wygl¹dasz najlepiej. Chyba zbyt d³ugo wystawia³eœ siê na czarne spojrzenia Poszukiwaczy.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_02");	//Mogê uzdrowiæ twoje cia³o, ale spokój duszy odzyskasz jedynie w klasztorze. Porozmawiaj z Pyrokarem. On ci pomo¿e.
};


instance DIA_VATRAS_ALLDRAGONSDEAD(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 59;
	condition = dia_vatras_alldragonsdead_condition;
	information = dia_vatras_alldragonsdead_info;
	description = "Nie musimy ju¿ obawiaæ siê smoków.";
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
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_00");	//Nie musimy ju¿ obawiaæ siê smoków.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_01");	//Wiedzia³em, ¿e wrócisz ca³y i zdrowy! Jednak najwiêksze wyzwanie dopiero przed tob¹.
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_02");	//Tak, wiem.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_03");	//Zatem wyposa¿ siê odpowiednio i przyjdŸ do mnie, gdybyœ potrzebowa³ pomocy. Zawsze miej przy sobie Oko Innosa! Niech Adanos bêdzie z tob¹.
};


instance DIA_VATRAS_KNOWWHEREENEMY(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 55;
	condition = dia_vatras_knowwhereenemy_condition;
	information = dia_vatras_knowwhereenemy_info;
	permanent = TRUE;
	description = "Wiem, gdzie czai siê nasz nieprzyjaciel.";
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
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_00");	//Wiem, gdzie czai siê nasz nieprzyjaciel.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_01");	//Zatem nie traæmy czasu i pierwsi siê z nim rozprawmy.
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_02");	//Chcesz mi towarzyszyæ?
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_03");	//D³ugo siê nad tym zastanawia³em, ale teraz nie mam w¹tpliwoœci. Chcê wyruszyæ z tob¹.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Vatras, ku mojemu zaskoczeniu, chce mi towarzyszyæ w mojej wyprawie. Tak doœwiadczony towarzysz by³by dla mnie prawdziwym skarbem.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_04");	//Moja za³oga jest i tak bardzo liczna. Obawiam siê, ¿e mo¿e dla ciebie zabrakn¹æ miejsca.
		AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_05");	//Zatem zwolnij dla mnie miejsce. Bêdê ci potrzebny.
	}
	else
	{
		Info_ClearChoices(dia_vatras_knowwhereenemy);
		Info_AddChoice(dia_vatras_knowwhereenemy,"Muszê to sobie jeszcze przemyœleæ.",dia_vatras_knowwhereenemy_no);
		Info_AddChoice(dia_vatras_knowwhereenemy,"Jestem zaszczycony twoj¹ propozycj¹.",dia_vatras_knowwhereenemy_yes);
	};
};

func void dia_vatras_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_Yes_15_00");	//Jestem zaszczycony twoj¹ propozycj¹. Spotkamy siê na przystani.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_Yes_05_01");	//Spiesz siê. Nieprzyjaciel nie zasypia gruszek w popiele.
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
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_No_15_00");	//Muszê to sobie jeszcze przemyœleæ.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_No_05_01");	//Jak uwa¿asz. Wróæ do mnie, gdy ju¿ podejmiesz decyzjê.
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
	description = "Lepiej bêdzie, jeœli tu zostaniesz. To miasto ciê potrzebuje.";
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
	AI_Output(other,self,"DIA_Vatras_LeaveMyShip_15_00");	//Lepiej bêdzie, jeœli tu zostaniesz. To miasto ciê potrzebuje.
	AI_Output(self,other,"DIA_Vatras_LeaveMyShip_05_01");	//Mo¿e masz racjê... Mimo to, jeœli zechcesz, wyruszê z tob¹! Pamiêtaj o tym.
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
	description = "Chcê ciê zabraæ na wyspê nieprzyjaciela.";
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
	AI_Output(other,self,"DIA_Vatras_StillNeedYou_15_00");	//Chcê ciê zabraæ na wyspê nieprzyjaciela.
	AI_Output(self,other,"DIA_Vatras_StillNeedYou_05_01");	//M¹dra decyzja. Mam nadziejê, ¿e ostateczna?
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

