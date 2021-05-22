
instance STRF_1114_STRAEFLING(NPC_DEFAULT)
{
	name[0] = NAME_STRAEFLING;
	guild = GIL_OUT;
	id = 1114;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_2h_axe_l_01);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL17,BODYTEX_N,4854);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,15);
	daily_routine = rtn_start_1114;
};


func void rtn_start_1114()
{
	ta_cook_cauldron(8,0,23,0,"OW_NEWMINE_11");
	ta_cook_cauldron(23,0,8,0,"OW_NEWMINE_11");
};

