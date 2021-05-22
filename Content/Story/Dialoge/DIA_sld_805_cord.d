
instance DIA_Cord_EXIT(C_Info)
{
	npc = Sld_805_Cord;
	nr = 999;
	condition = DIA_Cord_EXIT_Condition;
	information = DIA_Cord_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Cord_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Cord_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Cord_Hallo(C_Info)
{
	npc = Sld_805_Cord;
	nr = 1;
	condition = DIA_Cord_Hallo_Condition;
	information = DIA_Cord_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Cord_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Cord_Hallo_Info()
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


var int Cord_SchonmalGefragt;

instance DIA_Cord_WannaJoin(C_Info)
{
	npc = Sld_805_Cord;
	nr = 5;
	condition = DIA_Cord_WannaJoin_Condition;
	information = DIA_Cord_WannaJoin_Info;
	permanent = TRUE;
	description = "Chc� zosta� najemnikiem!";
};


func int DIA_Cord_WannaJoin_Condition()
{
	if((Cord_Approved == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void B_Cord_BeBetter()
{
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_14");	//Dop�ki nie nauczysz si� prawid�owo trzyma� bro�, nie masz tu czego szuka�!
};

func void DIA_Cord_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Cord_WannaJoin_15_00");	//Chc� zosta� najemnikiem!
	if(Cord_SchonmalGefragt == FALSE)
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_01");	//Wygl�dasz mi raczej na kogo�, kto urodzi� si� do pracy w polu, ch�opcze.
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_02");	//Potrafisz trzyma� bro�?
		Cord_SchonmalGefragt = TRUE;
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
	if((other.HitChance[NPC_TALENT_1H] >= 15) || (other.HitChance[NPC_TALENT_2H] >= 15))
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_10");	//No c�, przynajmniej nie jeste� zupe�nie zielony. Dobrze, przyjmuj� ci�.
		Cord_Approved = TRUE;
		B_GivePlayerXP(XP_Cord_Approved);
		B_LogEntry(TOPIC_SLDRespekt,"G�os Corda znajduje mam zagwarantowany.");
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_12");	//Innymi s�owy, jeste� cholernym amatorem!
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_13");	//Ka�dy najemnik musi wiedzie�, �e mo�e polega� na swoich kompanach. Od tego zale�y nasze �ycie.
		B_Cord_BeBetter();
		Log_CreateTopic(TOPIC_CordProve,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CordProve,LOG_Running);
		B_LogEntry(TOPIC_CordProve,"Cord udzieli mi swojego poparcia, je�li stan� si� lepszym wojownikiem.");
	};
};


instance DIA_Cord_ExplainSkills(C_Info)
{
	npc = Sld_805_Cord;
	nr = 1;
	condition = DIA_Cord_ExplainSkills_Condition;
	information = DIA_Cord_ExplainSkills_Info;
	permanent = FALSE;
	description = "Od czego powinienem zacz��, od walki broni� jedno- czy dwur�czn�?";
};


func int DIA_Cord_ExplainSkills_Condition()
{
	if(CORD_TEACH == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cord_ExplainSkills_Info()
{
	AI_Output(other,self,"DIA_Cord_ExplainSkills_15_00");	//Od czego powinienem zacz��, od walki broni� jedno- czy dwur�czn�?
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_01");	//Te dwa rodzaje broni s� do�� podobne.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_07");	//Ostatecznie wyjdzie na to samo - wyb�r nale�y do ciebie.
};


instance DIA_Cord_ExplainWeapons(C_Info)
{
	npc = Sld_805_Cord;
	nr = 2;
	condition = DIA_Cord_ExplainWeapons_Condition;
	information = DIA_Cord_ExplainWeapons_Info;
	permanent = FALSE;
	description = "Jakie s� zalety broni jedno- i dwur�cznych?";
};


func int DIA_Cord_ExplainWeapons_Condition()
{
	if(CORD_TEACH == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cord_ExplainWeapons_Info()
{
	AI_Output(other,self,"DIA_Cord_ExplainWeapons_15_00");	//Jakie s� zalety broni jedno- i dwur�cznych?
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_01");	//Dobre pytanie. Widz�, �e przemy�la�e� kwesti� swojego treningu.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_02");	//Bro� jednor�czna jest szybsza, ale zadaje troch� mniejsze obra�enia.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_03");	//Z kolei bro� dwur�czna zadaje wi�ksze obra�enia, ale nie mo�esz zadawa� ni� szybkich cios�w.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_04");	//Poza tym walka broni� dwur�czn� wymaga wi�kszej si�y, a to oznacza dodatkowy trening.
};


var int Cord_Merke_1h;
var int Cord_Merke_2h;
var int cord_teach;

instance DIA_Cord_Teach(C_Info)
{
	npc = Sld_805_Cord;
	nr = 3;
	condition = DIA_Cord_Teach_Condition;
	information = DIA_Cord_Teach_Info;
	permanent = TRUE;
	description = "Naucz mnie walczy�!";
};


func int DIA_Cord_Teach_Condition()
{
	return TRUE;
};

func void B_Cord_Zeitverschwendung()
{
	AI_Output(self,other,"DIA_Cord_Teach_14_03");	//Nie marnuj� czasu na amator�w.
};

func void DIA_Cord_Teach_Info()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Cord_Teach_15_00");	//Naucz mnie walczy�!
	if((hero.guild == GIL_DJG) || (hero.guild == GIL_PAL) || (Hlp_IsItem(heroArmor,ItAr_Sld_H) == TRUE) || (Hlp_IsItem(heroArmor,ITAR_DJG_Crawler) == TRUE) || ((hero.guild == GIL_KDF) && (MIS_RitualInnosEyeRepair == LOG_SUCCESS)))
	{
		if(CORD_TEACH == FALSE)
		{
			Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
			B_LogEntry(Topic_SoldierTeacher,"Cord mo�e mnie szkoli� w zakresie walki or�em jedno- i dwur�cznym.");
			CORD_TEACH = TRUE;
		}
		else
		{
			if(Cord_SchonmalGefragt == FALSE)
			{
				AI_Output(self,other,"DIA_Cord_WannaJoin_14_02");	//Potrafisz trzyma� bro�?
				Cord_SchonmalGefragt = TRUE;
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
				Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
				B_LogEntry(Topic_SoldierTeacher,"Cord mo�e mnie szkoli� w zakresie walki or�em jedno- i dwur�cznym.");
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
				B_Cord_Zeitverschwendung();
			}
			else if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
			{
				AI_Output(self,other,"DIA_Cord_Teach_14_04");	//Je�li chodzi o miecz jednor�czny, to jeste� jeszcze cholernie zielony! Natomiast z mieczem dwur�cznym idzie ci znacznie lepiej.
				AI_Output(self,other,"DIA_Cord_Teach_14_05");	//Je�li potrzebujesz szkolenia w zakresie walki broni� jednor�czn�, musisz znale�� innego nauczyciela.
			}
			else
			{
				B_Cord_Zeitverschwendung();
				B_Cord_BeBetter();
			};
			if(Cord_Approved == TRUE)
			{
				Info_ClearChoices(DIA_Cord_Teach);
				Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
				if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
				{
					Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H)),DIA_Cord_Teach_2H_1);
					Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H) * 5),DIA_Cord_Teach_2H_5);
				};
				if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
				{
					Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H)),DIA_Cord_Teach_1H_1);
					Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H) * 5),DIA_Cord_Teach_1H_5);
				};
				Cord_Merke_1h = other.HitChance[NPC_TALENT_1H];
				Cord_Merke_2h = other.HitChance[NPC_TALENT_2H];
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_05");	//Dobre wyszkolenie wymaga sporo wysi�ku.
		AI_Output(self,other,"DIA_Cord_Teach_14_03");	//Nie marnuj� czasu na amator�w.
	};
};

func void DIA_Cord_Teach_Back()
{
	if((Cord_Merke_1h < other.HitChance[NPC_TALENT_1H]) || (Cord_Merke_2h < other.HitChance[NPC_TALENT_2H]))
	{
		AI_Output(self,other,"DIA_Cord_Teach_BACK_14_00");	//Ju� jeste� lepszy - tak trzyma�!
	};
	Info_ClearChoices(DIA_Cord_Teach);
};

func void DIA_Cord_Teach_2H_1()
{
	if(Kapitel >= 3)
	{
		B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,50);
	}
	else
	{
		B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,40);
	};
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H)),DIA_Cord_Teach_2H_1);
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H) * 5),DIA_Cord_Teach_2H_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H)),DIA_Cord_Teach_1H_1);
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H) * 5),DIA_Cord_Teach_1H_5);
	};
};

func void DIA_Cord_Teach_2H_5()
{
	if(Kapitel >= 3)
	{
		B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,50);
	}
	else
	{
		B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,40);
	};
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H)),DIA_Cord_Teach_2H_1);
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H) * 5),DIA_Cord_Teach_2H_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H)),DIA_Cord_Teach_1H_1);
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H) * 5),DIA_Cord_Teach_1H_5);
	};
};

func void DIA_Cord_Teach_1H_1()
{
	if(Kapitel >= 3)
	{
		B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,50);
	}
	else
	{
		B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,40);
	};
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H)),DIA_Cord_Teach_2H_1);
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H) * 5),DIA_Cord_Teach_2H_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H)),DIA_Cord_Teach_1H_1);
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H) * 5),DIA_Cord_Teach_1H_5);
	};
};

func void DIA_Cord_Teach_1H_5()
{
	if(Kapitel >= 3)
	{
		B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,50);
	}
	else
	{
		B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,40);
	};
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H)),DIA_Cord_Teach_2H_1);
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H) * 5),DIA_Cord_Teach_2H_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H)),DIA_Cord_Teach_1H_1);
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H) * 5),DIA_Cord_Teach_1H_5);
	};
};


instance DIA_Cord_PICKPOCKET(C_Info)
{
	npc = Sld_805_Cord;
	nr = 900;
	condition = DIA_Cord_PICKPOCKET_Condition;
	information = DIA_Cord_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Cord_PICKPOCKET_Condition()
{
	return C_Beklauen(65,75);
};

func void DIA_Cord_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Cord_PICKPOCKET);
	Info_AddChoice(DIA_Cord_PICKPOCKET,Dialog_Back,DIA_Cord_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Cord_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Cord_PICKPOCKET_DoIt);
};

func void DIA_Cord_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Cord_PICKPOCKET);
};

func void DIA_Cord_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Cord_PICKPOCKET);
};

