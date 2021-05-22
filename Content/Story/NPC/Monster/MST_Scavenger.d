
prototype Mst_Default_Scavenger(C_Npc)
{
	name[0] = "Œcierwojad";
	guild = GIL_SCAVENGER;
	aivar[AIV_MM_REAL_ID] = ID_SCAVENGER;
	level = 7;
	attribute[ATR_STRENGTH] = 55;
	attribute[ATR_DEXTERITY] = 55;
	attribute[ATR_HITPOINTS_MAX] = 80;
	attribute[ATR_HITPOINTS] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 15;
	protection[PROT_EDGE] = 15;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 15;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SCAVENGER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_SleepStart] = 22;
	aivar[AIV_MM_SleepEnd] = 6;
	aivar[AIV_MM_EatGroundStart] = 6;
	aivar[AIV_MM_EatGroundEnd] = 22;
	bodyStateInterruptableOverride = TRUE;
};

func void B_SetVisuals_Scavenger()
{
	Mdl_SetVisual(self,"Scavenger.mds");
	Mdl_SetVisualBody(self,"Sca_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Scavenger(Mst_Default_Scavenger)
{
	B_SetVisuals_Scavenger();
	Npc_SetToFistMode(self);
};

