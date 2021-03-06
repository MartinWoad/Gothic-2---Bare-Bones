
prototype Mst_Default_Shadowbeast(C_Npc)
{
	name[0] = "Cieniostwór";
	guild = GIL_SHADOWBEAST;
	aivar[AIV_MM_REAL_ID] = ID_SHADOWBEAST;
	level = 30;
	attribute[ATR_STRENGTH] = 120;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 110;
	protection[PROT_EDGE] = 110;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 110;
	protection[PROT_MAGIC] = 110;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SHADOWBEAST;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_SleepStart] = 6;
	aivar[AIV_MM_SleepEnd] = 20;
	aivar[AIV_MM_RoamStart] = 20;
	aivar[AIV_MM_RoamEnd] = 6;
	bodyStateInterruptableOverride = TRUE;
};

func void B_SetVisuals_Shadowbeast()
{
	Mdl_SetVisual(self,"Shadow.mds");
	Mdl_SetVisualBody(self,"Sha_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Shadowbeast(Mst_Default_Shadowbeast)
{
	B_SetVisuals_Shadowbeast();
	Npc_SetToFistMode(self);
};
