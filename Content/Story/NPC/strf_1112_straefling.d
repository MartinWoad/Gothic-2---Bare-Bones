
instance STRF_1112_Straefling(Npc_Default)
{
	name[0] = NAME_Straefling;
	guild = GIL_OUT;
	id = 1112;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_2H_Axe_L_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal08,BodyTex_N,ITAR_Prisoner);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	daily_routine = Rtn_Start_1112;
};


func void Rtn_Start_1112()
{
	TA_Sit_Campfire(8,0,23,0,"OW_NEWMINE_11");
	TA_Sit_Campfire(23,0,8,0,"OW_NEWMINE_11");
};

