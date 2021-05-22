
instance DIA_FERNANDO_EXIT(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 999;
	condition = dia_fernando_exit_condition;
	information = dia_fernando_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_fernando_exit_condition()
{
	return TRUE;
};

func void dia_fernando_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_FERNANDO_PICKPOCKET(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 900;
	condition = dia_fernando_pickpocket_condition;
	information = dia_fernando_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie¿ tego mieszka bêdzie ryzykownym zadaniem)";
};


func int dia_fernando_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itse_goldpocket100) >= 1) && (other.attribute[ATR_DEXTERITY] >= (50 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_fernando_pickpocket_info()
{
	Info_ClearChoices(dia_fernando_pickpocket);
	Info_AddChoice(dia_fernando_pickpocket,DIALOG_BACK,dia_fernando_pickpocket_back);
	Info_AddChoice(dia_fernando_pickpocket,DIALOG_PICKPOCKET,dia_fernando_pickpocket_doit);
};

func void dia_fernando_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 50)
	{
		b_giveinvitems(self,other,5606,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_giveplayerxp(XP_AMBIENT);
		Info_ClearChoices(dia_fernando_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_fernando_pickpocket_back()
{
	Info_ClearChoices(dia_fernando_pickpocket);
};


instance DIA_FERNANDO_HELLO(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 5;
	condition = dia_fernando_hello_condition;
	information = dia_fernando_hello_info;
	permanent = FALSE;
	description = "Jak idzie interes?";
};


func int dia_fernando_hello_condition()
{
	if(NPCOBSESSEDBYDMT_FERNANDO == FALSE)
	{
		return TRUE;
	};
};

func void dia_fernando_hello_info()
{
	AI_Output(other,self,"DIA_Fernando_Hello_15_00");	//Jak interesy?
	AI_Output(self,other,"DIA_Fernando_Hello_14_01");	//Nie za dobrze. Wszystko by³o du¿o ³atwiejsze, zanim zniknê³a Bariera.
	AI_Output(self,other,"DIA_Fernando_Hello_14_02");	//WiêŸniowie wydobywali z kopalni ca³e tony rudy, które moje statki przewozi³y na kontynent.
	AI_Output(self,other,"DIA_Fernando_Hello_14_03");	//W drodze powrotnej przywozi³y jedzenie i inne towary.
	AI_Output(self,other,"DIA_Fernando_Hello_14_04");	//Niestety, te czasy minê³y. Zostaliœmy odciêci od kontynentu, wiêc musimy zadowalaæ siê jedynie tym, co dostarczaj¹ nam nasi ch³opi.
};


instance DIA_FERNANDO_PERM(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 850;
	condition = dia_fernando_perm_condition;
	information = dia_fernando_perm_info;
	permanent = TRUE;
	description = "Z czego siê teraz utrzymujesz?";
};


func int dia_fernando_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_fernando_hello) && (NPCOBSESSEDBYDMT_FERNANDO == FALSE))
	{
		return TRUE;
	};
};

func void dia_fernando_perm_info()
{
	AI_Output(other,self,"DIA_Fernando_Perm_15_00");	//Z czego siê teraz utrzymujesz?
	if(Npc_KnowsInfo(other,dia_fernando_success) == FALSE)
	{
		AI_Output(self,other,"DIA_Fernando_Perm_14_01");	//Na razie ¿yjê z oszczêdnoœci. Jednak jeœli nie uda mi siê szybko stan¹æ na nogi, wkrótce bêdê mia³ powa¿ne problemy finansowe.
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Perm_14_02");	//Jestem zrujnowany. Powinienem by³ pos³uchaæ ojca, kiedy mnie ostrzega³, ¿ebym trzyma³ siê z daleka od górnictwa.
	};
};


instance DIA_FERNANDO_MINENTAL(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 2;
	condition = dia_fernando_minental_condition;
	information = dia_fernando_minental_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_fernando_minental_condition()
{
	if((NPCOBSESSEDBYDMT_FERNANDO == FALSE) && (MIS_OLDWORLD == LOG_RUNNING) && (KAPITEL == 2) && (ENTEROW_KAPITEL2 == FALSE))
	{
		return TRUE;
	};
};

func void dia_fernando_minental_info()
{
	AI_Output(self,other,"DIA_Fernando_Minental_14_00");	//Ej, ty - zaczekaj chwilê. Podró¿ujesz do Górniczej Doliny, prawda?
	AI_Output(other,self,"DIA_Fernando_Minental_15_01");	//Co w zwi¹zku z tym?
	AI_Output(self,other,"DIA_Fernando_Minental_14_02");	//Zawrzyjmy umowê. Powiesz mi, co siê dzieje z rud¹, a ja w zamian za to podarujê ci...
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_03");	//...kamieñ runiczny.
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_04");	//...pierœcieñ, który podniesie twoj¹ energiê ¿yciow¹.
	};
	AI_Output(other,self,"DIA_Fernando_Minental_15_05");	//Zobaczê, co da siê zrobiæ.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	Log_CreateTopic(TOPIC_FERNANDO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FERNANDO,LOG_RUNNING);
	b_logentry(TOPIC_FERNANDO,"Kupiec Fernando chce wiedzieæ, co dzieje siê z rud¹ w Górniczej Dolinie.");
};


instance DIA_FERNANDO_SUCCESS(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 5;
	condition = dia_fernando_success_condition;
	information = dia_fernando_success_info;
	permanent = FALSE;
	description = "By³em w Górniczej Dolinie.";
};


func int dia_fernando_success_condition()
{
	if((NPCOBSESSEDBYDMT_FERNANDO == FALSE) && (KAPITEL >= 3) && Npc_KnowsInfo(other,dia_fernando_minental))
	{
		return TRUE;
	};
};

func void dia_fernando_success_info()
{
	AI_Output(other,self,"DIA_Fernando_Success_15_00");	//By³em w Górniczej Dolinie.
	FERNANDO_ERZ = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	AI_Output(self,other,"DIA_Fernando_Success_14_01");	//I co? Jak wygl¹da sytuacja?
	AI_Output(other,self,"DIA_Fernando_Success_15_02");	//Z³o¿a siê wyczerpa³y, nie warto prowadziæ prac dla kilku skrzyñ rudy.
	AI_Output(self,other,"DIA_Fernando_Success_14_03");	//To niemo¿liwe! A wiêc jestem zrujnowany...
	AI_Output(other,self,"DIA_Fernando_Success_15_04");	//Co z nasz¹ umow¹?
	AI_Output(self,other,"DIA_Fernando_Success_14_05");	//A teraz s³ówko o twojej nagrodzie...
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_06");	//Proszê, weŸ ten kamieñ runiczny.
		b_giveinvitems(self,other,5086,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_07");	//Proszê, weŸ ten pierœcieñ.
		b_giveinvitems(self,other,5374,1);
	};
};


instance DIA_FERNANDO_OBSESSION(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 30;
	condition = dia_fernando_obsession_condition;
	information = dia_fernando_obsession_info;
	description = "Wszystko w porz¹dku?";
};


func int dia_fernando_obsession_condition()
{
	if((KAPITEL >= 3) && (NPCOBSESSEDBYDMT_FERNANDO == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int dia_fernando_obsession_gotmoney;

func void dia_fernando_obsession_info()
{
	b_npcobsessedbydmt(self);
};


instance DIA_FERNANDO_HEILUNG(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 55;
	condition = dia_fernando_heilung_condition;
	information = dia_fernando_heilung_info;
	permanent = TRUE;
	description = "Jesteœ opêtany!";
};


func int dia_fernando_heilung_condition()
{
	if((NPCOBSESSEDBYDMT_FERNANDO == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_fernando_heilung_info()
{
	AI_Output(other,self,"DIA_Fernando_Heilung_15_00");	//Jesteœ opêtany!
	AI_Output(self,other,"DIA_Fernando_Heilung_14_01");	//IdŸ. No idŸ wreszcie!
	b_npcclearobsessionbydmt(self);
};

