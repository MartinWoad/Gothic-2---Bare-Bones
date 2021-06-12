
instance DIA_Fernando_EXIT(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 999;
	condition = DIA_Fernando_EXIT_Condition;
	information = DIA_Fernando_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Fernando_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fernando_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Fernando_PICKPOCKET(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 900;
	condition = DIA_Fernando_PICKPOCKET_Condition;
	information = DIA_Fernando_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Kradzie¿ tego mieszka bêdzie ryzykownym zadaniem)";
};


func int DIA_Fernando_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItSe_GoldPocket100) >= 1) && (other.attribute[ATR_DEXTERITY] >= (50 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Fernando_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fernando_PICKPOCKET);
	Info_AddChoice(DIA_Fernando_PICKPOCKET,Dialog_Back,DIA_Fernando_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fernando_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fernando_PICKPOCKET_DoIt);
};

func void DIA_Fernando_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 50)
	{
		B_StealInvItems(self,other,ItSe_GoldPocket100,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		//B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Fernando_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Fernando_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fernando_PICKPOCKET);
};


instance DIA_Fernando_Hello(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 5;
	condition = DIA_Fernando_Hello_Condition;
	information = DIA_Fernando_Hello_Info;
	permanent = FALSE;
	description = "Jak idzie interes?";
};


func int DIA_Fernando_Hello_Condition()
{
	if(NpcObsessedByDMT_Fernando == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Fernando_Hello_Info()
{
	AI_Output(other,self,"DIA_Fernando_Hello_15_00");	//Jak interesy?
	AI_Output(self,other,"DIA_Fernando_Hello_14_01");	//Nie za dobrze. Wszystko by³o du¿o ³atwiejsze, zanim zniknê³a Bariera.
	AI_Output(self,other,"DIA_Fernando_Hello_14_02");	//WiêŸniowie wydobywali z kopalni ca³e tony rudy, które moje statki przewozi³y na kontynent.
	AI_Output(self,other,"DIA_Fernando_Hello_14_03");	//W drodze powrotnej przywozi³y jedzenie i inne towary.
	AI_Output(self,other,"DIA_Fernando_Hello_14_04");	//Niestety, te czasy minê³y. Zostaliœmy odciêci od kontynentu, wiêc musimy zadowalaæ siê jedynie tym, co dostarczaj¹ nam nasi ch³opi.
};


instance DIA_Fernando_Perm(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 850;
	condition = DIA_Fernando_Perm_Condition;
	information = DIA_Fernando_Perm_Info;
	permanent = TRUE;
	description = "Z czego siê teraz utrzymujesz?";
};


func int DIA_Fernando_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fernando_Hello) && (NpcObsessedByDMT_Fernando == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Perm_Info()
{
	AI_Output(other,self,"DIA_Fernando_Perm_15_00");	//Z czego siê teraz utrzymujesz?
	if(Npc_KnowsInfo(other,DIA_Fernando_Success) == FALSE)
	{
		AI_Output(self,other,"DIA_Fernando_Perm_14_01");	//Na razie ¿yjê z oszczêdnoœci. Jednak jeœli nie uda mi siê szybko stan¹æ na nogi, wkrótce bêdê mia³ powa¿ne problemy finansowe.
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Perm_14_02");	//Jestem zrujnowany. Powinienem by³ pos³uchaæ ojca, kiedy mnie ostrzega³, ¿ebym trzyma³ siê z daleka od górnictwa.
	};
};


instance DIA_Fernando_Minental(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 2;
	condition = DIA_Fernando_Minental_Condition;
	information = DIA_Fernando_Minental_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Fernando_Minental_Condition()
{
	if((NpcObsessedByDMT_Fernando == FALSE) && (MIS_OLDWORLD == LOG_Running) && (Kapitel == 2) && (EnterOW_Kapitel2 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Minental_Info()
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
	Log_CreateTopic(TOPIC_Fernando,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Fernando,LOG_Running);
	B_LogEntry(TOPIC_Fernando,"Kupiec Fernando chce wiedzieæ, co dzieje siê z rud¹ w Górniczej Dolinie.");
};


instance DIA_Fernando_Success(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 5;
	condition = DIA_Fernando_Success_Condition;
	information = DIA_Fernando_Success_Info;
	permanent = FALSE;
	description = "By³em w Górniczej Dolinie.";
};


func int DIA_Fernando_Success_Condition()
{
	if((NpcObsessedByDMT_Fernando == FALSE) && (Kapitel >= 3) && Npc_KnowsInfo(other,DIA_Fernando_Minental))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Success_Info()
{
	AI_Output(other,self,"DIA_Fernando_Success_15_00");	//By³em w Górniczej Dolinie.
	Fernando_Erz = TRUE;
	B_GivePlayerXP(XP_Ambient);
	AI_Output(self,other,"DIA_Fernando_Success_14_01");	//I co? Jak wygl¹da sytuacja?
	AI_Output(other,self,"DIA_Fernando_Success_15_02");	//Z³o¿a siê wyczerpa³y, nie warto prowadziæ prac dla kilku skrzyñ rudy.
	AI_Output(self,other,"DIA_Fernando_Success_14_03");	//To niemo¿liwe! A wiêc jestem zrujnowany...
	AI_Output(other,self,"DIA_Fernando_Success_15_04");	//Co z nasz¹ umow¹?
	AI_Output(self,other,"DIA_Fernando_Success_14_05");	//A teraz s³ówko o twojej nagrodzie...
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_06");	//Proszê, weŸ ten kamieñ runiczny.
		B_GiveInvItems(self,other,ItMi_RuneBlank,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_07");	//Proszê, weŸ ten pierœcieñ.
		B_GiveInvItems(self,other,ItRi_Hp_02,1);
	};
};


instance DIA_Fernando_Obsession(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 30;
	condition = DIA_Fernando_Obsession_Condition;
	information = DIA_Fernando_Obsession_Info;
	description = "Wszystko w porz¹dku?";
};


func int DIA_Fernando_Obsession_Condition()
{
	if((Kapitel >= 3) && (NpcObsessedByDMT_Fernando == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int dia_fernando_obsession_gotmoney;

func void DIA_Fernando_Obsession_Info()
{
	B_NpcObsessedByDMT(self);
};


instance DIA_Fernando_Heilung(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 55;
	condition = DIA_Fernando_Heilung_Condition;
	information = DIA_Fernando_Heilung_Info;
	permanent = TRUE;
	description = "Jesteœ opêtany!";
};


func int DIA_Fernando_Heilung_Condition()
{
	if((NpcObsessedByDMT_Fernando == TRUE) && (NpcObsessedByDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Heilung_Info()
{
	AI_Output(other,self,"DIA_Fernando_Heilung_15_00");	//Jesteœ opêtany!
	AI_Output(self,other,"DIA_Fernando_Heilung_14_01");	//IdŸ. No idŸ wreszcie!
	B_NpcClearObsessionByDMT(self);
};
