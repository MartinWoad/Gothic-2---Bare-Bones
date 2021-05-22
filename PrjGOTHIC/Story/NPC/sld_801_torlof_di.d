
instance SLD_801_TORLOF_DI(NPC_DEFAULT)
{
	name[0] = "Torlof";
	guild = GIL_SLD;
	id = 8010;
	voice = 1;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_sld_sword);
	EquipItem(self,itrw_sld_bow);
	CreateInvItems(self,itrw_arrow,63);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_N_TORLOF,BODYTEX_N,4836);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,40);
	daily_routine = rtn_start_8010;
};


func void rtn_start_8010()
{
	ta_stand_wp(8,0,23,0,"SHIP_CREW_CAPTAIN");
	ta_sleep(23,0,8,0,"SHIP_IN_06");
};

func void rtn_orksturmdi_8010()
{
	ta_stand_wp(8,0,23,0,"DI_SHIP_03");
	ta_stand_wp(23,0,8,0,"DI_SHIP_03");
};

