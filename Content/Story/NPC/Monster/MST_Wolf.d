
prototype MST_DEFAULT_WOLF(C_NPC)
{
	name[0] = "Wilk";
	guild = GIL_WOLF;
	aivar[AIV_MM_REAL_ID] = ID_WOLF;
	level = 6;
	attribute[ATR_STRENGTH] = 55;
	attribute[ATR_DEXTERITY] = 55;
	attribute[ATR_HITPOINTS_MAX] = 85;
	attribute[ATR_HITPOINTS] = 85;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 15;
	protection[PROT_EDGE] = 15;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 15;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_WOLF;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_THREATENBEFOREATTACK] = TRUE;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_LONG;
	aivar[AIV_MM_FOLLOWINWATER] = TRUE;
	aivar[AIV_MM_PACKHUNTER] = TRUE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_ROAMSTART] = ONLYROUTINE;
	bodystateinterruptableoverride = TRUE;
};

func void b_setvisuals_wolf()
{
	Mdl_SetVisual(self,"Wolf.mds");
	Mdl_SetVisualBody(self,"Wol_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance WOLF(MST_DEFAULT_WOLF)
{
	b_setvisuals_wolf();
	Npc_SetToFistMode(self);
};

instance SUMMONED_WOLF(MST_DEFAULT_WOLF)
{
	name[0] = "Przyzwany Wilk";
	guild = gil_summoned_wolf;
	aivar[AIV_MM_REAL_ID] = id_summoned_wolf;
	level = 0;
	attribute[ATR_STRENGTH] = 55;
	attribute[ATR_DEXTERITY] = 55;
	attribute[ATR_HITPOINTS_MAX] = 85;
	attribute[ATR_HITPOINTS] = 85;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 15;
	protection[PROT_EDGE] = 15;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 15;
	protection[PROT_MAGIC] = 0;
	aivar[AIV_PARTYMEMBER] = TRUE;
	b_setattitude(self,ATT_FRIENDLY);
	start_aistate = zs_mm_rtn_summoned;
	b_setvisuals_wolf();
	Npc_SetToFistMode(self);
};

instance YWOLF(MST_DEFAULT_WOLF)
{
	level = 3;
	name[0] = "M�ody Wilk";
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 25;
	attribute[ATR_HITPOINTS_MAX] = 20;
	attribute[ATR_HITPOINTS] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	fight_tactic = FAI_MONSTER_COWARD;
	b_setvisuals_wolf();
	Npc_SetToFistMode(self);
};

instance PEPES_YWOLF1(MST_DEFAULT_WOLF)
{
	name[0] = "M�ody Wilk";
	level = 3;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 25;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	b_setvisuals_wolf();
	Npc_SetToFistMode(self);
};

instance PEPES_YWOLF2(MST_DEFAULT_WOLF)
{
	level = 3;
	name[0] = "M�ody wilk";
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 25;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 5;
	protection[PROT_EDGE] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 5;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	b_setvisuals_wolf();
	Npc_SetToFistMode(self);
};

instance PEPES_YWOLF3(MST_DEFAULT_WOLF)
{
	level = 3;
	name[0] = "M�ody Wilk";
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 25;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 5;
	protection[PROT_EDGE] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 5;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	b_setvisuals_wolf();
	Npc_SetToFistMode(self);
};

instance PEPES_YWOLF4(MST_DEFAULT_WOLF)
{
	level = 3;
	name[0] = "M�ody Wilk";
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 25;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 5;
	protection[PROT_EDGE] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 5;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	b_setvisuals_wolf();
	Npc_SetToFistMode(self);
};

