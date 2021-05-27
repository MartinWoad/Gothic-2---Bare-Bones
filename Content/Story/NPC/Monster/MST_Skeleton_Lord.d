
prototype Mst_Skeleton_Lord(C_Npc)
{
	name[0] = "Wojownik Cienia";
	guild = GIL_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	level = 40;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 20;
	protection[PROT_EDGE] = 40;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 20;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Zweihaender2);
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
	bodyStateInterruptableOverride = TRUE;
};

func void B_SetVisuals_Skeleton_Lord()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	B_SetNpcVisual(self,MALE,"Ske_Head",0,0,itar_pal_skel);
};


instance Skeleton_Lord(Mst_Skeleton_Lord)
{
	B_SetVisuals_Skeleton_Lord();
};

instance Crypt_Skeleton_Lord(Mst_Skeleton_Lord)
{
	name[0] = "Inubis";
	B_SetVisuals_Skeleton_Lord();
	CreateInvItems(self,ItMi_Gold,500);
	CreateInvItems(self,ItPo_Mana_03,2);
	CreateInvItems(self,ItPo_Health_03,2);
};

instance Skeleton_Lord_Archol(Mst_Skeleton_Lord)
{
	name[0] = "Archol";
	level = 60;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 180;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 20;
	protection[PROT_EDGE] = 40;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 20;
	B_SetVisuals_Skeleton_Lord();
	CreateInvItems(self,ItMi_Gold,650);
	CreateInvItems(self,ItKe_EVT_UNDEAD_01,1);
};
