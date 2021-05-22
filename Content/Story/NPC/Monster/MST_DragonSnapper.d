
prototype MST_DEFAULT_DRAGONSNAPPER(C_NPC)
{
	name[0] = "Smoczy Zêbacz";
	guild = GIL_SNAPPER;
	aivar[AIV_MM_REAL_ID] = ID_DRAGONSNAPPER;
	level = 20;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 120;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 160;
	protection[PROT_MAGIC] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SNAPPER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_THREATENBEFOREATTACK] = TRUE;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = TRUE;
	aivar[AIV_MM_PACKHUNTER] = TRUE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
	bodystateinterruptableoverride = TRUE;
};

func void b_setvisuals_dragonsnapper()
{
	Mdl_SetVisual(self,"DragonSnapper.mds");
	Mdl_SetVisualBody(self,"Razor_Demon_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance DRAGONSNAPPER(MST_DEFAULT_DRAGONSNAPPER)
{
	b_setvisuals_dragonsnapper();
	Npc_SetToFistMode(self);
};

instance GAANS_SNAPPER(MST_DEFAULT_DRAGONSNAPPER)
{
	name[0] = "Prychaj¹cy Smoczy Zêbacz";
	b_setvisuals_dragonsnapper();
	Npc_SetToFistMode(self);
};

