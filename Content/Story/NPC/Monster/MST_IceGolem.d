
prototype Mst_Default_IceGolem(C_Npc)
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
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
	bodyStateInterruptableOverride = TRUE;
};

func void B_SetVisuals_IceGolem()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_ApplyOverlayMds(self,"Golem_Icegolem.mds");
	Mdl_SetVisualBody(self,"Gol_Ice_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance IceGolem(Mst_Default_IceGolem)
{
	B_SetVisuals_IceGolem();
	Npc_SetToFistMode(self);
};

instance IceGolem_Sylvio1(Mst_Default_IceGolem)
{
	B_SetVisuals_IceGolem();
	Npc_SetToFistMode(self);
};

instance IceGolem_Sylvio2(Mst_Default_IceGolem)
{
	B_SetVisuals_IceGolem();
	Npc_SetToFistMode(self);
};

