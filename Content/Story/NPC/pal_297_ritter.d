
instance PAL_297_RITTER(NPC_DEFAULT)
{
	name[0] = NAME_RITTER;
	guild = GIL_PAL;
	id = 297;
	voice = 4;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	aivar[AIV_IGNORE_MURDER] = TRUE;
	aivar[AIV_IGNORE_THEFT] = TRUE;
	aivar[AIV_IGNORE_SHEEPKILLER] = TRUE;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_pal_sword);
	EquipItem(self,itrw_mil_crossbow);
	CreateInvItems(self,itrw_bolt,11);
	b_createambientinv(self);
	CreateInvItems(self,itru_teleportpassnw,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_P_NORMAL01,BODYTEX_N,4828);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,65);
	daily_routine = rtn_start_297;
};


func void rtn_start_297()
{
	ta_stand_guarding(8,0,22,0,"NW_PASS_GATEGUARD_02");
	ta_stand_guarding(22,0,8,0,"NW_PASS_GATEGUARD_02");
};

