
prototype MST_DEFAULT_DRAGON_UNDEAD(C_NPC)
{
	name[0] = "Nieumar³y Smok";
	guild = GIL_DRAGON;
	aivar[AIV_MM_REAL_ID] = ID_DRAGON_UNDEAD;
	level = 1000;
	bodystateinterruptableoverride = TRUE;
	attribute[ATR_STRENGTH] = 170;
	attribute[ATR_DEXTERITY] = 170;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 5000;
	attribute[ATR_MANA] = 5000;
	protection[PROT_BLUNT] = 160;
	protection[PROT_EDGE] = 180;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = 280;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = 280;
	damagetype = DAM_FLY;
	fight_tactic = FAI_DRAGON;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = 1000;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
	aivar[AIV_MAXDISTTOWP] = 1000;
	aivar[AIV_ORIGINALFIGHTTACTIC] = FAI_DRAGON;
	start_aistate = zs_mm_rtn_dragonrest;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

func void b_setvisuals_dragon_undead()
{
	Mdl_SetVisual(self,"Dragon.mds");
	Mdl_SetVisualBody(self,"Dragon_Undead_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance DRAGON_UNDEAD(MST_DEFAULT_DRAGON_UNDEAD)
{
	b_setvisuals_dragon_undead();
	flags = NPC_FLAG_IMMORTAL;
	Npc_SetToFistMode(self);
};

