
prototype Mst_Default_Warg(C_Npc)
{
	name[0] = "Warg";
	guild = GIL_WOLF;
	aivar[AIV_MM_REAL_ID] = ID_WARG;
	level = 15;
	attribute[ATR_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 90;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 80;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 30;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_WOLF;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_LONG;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	bodyStateInterruptableOverride = TRUE;
};

func void B_SetVisuals_WARG()
{
	Mdl_SetVisual(self,"Wolf.mds");
	Mdl_SetVisualBody(self,"Warg_Body2",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_BLACKWOLF()
{
	Mdl_SetVisual(self,"Wolf.mds");
	Mdl_SetVisualBody(self,"Warg_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Warg(Mst_Default_Warg)
{
	B_SetVisuals_WARG();
	Npc_SetToFistMode(self);
};

instance BlackWolf(Mst_Default_Warg)
{
	name[0] = "Czarny Wilk";
	level = 6;
	aivar[AIV_MM_REAL_ID] = ID_WOLF;
	attribute[ATR_STRENGTH] = 55;
	attribute[ATR_DEXTERITY] = 55;
	attribute[ATR_HITPOINTS_MAX] = 120;
	attribute[ATR_HITPOINTS] = 120;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 12;
	protection[PROT_EDGE] = 12;
	protection[PROT_POINT] = 12;
	protection[PROT_FIRE] = 12;
	protection[PROT_FLY] = 12;
	protection[PROT_MAGIC] = 12;
	B_SetVisuals_BLACKWOLF();
	Npc_SetToFistMode(self);
};

