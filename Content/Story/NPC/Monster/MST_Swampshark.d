
prototype MST_DEFAULT_SWAMPSHARK(C_NPC)
{
	name[0] = "W¹¿ B³otny";
	guild = GIL_SWAMPSHARK;
	aivar[AIV_MM_REAL_ID] = ID_SWAMPSHARK;
	level = 24;
	attribute[ATR_STRENGTH] = 160;
	attribute[ATR_DEXTERITY] = 160;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 120;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 1000;
	protection[PROT_MAGIC] = 120;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SWAMPSHARK;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_THREATENBEFOREATTACK] = TRUE;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = TRUE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_ROAMSTART] = ONLYROUTINE;
	bodystateinterruptableoverride = TRUE;
};

func void b_setvisuals_swampshark()
{
	Mdl_SetVisual(self,"Swampshark.mds");
	Mdl_SetVisualBody(self,"Swa_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance SWAMPSHARK(MST_DEFAULT_SWAMPSHARK)
{
	b_setvisuals_swampshark();
	Npc_SetToFistMode(self);
};

