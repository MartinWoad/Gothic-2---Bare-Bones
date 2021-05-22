
prototype MST_DEFAULT_DRAGON_SWAMP(C_NPC)
{
	name[0] = "Smok B³otny";
	guild = GIL_DRAGON;
	aivar[AIV_MM_REAL_ID] = ID_DRAGON_SWAMP;
	level = 350;
	bodystateinterruptableoverride = TRUE;
	attribute[ATR_STRENGTH] = 120;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 110;
	protection[PROT_EDGE] = 110;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 130;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = 170;
	damagetype = DAM_FLY;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_DRAGON_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
	aivar[AIV_MAXDISTTOWP] = 1000;
	aivar[AIV_ORIGINALFIGHTTACTIC] = FAI_DRAGON;
	start_aistate = zs_mm_rtn_dragonrest;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

func void b_setvisuals_dragon_swamp()
{
	Mdl_SetVisual(self,"Dragon.mds");
	Mdl_SetVisualBody(self,"Dragon_Swamp_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance DRAGON_SWAMP(MST_DEFAULT_DRAGON_SWAMP)
{
	name[0] = "Pandrodor";
	flags = NPC_FLAG_IMMORTAL;
	fight_tactic = FAI_DRAGON;
	b_setvisuals_dragon_swamp();
	Npc_SetToFistMode(self);
	bodystateinterruptableoverride = TRUE;
};

