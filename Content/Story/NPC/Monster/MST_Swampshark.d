
prototype Mst_Default_Swampshark(C_Npc)
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
	protection[PROT_BLUNT] = 110;
	protection[PROT_EDGE] = 90;
	protection[PROT_POINT] = 110;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 1000;
	protection[PROT_MAGIC] = 120;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SWAMPSHARK;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	bodyStateInterruptableOverride = TRUE;
};

func void B_SetVisuals_Swampshark()
{
	Mdl_SetVisual(self,"Swampshark.mds");
	Mdl_SetVisualBody(self,"Swa_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Swampshark(Mst_Default_Swampshark)
{
	B_SetVisuals_Swampshark();
	Npc_SetToFistMode(self);
};
