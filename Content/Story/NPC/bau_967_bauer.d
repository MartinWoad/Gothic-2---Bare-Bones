
instance BAU_967_Bauer(Npc_Default)
{
	name[0] = NAME_Bauer;
	guild = GIL_OUT;
	id = 967;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_L_Jackal,BodyTex_L,ITAR_Bau_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = Rtn_Start_967;
};


func void Rtn_Start_967()
{
	TA_Pick_FP(8,0,22,0,"NW_FARM3_FIELD_02");
	TA_Sit_Campfire(22,0,8,0,"NW_FARM3_STABLE_REST_01");
};

func void Rtn_FleeFromPass_967()
{
	TA_Sit_Campfire(8,0,22,0,"NW_BIGMILL_MALAKSVERSTECK_06");
	TA_Sit_Campfire(22,0,8,0,"NW_BIGMILL_MALAKSVERSTECK_06");
};

