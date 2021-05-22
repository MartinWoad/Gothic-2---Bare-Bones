
prototype MST_DEFAULT_ORCSHAMAN(C_NPC)
{
	name[0] = "Ork Szaman";
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	voice = 18;
	level = 30;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 80;
	hitchance[NPC_TALENT_1H] = 100;
	hitchance[NPC_TALENT_2H] = 100;
	hitchance[NPC_TALENT_BOW] = 100;
	hitchance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
	bodystateinterruptableoverride = TRUE;
};

func void b_setvisuals_orcshaman()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyShaman",DEFAULT,DEFAULT,"Orc_HeadShaman",DEFAULT,DEFAULT,-1);
};


instance ORCSHAMAN_SIT(MST_DEFAULT_ORCSHAMAN)
{
	b_setvisuals_orcshaman();
	EquipItem(self,itmw_2h_orcaxe_01);
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_ORCSITSTART] = ONLYROUTINE;
};

instance ORCSHAMAN_HOSH_PAK(MST_DEFAULT_ORCSHAMAN)
{
	name[0] = "Hosh-Pak";
	b_setvisuals_orcshaman();
	EquipItem(self,itmw_2h_orcaxe_01);
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_ORCSITSTART] = ONLYROUTINE;
};

