
instance BDT_1032_FLUECHTLING(NPC_DEFAULT)
{
	name[0] = NAME_FLUECHTLING;
	guild = GIL_BDT;
	id = 1032;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMALBART09,BODYTEX_N,4845);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_1032;
};


func void rtn_start_1032()
{
	ta_sleep(8,0,23,0,"NW_XARDAS_BANDITS_LEFT");
	ta_sleep(23,0,8,0,"NW_XARDAS_BANDITS_LEFT");
};

