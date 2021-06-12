
prototype Mst_Default_DemonLord(C_Npc)
{
	name[0] = "Ksi��� Demon�w";
	guild = GIL_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_DEMON_LORD;
	level = 100;
	attribute[ATR_STRENGTH] = 140;
	attribute[ATR_DEXTERITY] = 140;
	attribute[ATR_HITPOINTS_MAX] = 666;
	attribute[ATR_HITPOINTS] = 666;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 115;
	protection[PROT_EDGE] = 115;
	protection[PROT_POINT] = 115;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = 115;
	protection[PROT_MAGIC] = 115;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_DEMON;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
	bodyStateInterruptableOverride = TRUE;
};

func void B_SetVisuals_DemonLord()
{
	Mdl_SetVisual(self,"Demon.mds");
	Mdl_SetVisualBody(self,"Dem2_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance DemonLord(Mst_Default_DemonLord)
{
	B_SetVisuals_DemonLord();
	Npc_SetToFistMode(self);
};

instance Xardas_DT_DemonLord(Mst_Default_DemonLord)
{
	B_SetVisuals_DemonLord();
	Npc_SetToFistMode(self);
};
