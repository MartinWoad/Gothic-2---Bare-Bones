
instance DIA_Rangar_EXIT(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 999;
	condition = DIA_Rangar_EXIT_Condition;
	information = DIA_Rangar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rangar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rangar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Rangar_PICKPOCKET(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 900;
	condition = DIA_Rangar_PICKPOCKET_Condition;
	information = DIA_Rangar_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Kradzie� tego klucza b�dzie do�� �atwa)";
};


func int DIA_Rangar_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_City_Tower_02) >= 1) && (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Rangar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rangar_PICKPOCKET);
	Info_AddChoice(DIA_Rangar_PICKPOCKET,Dialog_Back,DIA_Rangar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rangar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Rangar_PICKPOCKET_DoIt);
};

func void DIA_Rangar_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems(self,other,ItKe_City_Tower_02,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Rangar_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Rangar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rangar_PICKPOCKET);
};


instance DIA_Rangar_Hallo(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 2;
	condition = DIA_Rangar_Hallo_Condition;
	information = DIA_Rangar_Hallo_Info;
	permanent = FALSE;
	description = "Hej, co s�ycha�?";
};


func int DIA_Rangar_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Rangar_Hallo_Info()
{
	AI_Output(other,self,"DIA_Rangar_Hallo_15_00");	//Hej, co s�ycha�?
	AI_Output(self,other,"DIA_Rangar_Hallo_07_01");	//P�ki paladyni nie maj� dla mnie �adnych zada�, mog� si� spokojnie odpr�y� i wypi� kilka piwek. Czeg� wi�cej mo�na pragn��.
	AI_Output(other,self,"DIA_Rangar_Hallo_15_02");	//Pracujesz dla paladyn�w?
	AI_Output(self,other,"DIA_Rangar_Hallo_07_03");	//Taaa, donosz� im o sytuacji w mie�cie. W tej chwili jest wyj�tkowo spokojnie.
};


instance DIA_Rangar_Ork(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 3;
	condition = DIA_Rangar_Ork_Condition;
	information = DIA_Rangar_Ork_Info;
	permanent = FALSE;
	description = "Jak si� maj� sprawy z orkami?";
};


func int DIA_Rangar_Ork_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rangar_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Rangar_Ork_Info()
{
	AI_Output(other,self,"DIA_Rangar_Ork_15_00");	//Jak si� maj� sprawy z orkami?
	AI_Output(self,other,"DIA_Rangar_Ork_07_01");	//Nie ma si� czym martwi� - paladyni i my, stra�nicy miejscy, panujemy nad wszystkim.
	AI_Output(self,other,"DIA_Rangar_Ork_07_02");	//Id� lepiej do domu i pozw�l nam w spokoju wype�nia� nasze obowi�zki. Strze�emy miasta i jego obywateli.
};


instance DIA_Rangar_Bier(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 4;
	condition = DIA_Rangar_Bier_Condition;
	information = DIA_Rangar_Bier_Info;
	permanent = TRUE;
	description = "Mo�e jeszcze jedno piwko?";
};


func int DIA_Rangar_Bier_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rangar_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Rangar_Bier_Info()
{
	AI_Output(other,self,"DIA_Rangar_Bier_15_00");	//Mo�e jeszcze jedno piwko?
	if(B_GiveInvItems(other,self,ItFo_Beer,1))
	{
		if(Knows_Paladins == FALSE)
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_01");	//Ach - nie ma nic lepszego ni� ch�odny porter.
			CreateInvItems(self,ItFo_Booze,1);
			B_UseItem(self,ItFo_Booze);
			AI_Output(other,self,"DIA_Rangar_Bier_15_02");	//Zdaje si�, �e chcia�e� powiedzie� co� o orkach.
			AI_Output(self,other,"DIA_Rangar_Bier_07_03");	//Och tak, tak, prawda. Orkowie nie stanowi� �adnego zagro�enia dla miasta.
			AI_Output(self,other,"DIA_Rangar_Bier_07_04");	//Utkn�li w G�rniczej Dolinie, a prze��cz jest obstawiona przez paladyn�w.
			AI_Output(self,other,"DIA_Rangar_Bier_07_05");	//Nawet chrz�szcz si� nie przeci�nie.
			Knows_Paladins = 1;
			Info_ClearChoices(DIA_Rangar_Bier);
		}
		else if((Knows_Paladins == 1) && (Knows_Ork == TRUE))
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_06");	//Nigdy nie odmawiam piwa.
			CreateInvItems(self,ItFo_Booze,1);
			B_UseItem(self,ItFo_Booze);
			AI_Output(other,self,"DIA_Rangar_Bier_15_07");	//Podobno zauwa�ono za miastem orka.
			AI_Output(self,other,"DIA_Rangar_Bier_07_08");	//Taa, jaaasne, wielki, niebezpieczny ork. Prawdziwe monstrum. Na pewno zaatakuje miasto.
			AI_Output(self,other,"DIA_Rangar_Bier_07_09");	//Pos�uchaj no, nakopiemy mu do tego t�ustego, orkowego ty�ka, je�li tylko zbli�y si� do miasta. Rozumiesz?
			AI_Output(other,self,"DIA_Rangar_Bier_15_10");	//Rozumiem.
			Knows_Paladins = 2;
			Info_ClearChoices(DIA_Rangar_Bier);
		}
		else
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_11");	//Smakowite, zimne piwo... Absolutnie najlepsze.
			CreateInvItems(self,ItFo_Booze,1);
			B_UseItem(self,ItFo_Booze);
			AI_Output(self,other,"DIA_Rangar_Bier_07_12");	//Niecz�sto spotyka si� kogo�, kto stawia piwo. Jeste� w porz�dku.
			Info_ClearChoices(DIA_Rangar_Bier);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Rangar_Bier_07_13");	//Jasne, ch�tnie si� jeszcze napij�. Przynie� jedno.
		AI_StopProcessInfos(self);
	};
};

