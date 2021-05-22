
instance DIA_GARVELL_EXIT(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 999;
	condition = dia_garvell_exit_condition;
	information = dia_garvell_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garvell_exit_condition()
{
	return TRUE;
};

func void dia_garvell_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GARVELL_PICKPOCKET(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 900;
	condition = dia_garvell_pickpocket_condition;
	information = dia_garvell_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie� tego mieszka b�dzie dziecinnie �atwa)";
};


func int dia_garvell_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itse_goldpocket25) >= 1) && (other.attribute[ATR_DEXTERITY] >= (10 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_garvell_pickpocket_info()
{
	Info_ClearChoices(dia_garvell_pickpocket);
	Info_AddChoice(dia_garvell_pickpocket,DIALOG_BACK,dia_garvell_pickpocket_back);
	Info_AddChoice(dia_garvell_pickpocket,DIALOG_PICKPOCKET,dia_garvell_pickpocket_doit);
};

func void dia_garvell_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 10)
	{
		b_giveinvitems(self,other,5602,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_giveplayerxp(XP_AMBIENT);
		Info_ClearChoices(dia_garvell_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_garvell_pickpocket_back()
{
	Info_ClearChoices(dia_garvell_pickpocket);
};


instance DIA_GARVELL_GREET(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 2;
	condition = dia_garvell_greet_condition;
	information = dia_garvell_greet_info;
	description = "Co tu porabiasz?";
};


func int dia_garvell_greet_condition()
{
	if(Wld_IsTime(5,0,19,0))
	{
		return TRUE;
	};
};

func void dia_garvell_greet_info()
{
	AI_Output(other,self,"DIA_Garvell_GREET_15_00");	//Co tu robisz?
	AI_Output(self,other,"DIA_Garvell_GREET_04_01");	//Buduj� statek i chc� si� jak najszybciej st�d wydosta�.
	AI_Output(self,other,"DIA_Garvell_GREET_04_02");	//Wygl�da jednak na to, �e nigdy nie zdo�am uko�czy� budowy.
};


instance DIA_GARVELL_EILIG(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 2;
	condition = dia_garvell_eilig_condition;
	information = dia_garvell_eilig_info;
	description = "Czemu si� tak strasznie spieszysz?";
};


func int dia_garvell_eilig_condition()
{
	if(Npc_KnowsInfo(other,dia_garvell_greet))
	{
		return TRUE;
	};
};

func void dia_garvell_eilig_info()
{
	AI_Output(other,self,"DIA_Garvell_eilig_15_00");	//Czemu si� tak strasznie spieszysz?
	AI_Output(self,other,"DIA_Garvell_eilig_04_01");	//Wkr�tce przyb�d� orkowie i spal� to miasto.
	AI_Output(other,self,"DIA_Garvell_eilig_15_02");	//Czemu tak s�dzisz?
	AI_Output(self,other,"DIA_Garvell_eilig_04_03");	//A nie zauwa�y�e� tych wszystkich paladyn�w? Jak s�dzisz, co oni tutaj robi�?
	AI_Output(self,other,"DIA_Garvell_eilig_04_04");	//Powiem ci - przybyli tutaj, bo wkr�tce rozpocznie si� atak ork�w. B�dzie gor�co.
};


instance DIA_GARVELL_SCHIFF(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 99;
	condition = dia_garvell_schiff_condition;
	information = dia_garvell_schiff_info;
	description = "Czemu nie mo�esz doko�czy� budowy statku?";
};


func int dia_garvell_schiff_condition()
{
	if(Npc_KnowsInfo(other,dia_garvell_greet))
	{
		return TRUE;
	};
};

func void dia_garvell_schiff_info()
{
	AI_Output(other,self,"DIA_Garvell_Schiff_15_00");	//Czemu nie mo�esz doko�czy� budowy statku?
	AI_Output(self,other,"DIA_Garvell_Schiff_04_01");	//Och, mamy tysi�ce problem�w. Kad�ub wci�� jeszcze nie stabilny, brakuje wielu element�w...
	AI_Output(self,other,"DIA_Garvell_Schiff_04_02");	//Niestety, nie mam ju� pieni�dzy na zakup nowych materia��w, a w ostatniej dostawie pe�no by�o kornik�w.
	AI_Output(self,other,"DIA_Garvell_Schiff_04_03");	//Moi ch�opcy te� nie pracuj� zbyt produktywnie. Jednemu zale�y tylko i wy��cznie na tym, �eby statek by� szybki, drugi najbardziej przejmuje si� figur� dziobow�!
	AI_Output(self,other,"DIA_Garvell_Schiff_04_04");	//Jakby�my nie mieli wa�niejszych problem�w!
};


instance DIA_GARVELL_MISSION(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 2;
	condition = dia_garvell_mission_condition;
	information = dia_garvell_mission_info;
	permanent = FALSE;
	description = "Czy mog� ci jako� pom�c?";
};


func int dia_garvell_mission_condition()
{
	if(Npc_KnowsInfo(other,dia_garvell_eilig) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_garvell_mission_info()
{
	AI_Output(other,self,"DIA_Garvell_MISSION_15_00");	//Czy mog� ci jako� pom�c?
	AI_Output(self,other,"DIA_Garvell_MISSION_04_01");	//Oczywi�cie. Spr�buj si� dowiedzie�, co planuj� paladyni. Jestem ciekaw, po co tu przybyli.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_02");	//Musz� wiedzie�, czy orkowie faktycznie zamierzaj� zaatakowa�, a je�li tak, to w jakiej odleg�o�ci od miasta si� znajduj�.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_03");	//Jeden z tych �mierdzieli podobno pojawi� si� tu� za miastem...
	AI_Output(self,other,"DIA_Garvell_MISSION_04_04");	//Po prostu dowiedz si� tyle, ile mo�esz.
	AI_Output(self,other,"DIA_Garvell_Add_04_00");	//Chc� wiedzie�, ile mam jeszcze czasu na doko�czenie budowy okr�tu.
	MIS_GARVELL_INFOS = LOG_RUNNING;
	KNOWS_ORK = TRUE;
	Log_CreateTopic(TOPIC_GARVELL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GARVELL,LOG_RUNNING);
	b_logentry(TOPIC_GARVELL,"Garvell chce si� dowiedzie� jak najwi�cej na temat ork�w. Chce te� wiedzie�, czemu w mie�cie przebywaj� paladyni.");
};

func void b_garvellweiter()
{
	AI_Output(self,other,"DIA_Garvell_Weiter_04_00");	//Dobrze. Je�li dowiesz si� czego� wi�cej, daj mi zna�.
};

func void b_garvellsuccess()
{
	AI_Output(self,other,"DIA_Garvell_Success_04_00");	//Dzi�kuj� za informacje. Wygl�da na to, �e mamy ca�� mas� czasu na uko�czenie naszego statku.
	MIS_GARVELL_INFOS = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_GARVELL_ORKS(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 3;
	condition = dia_garvell_orks_condition;
	information = dia_garvell_orks_info;
	permanent = FALSE;
	description = "Mam informacje dotycz�ce ork�w.";
};


func int dia_garvell_orks_condition()
{
	if((MIS_GARVELL_INFOS == LOG_RUNNING) && (KNOWS_PALADINS >= 1))
	{
		return TRUE;
	};
};

func void dia_garvell_orks_info()
{
	AI_Output(other,self,"DIA_Garvell_Orks_15_00");	//Mam informacje dotycz�ce ork�w.
	AI_Output(self,other,"DIA_Garvell_Orks_04_01");	//S�ucham.
	AI_Output(other,self,"DIA_Garvell_Orks_15_02");	//Utkn�li w G�rniczej Dolinie, i wygl�da na to, �e ju� tam pozostan�.
	AI_Output(other,self,"DIA_Garvell_Orks_15_03");	//Paladyni strzeg� prze��czy.
	TELL_GARVELL = TELL_GARVELL + 1;
	b_giveplayerxp(XP_AMBIENT);
	if(TELL_GARVELL >= 3)
	{
		b_garvellsuccess();
	}
	else
	{
		b_garvellweiter();
	};
};


instance DIA_GARVELL_PALADINE(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 2;
	condition = dia_garvell_paladine_condition;
	information = dia_garvell_paladine_info;
	permanent = FALSE;
	description = "Wiem, co tu robi� paladyni.";
};


func int dia_garvell_paladine_condition()
{
	if((MIS_GARVELL_INFOS == LOG_RUNNING) && (KNOWSPALADINS_ORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_garvell_paladine_info()
{
	AI_Output(other,self,"DIA_Garvell_Paladine_15_00");	//Wiem, co tu robi� paladyni.
	AI_Output(self,other,"DIA_Garvell_Paladine_04_01");	//Naprawd�? Powiedz!
	AI_Output(other,self,"DIA_Garvell_Paladine_15_02");	//Paladyni nie przybyli tutaj, dlatego �e spodziewaj� si� ataku ork�w. Ich celem jest zdobycie magicznej rudy z G�rniczej Doliny.
	AI_Output(other,self,"DIA_Garvell_Paladine_15_03");	//Kiedy tylko j� zdob�d�, powr�c� na kontynent.
	TELL_GARVELL = TELL_GARVELL + 1;
	b_giveplayerxp(XP_AMBIENT);
	if(TELL_GARVELL >= 3)
	{
		b_garvellsuccess();
	}
	else
	{
		b_garvellweiter();
	};
};


instance DIA_GARVELL_CITY(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 4;
	condition = dia_garvell_city_condition;
	information = dia_garvell_city_info;
	permanent = FALSE;
	description = "Co do tego orka za miastem�";
};


func int dia_garvell_city_condition()
{
	if((MIS_GARVELL_INFOS == LOG_RUNNING) && (KNOWS_PALADINS >= 2))
	{
		return TRUE;
	};
};

func void dia_garvell_city_info()
{
	AI_Output(other,self,"DIA_Garvell_City_15_00");	//Co do tego orka za miastem...
	AI_Output(self,other,"DIA_Garvell_City_04_01");	//Taaak...?
	AI_Output(other,self,"DIA_Garvell_City_15_02");	//Nie przejmuj si� nim. Stra� da sobie rad�.
	TELL_GARVELL = TELL_GARVELL + 1;
	b_giveplayerxp(XP_AMBIENT);
	if(TELL_GARVELL >= 3)
	{
		b_garvellsuccess();
	}
	else
	{
		b_garvellweiter();
	};
};


instance DIA_GARVELL_PERM(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 13;
	condition = dia_garvell_perm_condition;
	information = dia_garvell_perm_info;
	permanent = TRUE;
	description = "Co si� dzieje w porcie?";
};


func int dia_garvell_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_garvell_mission))
	{
		return TRUE;
	};
};

func void dia_garvell_perm_info()
{
	AI_Output(other,self,"DIA_Garvell_Perm_15_00");	//Co si� dzieje w porcie?
	if(MIS_GARVELL_INFOS != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Garvell_Perm_04_01");	//Orkowie depcz� nam po pi�tach, a ty pytasz, co si� dzieje w porcie?
		AI_Output(other,self,"DIA_Garvell_Perm_15_02");	//Chcia�em tylko...
		AI_Output(self,other,"DIA_Garvell_Perm_04_03");	//Najwi�kszy problem w tym, �e w porcie jest zbyt ma�o statk�w, �eby wszyscy mogli si� ewakuowa�.
		AI_Output(self,other,"DIA_Garvell_Perm_04_04");	//Szczerze m�wi�c, to jest tu tylko jeden statek, i w dodatku nale�y do paladyn�w.
	}
	else
	{
		AI_Output(self,other,"DIA_Garvell_Perm_04_05");	//Mo�esz si� rozejrze�. Jak widzisz, nic si� tu nie dzieje.
	};
};

