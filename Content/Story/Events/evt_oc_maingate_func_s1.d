
func void evt_oc_maingate_func_s1()
{
	if(MIS_OCGATEOPEN == FALSE)
	{
		Wld_InsertNpc(orcelite_roam,"OC_TO_GUARD");
		Wld_InsertNpc(orcwarrior_roam,"OC_TO_GUARD");
		Wld_InsertNpc(orcelite_roam,"OC_TO_GUARD");
		Wld_InsertNpc(orcwarrior_roam,"OC_TO_GUARD");
		Wld_InsertNpc(orcshaman_sit,"OC_TO_GUARD");
		Wld_InsertNpc(orcelite_roam,"OC_TO_GUARD");
		Wld_InsertNpc(warg,"OC_GUARD_ENTRANCE");
		Wld_InsertNpc(orcelite_roam,"OC_GUARD_ENTRANCE");
		Wld_InsertNpc(warg,"OC_GUARD_ENTRANCE");
		Wld_InsertNpc(orcelite_roam,"OC_GUARD_ENTRANCE");
		Wld_InsertNpc(orcwarrior_roam,"OC_TRAIN_03");
		Wld_InsertNpc(orcelite_roam,"OC_TRAIN_03");
		Wld_InsertNpc(orcwarrior_roam,"OC_TRAIN_03");
		Wld_InsertNpc(orcelite_roam,"OC_TRAIN_03");
		Wld_InsertNpc(orcwarrior_roam,"OC_TRAIN_04");
		Wld_InsertNpc(orcelite_roam,"OC_TRAIN_04");
		Wld_InsertNpc(orcwarrior_roam,"OC_CAMPFIRE_OUT_01");
		Wld_InsertNpc(warg,"OC_CAMPFIRE_OUT_01");
		Wld_InsertNpc(warg,"OC_CAMPFIRE_OUT_01");
		Wld_InsertNpc(orcelite_roam,"OC_CAMPFIRE_OUT_01");
		Wld_InsertNpc(orcwarrior_roam,"OC_CENTER_02");
		Wld_InsertNpc(orcelite_roam,"OC_CENTER_02");
		Wld_InsertNpc(orcwarrior_roam,"OC_CENTER_03");
		Wld_InsertNpc(orcelite_roam,"OC_CENTER_03");
		Wld_InsertNpc(orcwarrior_roam,"OC_KITCHEN_ENTRANCE");
		Wld_InsertNpc(orcelite_roam,"OC_KITCHEN_ENTRANCE");
		Wld_InsertNpc(orcshaman_sit,"OC_KITCHEN_ENTRANCE");
		Wld_InsertNpc(orcelite_roam,"OC_KITCHEN_ENTRANCE");
		Wld_InsertNpc(orcwarrior_roam,"OC_EBR_HALL_THRONE");
		Wld_InsertNpc(orcshaman_sit,"OC_EBR_HALL_THRONE");
		Wld_InsertNpc(warg,"OC_EBR_HALL_THRONE");
		b_killnpc(9018);
		b_killnpc(9022);
		b_killnpc(9024);
		b_killnpc(9026);
		b_killnpc(8962);
		b_killnpc(8964);
		b_killnpc(8966);
		b_killnpc(8968);
		b_killnpc(8970);
		b_killnpc(8978);
		garond.flags = 0;
		brutus.flags = NPC_FLAG_IMMORTAL;
		PlayVideo("ORCATTACK.BIK");
		MIS_OCGATEOPEN = TRUE;
	};
};

