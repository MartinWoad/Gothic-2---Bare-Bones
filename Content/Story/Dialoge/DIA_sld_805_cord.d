
instance DIA_CORD_EXIT(C_INFO)
{
	npc = sld_805_cord;
	nr = 999;
	condition = dia_cord_exit_condition;
	information = dia_cord_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_cord_exit_condition()
{
	return TRUE;
};

func void dia_cord_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CORD_HALLO(C_INFO)
{
	npc = sld_805_cord;
	nr = 1;
	condition = dia_cord_hallo_condition;
	information = dia_cord_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_cord_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_cord_hallo_info()
{
	AI_Output(self,other,"DIA_Cord_Hallo_14_00");	//Jeœli masz problem z wilkami albo polnymi bestiami, porozmawiaj z którymœ z m³odszych najemników.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Cord_Hallo_14_01");	//Mo¿esz do mnie przyjœæ, kiedy pojawi¹ siê tu paladyni.
		AI_Output(other,self,"DIA_Cord_Hallo_15_02");	//Co?
		AI_Output(self,other,"DIA_Cord_Hallo_14_03");	//Zawsze kiedy przychodzi do mnie jakiœ wieœniak, chodzi o rzeŸ na niewinnych zwierzêtach.
		AI_Output(other,self,"DIA_Cord_Hallo_15_04");	//Nie jestem wieœniakiem.
		AI_Output(self,other,"DIA_Cord_Hallo_14_05");	//Tak? A zatem czego chcesz?
	};
};


var int cord_schonmalgefragt;

instance DIA_CORD_WANNAJOIN(C_INFO)
{
	npc = sld_805_cord;
	nr = 5;
	condition = dia_cord_wannajoin_condition;
	information = dia_cord_wannajoin_info;
	permanent = TRUE;
	description = "Chcê zostaæ najemnikiem!";
};


func int dia_cord_wannajoin_condition()
{
	if((CORD_APPROVED == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void b_cord_bebetter()
{
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_14");	//Dopóki nie nauczysz siê prawid³owo trzymaæ broñ, nie masz tu czego szukaæ!
};

func void dia_cord_wannajoin_info()
{
	AI_Output(other,self,"DIA_Cord_WannaJoin_15_00");	//Chcê zostaæ najemnikiem!
	if(CORD_SCHONMALGEFRAGT == FALSE)
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_01");	//Wygl¹dasz mi raczej na kogoœ, kto urodzi³ siê do pracy w polu, ch³opcze.
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_02");	//Potrafisz trzymaæ broñ?
		CORD_SCHONMALGEFRAGT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_03");	//Podszkoli³eœ siê trochê?
	};
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_04");	//To mo¿e broñ jednorêczna?
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_05");	//Nie jestem w tym a¿ taki z³y...
	}
	else
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_06");	//No có¿...
	};
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_07");	//W takim razie dwurêczna?
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_08");	//Poradzê sobie z tym.
	}
	else
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_09");	//Z pewnoœci¹ szybko siê nauczê!
	};
	if((other.hitchance[NPC_TALENT_1H] >= 15) || (other.hitchance[NPC_TALENT_2H] >= 15))
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_10");	//No có¿, przynajmniej nie jesteœ zupe³nie zielony. Dobrze, przyjmujê ciê.
		CORD_APPROVED = TRUE;
		b_giveplayerxp(XP_CORD_APPROVED);
		b_logentry(TOPIC_SLDRESPEKT,"G³os Corda znajduje mam zagwarantowany.");
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_12");	//Innymi s³owy, jesteœ cholernym amatorem!
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_13");	//Ka¿dy najemnik musi wiedzieæ, ¿e mo¿e polegaæ na swoich kompanach. Od tego zale¿y nasze ¿ycie.
		b_cord_bebetter();
		Log_CreateTopic(TOPIC_CORDPROVE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CORDPROVE,LOG_RUNNING);
		b_logentry(TOPIC_CORDPROVE,"Cord udzieli mi swojego poparcia, jeœli stanê siê lepszym wojownikiem.");
	};
};


instance DIA_CORD_EXPLAINSKILLS(C_INFO)
{
	npc = sld_805_cord;
	nr = 1;
	condition = dia_cord_explainskills_condition;
	information = dia_cord_explainskills_info;
	permanent = FALSE;
	description = "Od czego powinienem zacz¹æ, od walki broni¹ jedno- czy dwurêczn¹?";
};


func int dia_cord_explainskills_condition()
{
	if(CORD_TEACH == TRUE)
	{
		return TRUE;
	};
};

func void dia_cord_explainskills_info()
{
	AI_Output(other,self,"DIA_Cord_ExplainSkills_15_00");	//Od czego powinienem zacz¹æ, od walki broni¹ jedno- czy dwurêczn¹?
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_01");	//Te dwa rodzaje broni s¹ doœæ podobne.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_07");	//Ostatecznie wyjdzie na to samo - wybór nale¿y do ciebie.
};


instance DIA_CORD_EXPLAINWEAPONS(C_INFO)
{
	npc = sld_805_cord;
	nr = 2;
	condition = dia_cord_explainweapons_condition;
	information = dia_cord_explainweapons_info;
	permanent = FALSE;
	description = "Jakie s¹ zalety broni jedno- i dwurêcznych?";
};


func int dia_cord_explainweapons_condition()
{
	if(CORD_TEACH == TRUE)
	{
		return TRUE;
	};
};

func void dia_cord_explainweapons_info()
{
	AI_Output(other,self,"DIA_Cord_ExplainWeapons_15_00");	//Jakie s¹ zalety broni jedno- i dwurêcznych?
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_01");	//Dobre pytanie. Widzê, ¿e przemyœla³eœ kwestiê swojego treningu.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_02");	//Broñ jednorêczna jest szybsza, ale zadaje trochê mniejsze obra¿enia.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_03");	//Z kolei broñ dwurêczna zadaje wiêksze obra¿enia, ale nie mo¿esz zadawaæ ni¹ szybkich ciosów.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_04");	//Poza tym walka broni¹ dwurêczn¹ wymaga wiêkszej si³y, a to oznacza dodatkowy trening.
};


var int cord_merke_1h;
var int cord_merke_2h;
var int cord_teach;

instance DIA_CORD_TEACH(C_INFO)
{
	npc = sld_805_cord;
	nr = 3;
	condition = dia_cord_teach_condition;
	information = dia_cord_teach_info;
	permanent = TRUE;
	description = "Naucz mnie walczyæ!";
};


func int dia_cord_teach_condition()
{
	return TRUE;
};

func void b_cord_zeitverschwendung()
{
	AI_Output(self,other,"DIA_Cord_Teach_14_03");	//Nie marnujê czasu na amatorów.
};

func void dia_cord_teach_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Cord_Teach_15_00");	//Naucz mnie walczyæ!
	if((hero.guild == GIL_DJG) || (hero.guild == GIL_PAL) || (Hlp_IsItem(heroarmor,itar_sld_h) == TRUE) || (Hlp_IsItem(heroarmor,itar_djg_crawler) == TRUE) || ((hero.guild == GIL_KDF) && (MIS_RITUALINNOSEYEREPAIR == LOG_SUCCESS)))
	{
		if(CORD_TEACH == FALSE)
		{
			Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
			b_logentry(TOPIC_SOLDIERTEACHER,"Cord mo¿e mnie szkoliæ w zakresie walki orê¿em jedno- i dwurêcznym.");
			CORD_TEACH = TRUE;
		}
		else
		{
			if(CORD_SCHONMALGEFRAGT == FALSE)
			{
				AI_Output(self,other,"DIA_Cord_WannaJoin_14_02");	//Potrafisz trzymaæ broñ?
				CORD_SCHONMALGEFRAGT = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Cord_WannaJoin_14_03");	//Podszkoli³eœ siê trochê?
			};
			AI_Output(self,other,"DIA_Cord_WannaJoin_14_04");	//To mo¿e broñ jednorêczna?
			if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
			{
				AI_Output(other,self,"DIA_Cord_WannaJoin_15_05");	//Nie jestem w tym a¿ taki z³y...
			}
			else
			{
				AI_Output(other,self,"DIA_Cord_WannaJoin_15_06");	//No có¿...
			};
			AI_Output(self,other,"DIA_Cord_WannaJoin_14_07");	//W takim razie dwurêczna?
			if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
			{
				AI_Output(other,self,"DIA_Cord_WannaJoin_15_08");	//Poradzê sobie z tym.
			}
			else
			{
				AI_Output(other,self,"DIA_Cord_WannaJoin_15_09");	//Z pewnoœci¹ szybko siê nauczê!
			};
			if((Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0) || (Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0))
			{
				CORD_TEACH = TRUE;
				Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
				b_logentry(TOPIC_SOLDIERTEACHER,"Cord mo¿e mnie szkoliæ w zakresie walki orê¿em jedno- i dwurêcznym.");
			}
			else
			{
				AI_Output(self,other,"DIA_Cord_Teach_14_03");	//Nie marnujê czasu na amatorów.
			};
		};
		if(CORD_TEACH == TRUE)
		{
			if((Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0) && (Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0))
			{
				AI_Output(self,other,"DIA_Cord_Teach_14_01");	//Mogê ciê nauczyæ walki ka¿d¹ broni¹. Od czego zaczniemy?
			}
			else if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
			{
				AI_Output(self,other,"DIA_Cord_Teach_14_02");	//Mogê ciê nauczyæ walki mieczem jednorêcznym. Do dwurêcznego brakuje ci jeszcze umiejêtnoœci.
				b_cord_zeitverschwendung();
			}
			else if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
			{
				AI_Output(self,other,"DIA_Cord_Teach_14_04");	//Jeœli chodzi o miecz jednorêczny, to jesteœ jeszcze cholernie zielony! Natomiast z mieczem dwurêcznym idzie ci znacznie lepiej.
				AI_Output(self,other,"DIA_Cord_Teach_14_05");	//Jeœli potrzebujesz szkolenia w zakresie walki broni¹ jednorêczn¹, musisz znaleŸæ innego nauczyciela.
			}
			else
			{
				b_cord_zeitverschwendung();
				b_cord_bebetter();
			};
			if(CORD_APPROVED == TRUE)
			{
				Info_ClearChoices(dia_cord_teach);
				Info_AddChoice(dia_cord_teach,DIALOG_BACK,dia_cord_teach_back);
				if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
				{
					Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_cord_teach_2h_1);
					Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_cord_teach_2h_5);
				};
				if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
				{
					Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_cord_teach_1h_1);
					Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_cord_teach_1h_5);
				};
				CORD_MERKE_1H = other.hitchance[NPC_TALENT_1H];
				CORD_MERKE_2H = other.hitchance[NPC_TALENT_2H];
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_05");	//Dobre wyszkolenie wymaga sporo wysi³ku.
		AI_Output(self,other,"DIA_Cord_Teach_14_03");	//Nie marnujê czasu na amatorów.
	};
};

func void dia_cord_teach_back()
{
	if((CORD_MERKE_1H < other.hitchance[NPC_TALENT_1H]) || (CORD_MERKE_2H < other.hitchance[NPC_TALENT_2H]))
	{
		AI_Output(self,other,"DIA_Cord_Teach_BACK_14_00");	//Ju¿ jesteœ lepszy - tak trzymaæ!
	};
	Info_ClearChoices(dia_cord_teach);
};

func void dia_cord_teach_2h_1()
{
	if(KAPITEL >= 3)
	{
		b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,50);
	}
	else
	{
		b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,40);
	};
	Info_ClearChoices(dia_cord_teach);
	Info_AddChoice(dia_cord_teach,DIALOG_BACK,dia_cord_teach_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_cord_teach_2h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_cord_teach_2h_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_cord_teach_1h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_cord_teach_1h_5);
	};
};

func void dia_cord_teach_2h_5()
{
	if(KAPITEL >= 3)
	{
		b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,50);
	}
	else
	{
		b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,40);
	};
	Info_ClearChoices(dia_cord_teach);
	Info_AddChoice(dia_cord_teach,DIALOG_BACK,dia_cord_teach_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_cord_teach_2h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_cord_teach_2h_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_cord_teach_1h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_cord_teach_1h_5);
	};
};

func void dia_cord_teach_1h_1()
{
	if(KAPITEL >= 3)
	{
		b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,50);
	}
	else
	{
		b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,40);
	};
	Info_ClearChoices(dia_cord_teach);
	Info_AddChoice(dia_cord_teach,DIALOG_BACK,dia_cord_teach_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_cord_teach_2h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_cord_teach_2h_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_cord_teach_1h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_cord_teach_1h_5);
	};
};

func void dia_cord_teach_1h_5()
{
	if(KAPITEL >= 3)
	{
		b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,50);
	}
	else
	{
		b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,40);
	};
	Info_ClearChoices(dia_cord_teach);
	Info_AddChoice(dia_cord_teach,DIALOG_BACK,dia_cord_teach_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_cord_teach_2h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_cord_teach_2h_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_cord_teach_1h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_cord_teach_1h_5);
	};
};


instance DIA_CORD_PICKPOCKET(C_INFO)
{
	npc = sld_805_cord;
	nr = 900;
	condition = dia_cord_pickpocket_condition;
	information = dia_cord_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_cord_pickpocket_condition()
{
	return c_beklauen(65,75);
};

func void dia_cord_pickpocket_info()
{
	Info_ClearChoices(dia_cord_pickpocket);
	Info_AddChoice(dia_cord_pickpocket,DIALOG_BACK,dia_cord_pickpocket_back);
	Info_AddChoice(dia_cord_pickpocket,DIALOG_PICKPOCKET,dia_cord_pickpocket_doit);
};

func void dia_cord_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_cord_pickpocket);
};

func void dia_cord_pickpocket_back()
{
	Info_ClearChoices(dia_cord_pickpocket);
};

