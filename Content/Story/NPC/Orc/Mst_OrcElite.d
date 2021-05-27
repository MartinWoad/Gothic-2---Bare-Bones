
prototype Mst_Default_OrcElite(C_Npc)
{
	name[0] = "Elitarny Ork";
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCELITE;
	voice = 18;
	level = 35;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 120;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 120;
	protection[PROT_MAGIC] = 100;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	bodyStateInterruptableOverride = TRUE;
};

func void B_SetVisuals_OrcElite()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElite",DEFAULT,DEFAULT,"Orc_HeadWarrior",DEFAULT,DEFAULT,-1);
};


instance OrcElite_Roam(Mst_Default_OrcElite)
{
	B_SetVisuals_OrcElite();
	EquipItem(self,ItMw_2H_OrcSword_02);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance OrcElite_Rest(Mst_Default_OrcElite)
{
	B_SetVisuals_OrcElite();
	EquipItem(self,ItMw_2H_OrcSword_02);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance OrkElite_AntiPaladinOrkOberst(Mst_Default_OrcElite)
{
	name[0] = "Ork Pu�kownik";
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 180;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	B_SetVisuals_OrcElite();
	EquipItem(self,ItMw_Schlachtaxt);
	CreateInvItems(self,ItRi_OrcEliteRing,1);
	CreateInvItems(self,ItWr_Map_Orcelite_MIS,1);
	CreateInvItems(self,ItRu_PalFullHeal,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance OrcElite_AntiPaladin(Mst_Default_OrcElite)
{
	name[0] = NAME_Antipaldin;
	B_SetVisuals_OrcElite();
	EquipItem(self,ItMw_2H_OrcAxe_04);
	CreateInvItems(self,ItRi_OrcEliteRing,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance OrcElite_AntiPaladin1(Mst_Default_OrcElite)
{
	name[0] = NAME_Antipaldin;
	guild = GIL_ORC;
	id = 111;
	voice = 18;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_OrcElite();
	EquipItem(self,ItMw_2H_OrcAxe_04);
	CreateInvItems(self,ItRi_OrcEliteRing,1);
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance OrcElite_AntiPaladin2(Mst_Default_OrcElite)
{
	name[0] = NAME_Antipaldin;
	id = 112;
	guild = GIL_ORC;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_OrcElite();
	EquipItem(self,ItMw_2H_OrcAxe_04);
	CreateInvItems(self,ItRi_OrcEliteRing,1);
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance OrcElite_AntiPaladin3(Mst_Default_OrcElite)
{
	name[0] = NAME_Antipaldin;
	id = 113;
	guild = GIL_ORC;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_OrcElite();
	EquipItem(self,ItMw_2H_OrcAxe_04);
	CreateInvItems(self,ItRi_OrcEliteRing,1);
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance OrkElite_AntiPaladinOrkOberst_DI(Mst_Default_OrcElite)
{
	name[0] = "Ork Pu�kownik";
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 180;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	B_SetVisuals_OrcElite();
	aivar[AIV_EnemyOverride] = TRUE;
	EquipItem(self,ItMw_2H_OrcAxe_04);
	CreateInvItems(self,ItKe_OrkKnastDI_MIS,1);
	CreateInvItems(self,ItRi_OrcEliteRing,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance OrcElite_DIOberst1_Rest(Mst_Default_OrcElite)
{
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_OrcElite();
	EquipItem(self,ItMw_2H_OrcAxe_04);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance OrcElite_DIOberst2_Rest(Mst_Default_OrcElite)
{
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_OrcElite();
	EquipItem(self,ItMw_2H_OrcAxe_04);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance OrcElite_DIOberst3_Rest(Mst_Default_OrcElite)
{
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_OrcElite();
	EquipItem(self,ItMw_2H_OrcAxe_04);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};
