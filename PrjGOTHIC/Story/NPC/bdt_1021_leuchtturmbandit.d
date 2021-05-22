
instance BDT_1021_LEUCHTTURMBANDIT(NPC_DEFAULT)
{
	name[0] = "Bandyta";
	guild = GIL_BDT;
	id = 1021;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_sld_sword);
	EquipItem(self,itrw_sld_bow);
	CreateInvItems(self,itrw_arrow,26);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_CIPHER_NEU,BODYTEX_N,4847);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	start_aistate = zs_bandit;
};

