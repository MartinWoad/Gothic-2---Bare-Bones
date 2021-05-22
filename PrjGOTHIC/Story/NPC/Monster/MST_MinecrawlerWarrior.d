
prototype MST_DEFAULT_MINECRAWLERWARRIOR(C_NPC)
{
	name[0] = "Pe�zacz Wojownik";
	guild = GIL_MINECRAWLER;
	aivar[AIV_MM_REAL_ID] = ID_MINECRAWLERWARRIOR;
	level = 20;
	attribute[ATR_STRENGTH] = 120;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 90;
	protection[PROT_POINT] = 160;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 80;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_MINECRAWLER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_THREATENBEFOREATTACK] = TRUE;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_WUSELSTART] = ONLYROUTINE;
	bodystateinterruptableoverride = TRUE;
};

func void b_setvisuals_minecrawlerwarrior()
{
	Mdl_SetVisual(self,"Crawler.mds");
	Mdl_SetVisualBody(self,"Cr2_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance MINECRAWLERWARRIOR(MST_DEFAULT_MINECRAWLERWARRIOR)
{
	b_setvisuals_minecrawlerwarrior();
	Npc_SetToFistMode(self);
};

