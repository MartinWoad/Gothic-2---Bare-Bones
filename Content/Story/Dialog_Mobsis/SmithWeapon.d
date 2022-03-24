
instance PC_SmithWeapon_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_SmithWeapon_End_Condition;
	information = PC_SmithWeapon_End_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int PC_SmithWeapon_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon)
	{
		return TRUE;
	};
};

func void PC_SmithWeapon_End_Info()
{
	CreateInvItems(self,ItMiSwordraw,1);
	b_endproductiondialog();
};


instance PC_ItMw_1H_Common(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_1H_Common_Condition;
	information = PC_ItMw_1H_Common_Info;
	permanent = TRUE;
};


func int PC_ItMw_1H_Common_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_1H_Common_Info()
{
	CreateInvItems(hero,ItMw_1H_Common_01,1);
	PrintS(PRINT_SmithSuccess);
	b_endproductiondialog();
};


instance PC_ItMw_1H_Special_01(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_1H_Special_01_Condition;
	information = PC_ItMw_1H_Special_01_Info;
	permanent = TRUE;
};


func int PC_ItMw_1H_Special_01_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_1H_Special_01_Info()
{
	if(Npc_HasItems(hero,ItMi_Nugget) >= 1)
	{
		Npc_RemoveInvItems(hero,ItMi_Nugget,1);
		CreateInvItems(hero,ItMw_1H_Special_01,1);
		PrintS(PRINT_SmithSuccess);
	}
	else
	{
		PrintS(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMiSwordraw,1);
	};
	b_endproductiondialog();
};


instance PC_ItMw_2H_Special_01(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_2H_Special_01_Condition;
	information = PC_ItMw_2H_Special_01_Info;
	permanent = TRUE;
};


func int PC_ItMw_2H_Special_01_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_2H_Special_01_Info()
{
	if(Npc_HasItems(hero,ItMi_Nugget) >= 2)
	{
		Npc_RemoveInvItems(hero,ItMi_Nugget,2);
		CreateInvItems(hero,ItMw_2H_Special_01,1);
		PrintS(PRINT_SmithSuccess);
	}
	else
	{
		PrintS(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMiSwordraw,1);
	};
	b_endproductiondialog();
};


instance PC_ItMw_1H_Special_02(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_1H_Special_02_Condition;
	information = PC_ItMw_1H_Special_02_Info;
	permanent = TRUE;
};


func int PC_ItMw_1H_Special_02_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_1H_Special_02_Info()
{
	if(Npc_HasItems(hero,ItMi_Nugget) >= 2)
	{
		Npc_RemoveInvItems(hero,ItMi_Nugget,2);
		CreateInvItems(hero,ItMw_1H_Special_02,1);
		PrintS(PRINT_SmithSuccess);
	}
	else
	{
		PrintS(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMiSwordraw,1);
	};
	b_endproductiondialog();
};


instance PC_ItMw_2H_Special_02(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_2H_Special_02_Condition;
	information = PC_ItMw_2H_Special_02_Info;
	permanent = TRUE;
};


func int PC_ItMw_2H_Special_02_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_2H_Special_02_Info()
{
	if(Npc_HasItems(hero,ItMi_Nugget) >= 3)
	{
		Npc_RemoveInvItems(hero,ItMi_Nugget,3);
		CreateInvItems(hero,ItMw_2H_Special_02,1);
		PrintS(PRINT_SmithSuccess);
	}
	else
	{
		PrintS(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMiSwordraw,1);
	};
	b_endproductiondialog();
};


instance PC_ItMw_1H_Special_03(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_1H_Special_03_Condition;
	information = PC_ItMw_1H_Special_03_Info;
	permanent = TRUE;
};


func int PC_ItMw_1H_Special_03_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_1H_Special_03_Info()
{
	if(Npc_HasItems(hero,ItMi_Nugget) >= 3)
	{
		Npc_RemoveInvItems(hero,ItMi_Nugget,3);
		CreateInvItems(hero,ItMw_1H_Special_03,1);
		PrintS(PRINT_SmithSuccess);
	}
	else
	{
		PrintS(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMiSwordraw,1);
	};
	b_endproductiondialog();
};


instance PC_ItMw_2H_Special_03(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_2H_Special_03_Condition;
	information = PC_ItMw_2H_Special_03_Info;
	permanent = TRUE;
};


func int PC_ItMw_2H_Special_03_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_2H_Special_03_Info()
{
	if(Npc_HasItems(hero,ItMi_Nugget) >= 4)
	{
		Npc_RemoveInvItems(hero,ItMi_Nugget,4);
		CreateInvItems(hero,ItMw_2H_Special_03,1);
		PrintS(PRINT_SmithSuccess);
	}
	else
	{
		PrintS(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMiSwordraw,1);
	};
	b_endproductiondialog();
};


instance PC_ItMw_1H_Special_04(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_1H_Special_04_Condition;
	information = PC_ItMw_1H_Special_04_Info;
	permanent = TRUE;
};


func int PC_ItMw_1H_Special_04_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_1H_Special_04_Info()
{
	if((Npc_HasItems(hero,ItMi_Nugget) >= 4) && (Npc_HasItems(hero,ItAt_DragonBlood) >= 5))
	{
		Npc_RemoveInvItems(hero,ItMi_Nugget,4);
		Npc_RemoveInvItems(hero,ItAt_DragonBlood,5);
		CreateInvItems(hero,ItMw_1H_Special_04,1);
		PrintS(PRINT_SmithSuccess);
	}
	else
	{
		PrintS(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMiSwordraw,1);
	};
	b_endproductiondialog();
};


instance PC_ItMw_2H_Special_04(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_2H_Special_04_Condition;
	information = PC_ItMw_2H_Special_04_Info;
	permanent = TRUE;
};


func int PC_ItMw_2H_Special_04_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_2H_Special_04_Info()
{
	if((Npc_HasItems(hero,ItMi_Nugget) >= 5) && (Npc_HasItems(hero,ItAt_DragonBlood) >= 5))
	{
		Npc_RemoveInvItems(hero,ItMi_Nugget,5);
		Npc_RemoveInvItems(hero,ItAt_DragonBlood,5);
		CreateInvItems(hero,ItMw_2H_Special_04,1);
		PrintS(PRINT_SmithSuccess);
	}
	else
	{
		PrintS(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMiSwordraw,1);
	};
	b_endproductiondialog();
};

func void smithweapon_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_SmithWeapon;
		AI_ProcessInfos(her);
	};
	PC_ItMw_1H_Common.description = NAME_ItMw_1H_Common_01;
	PC_ItMw_1H_Special_01.description = ConcatStrings(NAME_ItMw_1H_Special_01,PRINT_Smith_1H_Special_01);
	PC_ItMw_2H_Special_01.description = ConcatStrings(NAME_ItMw_2H_Special_01,PRINT_Smith_2H_Special_01);
	PC_ItMw_1H_Special_02.description = ConcatStrings(NAME_ItMw_1H_Special_02,PRINT_Smith_1H_Special_02);
	PC_ItMw_2H_Special_02.description = ConcatStrings(NAME_ItMw_2H_Special_02,PRINT_Smith_2H_Special_02);
	PC_ItMw_1H_Special_03.description = ConcatStrings(NAME_ItMw_1H_Special_03,PRINT_Smith_1H_Special_03);
	PC_ItMw_2H_Special_03.description = ConcatStrings(NAME_ItMw_2H_Special_03,PRINT_Smith_2H_Special_03);
	PC_ItMw_1H_Special_04.description = ConcatStrings(NAME_ItMw_1H_Special_04,PRINT_Smith_1H_Special_04);
	PC_ItMw_2H_Special_04.description = ConcatStrings(NAME_ItMw_2H_Special_04,PRINT_Smith_2H_Special_04);
};

