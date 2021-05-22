
prototype MST_DEFAULT_SHADOWBEAST_SKELETON(C_NPC)
{
	name[0] = "Nieumar�y Cieniostw�r";
	guild = GIL_SHADOWBEAST_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SHADOWBEAST_SKELETON;
	level = 30;
	attribute[ATR_STRENGTH] = 120;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 140;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 120;
	protection[PROT_FLY] = 120;
	protection[PROT_MAGIC] = 120;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SHADOWBEAST;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_ROAMSTART] = ONLYROUTINE;
	bodystateinterruptableoverride = TRUE;
};

func void b_setvisuals_shadowbeast_skeleton()
{
	Mdl_SetVisual(self,"Shadow.mds");
	Mdl_SetVisualBody(self,"Shadowbeast_Skeleton_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance SHADOWBEAST_SKELETON(MST_DEFAULT_SHADOWBEAST_SKELETON)
{
	b_setvisuals_shadowbeast_skeleton();
	Npc_SetToFistMode(self);
};

instance SHADOWBEAST_SKELETON_ANGAR(MST_DEFAULT_SHADOWBEAST_SKELETON)
{
	b_setvisuals_shadowbeast_skeleton();
	Npc_SetToFistMode(self);
};

