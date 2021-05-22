
prototype MST_DEFAULT_ZOMBIE(C_NPC)
{
	name[0] = "Zombie";
	guild = GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE;
	level = 15;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 75;
	protection[PROT_FLY] = 75;
	protection[PROT_MAGIC] = 75;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ZOMBIE;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
	bodystateinterruptableoverride = TRUE;
};

func void b_setvisuals_zombie01()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",0,DEFAULT,-1);
};

func void b_setvisuals_zombie02()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",1,DEFAULT,-1);
};

func void b_setvisuals_zombie03()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,1,"Zom_Head",0,DEFAULT,-1);
};

func void b_setvisuals_zombie04()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,1,"Zom_Head",1,DEFAULT,-1);
};


instance ZOMBIE01(MST_DEFAULT_ZOMBIE)
{
	b_setvisuals_zombie01();
	Npc_SetToFistMode(self);
};

instance ZOMBIE02(MST_DEFAULT_ZOMBIE)
{
	b_setvisuals_zombie02();
	Npc_SetToFistMode(self);
};

instance ZOMBIE03(MST_DEFAULT_ZOMBIE)
{
	b_setvisuals_zombie03();
	Npc_SetToFistMode(self);
};

instance ZOMBIE04(MST_DEFAULT_ZOMBIE)
{
	b_setvisuals_zombie04();
	Npc_SetToFistMode(self);
};

