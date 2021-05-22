
instance DIA_BROMOR_EXIT(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 999;
	condition = dia_bromor_exit_condition;
	information = dia_bromor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bromor_exit_condition()
{
	return TRUE;
};

func void dia_bromor_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_BROMOR_GIRLS(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 2;
	condition = dia_bromor_girls_condition;
	information = dia_bromor_girls_info;
	permanent = FALSE;
	description = "Chcê siê zabawiæ.";
};


func int dia_bromor_girls_condition()
{
	if(NPCOBSESSEDBYDMT_BROMOR == FALSE)
	{
		return TRUE;
	};
};

func void dia_bromor_girls_info()
{
	AI_Output(other,self,"DIA_Bromor_GIRLS_15_00");	//Chcê siê zabawiæ.
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_01");	//Koniec koñców po to tu w³aœnie przyszed³eœ.
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_02");	//Jestem Bromor. To mój przybytek, a to moje dziewczyny. Lubiê je.
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_03");	//A jeœli ty te¿ je lubisz, to za nie zap³acisz - 50 sztuk z³ota.
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_04");	//I lepiej nie myœl o wszczynaniu tutaj burd.
};


instance DIA_BROMOR_PAY(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 2;
	condition = dia_bromor_pay_condition;
	information = dia_bromor_pay_info;
	permanent = TRUE;
	description = "Chcê siê troszkê zabawiæ (zap³aæ 50 sztuk z³ota).";
};


func int dia_bromor_pay_condition()
{
	if((BROMOR_PAY == FALSE) && Npc_KnowsInfo(other,dia_bromor_girls) && (NPCOBSESSEDBYDMT_BROMOR == FALSE) && (Npc_IsDead(nadja) == FALSE))
	{
		return TRUE;
	};
};


var int dia_bromor_pay_onetime;

func void dia_bromor_pay_info()
{
	AI_Output(other,self,"DIA_Bromor_Pay_15_00");	//Chcê siê zabawiæ.
	if(b_giveinvitems(other,self,5113,50))
	{
		AI_Output(self,other,"DIA_Bromor_Pay_07_01");	//Dobra. Najbli¿szych kilku godzin d³ugo nie zapomnisz.
		AI_Output(self,other,"DIA_Bromor_Pay_07_02");	//Zatem idŸ na górê z Nadj¹.
		if(DIA_BROMOR_PAY_ONETIME == FALSE)
		{
			DIA_BROMOR_PAY_ONETIME = TRUE;
		};
		BROMOR_PAY = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Bromor_Pay_07_03");	//Nie znoszê, kiedy ludzie próbuj¹ ze mnie ¿artowaæ. Skoro nie mo¿esz zap³aciæ, to wynoœ siê st¹d.
	};
	b_npcclearobsessionbydmt(self);
};


instance DIA_BROMOR_DOPE(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 3;
	condition = dia_bromor_dope_condition;
	information = dia_bromor_dope_info;
	permanent = FALSE;
	description = "Czy mogê tutaj dostaæ tak¿e 'wyj¹tkowe' towary?";
};


func int dia_bromor_dope_condition()
{
	if((MIS_ANDRE_REDLIGHT == LOG_RUNNING) && (NPCOBSESSEDBYDMT_BROMOR == FALSE))
	{
		return TRUE;
	};
};

func void dia_bromor_dope_info()
{
	AI_Output(other,self,"DIA_Bromor_DOPE_15_00");	//Czy mogê tutaj dostaæ tak¿e 'wyj¹tkowe' towary?
	AI_Output(self,other,"DIA_Bromor_DOPE_07_01");	//Pewnie, wszystkie moje dziewczyny s¹ wyj¹tkowe.
	AI_Output(self,other,"DIA_Bromor_DOPE_07_02");	//Je¿eli masz doœæ z³ota, mo¿esz iœæ na górê z Nadj¹.
};


instance DIA_BROMOR_OBSESSION(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 30;
	condition = dia_bromor_obsession_condition;
	information = dia_bromor_obsession_info;
	description = "Wszystko w porz¹dku?";
};


func int dia_bromor_obsession_condition()
{
	if((KAPITEL >= 3) && (NPCOBSESSEDBYDMT_BROMOR == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int dia_bromor_obsession_gotmoney;

func void dia_bromor_obsession_info()
{
	b_npcobsessedbydmt(self);
};


instance DIA_BROMOR_HEILUNG(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 55;
	condition = dia_bromor_heilung_condition;
	information = dia_bromor_heilung_info;
	permanent = TRUE;
	description = "Jesteœ opêtany.";
};


func int dia_bromor_heilung_condition()
{
	if((NPCOBSESSEDBYDMT_BROMOR == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_bromor_heilung_info()
{
	AI_Output(other,self,"DIA_Bromor_Heilung_15_00");	//Jesteœ opêtany.
	AI_Output(self,other,"DIA_Bromor_Heilung_07_01");	//Co? O czym ty gadasz? Wynocha.
	b_npcclearobsessionbydmt(self);
};


instance DIA_BROMOR_PICKPOCKET(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 900;
	condition = dia_bromor_pickpocket_condition;
	information = dia_bromor_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie¿ tego klucza bêdzie ryzykownym zadaniem)";
};


func int dia_bromor_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_bromor) >= 1) && (other.attribute[ATR_DEXTERITY] >= (50 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_bromor_pickpocket_info()
{
	Info_ClearChoices(dia_bromor_pickpocket);
	Info_AddChoice(dia_bromor_pickpocket,DIALOG_BACK,dia_bromor_pickpocket_back);
	Info_AddChoice(dia_bromor_pickpocket,DIALOG_PICKPOCKET,dia_bromor_pickpocket_doit);
};

func void dia_bromor_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 50)
	{
		b_giveinvitems(self,other,5748,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_giveplayerxp(XP_AMBIENT);
		Info_ClearChoices(dia_bromor_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_bromor_pickpocket_back()
{
	Info_ClearChoices(dia_bromor_pickpocket);
};

