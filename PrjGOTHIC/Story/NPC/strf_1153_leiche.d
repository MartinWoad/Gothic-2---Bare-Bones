
instance STRF_1153_LEICHE(NPC_DEFAULT)
{
	name[0] = NAME_STRAEFLING;
	guild = GIL_STRF;
	id = 1153;
	voice = 8;
	flags = 0;
	npctype = NPCTYPE_OCMAIN;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 1;
	attribute[ATR_HITPOINTS] = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMALBART12,BODYTEX_N,4854);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,15);
	daily_routine = rtn_start_1153;
};


func void rtn_start_1153()
{
	ta_stand_guarding(8,0,23,0,"OW_SPAWN_TRACK_LEICHE_04");
	ta_stand_guarding(23,0,8,0,"OW_SPAWN_TRACK_LEICHE_04");
};

