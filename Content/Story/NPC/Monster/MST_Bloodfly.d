
prototype Mst_Default_Bloodfly(C_Npc)
{
	name[0] = "Krwiopijca";
	guild = GIL_BLOODFLY;
	aivar[AIV_MM_REAL_ID] = ID_BLOODFLY;
	level = 6;
	attribute[ATR_STRENGTH] = 55;
	attribute[ATR_DEXTERITY] = 55;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 15;
	protection[PROT_EDGE] = 15;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 15;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_BLOODFLY;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_WuselStart] = OnlyRoutine;
	bodyStateInterruptableOverride = TRUE;
};

func void B_SetVisuals_Bloodfly()
{
	Mdl_SetVisual(self,"Bloodfly.mds");
	Mdl_SetVisualBody(self,"Blo_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Bloodfly(Mst_Default_Bloodfly)
{
	B_SetVisuals_Bloodfly();
	Npc_SetToFistMode(self);
};

instance YBloodfly(Mst_Default_Bloodfly)
{
	name[0] = "Ma�y Krwiopijca";
	level = 3;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 25;
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
	B_SetVisuals_Bloodfly();
	Mdl_SetModelScale(self,0.8,0.8,0.8);
	Npc_SetToFistMode(self);
};
