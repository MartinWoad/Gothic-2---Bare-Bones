
prototype MST_SKELETON_LORD(C_NPC)
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
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 40;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_zweihaender2);
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
	bodystateinterruptableoverride = TRUE;
};

func void b_setvisuals_skeleton_lord()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	b_setnpcvisual(self,MALE,"Ske_Head",0,0,5713);
};


instance SKELETON_LORD(MST_SKELETON_LORD)
{
	b_setvisuals_skeleton_lord();
};

instance CRYPT_SKELETON_LORD(MST_SKELETON_LORD)
{
	name[0] = "Inubis";
	b_setvisuals_skeleton_lord();
	CreateInvItems(self,itmi_gold,500);
	CreateInvItems(self,itpo_mana_03,2);
	CreateInvItems(self,itpo_health_03,2);
};

instance SKELETON_LORD_ARCHOL(MST_SKELETON_LORD)
{
	name[0] = "Archol";
	level = 60;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 180;
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
	b_setvisuals_skeleton_lord();
	CreateInvItems(self,itmi_gold,650);
	CreateInvItems(self,itke_evt_undead_01,1);
};

