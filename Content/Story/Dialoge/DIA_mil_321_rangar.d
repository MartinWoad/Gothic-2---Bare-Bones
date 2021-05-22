
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
	description = "(Kradzie¿ tego klucza bêdzie doœæ ³atwa)";
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
	description = "Hej, co s³ychaæ?";
};


func int DIA_Rangar_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Rangar_Hallo_Info()
{
	AI_Output(other,self,"DIA_Rangar_Hallo_15_00");	//Hej, co s³ychaæ?
	AI_Output(self,other,"DIA_Rangar_Hallo_07_01");	//Póki paladyni nie maj¹ dla mnie ¿adnych zadañ, mogê siê spokojnie odprê¿yæ i wypiæ kilka piwek. Czegó¿ wiêcej mo¿na pragn¹æ.
	AI_Output(other,self,"DIA_Rangar_Hallo_15_02");	//Pracujesz dla paladynów?
	AI_Output(self,other,"DIA_Rangar_Hallo_07_03");	//Taaa, donoszê im o sytuacji w mieœcie. W tej chwili jest wyj¹tkowo spokojnie.
};


instance DIA_Rangar_Ork(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 3;
	condition = DIA_Rangar_Ork_Condition;
	information = DIA_Rangar_Ork_Info;
	permanent = FALSE;
	description = "Jak siê maj¹ sprawy z orkami?";
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
	AI_Output(other,self,"DIA_Rangar_Ork_15_00");	//Jak siê maj¹ sprawy z orkami?
	AI_Output(self,other,"DIA_Rangar_Ork_07_01");	//Nie ma siê czym martwiæ - paladyni i my, stra¿nicy miejscy, panujemy nad wszystkim.
	AI_Output(self,other,"DIA_Rangar_Ork_07_02");	//IdŸ lepiej do domu i pozwól nam w spokoju wype³niaæ nasze obowi¹zki. Strze¿emy miasta i jego obywateli.
};


instance DIA_Rangar_Bier(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 4;
	condition = DIA_Rangar_Bier_Condition;
	information = DIA_Rangar_Bier_Info;
	permanent = TRUE;
	description = "Mo¿e jeszcze jedno piwko?";
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
	AI_Output(other,self,"DIA_Rangar_Bier_15_00");	//Mo¿e jeszcze jedno piwko?
	if(B_GiveInvItems(other,self,ItFo_Beer,1))
	{
		if(Knows_Paladins == FALSE)
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_01");	//Ach - nie ma nic lepszego ni¿ ch³odny porter.
			CreateInvItems(self,ItFo_Booze,1);
			B_UseItem(self,ItFo_Booze);
			AI_Output(other,self,"DIA_Rangar_Bier_15_02");	//Zdaje siê, ¿e chcia³eœ powiedzieæ coœ o orkach.
			AI_Output(self,other,"DIA_Rangar_Bier_07_03");	//Och tak, tak, prawda. Orkowie nie stanowi¹ ¿adnego zagro¿enia dla miasta.
			AI_Output(self,other,"DIA_Rangar_Bier_07_04");	//Utknêli w Górniczej Dolinie, a prze³êcz jest obstawiona przez paladynów.
			AI_Output(self,other,"DIA_Rangar_Bier_07_05");	//Nawet chrz¹szcz siê nie przeciœnie.
			Knows_Paladins = 1;
			Info_ClearChoices(DIA_Rangar_Bier);
		}
		else if((Knows_Paladins == 1) && (Knows_Ork == TRUE))
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_06");	//Nigdy nie odmawiam piwa.
			CreateInvItems(self,ItFo_Booze,1);
			B_UseItem(self,ItFo_Booze);
			AI_Output(other,self,"DIA_Rangar_Bier_15_07");	//Podobno zauwa¿ono za miastem orka.
			AI_Output(self,other,"DIA_Rangar_Bier_07_08");	//Taa, jaaasne, wielki, niebezpieczny ork. Prawdziwe monstrum. Na pewno zaatakuje miasto.
			AI_Output(self,other,"DIA_Rangar_Bier_07_09");	//Pos³uchaj no, nakopiemy mu do tego t³ustego, orkowego ty³ka, jeœli tylko zbli¿y siê do miasta. Rozumiesz?
			AI_Output(other,self,"DIA_Rangar_Bier_15_10");	//Rozumiem.
			Knows_Paladins = 2;
			Info_ClearChoices(DIA_Rangar_Bier);
		}
		else
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_11");	//Smakowite, zimne piwo... Absolutnie najlepsze.
			CreateInvItems(self,ItFo_Booze,1);
			B_UseItem(self,ItFo_Booze);
			AI_Output(self,other,"DIA_Rangar_Bier_07_12");	//Nieczêsto spotyka siê kogoœ, kto stawia piwo. Jesteœ w porz¹dku.
			Info_ClearChoices(DIA_Rangar_Bier);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Rangar_Bier_07_13");	//Jasne, chêtnie siê jeszcze napijê. Przynieœ jedno.
		AI_StopProcessInfos(self);
	};
};

