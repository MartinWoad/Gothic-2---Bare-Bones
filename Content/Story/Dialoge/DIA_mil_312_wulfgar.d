
var int wulfgar_refuse_to_train;

instance DIA_WULFGAR_EXIT(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 999;
	condition = dia_wulfgar_exit_condition;
	information = dia_wulfgar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wulfgar_exit_condition()
{
	return TRUE;
};

func void dia_wulfgar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WULFGAR_HALLO(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 1;
	condition = dia_wulfgar_hallo_condition;
	information = dia_wulfgar_hallo_info;
	permanent = FALSE;
	description = "Jak tam na s³u¿bie?";
};


func int dia_wulfgar_hallo_condition()
{
	return TRUE;
};

func void dia_wulfgar_hallo_info()
{
	AI_Output(other,self,"DIA_Wulfgar_Hallo_15_00");	//Jak tam na s³u¿bie?
	AI_Output(self,other,"DIA_Wulfgar_Hallo_04_01");	//Ci ch³opcy machaj¹ mieczami jak cepem.
	AI_Output(self,other,"DIA_Wulfgar_Hallo_04_02");	//Ale kiedy z nimi skoñczê, wszyscy, jak jeden m¹¿, bêd¹ twardzi jak ska³a.
};


instance DIA_WULFGAR_WANNAJOIN(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 2;
	condition = dia_wulfgar_wannajoin_condition;
	information = dia_wulfgar_wannajoin_info;
	permanent = FALSE;
	description = "Chcê wst¹piæ do stra¿y.";
};


func int dia_wulfgar_wannajoin_condition()
{
	if(Npc_KnowsInfo(other,dia_wulfgar_hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_wulfgar_wannajoin_info()
{
	AI_Output(other,self,"DIA_Wulfgar_WannaJoin_15_00");	//Chcê wst¹piæ do stra¿y.
	AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_01");	//Czy jesteœ obywatelem miasta?
	if(PLAYER_ISAPPRENTICE == APP_NONE)
	{
		AI_Output(other,self,"DIA_Wulfgar_WannaJoin_15_02");	//Nie.
		AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_03");	//W takim razie Lord Andre ciê nie przyjmie.
		AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_04");	//Oczywiœcie, mo¿esz z nim porozmawiaæ - ale w¹tpiê, by zrobi³ dla ciebie wyj¹tek.
	}
	else
	{
		AI_Output(other,self,"DIA_Wulfgar_WannaJoin_15_05");	//Zrobi.
		AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_06");	//Porozmawiaj wiêc z Lordem Andre. To on jest odpowiedzialny za rekrutacjê.
	};
};


instance DIA_WULFGAR_ABOUTMILIZ(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 3;
	condition = dia_wulfgar_aboutmiliz_condition;
	information = dia_wulfgar_aboutmiliz_info;
	permanent = FALSE;
	description = "Jak siê maj¹ sprawy w stra¿y?";
};


func int dia_wulfgar_aboutmiliz_condition()
{
	if(Npc_KnowsInfo(other,dia_wulfgar_hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_wulfgar_aboutmiliz_info()
{
	AI_Output(other,self,"DIA_Wulfgar_AboutMiliz_15_00");	//Jak siê maj¹ sprawy w stra¿y?
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_01");	//Naszym kapitanem jest obecnie Lord Andre.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_02");	//Swego czasu stra¿ odpowiada³a przed gubernatorem. Ten cz³owiek nie mia³ pojêcia, co siê tutaj naprawdê dzieje.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_03");	//Lord Andre, dla odmiany, wie, co robi. Potrafi odpowiednio zadbaæ o swoich ludzi.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_04");	//Wszyscy, którzy zaczynaj¹ tu pracê, dostaj¹ przyzwoit¹ zbrojê i porz¹dn¹ broñ.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_05");	//A jeœli ktoœ dobrze pracuje, mo¿e zawsze liczyæ na premiê. Za ka¿dego z³apanego przestêpcê czeka wysoka nagroda.
};


instance DIA_WULFGAR_CANYOUTRAIN(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 4;
	condition = dia_wulfgar_canyoutrain_condition;
	information = dia_wulfgar_canyoutrain_info;
	permanent = TRUE;
	description = "Czy mo¿esz mnie trenowaæ w walce mieczem?";
};


func int dia_wulfgar_canyoutrain_condition()
{
	if(Npc_KnowsInfo(other,dia_wulfgar_hallo) && (other.guild != GIL_MIL) && (WULFGAR_TEACH1H == FALSE) && (WULFGAR_REFUSE_TO_TRAIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_wulfgar_canyoutrain_info()
{
	AI_Output(other,self,"DIA_Wulfgar_CanYouTrain_15_00");	//Mo¿esz mnie trenowaæ w walce mieczem?
	AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_01");	//Lord Andre nakaza³, byœmy trenowali wszystkich, którzy s³u¿¹ sprawie miasta.
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_02");	//Jest jednak pewien wyj¹tek - najemnicy. Wynocha.
		WULFGAR_REFUSE_TO_TRAIN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_03");	//Dotyczy to jednak tylko treningu bojowego. Wszystkie pozosta³e formy szkolenia s¹ zarezerwowane dla stra¿y.
		if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
		{
			AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_01");	//Czy jesteœ obywatelem miasta?
			if(PLAYER_ISAPPRENTICE == APP_NONE)
			{
				AI_Output(other,self,"DIA_Babo_Windfaust_15_04");	//Nie, jeszcze nie.
				return;
			}
			else
			{
				AI_Output(other,self,"DIA_Wulfgar_WannaJoin_15_05");	//Zrobi.
			};
		};
		if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
		{
			AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_04");	//Wiesz chocia¿, jak trzymaæ broñ, któr¹ walczysz?
			if((other.hitchance[NPC_TALENT_1H] < 15) && (other.hitchance[NPC_TALENT_2H] < 15))
			{
				AI_Output(other,self,"DIA_Wulfgar_CanYouTrain_15_05");	//Tak mi siê wydaje...
			}
			else
			{
				AI_Output(other,self,"DIA_Constantino_Heilung_Ja_15_00");	//Tak.
			};
		};
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_06");	//W porz¹dku, zaczniemy, kiedy bêdziesz chcia³.
		Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
		b_logentry(TOPIC_CITYTEACHER,"Wulfgar, stra¿nik miejski, mo¿e mnie nauczyæ walki orê¿em jedno- i dwurêcznym.");
		WULFGAR_TEACH1H = TRUE;
	};
};


instance DIA_WULFGAR_ADVANTAGE(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 5;
	condition = dia_wulfgar_advantage_condition;
	information = dia_wulfgar_advantage_info;
	permanent = FALSE;
	description = "Opowiedz mi proszê o ró¿nicach miêdzy broni¹ jednorêczn¹ i dwurêczn¹.";
};


func int dia_wulfgar_advantage_condition()
{
	if((WULFGAR_TEACH1H == TRUE) || (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_wulfgar_advantage_info()
{
	AI_Output(other,self,"DIA_Wulfgar_Advantage_15_00");	//Opowiedz mi proszê o ró¿nicach miêdzy broni¹ jednorêczn¹ i dwurêczn¹.
	AI_Output(self,other,"DIA_Wulfgar_Advantage_04_01");	//To proste. U¿ywaj¹c broni jednorêcznej, jesteœ szybszy, to zaœ mo¿e stanowiæ o twej przewadze w walce.
	AI_Output(self,other,"DIA_Wulfgar_Advantage_04_02");	//Broñ dwurêczna spowalnia twoje ruchy i dlatego nale¿y u¿ywaæ jej bardzo rozwa¿nie. Jednak przy trafieniu zadaje znacznie wiêksze obra¿enia.
};


instance DIA_WULFGAR_HOWTOBEGIN(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 6;
	condition = dia_wulfgar_howtobegin_condition;
	information = dia_wulfgar_howtobegin_info;
	permanent = FALSE;
	description = "Od czego powinienem zacz¹æ? Od broni jedno- czy dwurêcznych?";
};


func int dia_wulfgar_howtobegin_condition()
{
	if((WULFGAR_TEACH1H == TRUE) || (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_wulfgar_howtobegin_info()
{
	AI_Output(other,self,"DIA_Wulfgar_HowToBegin_15_00");	//Od czego powinienem zacz¹æ? Od broni jedno- czy dwurêcznych?
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_01");	//To ju¿ zale¿y od ciebie.
};


instance DIA_WULFGAR_TEACH(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 7;
	condition = dia_wulfgar_teach_condition;
	information = dia_wulfgar_teach_info;
	permanent = TRUE;
	description = "Zacznijmy trening.";
};


func int dia_wulfgar_teach_condition()
{
	if((WULFGAR_TEACH1H == TRUE) || (other.guild == GIL_MIL))
	{
		return TRUE;
	};
};

func void dia_wulfgar_teach_info()
{
	AI_Output(other,self,"DIA_Wulfgar_Teach_15_00");	//Zacznijmy trening.
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Wulfgar_Add_04_00");	//Nie trenujê najemników!
		WULFGAR_REFUSE_TO_TRAIN = TRUE;
	}
	else if(((other.guild == GIL_NONE) || (other.guild == GIL_NOV)) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_01");	//Czy jesteœ obywatelem miasta?
		AI_Output(other,self,"DIA_Andre_FOUND_STUFF_15_02");	//Jeszcze nie...
	}
	else
	{
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Wulfgar_Add_04_01");	//Oczywiœcie, wielebny.
		};
		Info_ClearChoices(dia_wulfgar_teach);
		Info_AddChoice(dia_wulfgar_teach,DIALOG_BACK,dia_wulfgar_teach_back);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_wulfgar_teach_2h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_wulfgar_teach_2h_5);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_wulfgar_teach_1h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_wulfgar_teach_1h_5);
	};
};

func void dia_wulfgar_teach_back()
{
	Info_ClearChoices(dia_wulfgar_teach);
};

func void dia_wulfgar_teach_1h_1()
{
	if(KAPITEL >= 3)
	{
		b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,30);
	}
	else
	{
		b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,20);
	};
	Info_ClearChoices(dia_wulfgar_teach);
	Info_AddChoice(dia_wulfgar_teach,DIALOG_BACK,dia_wulfgar_teach_back);
	Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_wulfgar_teach_2h_1);
	Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_wulfgar_teach_2h_5);
	Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_wulfgar_teach_1h_1);
	Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_wulfgar_teach_1h_5);
};

func void dia_wulfgar_teach_1h_5()
{
	if(KAPITEL >= 3)
	{
		b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,30);
	}
	else
	{
		b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,20);
	};
	Info_ClearChoices(dia_wulfgar_teach);
	Info_AddChoice(dia_wulfgar_teach,DIALOG_BACK,dia_wulfgar_teach_back);
	Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_wulfgar_teach_2h_1);
	Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_wulfgar_teach_2h_5);
	Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_wulfgar_teach_1h_1);
	Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_wulfgar_teach_1h_5);
};

func void dia_wulfgar_teach_2h_1()
{
	if(KAPITEL >= 3)
	{
		b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,30);
	}
	else
	{
		b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,20);
	};
	Info_ClearChoices(dia_wulfgar_teach);
	Info_AddChoice(dia_wulfgar_teach,DIALOG_BACK,dia_wulfgar_teach_back);
	Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_wulfgar_teach_2h_1);
	Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_wulfgar_teach_2h_5);
	Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_wulfgar_teach_1h_1);
	Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_wulfgar_teach_1h_5);
};

func void dia_wulfgar_teach_2h_5()
{
	if(KAPITEL >= 3)
	{
		b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,30);
	}
	else
	{
		b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,20);
	};
	Info_ClearChoices(dia_wulfgar_teach);
	Info_AddChoice(dia_wulfgar_teach,DIALOG_BACK,dia_wulfgar_teach_back);
	Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_wulfgar_teach_2h_1);
	Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_wulfgar_teach_2h_5);
	Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_wulfgar_teach_1h_1);
	Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_wulfgar_teach_1h_5);
};


instance DIA_WULFGAR_ALSMIL(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 1;
	condition = dia_wulfgar_alsmil_condition;
	information = dia_wulfgar_alsmil_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_wulfgar_alsmil_condition()
{
	if(other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void dia_wulfgar_alsmil_info()
{
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_00");	//Mówisz wiêc, ¿e Lord Andre przyj¹³ ciê na s³u¿bê!
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_01");	//Mam nadziejê, ¿e bêdziesz tu przychodzi³ i trenowa³ regularnie.
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_02");	//Ruga bêdzie twoim nauczycielem kusznictwa, natomiast Mortis poka¿e ci, jak zwiêkszyæ si³ê.
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_03");	//Jednak najwa¿niejszym aspektem treningu jest porz¹dne nauczenie siê machania mieczem.
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_04");	//Jeszcze bêdzie z ciebie niez³y wojownik, masz moje s³owo!
};


instance DIA_WULFGAR_BONUS(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 2;
	condition = dia_wulfgar_bonus_condition;
	information = dia_wulfgar_bonus_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_wulfgar_bonus_condition()
{
	if(Npc_IsInState(self,zs_talk) && Wld_IsTime(5,2,6,54) && ((other.guild == GIL_NONE) || (other.guild == GIL_NOV)) && (other.hitchance[NPC_TALENT_1H] < 50))
	{
		return TRUE;
	};
};

func void dia_wulfgar_bonus_info()
{
	AI_Output(self,other,"DIA_Wulfgar_Bonus_04_00");	//Tak wczeœnie na nogach. Z regu³y o tej porze nikt mnie nie odwiedza. No, ale skoro ju¿ tu jesteœ, to mo¿e warto ciê czegoœ nauczyæ.
	if(other.hitchance[NPC_TALENT_1H] < 30)
	{
		AI_Output(self,other,"DIA_Wulfgar_Bonus_04_01");	//S³uchaj wiêc uwa¿nie. Mo¿esz wyprowadziæ swych przeciwników w pole, unikaj¹c ich ciosów i atakuj¹c w odpowiednim momencie.
		AI_Output(self,other,"DIA_Wulfgar_Bonus_04_02");	//Pamiêtaj o tym podczas kolejnej walki.
		b_addfightskill(other,NPC_TALENT_1H,1,TRUE);
		PrintScreen(PRINT_LEARN1H,-1,-1,FONT_SCREENSMALL,2);
	};
};


instance DIA_WULFGAR_PICKPOCKET(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 900;
	condition = dia_wulfgar_pickpocket_condition;
	information = dia_wulfgar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_wulfgar_pickpocket_condition()
{
	return c_beklauen(58,80);
};

func void dia_wulfgar_pickpocket_info()
{
	Info_ClearChoices(dia_wulfgar_pickpocket);
	Info_AddChoice(dia_wulfgar_pickpocket,DIALOG_BACK,dia_wulfgar_pickpocket_back);
	Info_AddChoice(dia_wulfgar_pickpocket,DIALOG_PICKPOCKET,dia_wulfgar_pickpocket_doit);
};

func void dia_wulfgar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_wulfgar_pickpocket);
};

func void dia_wulfgar_pickpocket_back()
{
	Info_ClearChoices(dia_wulfgar_pickpocket);
};

