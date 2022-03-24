
instance DIA_Bromor_EXIT(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 999;
	condition = DIA_Bromor_EXIT_Condition;
	information = DIA_Bromor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bromor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bromor_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Bromor_GIRLS(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 2;
	condition = DIA_Bromor_GIRLS_Condition;
	information = DIA_Bromor_GIRLS_Info;
	permanent = FALSE;
	description = "Chcê siê zabawiæ.";
};


func int DIA_Bromor_GIRLS_Condition()
{
	if(NpcObsessedByDMT_Bromor == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Bromor_GIRLS_Info()
{
	AI_Output(other,self,"DIA_Bromor_GIRLS_15_00");	//Chcê siê zabawiæ.
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_01");	//Koniec koñców po to tu w³aœnie przyszed³eœ.
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_02");	//Jestem Bromor. To mój przybytek, a to moje dziewczyny. Lubiê je.
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_03");	//A jeœli ty te¿ je lubisz, to za nie zap³acisz - 50 sztuk z³ota.
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_04");	//I lepiej nie myœl o wszczynaniu tutaj burd.
};


instance DIA_Bromor_Pay(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 2;
	condition = DIA_Bromor_Pay_Condition;
	information = DIA_Bromor_Pay_Info;
	permanent = TRUE;
	description = "Chcê siê troszkê zabawiæ (zap³aæ 50 sztuk z³ota).";
};


func int DIA_Bromor_Pay_Condition()
{
	if((Bromor_Pay == FALSE) && Npc_KnowsInfo(other,DIA_Bromor_GIRLS) && (NpcObsessedByDMT_Bromor == FALSE) && (Npc_IsDead(Nadja) == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Bromor_Pay_OneTime;

func void DIA_Bromor_Pay_Info()
{
	AI_Output(other,self,"DIA_Bromor_Pay_15_00");	//Chcê siê zabawiæ.
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Bromor_Pay_07_01");	//Dobra. Najbli¿szych kilku godzin d³ugo nie zapomnisz.
		AI_Output(self,other,"DIA_Bromor_Pay_07_02");	//Zatem idŸ na górê z Nadj¹.
		if(DIA_Bromor_Pay_OneTime == FALSE)
		{
			DIA_Bromor_Pay_OneTime = TRUE;
		};
		Bromor_Pay = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Bromor_Pay_07_03");	//Nie znoszê, kiedy ludzie próbuj¹ ze mnie ¿artowaæ. Skoro nie mo¿esz zap³aciæ, to wynoœ siê st¹d.
	};
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Bromor_DOPE(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 3;
	condition = DIA_Bromor_DOPE_Condition;
	information = DIA_Bromor_DOPE_Info;
	permanent = FALSE;
	description = "Czy mogê tutaj dostaæ tak¿e 'wyj¹tkowe' towary?";
};


func int DIA_Bromor_DOPE_Condition()
{
	if((MIS_Andre_REDLIGHT == LOG_Running) && (NpcObsessedByDMT_Bromor == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bromor_DOPE_Info()
{
	AI_Output(other,self,"DIA_Bromor_DOPE_15_00");	//Czy mogê tutaj dostaæ tak¿e 'wyj¹tkowe' towary?
	AI_Output(self,other,"DIA_Bromor_DOPE_07_01");	//Pewnie, wszystkie moje dziewczyny s¹ wyj¹tkowe.
	AI_Output(self,other,"DIA_Bromor_DOPE_07_02");	//Je¿eli masz doœæ z³ota, mo¿esz iœæ na górê z Nadj¹.
};


instance DIA_Bromor_Obsession(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 30;
	condition = DIA_Bromor_Obsession_Condition;
	information = DIA_Bromor_Obsession_Info;
	description = "Wszystko w porz¹dku?";
};


func int DIA_Bromor_Obsession_Condition()
{
	if((Kapitel >= 3) && (NpcObsessedByDMT_Bromor == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int DIA_Bromor_Obsession_GotMoney;

func void DIA_Bromor_Obsession_Info()
{
	B_NpcObsessedByDMT(self);
};


instance DIA_Bromor_Heilung(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 55;
	condition = DIA_Bromor_Heilung_Condition;
	information = DIA_Bromor_Heilung_Info;
	permanent = TRUE;
	description = "Jesteœ opêtany.";
};


func int DIA_Bromor_Heilung_Condition()
{
	if((NpcObsessedByDMT_Bromor == TRUE) && (NpcObsessedByDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Bromor_Heilung_Info()
{
	AI_Output(other,self,"DIA_Bromor_Heilung_15_00");	//Jesteœ opêtany.
	AI_Output(self,other,"DIA_Bromor_Heilung_07_01");	//Co? O czym ty gadasz? Wynocha.
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Bromor_PICKPOCKET(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 900;
	condition = DIA_Bromor_PICKPOCKET_Condition;
	information = DIA_Bromor_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Kradzie¿ tego klucza bêdzie ryzykownym zadaniem)";
};


func int DIA_Bromor_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_Bromor) >= 1) && (other.attribute[ATR_DEXTERITY] >= (50 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Bromor_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bromor_PICKPOCKET);
	Info_AddChoice(DIA_Bromor_PICKPOCKET,Dialog_Back,DIA_Bromor_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bromor_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bromor_PICKPOCKET_DoIt);
};

func void DIA_Bromor_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 50)
	{
		B_StealInvItems(self,other,ItKe_Bromor,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		//B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Bromor_PICKPOCKET);

		if(hero.attribute[ATR_DEXTERITY] - ATTRIBUTEFROMEQUIPMENT[ATR_DEXTERITY] < attributepotential[ATR_DEXTERITY])
		{
			heroDexterityExp += 500;
			CheckWeaponLevelUp();
		};

	}
	else
	{
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Bromor_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bromor_PICKPOCKET);
};
