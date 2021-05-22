
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


var int Cord_SchonmalGefragt;

instance DIA_Cord_WannaJoin(C_Info)
{
	npc = Sld_805_Cord;
	nr = 5;
	condition = DIA_Cord_WannaJoin_Condition;
	information = DIA_Cord_WannaJoin_Info;
	permanent = TRUE;
	description = "Chcê zostaæ najemnikiem!";
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
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_14");	//Dopóki nie nauczysz siê prawid³owo trzymaæ broñ, nie masz tu czego szukaæ!
};

func void DIA_Cord_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Cord_WannaJoin_15_00");	//Chcê zostaæ najemnikiem!
	if(Cord_SchonmalGefragt == FALSE)
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_01");	//Wygl¹dasz mi raczej na kogoœ, kto urodzi³ siê do pracy w polu, ch³opcze.
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_02");	//Potrafisz trzymaæ broñ?
		Cord_SchonmalGefragt = TRUE;
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
	if((other.HitChance[NPC_TALENT_1H] >= 15) || (other.HitChance[NPC_TALENT_2H] >= 15))
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_10");	//No có¿, przynajmniej nie jesteœ zupe³nie zielony. Dobrze, przyjmujê ciê.
		Cord_Approved = TRUE;
		B_GivePlayerXP(XP_Cord_Approved);
		B_LogEntry(TOPIC_SLDRespekt,"G³os Corda znajduje mam zagwarantowany.");
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_12");	//Innymi s³owy, jesteœ cholernym amatorem!
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_13");	//Ka¿dy najemnik musi wiedzieæ, ¿e mo¿e polegaæ na swoich kompanach. Od tego zale¿y nasze ¿ycie.
		B_Cord_BeBetter();
		Log_CreateTopic(TOPIC_CordProve,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CordProve,LOG_Running);
		B_LogEntry(TOPIC_CordProve,"Cord udzieli mi swojego poparcia, jeœli stanê siê lepszym wojownikiem.");
	};
};


instance DIA_Cord_ExplainSkills(C_Info)
{
	npc = Sld_805_Cord;
	nr = 1;
	condition = DIA_Cord_ExplainSkills_Condition;
	information = DIA_Cord_ExplainSkills_Info;
	permanent = FALSE;
	description = "Od czego powinienem zacz¹æ, od walki broni¹ jedno- czy dwurêczn¹?";
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
	AI_Output(other,self,"DIA_Cord_ExplainSkills_15_00");	//Od czego powinienem zacz¹æ, od walki broni¹ jedno- czy dwurêczn¹?
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_01");	//Te dwa rodzaje broni s¹ doœæ podobne.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_07");	//Ostatecznie wyjdzie na to samo - wybór nale¿y do ciebie.
};


instance DIA_Cord_ExplainWeapons(C_Info)
{
	npc = Sld_805_Cord;
	nr = 2;
	condition = DIA_Cord_ExplainWeapons_Condition;
	information = DIA_Cord_ExplainWeapons_Info;
	permanent = FALSE;
	description = "Jakie s¹ zalety broni jedno- i dwurêcznych?";
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
	AI_Output(other,self,"DIA_Cord_ExplainWeapons_15_00");	//Jakie s¹ zalety broni jedno- i dwurêcznych?
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_01");	//Dobre pytanie. Widzê, ¿e przemyœla³eœ kwestiê swojego treningu.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_02");	//Broñ jednorêczna jest szybsza, ale zadaje trochê mniejsze obra¿enia.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_03");	//Z kolei broñ dwurêczna zadaje wiêksze obra¿enia, ale nie mo¿esz zadawaæ ni¹ szybkich ciosów.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_04");	//Poza tym walka broni¹ dwurêczn¹ wymaga wiêkszej si³y, a to oznacza dodatkowy trening.
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
	description = "Naucz mnie walczyæ!";
};


func int DIA_Cord_Teach_Condition()
{
	return TRUE;
};

func void B_Cord_Zeitverschwendung()
{
	AI_Output(self,other,"DIA_Cord_Teach_14_03");	//Nie marnujê czasu na amatorów.
};

func void DIA_Cord_Teach_Info()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Cord_Teach_15_00");	//Naucz mnie walczyæ!
	if((hero.guild == GIL_DJG) || (hero.guild == GIL_PAL) || (Hlp_IsItem(heroArmor,ItAr_Sld_H) == TRUE) || (Hlp_IsItem(heroArmor,ITAR_DJG_Crawler) == TRUE) || ((hero.guild == GIL_KDF) && (MIS_RitualInnosEyeRepair == LOG_SUCCESS)))
	{
		if(CORD_TEACH == FALSE)
		{
			Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
			B_LogEntry(Topic_SoldierTeacher,"Cord mo¿e mnie szkoliæ w zakresie walki orê¿em jedno- i dwurêcznym.");
			CORD_TEACH = TRUE;
		}
		else
		{
			if(Cord_SchonmalGefragt == FALSE)
			{
				AI_Output(self,other,"DIA_Cord_WannaJoin_14_02");	//Potrafisz trzymaæ broñ?
				Cord_SchonmalGefragt = TRUE;
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
				Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
				B_LogEntry(Topic_SoldierTeacher,"Cord mo¿e mnie szkoliæ w zakresie walki orê¿em jedno- i dwurêcznym.");
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
				B_Cord_Zeitverschwendung();
			}
			else if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
			{
				AI_Output(self,other,"DIA_Cord_Teach_14_04");	//Jeœli chodzi o miecz jednorêczny, to jesteœ jeszcze cholernie zielony! Natomiast z mieczem dwurêcznym idzie ci znacznie lepiej.
				AI_Output(self,other,"DIA_Cord_Teach_14_05");	//Jeœli potrzebujesz szkolenia w zakresie walki broni¹ jednorêczn¹, musisz znaleŸæ innego nauczyciela.
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
		AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_05");	//Dobre wyszkolenie wymaga sporo wysi³ku.
		AI_Output(self,other,"DIA_Cord_Teach_14_03");	//Nie marnujê czasu na amatorów.
	};
};

func void DIA_Cord_Teach_Back()
{
	if((Cord_Merke_1h < other.HitChance[NPC_TALENT_1H]) || (Cord_Merke_2h < other.HitChance[NPC_TALENT_2H]))
	{
		AI_Output(self,other,"DIA_Cord_Teach_BACK_14_00");	//Ju¿ jesteœ lepszy - tak trzymaæ!
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

