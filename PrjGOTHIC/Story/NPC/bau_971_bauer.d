
instance BAU_971_BAUER(NPC_DEFAULT)
{
	name[0] = NAME_BAUER;
	guild = GIL_OUT;
	id = 971;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMALBART12,BODYTEX_N,4830);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,15);
	daily_routine = rtn_start_971;
};


func void rtn_start_971()
{
	ta_smalltalk(8,0,22,0,"NW_TAVERNE_IN_05");
	ta_smalltalk(22,0,8,0,"NW_TAVERNE_IN_05");
};

