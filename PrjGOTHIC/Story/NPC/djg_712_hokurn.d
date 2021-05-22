
instance DJG_712_HOKURN(NPC_DEFAULT)
{
	name[0] = "Hokurn";
	guild = GIL_DJG;
	id = 712;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_sld_sword);
	EquipItem(self,itrw_crossbow_m_01);
	CreateInvItems(self,itrw_bolt,14);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_B_NORMAL_SHARKY,BODYTEX_B,4839);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_prestart_712;
};


func void rtn_prestart_712()
{
	ta_smalltalk(8,0,23,0,"OW_DJG_STARTCAMP_01");
	ta_smalltalk(23,0,8,0,"OW_DJG_STARTCAMP_01");
};

func void rtn_start_712()
{
	ta_smalltalk(8,0,23,0,"SPAWN_OW_BLACKGOBBO_A1");
	ta_smalltalk(23,0,8,0,"SPAWN_OW_BLACKGOBBO_A1");
};

