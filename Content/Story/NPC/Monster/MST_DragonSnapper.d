
prototype Mst_Default_DragonSnapper(C_Npc)
{
	name[0] = "Smoczy Z?bacz";
	guild = GIL_SNAPPER;
	aivar[AIV_MM_REAL_ID] = ID_DRAGONSNAPPER;
	level = 25;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 160;
	protection[PROT_MAGIC] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SNAPPER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
	bodyStateInterruptableOverride = TRUE;
};

func void B_SetVisuals_DragonSnapper()
{
	Mdl_SetVisual(self,"DragonSnapper.mds");
	Mdl_SetVisualBody(self,"Razor_Demon_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance DragonSnapper(Mst_Default_DragonSnapper)
{
	B_SetVisuals_DragonSnapper();
	Npc_SetToFistMode(self);
};

instance Gaans_Snapper(Mst_Default_DragonSnapper)
{
	name[0] = "Prychaj?cy Smoczy Z?bacz";
	B_SetVisuals_DragonSnapper();
	Npc_SetToFistMode(self);
};
