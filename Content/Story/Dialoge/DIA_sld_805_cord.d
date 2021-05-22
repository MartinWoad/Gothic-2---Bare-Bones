
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
	AI_Output(self,other,"DIA_Cord_Hallo_14_00");	//Je�li masz problem z wilkami albo polnymi bestiami, porozmawiaj z kt�rym� z m�odszych najemnik�w.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Cord_Hallo_14_01");	//Mo�esz do mnie przyj��, kiedy pojawi� si� tu paladyni.
		AI_Output(other,self,"DIA_Cord_Hallo_15_02");	//Co?
		AI_Output(self,other,"DIA_Cord_Hallo_14_03");	//Zawsze kiedy przychodzi do mnie jaki� wie�niak, chodzi o rze� na niewinnych zwierz�tach.
		AI_Output(other,self,"DIA_Cord_Hallo_15_04");	//Nie jestem wie�niakiem.
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
	description = "Chc� zosta� najemnikiem!";
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
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_14");	//Dop�ki nie nauczysz si� prawid�owo trzyma� bro�, nie masz tu czego szuka�!
};

func void dia_cord_wannajoin_info()
{
	AI_Output(other,self,"DIA_Cord_WannaJoin_15_00");	//Chc� zosta� najemnikiem!
	if(CORD_SCHONMALGEFRAGT == FALSE)
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_01");	//Wygl�dasz mi raczej na kogo�, kto urodzi� si� do pracy w polu, ch�opcze.
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_02");	//Potrafisz trzyma� bro�?
		CORD_SCHONMALGEFRAGT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_03");	//Podszkoli�e� si� troch�?
	};
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_04");	//To mo�e bro� jednor�czna?
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_05");	//Nie jestem w tym a� taki z�y...
	}
	else
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_06");	//No c�...
	};
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_07");	//W takim razie dwur�czna?
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_08");	//Poradz� sobie z tym.
	}
	else
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_09");	//Z pewno�ci� szybko si� naucz�!
	};
	if((other.hitchance[NPC_TALENT_1H] >= 15) || (other.hitchance[NPC_TALENT_2H] >= 15))
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_10");	//No c�, przynajmniej nie jeste� zupe�nie zielony. Dobrze, przyjmuj� ci�.
		CORD_APPROVED = TRUE;
		b_giveplayerxp(XP_CORD_APPROVED);
		b_logentry(TOPIC_SLDRESPEKT,"G�os Corda znajduje mam zagwarantowany.");
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_12");	//Innymi s�owy, jeste� cholernym amatorem!
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_13");	//Ka�dy najemnik musi wiedzie�, �e mo�e polega� na swoich kompanach. Od tego zale�y nasze �ycie.
		b_cord_bebetter();
		Log_CreateTopic(TOPIC_CORDPROVE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CORDPROVE,LOG_RUNNING);
		b_logentry(TOPIC_CORDPROVE,"Cord udzieli mi swojego poparcia, je�li stan� si� lepszym wojownikiem.");
	};
};


instance DIA_CORD_EXPLAINSKILLS(C_INFO)
{
	npc = sld_805_cord;
	nr = 1;
	condition = dia_cord_explainskills_condition;
	information = dia_cord_explainskills_info;
	permanent = FALSE;
	description = "Od czego powinienem zacz��, od walki broni� jedno- czy dwur�czn�?";
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
	AI_Output(other,self,"DIA_Cord_ExplainSkills_15_00");	//Od czego powinienem zacz��, od walki broni� jedno- czy dwur�czn�?
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_01");	//Te dwa rodzaje broni s� do�� podobne.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_07");	//Ostatecznie wyjdzie na to samo - wyb�r nale�y do ciebie.
};


instance DIA_CORD_EXPLAINWEAPONS(C_INFO)
{
	npc = sld_805_cord;
	nr = 2;
	condition = dia_cord_explainweapons_condition;
	information = dia_cord_explainweapons_info;
	permanent = FALSE;
	description = "Jakie s� zalety broni jedno- i dwur�cznych?";
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
	AI_Output(other,self,"DIA_Cord_ExplainWeapons_15_00");	//Jakie s� zalety broni jedno- i dwur�cznych?
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_01");	//Dobre pytanie. Widz�, �e przemy�la�e� kwesti� swojego treningu.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_02");	//Bro� jednor�czna jest szybsza, ale zadaje troch� mniejsze obra�enia.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_03");	//Z kolei bro� dwur�czna zadaje wi�ksze obra�enia, ale nie mo�esz zadawa� ni� szybkich cios�w.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_04");	//Poza tym walka broni� dwur�czn� wymaga wi�kszej si�y, a to oznacza dodatkowy trening.
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
	description = "Naucz mnie walczy�!";
};


func int dia_cord_teach_condition()
{
	return TRUE;
};

func void b_cord_zeitverschwendung()
{
	AI_Output(self,other,"DIA_Cord_Teach_14_03");	//Nie marnuj� czasu na amator�w.
};

func void dia_cord_teach_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Cord_Teach_15_00");	//Naucz mnie walczy�!
	if((hero.guild == GIL_DJG) || (hero.guild == GIL_PAL) || (Hlp_IsItem(heroarmor,itar_sld_h) == TRUE) || (Hlp_IsItem(heroarmor,itar_djg_crawler) == TRUE) || ((hero.guild == GIL_KDF) && (MIS_RITUALINNOSEYEREPAIR == LOG_SUCCESS)))
	{
		if(CORD_TEACH == FALSE)
		{
			Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
			b_logentry(TOPIC_SOLDIERTEACHER,"Cord mo�e mnie szkoli� w zakresie walki or�em jedno- i dwur�cznym.");
			CORD_TEACH = TRUE;
		}
		else
		{
			if(CORD_SCHONMALGEFRAGT == FALSE)
			{
				AI_Output(self,other,"DIA_Cord_WannaJoin_14_02");	//Potrafisz trzyma� bro�?
				CORD_SCHONMALGEFRAGT = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Cord_WannaJoin_14_03");	//Podszkoli�e� si� troch�?
			};
			AI_Output(self,other,"DIA_Cord_WannaJoin_14_04");	//To mo�e bro� jednor�czna?
			if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
			{
				AI_Output(other,self,"DIA_Cord_WannaJoin_15_05");	//Nie jestem w tym a� taki z�y...
			}
			else
			{
				AI_Output(other,self,"DIA_Cord_WannaJoin_15_06");	//No c�...
			};
			AI_Output(self,other,"DIA_Cord_WannaJoin_14_07");	//W takim razie dwur�czna?
			if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
			{
				AI_Output(other,self,"DIA_Cord_WannaJoin_15_08");	//Poradz� sobie z tym.
			}
			else
			{
				AI_Output(other,self,"DIA_Cord_WannaJoin_15_09");	//Z pewno�ci� szybko si� naucz�!
			};
			if((Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0) || (Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0))
			{
				CORD_TEACH = TRUE;
				Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
				b_logentry(TOPIC_SOLDIERTEACHER,"Cord mo�e mnie szkoli� w zakresie walki or�em jedno- i dwur�cznym.");
			}
			else
			{
				AI_Output(self,other,"DIA_Cord_Teach_14_03");	//Nie marnuj� czasu na amator�w.
			};
		};
		if(CORD_TEACH == TRUE)
		{
			if((Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0) && (Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0))
			{
				AI_Output(self,other,"DIA_Cord_Teach_14_01");	//Mog� ci� nauczy� walki ka�d� broni�. Od czego zaczniemy?
			}
			else if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
			{
				AI_Output(self,other,"DIA_Cord_Teach_14_02");	//Mog� ci� nauczy� walki mieczem jednor�cznym. Do dwur�cznego brakuje ci jeszcze umiej�tno�ci.
				b_cord_zeitverschwendung();
			}
			else if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
			{
				AI_Output(self,other,"DIA_Cord_Teach_14_04");	//Je�li chodzi o miecz jednor�czny, to jeste� jeszcze cholernie zielony! Natomiast z mieczem dwur�cznym idzie ci znacznie lepiej.
				AI_Output(self,other,"DIA_Cord_Teach_14_05");	//Je�li potrzebujesz szkolenia w zakresie walki broni� jednor�czn�, musisz znale�� innego nauczyciela.
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
		AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_05");	//Dobre wyszkolenie wymaga sporo wysi�ku.
		AI_Output(self,other,"DIA_Cord_Teach_14_03");	//Nie marnuj� czasu na amator�w.
	};
};

func void dia_cord_teach_back()
{
	if((CORD_MERKE_1H < other.hitchance[NPC_TALENT_1H]) || (CORD_MERKE_2H < other.hitchance[NPC_TALENT_2H]))
	{
		AI_Output(self,other,"DIA_Cord_Teach_BACK_14_00");	//Ju� jeste� lepszy - tak trzyma�!
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

