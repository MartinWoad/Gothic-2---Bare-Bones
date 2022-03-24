
prototype Mst_Default_OrcShaman(C_Npc)
{
	name[0] = "Ork Szaman";
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	voice = 18;
	level = 30;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 90;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 80;
	HitChance[NPC_TALENT_1H] = 40;
	HitChance[NPC_TALENT_2H] = 40;
	HitChance[NPC_TALENT_BOW] = 40;
	HitChance[NPC_TALENT_CROSSBOW] = 40;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	bodyStateInterruptableOverride = TRUE;
};

func void B_SetVisuals_OrcShaman()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyShaman",DEFAULT,DEFAULT,"Orc_HeadShaman",DEFAULT,DEFAULT,-1);
};


instance OrcShaman_Sit(Mst_Default_OrcShaman)
{
	B_SetVisuals_OrcShaman();
	EquipItem(self,ItMw_2H_OrcAxe_01);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};

instance OrcShaman_Hosh_Pak(Mst_Default_OrcShaman)
{
	name[0] = "Hosh-Pak";
	B_SetVisuals_OrcShaman();
	EquipItem(self,ItMw_2H_OrcAxe_01);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = OnlyRoutine;
};
