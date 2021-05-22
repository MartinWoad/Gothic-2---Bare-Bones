
prototype MST_DEFAULT_ICEGOLEM(C_NPC)
{
	name[0] = "Lodowy Golem";
	guild = GIL_ICEGOLEM;
	aivar[AIV_MM_REAL_ID] = ID_ICEGOLEM;
	level = 24;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 180;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 1000;
	protection[PROT_MAGIC] = 200;
	damagetype = DAM_FLY;
	fight_tactic = FAI_STONEGOLEM;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = TRUE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
	bodystateinterruptableoverride = TRUE;
};

func void b_setvisuals_icegolem()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_ApplyOverlayMds(self,"Golem_Icegolem.mds");
	Mdl_SetVisualBody(self,"Gol_Ice_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance ICEGOLEM(MST_DEFAULT_ICEGOLEM)
{
	b_setvisuals_icegolem();
	Npc_SetToFistMode(self);
};

instance ICEGOLEM_SYLVIO1(MST_DEFAULT_ICEGOLEM)
{
	b_setvisuals_icegolem();
	Npc_SetToFistMode(self);
};

instance ICEGOLEM_SYLVIO2(MST_DEFAULT_ICEGOLEM)
{
	b_setvisuals_icegolem();
	Npc_SetToFistMode(self);
};

