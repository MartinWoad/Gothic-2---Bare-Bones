
instance BDT_1060_DEXTER(NPC_DEFAULT)
{
	name[0] = "Dexter";
	guild = GIL_BDT;
	id = 1060;
	voice = 9;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_shortsword2);
	b_createambientinv(self);
	CreateInvItems(self,itke_dexter,1);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMALBART_DEXTER,BODYTEX_N,4850);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,45);
	daily_routine = rtn_start_1060;
};


func void rtn_start_1060()
{
	ta_sit_throne(0,0,12,0,"NW_CASTLEMINE_HUT_10");
	ta_sit_throne(12,0,0,0,"NW_CASTLEMINE_HUT_10");
};

