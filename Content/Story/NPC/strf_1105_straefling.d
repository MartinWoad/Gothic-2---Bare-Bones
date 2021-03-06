
instance STRF_1105_Straefling(Npc_Default)
{
	name[0] = NAME_Straefling;
	guild = GIL_OUT;
	id = 1105;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_2H_Axe_L_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart_Graham,BodyTex_N,ITAR_Prisoner);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	daily_routine = Rtn_Start_1105;
};


func void Rtn_Start_1105()
{
	TA_Pick_Ore(8,0,23,0,"OW_NEWMINE_05");
	TA_Pick_Ore(23,0,8,0,"OW_NEWMINE_05");
};

