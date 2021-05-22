
instance MIL_309_STADTWACHE(NPC_DEFAULT)
{
	name[0] = NAME_STADTWACHE;
	guild = GIL_MIL;
	id = 309;
	voice = 6;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_mil_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_WEAK_HEREK,BODYTEX_N,4826);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_309;
};


func void rtn_start_309()
{
	ta_stand_wp(8,0,22,0,"NW_CITY_ENTRANCE_GUARD_01");
	ta_stand_wp(22,0,8,0,"NW_CITY_ENTRANCE_GUARD_01");
};

