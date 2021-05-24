
var int Vatras_SchickeLeuteWeg;
var int vatras_heal_day;

instance DIA_Vatras_EXIT(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 999;
	condition = DIA_Vatras_EXIT_Condition;
	information = DIA_Vatras_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Vatras_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Vatras_EXIT_Info()
{
	AI_StopProcessInfos(self);
	if(Vatras_SchickeLeuteWeg == TRUE)
	{
		B_StartOtherRoutine(VLK_455_Buerger,"VATRASAWAY");
		B_StartOtherRoutine(VLK_454_Buerger,"VATRASAWAY");
		B_StartOtherRoutine(VLK_428_Buergerin,"VATRASAWAY");
		B_StartOtherRoutine(VLK_450_Buerger,"VATRASAWAY");
		B_StartOtherRoutine(VLK_426_Buergerin,"VATRASAWAY");
		B_StartOtherRoutine(VLK_421_Valentino,"VATRASAWAY");
		Vatras_SchickeLeuteWeg = FALSE;
	};
};


instance DIA_Vatras_PICKPOCKET(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 900;
	condition = DIA_Vatras_PICKPOCKET_Condition;
	information = DIA_Vatras_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Vatras_PICKPOCKET_Condition()
{
	return C_Beklauen(91,250);
};

func void DIA_Vatras_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Vatras_PICKPOCKET);
	Info_AddChoice(DIA_Vatras_PICKPOCKET,Dialog_Back,DIA_Vatras_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Vatras_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Vatras_PICKPOCKET_DoIt);
};

func void DIA_Vatras_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Vatras_PICKPOCKET);
};

func void DIA_Vatras_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Vatras_PICKPOCKET);
};


instance DIA_Vatras_GREET(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Vatras_GREET_Condition;
	information = DIA_Vatras_GREET_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Vatras_GREET_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_GREET_Info()
{
	AI_Output(self,other,"DIA_Vatras_GREET_05_00");	//Niech ³aska Adanosa bêdzie z tob¹.
	AI_Output(other,self,"DIA_Vatras_GREET_15_01");	//Kim jesteœ?
	AI_Output(self,other,"DIA_Vatras_GREET_05_02");	//Nazywam siê Vatras. Jestem s³ug¹ Adanosa, stra¿nika niebiañskiej i ziemskiej harmonii.
	AI_Output(self,other,"DIA_Vatras_GREET_05_03");	//Co mogê dla ciebie zrobiæ?
};


instance DIA_Vatras_INFLUENCE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Vatras_INFLUENCE_Condition;
	information = DIA_Vatras_INFLUENCE_Info;
	permanent = FALSE;
	description = "Przybywam, by prosiæ ciê o b³ogos³awieñstwo.";
};


func int DIA_Vatras_INFLUENCE_Condition()
{
	if((MIS_Thorben_GetBlessings == LOG_Running) && (Player_IsApprentice == APP_NONE) && (Kapitel <= 1))
	{
		return TRUE;
	};
};

func void DIA_Vatras_INFLUENCE_Info()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_00");	//Przybywam, by prosiæ ciê o b³ogos³awieñstwo.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_01");	//Dlaczegó¿ mia³bym ciê pob³ogos³awiæ, nieznajomy?
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_02");	//Chcê zostaæ czeladnikiem u jednego z mistrzów w dolnej czêœci miasta.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_03");	//Mogê udzieliæ ci b³ogos³awieñstwa, przybyszu, ale przecie¿ nic o tobie nie wiem! Opowiedz mi trochê o sobie.
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_04");	//A co chcia³byœ wiedzieæ?
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_05");	//Powiedz mi, sk¹d pochodzisz... i co sprowadza ciê do tego miasta.
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_06");	//Mam wa¿n¹ wiadomoœæ dla przywódcy paladynów.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_07");	//Co to za wiadomoœæ?
	Info_ClearChoices(DIA_Vatras_INFLUENCE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Przyby³y smoki...",DIA_Vatras_INFLUENCE_FIRST_TRUTH);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Wkrótce wydarz¹ siê straszliwe rzeczy.",DIA_Vatras_INFLUENCE_FIRST_LIE);
};

func void DIA_Vatras_INFLUENCE_FIRST_TRUTH()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_15_00");	//Niedaleko st¹d zbiera siê potê¿na armia. Jej przywódcami s¹ smoki, a celem podbój ca³ego kraju.
	if(Vatras_First == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_01");	//Hmmm. Jeœli mówisz prawdê, to równowaga na tych ziemiach zosta³a zak³ócona. Kto ci o tym powiedzia³?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_02");	//Smoki? Mówisz o istotach, o których zwykle wspominaj¹ tylko legendy. Kto ci o tym powiedzia³?
	};
	Info_ClearChoices(DIA_Vatras_INFLUENCE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Ach, s³ysza³em jakieœ plotki...",DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Powiedzia³ mi o tym mag Xardas...",DIA_Vatras_INFLUENCE_SECOND_TRUTH);
	Vatras_First = TRUE;
};

func void DIA_Vatras_INFLUENCE_FIRST_LIE()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_LIE_15_00");	//Wkrótce wydarz¹ siê straszliwe rzeczy.
	if(Vatras_First == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_01");	//Aha! A kto ci o tym powiedzia³?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_02");	//Straszliwe rzeczy, tak? A sk¹d to przypuszczenie?
	};
	Info_ClearChoices(DIA_Vatras_INFLUENCE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Ach, s³ysza³em jakieœ plotki...",DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Powiedzia³ mi o tym mag Xardas...",DIA_Vatras_INFLUENCE_SECOND_TRUTH);
	Vatras_First = 2;
};

func void DIA_Vatras_INFLUENCE_SECOND_TRUTH()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_15_00");	//Powiedzia³ mi o tym mag Xardas. To on wys³a³ mnie, bym ostrzeg³ paladynów.
	if(Vatras_Second == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_01");	//Wiem, ¿e jest on m¹drym i potê¿nym mistrzem magii. Powiedz mi jeszcze, sk¹d przybywasz?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_02");	//Ten nekromanta... A wiêc ¿yje... i on ciê tu przys³a³? Kim jesteœ naprawdê?
	};
	Info_ClearChoices(DIA_Vatras_INFLUENCE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Podró¿nikiem z dalekiego po³udnia...",DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Dawnym skazañcem...",DIA_Vatras_INFLUENCE_THIRD_TRUTH);
	Vatras_Second = TRUE;
};

func void DIA_Vatras_INFLUENCE_SECOND_LIE()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_LIE_15_00");	//Ach, s³ysza³em jakieœ plotki...
	if(Vatras_Second == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_01");	//A pamiêtasz chocia¿, GDZIE je s³ysza³eœ?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_02");	//Tak... I dlatego wyruszy³eœ w tê podró¿? Kim jesteœ naprawdê?
	};
	Info_ClearChoices(DIA_Vatras_INFLUENCE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Podró¿nikiem z dalekiego po³udnia...",DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Dawnym skazañcem...",DIA_Vatras_INFLUENCE_THIRD_TRUTH);
	Vatras_Second = 2;
};

func void DIA_Vatras_INFLUENCE_THIRD_TRUTH()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_TRUTH_15_00");	//Dawnym skazañcem z wiêziennej kolonii Khorinis.
	Info_ClearChoices(DIA_Vatras_INFLUENCE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Udzielisz mi teraz swojego b³ogos³awieñstwa?",dia_vatras_influence_repeat);
	Vatras_Third = TRUE;
};

func void DIA_Vatras_INFLUENCE_THIRD_LIE()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_LIE_15_00");	//Podró¿nikiem z dalekiego po³udnia...
	Info_ClearChoices(DIA_Vatras_INFLUENCE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Udzielisz mi teraz swojego b³ogos³awieñstwa?",dia_vatras_influence_repeat);
	Vatras_Third = 2;
};

func void dia_vatras_influence_repeat()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_REPEAT_15_00");	//Czy udzielisz mi teraz swojego b³ogos³awieñstwa?
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_01");	//Dobrze, podsumujmy:
	if(Vatras_Third == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_02");	//Jesteœ zbieg³ym wiêŸniem, ...
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_03");	//Jesteœ podró¿nikiem z dalekiego po³udnia, ...
	};
	if(Vatras_Second == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_04");	//... któremu nekromanta Xardas powiedzia³, ...
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_05");	//... który us³ysza³ plotki, ...
	};
	if(Vatras_First == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_06");	//... ¿e armia smoków zamierza podbiæ ca³y kraj.
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_07");	//... ¿e wydarz¹ siê wkrótce straszliwe rzeczy.
	};
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_08");	//I zamierzasz ostrzec o tym paladynów.
	if((Vatras_First == TRUE) && (Vatras_Second == TRUE) && (Vatras_Third == TRUE))
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_09");	//Brzmi to doœæ niewiarygodnie, ale nie wyczuwam, byæ próbowa³ mnie ok³amaæ.
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_10");	//Dlatego muszê przyj¹æ, ¿e kieruj¹ tob¹ szlachetne pobudki.
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_11");	//IdŸ wiêc z b³ogos³awieñstwem Adanosa, mój synu!
		Snd_Play("LevelUp");
		B_GivePlayerXP(XP_VatrasTruth);
		Vatras_Segen = TRUE;
		B_LogEntry(TOPIC_Thorben,"Vatras, Mag Wody, udzieli³ mi b³ogos³awieñstwa.");
	}
	else if(Vatras_Chance == FALSE)
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
		Vatras_Chance = TRUE;
		Info_ClearChoices(DIA_Vatras_INFLUENCE);
		Info_AddChoice(DIA_Vatras_INFLUENCE,"Przyby³y smoki...",DIA_Vatras_INFLUENCE_FIRST_TRUTH);
		Info_AddChoice(DIA_Vatras_INFLUENCE,"Wkrótce wydarz¹ siê straszliwe rzeczy.",DIA_Vatras_INFLUENCE_FIRST_LIE);
	}
	else if(Vatras_Chance == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_13");	//Da³em ci dwie szanse na powiedzenie prawdy, ale najwyraŸniej bardzo siê przed tym wzbraniasz. Nie dostaniesz mojego b³ogos³awieñstwa.
	};
};


instance DIA_Vatras_WoKdF(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 3;
	condition = DIA_Vatras_WoKdF_Condition;
	information = DIA_Vatras_WoKdF_Info;
	permanent = FALSE;
	description = "Gdzie mogê znaleŸæ jakiegoœ kap³ana Innosa?";
};


func int DIA_Vatras_WoKdF_Condition()
{
	if((Vatras_Segen == TRUE) && (Kapitel <= 1))
	{
		return TRUE;
	};
};

func void DIA_Vatras_WoKdF_Info()
{
	AI_Output(other,self,"DIA_Vatras_WoKdF_15_00");	//Gdzie mogê znaleŸæ jakiegoœ kap³ana Innosa?
	AI_Output(self,other,"DIA_Vatras_WoKdF_05_01");	//Najlepiej rozejrzyj siê po targowisku. Znajdziesz tam wys³annika klasztoru.
};


instance DIA_Vatras_Spende(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 3;
	condition = DIA_Vatras_Spende_Condition;
	information = DIA_Vatras_Spende_Info;
	permanent = TRUE;
	description = "Chcia³bym przekazaæ datek na œwi¹tyniê Adanosa!";
};


func int DIA_Vatras_Spende_Condition()
{
	return TRUE;
};

func void DIA_Vatras_Spende_Info()
{
	AI_Output(other,self,"DIA_Vatras_Spende_15_00");	//Chcia³bym przekazaæ datek na œwi¹tyniê Adanosa!
	AI_Output(self,other,"DIA_Vatras_Spende_05_01");	//Datek na œwi¹tyniê Adanosa mo¿e zmazaæ czêœæ przewin, które pope³ni³eœ w przesz³oœci, mój synu.
	AI_Output(self,other,"DIA_Vatras_Spende_05_02");	//Jak¹ sumê zechcesz przekazaæ?
	Info_ClearChoices(DIA_Vatras_Spende);
	Info_AddChoice(DIA_Vatras_Spende,"Chwilowo nie mam pieniêdzy...",DIA_Vatras_Spende_BACK);
	if(Npc_HasItems(other,ItMi_Gold) >= 50)
	{
		Info_AddChoice(DIA_Vatras_Spende,"Mam 50 sztuk z³ota...",DIA_Vatras_Spende_50);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		Info_AddChoice(DIA_Vatras_Spende,"Mam 100 sztuk z³ota...",DIA_Vatras_Spende_100);
	};
};

func void DIA_Vatras_Spende_BACK()
{
	AI_Output(other,self,"DIA_Vatras_Spende_BACK_15_00");	//Chwilowo nie mam pieniêdzy...
	AI_Output(self,other,"DIA_Vatras_Spende_BACK_05_01");	//Nic siê nie sta³o. Adanos zawsze ucieszy siê z twojej ofiary.
	Info_ClearChoices(DIA_Vatras_Spende);
};

func void DIA_Vatras_Spende_50()
{
	AI_Output(other,self,"DIA_Vatras_Spende_50_15_00");	//Mam 50 sztuk z³ota...
	AI_Output(self,other,"DIA_Vatras_Spende_50_05_01");	//Dziêkujê ci w imieniu Adanosa, mój synu. Twoje z³oto zostanie przekazane potrzebuj¹cym.
	B_GiveInvItems(other,self,ItMi_Gold,50);
	Info_ClearChoices(DIA_Vatras_Spende);
};

func void DIA_Vatras_Spende_100()
{
	AI_Output(other,self,"DIA_Vatras_Spende_100_15_00");	//Mam 100 sztuk z³ota...
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_01");	//B¹dŸ b³ogos³awiony, mój synu! Dziêki ci za tw¹ hojnoœæ.
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_02");	//Niech Adanos strze¿e ciê zawsze od z³ej przygody.
	B_GiveInvItems(other,self,ItMi_Gold,100);
	Vatras_Segen = TRUE;
	Info_ClearChoices(DIA_Vatras_Spende);
	if(MIS_Thorben_GetBlessings == LOG_Running)
	{
		B_LogEntry(TOPIC_Thorben,"Vatras, Mag Wody, udzieli³ mi b³ogos³awieñstwa.");
	};
};


instance DIA_VATRAS_DI_VATRASMURDERER(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 1;
	condition = dia_vatras_di_vatrasmurderer_condition;
	information = dia_vatras_di_vatrasmurderer_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_vatras_di_vatrasmurderer_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && ((PETZCOUNTER_OldCamp_Murder > 0) || (PETZCOUNTER_City_Murder > 0) || (PETZCOUNTER_Monastery_Murder > 0) || (PETZCOUNTER_Farm_Murder > 0)))
	{
		return TRUE;
	};
};

func void dia_vatras_di_vatrasmurderer_info()
{
	AI_Output(self,other,"DIA_Vatras_DI_VatrasSucked_05_00");	//ZejdŸ mi z oczu, morderco. Na moj¹ pomoc nie masz co liczyæ.
	AI_StopProcessInfos(self);
};


instance DIA_Vatras_CanTeach(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Vatras_CanTeach_Condition;
	information = DIA_Vatras_CanTeach_Info;
	permanent = FALSE;
	description = "Mo¿esz nauczyæ mnie czegoœ o magii?";
};


func int DIA_Vatras_CanTeach_Condition()
{
	return TRUE;
};

func void DIA_Vatras_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Vatras_CanTeach_15_00");	//Mo¿esz nauczyæ mnie czegoœ o magii?
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_01");	//Tylko Wybrañcy Innosa i Wybrañcy Adanosa mog¹ pos³ugiwaæ siê magi¹ run.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_02");	//Ale magia dostêpna jest tak¿e zwyk³ym œmiertelnikom, pod postaci¹ magicznych zwojów.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_03");	//Mogê ciê nauczyæ, jak lepiej wykorzystywaæ dostêpn¹ ci magiczn¹ moc.
	Vatras_TeachMANA = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"Vatras, Mag Wody, mo¿e pomóc mi w zwiêkszeniu magicznych zdolnoœci.");
};


instance DIA_Vatras_Teach(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 100;
	condition = DIA_Vatras_Teach_Condition;
	information = DIA_Vatras_Teach_Info;
	permanent = TRUE;
	description = "Chcê zwiêkszyæ moj¹ magiczn¹ moc.";
};


func int DIA_Vatras_Teach_Condition()
{
	if(Vatras_TeachMANA == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Vatras_Teach_Info()
{
	AI_Output(other,self,"DIA_Vatras_Teach_15_00");	//Chcê zwiêkszyæ moj¹ magiczn¹ moc.
	Info_ClearChoices(DIA_Vatras_Teach);
	Info_AddChoice(DIA_Vatras_Teach,Dialog_Back,DIA_Vatras_Teach_BACK);
	Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Vatras_Teach_1);
	Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Vatras_Teach_5);
};

func void DIA_Vatras_Teach_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= 50)
	{
		AI_Output(self,other,"DIA_Vatras_Teach_05_00");	//Jesteœ ju¿ zbyt potê¿ny, bym móg³ ciê czegoœ nauczyæ.
	};
	Info_ClearChoices(DIA_Vatras_Teach);
};

func void DIA_Vatras_Teach_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,50);
	Info_ClearChoices(DIA_Vatras_Teach);
	Info_AddChoice(DIA_Vatras_Teach,Dialog_Back,DIA_Vatras_Teach_BACK);
	Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Vatras_Teach_1);
	Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Vatras_Teach_5);
};

func void DIA_Vatras_Teach_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,50);
	Info_ClearChoices(DIA_Vatras_Teach);
	Info_AddChoice(DIA_Vatras_Teach,Dialog_Back,DIA_Vatras_Teach_BACK);
	Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Vatras_Teach_1);
	Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Vatras_Teach_5);
};


instance DIA_Vatras_GODS(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 98;
	condition = DIA_Vatras_GODS_Condition;
	information = DIA_Vatras_GODS_Info;
	permanent = TRUE;
	description = "Opowiedz mi o bogach.";
};


func int DIA_Vatras_GODS_Condition()
{
	return TRUE;
};

func void DIA_Vatras_GODS_Info()
{
	AI_Output(other,self,"DIA_Vatras_GODS_15_00");	//Opowiedz mi o bogach.
	AI_Output(self,other,"DIA_Vatras_GODS_05_01");	//A co dok³adnie chcia³byœ o nich wiedzieæ?
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"Opowiedz mi o Innosie.",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"Opowiedz mi o Adanosie.",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"Opowiedz mi o Beliarze.",DIA_Vatras_GODS_BELIAR);
};

func void DIA_Vatras_GODS_BACK()
{
	Info_ClearChoices(DIA_Vatras_GODS);
};

func void DIA_Vatras_GODS_INNOS()
{
	AI_Output(other,self,"DIA_Vatras_GODS_INNOS_15_00");	//Opowiedz mi o Innosie.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_01");	//Dobrze. Innos jest pierwszym i najpotê¿niejszym z bogów. To on da³ œwiatu S³oñce.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_02");	//W jego w³adaniu znajduj¹ siê œwiat³o i ogieñ, które podarowa³ ludzkoœci. Innos jest te¿ sprawiedliwoœci¹ i prawem.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_03");	//Jego kap³anami s¹ Magowie Ognia, a wojownikami - mê¿ni paladyni.
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"Opowiedz mi o Innosie.",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"Opowiedz mi o Adanosie.",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"Opowiedz mi o Beliarze.",DIA_Vatras_GODS_BELIAR);
};

func void DIA_Vatras_GODS_ADANOS()
{
	AI_Output(other,self,"DIA_Vatras_GODS_ADANOS_15_00");	//Opowiedz mi o Adanosie.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_01");	//Adanos jest bogiem harmonii. To boski stra¿nik równowagi pomiêdzy Innosem i Beliarem.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_02");	//Jest te¿ wielkim sprawc¹ zmian i panem wód wszystkich mórz, rzek i jezior.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_03");	//Jego oddanymi s³ugami s¹ moi bracia, Magowie Wody.
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"Opowiedz mi o Innosie.",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"Opowiedz mi o Adanosie.",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"Opowiedz mi o Beliarze.",DIA_Vatras_GODS_BELIAR);
};

func void DIA_Vatras_GODS_BELIAR()
{
	AI_Output(other,self,"DIA_Vatras_GODS_BELIAR_15_00");	//Opowiedz mi o Beliarze.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_01");	//Beliar jest mrocznym bogiem œmierci, zniszczenia i wszystkich rzeczy nienaturalnych.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_02");	//Toczy on wieczn¹ wojnê z Innosem, ale Adanos dba, by ich si³y zawsze by³y wyrównane.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_03");	//Niewielu ludzi pozostaje w s³u¿bie Beliara, ale s¹ oni niezwykle potê¿ni.
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"Opowiedz mi o Innosie.",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"Opowiedz mi o Adanosie.",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"Opowiedz mi o Beliarze.",DIA_Vatras_GODS_BELIAR);
};


instance DIA_Vatras_HEAL(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 99;
	condition = DIA_Vatras_HEAL_Condition;
	information = DIA_Vatras_HEAL_Info;
	permanent = TRUE;
	description = "Mo¿esz mnie uzdrowiæ?";
};


func int DIA_Vatras_HEAL_Condition()
{
	return TRUE;
};

func void DIA_Vatras_HEAL_Info()
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
			PurgeToxicity(other);
			PrintScreen(PRINT_FullyHealed,-1,-1,FONT_Screen,2);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_HEAL_05_02");	//Nie potrzebujesz pomocy uzdrowiciela.
	};
};

func void B_SayVatrasGo()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_13");	//Dobrze. Ruszaj teraz w drogê do Mistrza Isgarotha.
};


instance DIA_Vatras_MISSION(C_Info)
{
	npc = VLK_439_Vatras;
	condition = DIA_Vatras_MISSION_Condition;
	information = DIA_Vatras_MISSION_Info;
	important = TRUE;
};


func int DIA_Vatras_MISSION_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Vatras_MISSION_Info()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_10");	//Mam wiadomoœæ dla Mistrza Isgarotha. Strze¿e on kaplicy przed klasztorem.
	AI_Output(self,other,"DIA_Vatras_MISSION_05_01");	//Jeœli podejmiesz siê wykonaæ to zadanie, bêdziesz móg³ sam sobie wybraæ nagrodê.
	Info_ClearChoices(DIA_Vatras_MISSION);
	Info_AddChoice(DIA_Vatras_MISSION,"Poszukaj sobie innego ch³opca na posy³ki, starcze.",DIA_Vatras_MISSION_NO);
	Info_AddChoice(DIA_Vatras_MISSION,"Mo¿esz na mnie liczyæ.",DIA_Vatras_MISSION_YES);
};

func void DIA_Vatras_MISSION_YES()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_YES_15_00");	//Mo¿esz na mnie liczyæ.
	AI_Output(self,other,"DIA_Vatras_Add_05_11");	//Œwietnie. Zabierz zatem tê wiadomoœæ i wybierz jeden ze zwojów z zaklêciami.
	AI_Output(self,other,"DIA_Vatras_Add_05_12");	//Gdy dostarczysz wiadomoœæ, otrzymasz odpowiedni¹ nagrodê.
	B_GiveInvItems(self,hero,ItWr_VatrasMessage,1);
	MIS_Vatras_Message = LOG_Running;
	Log_CreateTopic(TOPIC_Botschaft,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Botschaft,LOG_Running);
	B_LogEntry(TOPIC_Botschaft,"Vatras da³ mi wiadomoœæ dla Mistrza Isgarotha, którego znajdê w kaplicy przed klasztorem.");
	Info_ClearChoices(DIA_Vatras_MISSION);
	Info_AddChoice(DIA_Vatras_MISSION,"Wezmê zaklêcie œwiat³a.",DIA_Vatras_MISSION_LIGHT);
	Info_AddChoice(DIA_Vatras_MISSION,"Wybieram zaklêcie uzdrawiaj¹ce.",DIA_Vatras_MISSION_HEAL);
	Info_AddChoice(DIA_Vatras_MISSION,"Daj mi Lodow¹ Strza³ê.",DIA_Vatras_MISSION_ICE);
};

func void DIA_Vatras_MISSION_NO()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_NO_15_00");	//Poszukaj sobie innego ch³opca na posy³ki, starcze.
	MIS_Vatras_Message = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Vatras_MISSION);
};

func void DIA_Vatras_MISSION_HEAL()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_HEAL_15_00");	//Wybieram zaklêcie uzdrawiaj¹ce.
	B_SayVatrasGo();
	B_GiveInvItems(self,hero,ItSc_LightHeal,1);
	Info_ClearChoices(DIA_Vatras_MISSION);
};

func void DIA_Vatras_MISSION_ICE()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_ICE_15_00");	//Daj mi Lodow¹ Strza³ê.
	B_SayVatrasGo();
	B_GiveInvItems(self,hero,ItSc_Icebolt,1);
	Info_ClearChoices(DIA_Vatras_MISSION);
};

func void DIA_Vatras_MISSION_LIGHT()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_LIGHT_15_00");	//Wezmê zaklêcie œwiat³a.
	B_SayVatrasGo();
	B_GiveInvItems(self,hero,ItSc_Light,1);
	Info_ClearChoices(DIA_Vatras_MISSION);
};


instance DIA_Vatras_MESSAGE_SUCCESS(C_Info)
{
	npc = VLK_439_Vatras;
	condition = DIA_Vatras_MESSAGE_SUCCESS_Condition;
	information = DIA_Vatras_MESSAGE_SUCCESS_Info;
	description = "Dostarczy³em twoj¹ wiadomoœæ.";
};


func int DIA_Vatras_MESSAGE_SUCCESS_Condition()
{
	if((MIS_Vatras_Message == LOG_Running) && (Vatras_Return == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_MESSAGE_SUCCESS_Info()
{
	AI_Output(other,self,"DIA_Vatras_MESSAGE_SUCCESS_15_00");	//Dostarczy³em twoj¹ wiadomoœæ.
	AI_Output(self,other,"DIA_Vatras_Add_05_14");	//Przyjmij wiêc moje podziêkowanie. Mo¿esz teraz wybraæ swoj¹ nagrodê.
	MIS_Vatras_Message = LOG_SUCCESS;
	B_GivePlayerXP(XP_Vatras_Message);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
	Info_AddChoice(DIA_Vatras_MESSAGE_SUCCESS,"1 szczaw królewski",DIA_Vatras_MESSAGE_SUCCESS_Plant);
	Info_AddChoice(DIA_Vatras_MESSAGE_SUCCESS,"Pierœcieñ zrêcznoœci",DIA_Vatras_MESSAGE_SUCCESS_Ring);
	Info_AddChoice(DIA_Vatras_MESSAGE_SUCCESS,"1 bry³ka rudy",DIA_Vatras_MESSAGE_SUCCESS_Ore);
};

func void DIA_Vatras_MESSAGE_SUCCESS_Plant()
{
	B_GiveInvItems(self,hero,ItPl_Perm_Herb,1);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
};

func void DIA_Vatras_MESSAGE_SUCCESS_Ring()
{
	B_GiveInvItems(self,hero,ItRi_Dex_01,1);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
};

func void DIA_Vatras_MESSAGE_SUCCESS_Ore()
{
	B_GiveInvItems(self,hero,ItMi_Nugget,1);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
};


const int kurz = 0;
const int lang = 1;
var int Vatras_einmalLangWeg;

func void B_Vatras_GeheWeg(var int dauer)
{
	if(Vatras_einmalLangWeg == TRUE)
	{
		return;
	};
	if((Npc_GetDistToWP(self,"NW_CITY_MERCHANT_TEMPLE_FRONT") <= 500) && Npc_WasInState(self,ZS_Preach_Vatras))
	{
		B_StopLookAt(self);
		AI_AlignToWP(self);
		AI_Output(self,other,"DIA_Vatras_Add_05_06");	//S³uchajcie, moi drodzy! Jestem potrzebny gdzie indziej.
		if(dauer == kurz)
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_07");	//To nie potrwa d³ugo. Po powrocie opowiem wam resztê tej historii.
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_08");	//Nie wiem, kiedy powrócê. Jeœli chcecie poznaæ zakoñczenie tej historii, przeczytajcie odpowiednie pisma.
			Vatras_einmalLangWeg = TRUE;
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_09");	//Niech Adanos bêdzie z wami!
		B_TurnToNpc(self,other);
	};
	Vatras_SchickeLeuteWeg = TRUE;
};


instance DIA_Vatras_INNOSEYEKAPUTT(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 32;
	condition = DIA_Vatras_INNOSEYEKAPUTT_Condition;
	information = DIA_Vatras_INNOSEYEKAPUTT_Info;
	description = "Oko Innosa zosta³o uszkodzone.";
};


func int DIA_Vatras_INNOSEYEKAPUTT_Condition()
{
	if((Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Vatras_INNOSEYEKAPUTT_Info()
{
	if(MIS_Pyrokar_GoToVatrasInnoseye == LOG_Running)
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_00");	//Przysy³a mnie Pyrokar.
	}
	else if(MIS_Xardas_GoToVatrasInnoseye == LOG_Running)
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_01");	//Przysy³a mnie Xardas.
	};
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_02");	//Oko Innosa zosta³o uszkodzone.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_03");	//Wiem. Donieœli mi o tym napotkani nowicjusze.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_04");	//Poszukiwacze wykorzystali w tym celu œwiêty S³oneczny Kr¹g Magów Ognia.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_05");	//To znak, ¿e nieprzyjaciel znacznie urós³ w si³ê.
	Info_ClearChoices(DIA_Vatras_INNOSEYEKAPUTT);
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Wieœci szybko siê roznosz¹.",DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten);
	if((hero.guild == GIL_KDF) && (MIS_Pyrokar_GoToVatrasInnoseye == LOG_Running))
	{
		Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Dlaczego Pyrokar przys³a³ mnie w³aœnie do ciebie - Maga Wody?",DIA_Vatras_INNOSEYEKAPUTT_warumdu);
	};
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Co siê teraz stanie z Okiem?",DIA_Vatras_INNOSEYEKAPUTT_Auge);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_15_00");	//Co siê teraz stanie z Okiem?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_01");	//Musimy spróbowaæ je naprawiæ. Nie bêdzie to jednak ³atwe zadanie.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_02");	//Oprawa pêk³a na dwie czêœci. Zrêczny kowal zdo³a zapewne po³¹czyæ je z powrotem.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_03");	//Ale to mniejsza czêœæ problemu. Bardziej martwi mnie sam klejnot.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_04");	//Jest matowy, pozbawiony blasku. Nieprzyjaciel dok³adnie wiedzia³, jak unieszkodliwiæ amulet.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Gdzie znajdê kowala, który zdo³a naprawiæ oprawê amuletu?",DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied);
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Czy mo¿emy przywróciæ klejnotowi dawn¹ moc?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_15_00");	//Czy mo¿emy przywróciæ klejnotowi dawn¹ moc?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_01");	//Jest tylko jeden na to sposób - po³¹czone moce wszystkich trzech bogów powinny tego dokonaæ.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_02");	//W miejscu zniszczenia amuletu nale¿y przeprowadziæ odpowiedni rytua³ odwracaj¹cy. Mo¿e wtedy klejnot odzyska swój ogieñ.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_03");	//Problem w tym, ¿e musisz sprowadziæ do tego miejsca ziemskich przedstawicieli wszystkich trzech bogów.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_04");	//Potrzebujemy te¿ znacznej iloœci bagiennego ziela. Myœlê, ¿e nie mniej ni¿ 3 roœliny.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Kim maj¹ byæ ci trzej przedstawiciele bogów?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer);
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Gdzie mogê znaleŸæ to bagienne ziele?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_15_00");	//Gdzie mogê znaleŸæ to bagienne ziele?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_01");	//Podobno w tych lasach mieszka stara wiedŸma imieniem Sagitta. Mo¿e u niej znajdziesz takie ziele.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_02");	//Ewentualnie rozejrzyj siê trochê na przystani.
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_15_00");	//Kim maj¹ byæ ci trzej przedstawiciele bogów?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_01");	//Adanosa mogê reprezentowaæ osobiœcie.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_02");	//Przedstawicielem Innosa powinien byæ Pyrokar, najwy¿szy z Magów Ognia.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_03");	//Ale nie wiem, kto móg³by reprezentowaæ Beliara. Potrzebujemy prawdziwego mistrza czarnej magii.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Czarnej magii? Mo¿e Xardas?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_15_00");	//Czarnej magii? Mo¿e Xardas?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_01");	//Tak! To siê powinno udaæ!
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_02");	//Nie wiem tylko, czy uda ci siê sprowadziæ obydwu.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_03");	//Ju¿ widzê wyraz twarzy Pyrokara, gdy dowie siê, ¿e musi wspó³pracowaæ z Xardasem.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Muszê ju¿ iœæ.",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_15_00");	//Gdzie znajdê kowala, który zdo³a naprawiæ oprawê amuletu?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_05_01");	//Musisz popytaæ ludzi o kowala, który zna siê na jubilerstwie.
};

func void DIA_Vatras_INNOSEYEKAPUTT_warumdu()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_15_00");	//Dlaczego Pyrokar przys³a³ mnie w³aœnie do ciebie - Maga Wody?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_01");	//Podejrzewa³em, ¿e prêdzej czy póŸniej dojdzie do czegoœ takiego.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_02");	//Pyrokar ma siê za tak potê¿nego i niezwyciê¿onego, ¿e czêsto zachowuje siê wrêcz nieodpowiedzialnie.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_03");	//I zosta³ za to ukarany - straci³ Oko Innosa.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_04");	//Myœlê jednak, ¿e podœwiadomie polega na mocy powierzonej mi przez Adanosa.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_05");	//Lepiej nie myœleæ, co by siê sta³o, gdyby mnie teraz zabrak³o.
};

func void DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_15_00");	//Wieœci szybko siê rozchodz¹.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_05_01");	//I bardzo dobrze. Nieprzyjaciel te¿ nie bêdzie czeka³ bezczynnie.
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_weiter_15_00");	//Muszê ju¿ iœæ.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_01");	//Ja te¿ wyruszê w drogê, by przygotowaæ S³oneczny Kr¹g do ceremonii.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_02");	//Przyœlij do mnie Xardasa i Pyrokara. I nie zapomnij o bagiennym zielu! Liczê na ciebie.
	B_LogEntry(TOPIC_INNOSEYE,"Vatras chce odprawiæ rytua³ w Krêgu Ognia, aby uzdrowiæ Oko. Muszê przekonaæ Xardasa i Pyrokara, aby wziêli udzia³ w tym przedsiêwziêciu. Powinienem tak¿e znaleŸæ kowala, który naprawi pêkniêt¹ oprawê amuletu.");
	MIS_RitualInnosEyeRepair = LOG_Running;
	Info_ClearChoices(DIA_Vatras_INNOSEYEKAPUTT);
	Npc_ExchangeRoutine(self,"RITUALINNOSEYEREPAIR");
	B_Vatras_GeheWeg(kurz);
	dmt_1201.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1202.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1203.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1204.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1205.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1206.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1207.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1208.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1209.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1210.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1211.aivar[AIV_EnemyOverride] = TRUE;
	B_StartOtherRoutine(dmt_1201,"AfterRitual");
	B_StartOtherRoutine(dmt_1202,"AfterRitual");
	B_StartOtherRoutine(dmt_1203,"AfterRitual");
	B_StartOtherRoutine(dmt_1204,"AfterRitual");
	B_StartOtherRoutine(dmt_1205,"AfterRitual");
	B_StartOtherRoutine(dmt_1206,"AfterRitual");
	B_StartOtherRoutine(dmt_1207,"AfterRitual");
	B_StartOtherRoutine(dmt_1208,"AfterRitual");
	B_StartOtherRoutine(dmt_1209,"AfterRitual");
	B_StartOtherRoutine(dmt_1210,"AfterRitual");
	B_StartOtherRoutine(dmt_1211,"AfterRitual");
};


instance DIA_Vatras_RitualInnosEyeRepair(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 33;
	condition = DIA_Vatras_RitualInnosEyeRepair_Condition;
	information = DIA_Vatras_RitualInnosEyeRepair_Info;
	permanent = TRUE;
	description = "Co z Okiem Innosa?";
};


func int DIA_Vatras_RitualInnosEyeRepair_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_Running) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Vatras_RitualInnosEyeRepair_Info()
{
	AI_Output(other,self,"DIA_Vatras_RitualInnosEyeRepair_15_00");	//Co z Okiem Innosa?
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_01");	//Tylko rytua³ odwrócenia odprawiony w S³onecznym Krêgu przeze mnie, Xardasa i Pyrokara mo¿e przywróciæ Oku dawn¹ moc.
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_02");	//Pamiêtaj, ¿eby przynieœæ Oko z naprawion¹ opraw¹.
};


instance DIA_Vatras_BEGINN(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 31;
	condition = DIA_Vatras_BEGINN_Condition;
	information = DIA_Vatras_BEGINN_Info;
	description = "Zrobi³em wszystko, o co prosi³eœ.";
};


func int DIA_Vatras_BEGINN_Condition()
{
	if((Kapitel == 3) && (Npc_GetDistToWP(self,"NW_TROLLAREA_RITUAL_02") < 2000) && (Npc_GetDistToWP(Xardas,"NW_TROLLAREA_RITUAL_02") < 2000) && (Npc_GetDistToWP(Pyrokar,"NW_TROLLAREA_RITUAL_02") < 2000) && Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) && (MIS_Bennet_InnosEyeRepairedSetting == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Vatras_BEGINN_Info()
{
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_00");	//Zrobi³em wszystko, o co prosi³eœ. Oto naprawione Oko.
	B_GivePlayerXP(XP_RitualInnosEyeRuns);
	B_GiveInvItems(other,self,ItMi_InnosEye_Broken_Mis,1);
	Npc_RemoveInvItem(self,ItMi_InnosEye_Broken_Mis);
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_01");	//Œwietnie. Mo¿emy zatem przyst¹piæ do odprawienia rytua³u.
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_02");	//A co z bagiennym zielem?
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_03");	//Ach, tak. Przynios³eœ dla mnie trzy roœliny?
	if(B_GiveInvItems(other,self,ItPl_SwampHerb,3))
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_04");	//Tak. Oto one.
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_05");	//Znakomicie.
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_06");	//Nie. Niestety, nie.
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_07");	//Trudno. Poradzimy sobie jakoœ bez nich.
	};
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_08");	//Dobrze siê spisa³eœ, ale teraz odsuñ siê na bok, byœmy mogli przyst¹piæ do ceremonii. Niech zjednocz¹ siê nasze si³y!
	Info_ClearChoices(DIA_Vatras_BEGINN);
	Info_AddChoice(DIA_Vatras_BEGINN,Dialog_Ende,DIA_Vatras_BEGINN_los);
};

func void DIA_Vatras_BEGINN_los()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RITUALINNOSEYE");
	B_StartOtherRoutine(Xardas,"RITUALINNOSEYE");
	B_StartOtherRoutine(Pyrokar,"RITUALINNOSEYE");
	Npc_SetRefuseTalk(self,60);
	RitualInnosEyeRuns = LOG_Running;
};


instance DIA_Vatras_AUGEGEHEILT(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 33;
	condition = DIA_Vatras_AUGEGEHEILT_Condition;
	information = DIA_Vatras_AUGEGEHEILT_Info;
	important = TRUE;
};


func int DIA_Vatras_AUGEGEHEILT_Condition()
{
	if((Kapitel == 3) && (RitualInnosEyeRuns == LOG_Running) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_AUGEGEHEILT_Info()
{
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_00");	//Ju¿ po wszystkim. Uda³o siê nam pokrzy¿owaæ plan nieprzyjaciela. Oko odzyska³o sw¹ moc!
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_01");	//Pyrokar wyjaœni ci, jak u¿ywaæ Oka.
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_02");	//Mam nadziejê, ¿e spotkamy siê jeszcze, gdy wype³nisz ju¿ swoj¹ misjê. Bywaj!
	B_LogEntry(TOPIC_INNOSEYE,"Oko zosta³o uzdrowione. Kiedy Pyrokar mi je wrêczy, udam siê na polowanie na smoki.");
	AI_StopProcessInfos(self);
	RitualInnosEyeRuns = LOG_SUCCESS;
	MIS_RitualInnosEyeRepair = LOG_SUCCESS;
	B_StartOtherRoutine(Pyrokar,"RitualInnosEyeRepair");
	B_StartOtherRoutine(Xardas,"RitualInnosEyeRepair");
	B_StartOtherRoutine(VLK_455_Buerger,"START");
	B_StartOtherRoutine(VLK_454_Buerger,"START");
	B_StartOtherRoutine(VLK_428_Buergerin,"START");
	B_StartOtherRoutine(VLK_450_Buerger,"START");
	B_StartOtherRoutine(VLK_426_Buergerin,"START");
	B_StartOtherRoutine(VLK_421_Valentino,"START");
};


instance DIA_Vatras_PERMKAP3(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 33;
	condition = DIA_Vatras_PERMKAP3_Condition;
	information = DIA_Vatras_PERMKAP3_Info;
	description = "Dziêki ci za pomoc w naprawieniu Oka Innosa.";
};


func int DIA_Vatras_PERMKAP3_Condition()
{
	if(MIS_RitualInnosEyeRepair == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Vatras_PERMKAP3_Info()
{
	AI_Output(other,self,"DIA_Vatras_PERMKAP3_15_00");	//Dziêki ci za pomoc w naprawieniu Oka Innosa.
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_01");	//Zachowaj podziêkowania na póŸniej. Czeka ciê teraz najwiêksze wyzwanie.
	if(MIS_ReadyforChapter4 == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_02");	//Porozmawiaj z Pyrokarem. On ci wszystko wyt³umaczy.
	};
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_03");	//Mam nadziejê, ¿e jeszcze siê kiedyœ spotkamy, mój synu.
};


instance DIA_Vatras_HILDAKRANK(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 34;
	condition = DIA_Vatras_HILDAKRANK_Condition;
	information = DIA_Vatras_HILDAKRANK_Info;
	description = "¯ona Lobarta, Hilda, zachorowa³a.";
};


func int DIA_Vatras_HILDAKRANK_Condition()
{
	if((MIS_HealHilda == LOG_Running) && Npc_KnowsInfo(other,DIA_Vatras_GREET))
	{
		return TRUE;
	};
};

func void DIA_Vatras_HILDAKRANK_Info()
{
	AI_Output(other,self,"DIA_Vatras_HILDAKRANK_15_00");	//¯ona Lobarta, Hilda, zachorowa³a.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_01");	//Co? Znowu? Ta biedna kobieta powinna bardziej na siebie uwa¿aæ.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_02");	//Jeszcze jedna ciê¿ka zima, a odejdzie z tego œwiata. Dobrze. Dam jej lekarstwo, które zmniejszy gor¹czkê.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_03");	//Hmmm... Skoro ju¿ tu jesteœ, móg³byœ jej zanieœæ lekarstwo?
	CreateInvItems(self,ItPo_HealHilda_MIS,1);
	B_GiveInvItems(self,other,ItPo_HealHilda_MIS,1);
};


instance DIA_Vatras_OBSESSION(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 35;
	condition = DIA_Vatras_OBSESSION_Condition;
	information = DIA_Vatras_OBSESSION_Info;
	description = "Chyba mam dreszcze.";
};


func int DIA_Vatras_OBSESSION_Condition()
{
	if((SC_IsObsessed == TRUE) && (SC_ObsessionTimes < 1))
	{
		return TRUE;
	};
};

func void DIA_Vatras_OBSESSION_Info()
{
	AI_Output(other,self,"DIA_Vatras_OBSESSION_15_00");	//Chyba mam dreszcze.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_01");	//Nie wygl¹dasz najlepiej. Chyba zbyt d³ugo wystawia³eœ siê na czarne spojrzenia Poszukiwaczy.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_02");	//Mogê uzdrowiæ twoje cia³o, ale spokój duszy odzyskasz jedynie w klasztorze. Porozmawiaj z Pyrokarem. On ci pomo¿e.
};


instance DIA_Vatras_AllDragonsDead(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 59;
	condition = DIA_Vatras_AllDragonsDead_Condition;
	information = DIA_Vatras_AllDragonsDead_Info;
	description = "Nie musimy ju¿ obawiaæ siê smoków.";
};


func int DIA_Vatras_AllDragonsDead_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Vatras_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_00");	//Nie musimy ju¿ obawiaæ siê smoków.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_01");	//Wiedzia³em, ¿e wrócisz ca³y i zdrowy! Jednak najwiêksze wyzwanie dopiero przed tob¹.
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_02");	//Tak, wiem.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_03");	//Zatem wyposa¿ siê odpowiednio i przyjdŸ do mnie, gdybyœ potrzebowa³ pomocy. Zawsze miej przy sobie Oko Innosa! Niech Adanos bêdzie z tob¹.
};


instance DIA_Vatras_KnowWhereEnemy(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 55;
	condition = DIA_Vatras_KnowWhereEnemy_Condition;
	information = DIA_Vatras_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Wiem, gdzie czai siê nasz nieprzyjaciel.";
};


func int DIA_Vatras_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Vatras_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_00");	//Wiem, gdzie czai siê nasz nieprzyjaciel.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_01");	//Zatem nie traæmy czasu i pierwsi siê z nim rozprawmy.
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_02");	//Chcesz mi towarzyszyæ?
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_03");	//D³ugo siê nad tym zastanawia³em, ale teraz nie mam w¹tpliwoœci. Chcê wyruszyæ z tob¹.
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,"Vatras, ku mojemu zaskoczeniu, chce mi towarzyszyæ w mojej wyprawie. Tak doœwiadczony towarzysz by³by dla mnie prawdziwym skarbem.");
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_04");	//Moja za³oga jest i tak bardzo liczna. Obawiam siê, ¿e mo¿e dla ciebie zabrakn¹æ miejsca.
		AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_05");	//Zatem zwolnij dla mnie miejsce. Bêdê ci potrzebny.
	}
	else
	{
		Info_ClearChoices(DIA_Vatras_KnowWhereEnemy);
		Info_AddChoice(DIA_Vatras_KnowWhereEnemy,"Muszê to sobie jeszcze przemyœleæ.",DIA_Vatras_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Vatras_KnowWhereEnemy,"Jestem zaszczycony twoj¹ propozycj¹.",DIA_Vatras_KnowWhereEnemy_Yes);
	};
};

func void DIA_Vatras_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_Yes_15_00");	//Jestem zaszczycony twoj¹ propozycj¹. Spotkamy siê na przystani.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_Yes_05_01");	//Spiesz siê. Nieprzyjaciel nie zasypia gruszek w popiele.
	B_GivePlayerXP(XP_Crewmember_Success);
	self.flags = NPC_FLAG_IMMORTAL;
	Vatras_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	B_Vatras_GeheWeg(lang);
	Info_ClearChoices(DIA_Vatras_KnowWhereEnemy);
};

func void DIA_Vatras_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_No_15_00");	//Muszê to sobie jeszcze przemyœleæ.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_No_05_01");	//Jak uwa¿asz. Wróæ do mnie, gdy ju¿ podejmiesz decyzjê.
	Vatras_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Vatras_KnowWhereEnemy);
};


instance DIA_Vatras_LeaveMyShip(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 55;
	condition = DIA_Vatras_LeaveMyShip_Condition;
	information = DIA_Vatras_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Lepiej bêdzie, jeœli tu zostaniesz. To miasto ciê potrzebuje.";
};


func int DIA_Vatras_LeaveMyShip_Condition()
{
	if((Vatras_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Vatras_LeaveMyShip_15_00");	//Lepiej bêdzie, jeœli tu zostaniesz. To miasto ciê potrzebuje.
	AI_Output(self,other,"DIA_Vatras_LeaveMyShip_05_01");	//Mo¿e masz racjê... Mimo to, jeœli zechcesz, wyruszê z tob¹! Pamiêtaj o tym.
	Vatras_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"PRAY");
};


instance DIA_Vatras_StillNeedYou(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 55;
	condition = DIA_Vatras_StillNeedYou_Condition;
	information = DIA_Vatras_StillNeedYou_Info;
	permanent = TRUE;
	description = "Chcê ciê zabraæ na wyspê nieprzyjaciela.";
};


func int DIA_Vatras_StillNeedYou_Condition()
{
	if(((Vatras_IsOnBoard == LOG_OBSOLETE) || (Vatras_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_Vatras_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Vatras_StillNeedYou_15_00");	//Chcê ciê zabraæ na wyspê nieprzyjaciela.
	AI_Output(self,other,"DIA_Vatras_StillNeedYou_05_01");	//M¹dra decyzja. Mam nadziejê, ¿e ostateczna?
	self.flags = NPC_FLAG_IMMORTAL;
	Vatras_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	B_Vatras_GeheWeg(lang);
	AI_StopProcessInfos(self);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};
