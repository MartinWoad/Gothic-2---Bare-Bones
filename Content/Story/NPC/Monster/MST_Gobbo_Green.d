
prototype Mst_Default_Gobbo_Green(C_Npc)
{
	name[0] = "Goblin";
	guild = GIL_GOBBO;
	aivar[AIV_MM_REAL_ID] = ID_GOBBO_GREEN;
	level = 5;
	attribute[ATR_STRENGTH] = 55;
	attribute[ATR_DEXTERITY] = 55;
	attribute[ATR_HITPOINTS_MAX] = 20;
	attribute[ATR_HITPOINTS] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 15;
	protection[PROT_EDGE] = 15;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 15;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_GOBBO;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_MM_Packhunter] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
	bodyStateInterruptableOverride = TRUE;
};

func void B_SetVisuals_Gobbo_Green()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_SetVisualBody(self,"Gob_Body",0,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Gobbo_Green(Mst_Default_Gobbo_Green)
{
	B_SetVisuals_Gobbo_Green();
	Npc_SetToFightMode(self,ItMw_1h_Bau_Mace);
};

instance YGobbo_Green(Mst_Default_Gobbo_Green)
{
	level = 3;
	name[0] = "M?ody Goblin";
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 15;
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
	//fight_tactic = FAI_MONSTER_COWARD;
	B_SetVisuals_Gobbo_Green();
	Mdl_SetModelScale(self,0.9,0.9,0.9);
	Npc_SetToFightMode(self,ItMw_1h_Bau_Mace);
};
