
prototype Mst_Default_Skeleton_Mage(C_Npc)
{
	name[0] = "Szkielet Mag";
	guild = GIL_SKELETON_MAGE;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_MAGE;
	level = 24;
	attribute[ATR_STRENGTH] = 120;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 240;
	attribute[ATR_HITPOINTS] = 240;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 80;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 125;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 125;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_STRONG;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_SetVisuals_Skeleton_Mage()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton_fly.mds");
	Mdl_SetVisualBody(self,"Ske_Fly_Body",1,DEFAULT,"",1,DEFAULT,-1);
};


instance SkeletonMage(Mst_Default_Skeleton_Mage)
{
	B_SetVisuals_Skeleton_Mage();
};

instance SkeletonMage_Angar(Mst_Default_Skeleton_Mage)
{
	B_SetVisuals_Skeleton_Mage();
	CreateInvItems(self,ItAm_Mana_Angar_MIS,1);
	CreateInvItems(self,ItPo_Perm_Mana,1);
};

instance SecretLibrarySkeleton(Mst_Default_Skeleton_Mage)
{
	B_SetVisuals_Skeleton_Mage();
};

