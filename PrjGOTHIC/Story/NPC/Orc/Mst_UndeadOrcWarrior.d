
prototype MST_DEFAULT_UNDEADORCWARRIOR(C_NPC)
{
	name[0] = "Nieumar³y Ork";
	guild = GIL_UNDEADORC;
	aivar[AIV_MM_REAL_ID] = ID_UNDEADORCWARRIOR;
	level = 30;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 100;
	hitchance[NPC_TALENT_1H] = 100;
	hitchance[NPC_TALENT_2H] = 100;
	hitchance[NPC_TALENT_BOW] = 100;
	hitchance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
	bodystateinterruptableoverride = TRUE;
};

func void b_setvisuals_undeadorcwarrior()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"UOW_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance UNDEADORCWARRIOR(MST_DEFAULT_UNDEADORCWARRIOR)
{
	b_setvisuals_undeadorcwarrior();
	EquipItem(self,itmw_2h_orcaxe_02);
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

