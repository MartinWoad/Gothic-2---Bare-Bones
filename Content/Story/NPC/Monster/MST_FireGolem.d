
prototype MST_DEFAULT_FIREGOLEM(C_NPC)
{
	name[0] = "Ognisty Golem";
	guild = GIL_FIREGOLEM;
	aivar[AIV_MM_REAL_ID] = ID_FIREGOLEM;
	level = 30;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = 1000;
	protection[PROT_MAGIC] = 100;
	damagetype = DAM_FLY;
	fight_tactic = FAI_STONEGOLEM;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
	bodystateinterruptableoverride = TRUE;
};

func void b_setvisuals_firegolem()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_ApplyOverlayMds(self,"Golem_Firegolem.mds");
	Mdl_SetVisualBody(self,"Gol_Fire_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance FIREGOLEM(MST_DEFAULT_FIREGOLEM)
{
	b_setvisuals_firegolem();
	Npc_SetToFistMode(self);
};

