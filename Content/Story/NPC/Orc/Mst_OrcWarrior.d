
prototype MST_DEFAULT_ORCWARRIOR(C_NPC)
{
	name[0] = "Ork Wojownik";
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCWARRIOR;
	voice = 18;
	level = 25;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 40;
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

func void b_setvisuals_orcwarrior()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWarrior",DEFAULT,DEFAULT,"Orc_HeadWarrior",DEFAULT,DEFAULT,-1);
};


instance ORCWARRIOR_ROAM(MST_DEFAULT_ORCWARRIOR)
{
	b_setvisuals_orcwarrior();
	EquipItem(self,itmw_2h_orcaxe_03);
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_ROAMSTART] = ONLYROUTINE;
};

instance ORCWARRIOR_REST(MST_DEFAULT_ORCWARRIOR)
{
	b_setvisuals_orcwarrior();
	EquipItem(self,itmw_2h_orcaxe_02);
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

instance ORCWARRIOR_HARAD(MST_DEFAULT_ORCWARRIOR)
{
	name[0] = "Ork Zwiadowca";
	b_setvisuals_orcwarrior();
	EquipItem(self,itmw_2h_orcaxe_01);
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

instance ORCWARRIOR_LOBART1(MST_DEFAULT_ORCWARRIOR)
{
	b_setvisuals_orcwarrior();
	EquipItem(self,itmw_2h_orcaxe_03);
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

instance ORCWARRIOR_LOBART2(MST_DEFAULT_ORCWARRIOR)
{
	b_setvisuals_orcwarrior();
	EquipItem(self,itmw_2h_orcaxe_03);
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

instance ORCWARRIOR_LOBART3(MST_DEFAULT_ORCWARRIOR)
{
	b_setvisuals_orcwarrior();
	EquipItem(self,itmw_2h_orcaxe_03);
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

instance ORCWARRIOR_LOBART4(MST_DEFAULT_ORCWARRIOR)
{
	b_setvisuals_orcwarrior();
	EquipItem(self,itmw_2h_orcaxe_03);
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

instance ORCWARRIOR_LOBART5(MST_DEFAULT_ORCWARRIOR)
{
	b_setvisuals_orcwarrior();
	EquipItem(self,itmw_2h_orcaxe_03);
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

instance ORCWARRIOR_LOBART6(MST_DEFAULT_ORCWARRIOR)
{
	b_setvisuals_orcwarrior();
	EquipItem(self,itmw_2h_orcaxe_03);
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

