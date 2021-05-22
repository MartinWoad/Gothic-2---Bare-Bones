
instance PAL_251_ORIC(NPC_DEFAULT)
{
	name[0] = "Orik";
	guild = GIL_PAL;
	id = 251;
	voice = 11;
	flags = 0;
	npctype = NPCTYPE_OCMAIN;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_2h_pal_sword);
	EquipItem(self,itrw_mil_crossbow);
	CreateInvItems(self,itrw_bolt,14);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_TOUGH_LEE_ÂHNLICH,BODYTEX_N,4829);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_start_251;
};


func void rtn_start_251()
{
	ta_smalltalk(8,0,21,0,"OC_EBR_HALL_CENTER");
	ta_sleep(21,0,8,0,"OC_EBR_ROOM_02_SLEEP");
};

