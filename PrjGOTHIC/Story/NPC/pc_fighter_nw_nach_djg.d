
instance PC_FIGHTER_NW_NACH_DJG(NPC_DEFAULT)
{
	name[0] = "Gorn";
	guild = GIL_DJG;
	id = 706;
	voice = 12;
	flags = 0;
	npctype = NPCTYPE_FRIEND;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_2h_sld_axe);
	EquipItem(self,itrw_crossbow_m_01);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_B_GORN,BODYTEX_B,4840);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_start_706;
};


func void rtn_start_706()
{
	ta_sit_chair(8,0,23,0,"NW_BIGFARM_HOUSE_14");
	ta_sit_chair(23,0,8,0,"NW_BIGFARM_HOUSE_14");
};

func void rtn_tot_706()
{
	ta_sit_campfire(8,0,23,0,"TOT");
	ta_sit_campfire(23,0,8,0,"TOT");
};

func void rtn_waitforship_706()
{
	ta_stand_guarding(8,0,23,0,"NW_WAITFOR_SHIP_05");
	ta_stand_guarding(23,0,8,0,"NW_WAITFOR_SHIP_05");
};

func void rtn_ship_706()
{
	ta_stand_guarding(6,0,7,0,"SHIP_DECK_03");
	ta_stand_guarding(7,0,7,10,"SHIP_DECK_37");
	ta_stand_guarding(7,10,7,20,"SHIP_DECK_03");
	ta_stand_guarding(7,20,7,30,"SHIP_DECK_37");
	ta_stand_guarding(7,30,7,40,"SHIP_DECK_03");
	ta_stand_guarding(7,40,7,50,"SHIP_DECK_30");
	ta_stand_guarding(7,50,8,0,"SHIP_DECK_03");
	ta_stand_guarding(8,0,8,10,"SHIP_DECK_37");
	ta_stand_guarding(8,10,8,20,"SHIP_DECK_03");
	ta_stand_guarding(8,20,8,30,"SHIP_DECK_37");
	ta_stand_guarding(8,30,8,40,"SHIP_DECK_03");
	ta_stand_guarding(8,40,8,50,"SHIP_DECK_30");
	ta_stand_guarding(8,50,9,0,"SHIP_DECK_03");
	ta_stand_guarding(9,0,9,10,"SHIP_DECK_37");
	ta_stand_guarding(9,10,9,20,"SHIP_DECK_03");
	ta_stand_guarding(9,20,9,30,"SHIP_DECK_37");
	ta_stand_guarding(9,30,9,40,"SHIP_DECK_03");
	ta_stand_guarding(9,40,9,50,"SHIP_DECK_30");
	ta_stand_guarding(9,50,10,0,"SHIP_DECK_03");
	ta_stand_guarding(10,0,10,10,"SHIP_DECK_37");
	ta_stand_guarding(10,10,10,20,"SHIP_DECK_03");
	ta_stand_guarding(10,20,10,30,"SHIP_DECK_37");
	ta_stand_guarding(10,30,10,40,"SHIP_DECK_03");
	ta_stand_guarding(10,40,10,50,"SHIP_DECK_30");
	ta_stand_guarding(10,50,11,0,"SHIP_DECK_03");
	ta_stand_guarding(11,0,11,10,"SHIP_DECK_37");
	ta_stand_guarding(11,10,11,20,"SHIP_DECK_03");
	ta_stand_guarding(11,20,11,30,"SHIP_DECK_37");
	ta_stand_guarding(11,30,11,40,"SHIP_DECK_03");
	ta_stand_guarding(11,40,11,50,"SHIP_DECK_30");
	ta_stand_guarding(11,50,12,0,"SHIP_DECK_03");
	ta_stand_guarding(12,0,12,10,"SHIP_DECK_37");
	ta_stand_guarding(12,10,12,20,"SHIP_DECK_03");
	ta_stand_guarding(12,20,12,30,"SHIP_DECK_37");
	ta_stand_guarding(12,30,12,40,"SHIP_DECK_03");
	ta_stand_guarding(12,40,12,50,"SHIP_DECK_30");
	ta_stand_guarding(12,50,13,0,"SHIP_DECK_03");
	ta_stand_guarding(13,0,13,10,"SHIP_DECK_37");
	ta_stand_guarding(13,10,13,20,"SHIP_DECK_03");
	ta_stand_guarding(13,20,13,30,"SHIP_DECK_37");
	ta_stand_guarding(13,30,13,40,"SHIP_DECK_03");
	ta_stand_guarding(13,40,13,50,"SHIP_DECK_30");
	ta_stand_guarding(13,50,14,0,"SHIP_DECK_03");
	ta_stand_guarding(14,0,14,10,"SHIP_DECK_37");
	ta_stand_guarding(14,10,14,20,"SHIP_DECK_03");
	ta_stand_guarding(14,20,14,30,"SHIP_DECK_37");
	ta_stand_guarding(14,30,14,40,"SHIP_DECK_03");
	ta_stand_guarding(14,40,14,50,"SHIP_DECK_30");
	ta_stand_guarding(14,50,15,0,"SHIP_DECK_03");
	ta_stand_guarding(15,0,15,10,"SHIP_DECK_37");
	ta_stand_guarding(15,10,15,20,"SHIP_DECK_03");
	ta_stand_guarding(15,20,15,30,"SHIP_DECK_37");
	ta_stand_guarding(15,30,15,40,"SHIP_DECK_03");
	ta_stand_guarding(15,40,15,50,"SHIP_DECK_30");
	ta_stand_guarding(15,50,16,0,"SHIP_DECK_03");
	ta_stand_guarding(16,0,16,10,"SHIP_DECK_37");
	ta_stand_guarding(16,10,16,20,"SHIP_DECK_03");
	ta_stand_guarding(16,20,16,30,"SHIP_DECK_37");
	ta_stand_guarding(16,30,16,40,"SHIP_DECK_03");
	ta_stand_guarding(16,40,16,50,"SHIP_DECK_03");
	ta_stand_guarding(16,50,17,0,"SHIP_DECK_03");
	ta_stand_guarding(17,0,17,10,"SHIP_DECK_37");
	ta_stand_guarding(17,10,17,20,"SHIP_DECK_03");
	ta_stand_guarding(17,20,17,30,"SHIP_DECK_37");
	ta_stand_guarding(17,30,17,40,"SHIP_DECK_03");
	ta_stand_guarding(17,40,17,50,"SHIP_DECK_30");
	ta_stand_guarding(17,50,18,0,"SHIP_DECK_03");
	ta_stand_guarding(18,0,18,10,"SHIP_DECK_37");
	ta_stand_guarding(18,10,18,20,"SHIP_DECK_03");
	ta_stand_guarding(18,20,18,30,"SHIP_DECK_37");
	ta_stand_guarding(18,30,18,40,"SHIP_DECK_03");
	ta_stand_guarding(18,40,18,50,"SHIP_DECK_30");
	ta_stand_guarding(18,50,19,0,"SHIP_DECK_03");
	ta_stand_guarding(19,0,19,10,"SHIP_DECK_37");
	ta_stand_guarding(19,10,19,20,"SHIP_DECK_03");
	ta_stand_guarding(19,20,19,30,"SHIP_DECK_37");
	ta_stand_guarding(19,30,19,40,"SHIP_DECK_03");
	ta_stand_guarding(19,40,19,50,"SHIP_DECK_30");
	ta_stand_guarding(19,50,20,0,"SHIP_DECK_03");
	ta_stand_guarding(20,0,20,10,"SHIP_DECK_37");
	ta_stand_guarding(20,10,20,20,"SHIP_DECK_03");
	ta_stand_guarding(20,20,20,30,"SHIP_DECK_37");
	ta_stand_guarding(20,30,20,40,"SHIP_DECK_03");
	ta_stand_guarding(20,40,20,50,"SHIP_DECK_30");
	ta_stand_guarding(20,50,21,0,"SHIP_DECK_03");
	ta_stand_guarding(21,0,21,10,"SHIP_DECK_37");
	ta_stand_guarding(21,10,21,20,"SHIP_DECK_03");
	ta_stand_guarding(21,20,21,30,"SHIP_DECK_37");
	ta_stand_guarding(21,30,21,40,"SHIP_DECK_03");
	ta_stand_guarding(21,40,21,50,"SHIP_DECK_30");
	ta_stand_guarding(21,50,22,0,"SHIP_DECK_03");
	ta_stand_guarding(22,0,23,0,"SHIP_DECK_37");
	ta_stand_guarding(23,0,0,0,"SHIP_DECK_03");
	ta_stand_guarding(0,0,1,0,"SHIP_DECK_37");
	ta_stand_guarding(1,0,2,0,"SHIP_DECK_30");
	ta_stand_guarding(2,0,3,0,"SHIP_DECK_03");
	ta_stand_guarding(3,0,4,0,"SHIP_DECK_30");
	ta_stand_guarding(4,0,5,0,"SHIP_DECK_03");
	ta_stand_guarding(5,0,6,0,"SHIP_DECK_37");
};

