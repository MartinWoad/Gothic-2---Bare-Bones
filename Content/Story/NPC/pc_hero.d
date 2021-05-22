
instance PC_Hero(Npc_Default)
{
	name[0] = "Ja";
	guild = GIL_NONE;
	id = 0;
	voice = 15;
	level = 0;
	npcType = npctype_main;
	exp = 0;
	exp_next = 500;
	lp = 0;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 10;
	attribute[ATR_MANA] = 10;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",9,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
	B_SetFightSkills(self,0);
};

instance PC_L3(Npc_Default)
{
	name[0] = "Ja";
	guild = GIL_NONE;
	id = 0;
	voice = 15;
	level = 3;
	npcType = npctype_main;
	bodyStateInterruptableOverride = TRUE;
	exp = 3000;
	exp_next = 5000;
	lp = 0;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 10;
	attribute[ATR_MANA] = 10;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Player,BodyTex_N,ITAR_Leather_L);
	B_AddFightSkill(self,NPC_TALENT_1H,30,FALSE);
	B_AddFightSkill(self,NPC_TALENT_2H,10,FALSE);
	B_AddFightSkill(self,NPC_TALENT_BOW,10,FALSE);
	B_AddFightSkill(self,NPC_TALENT_CROSSBOW,10,FALSE);
	CreateInvItems(self,ItMi_Gold,100);
	CreateInvItems(self,ItRw_Bolt,100);
	EquipItem(self,ItMw_1h_Vlk_Sword);
	EquipItem(self,ItRw_Crossbow_L_01);
};

instance PC_L9(Npc_Default)
{
	name[0] = "Ja";
	guild = GIL_MIL;
	id = 0;
	voice = 15;
	level = 9;
	npcType = npctype_main;
	bodyStateInterruptableOverride = TRUE;
	exp = 22500;
	exp_next = 27500;
	lp = 0;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 10;
	attribute[ATR_MANA] = 10;
	attribute[ATR_HITPOINTS_MAX] = 148;
	attribute[ATR_HITPOINTS] = 148;
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Player,BodyTex_N,ITAR_Mil_L);
	B_AddFightSkill(self,NPC_TALENT_1H,30,FALSE);
	B_AddFightSkill(self,NPC_TALENT_2H,10,FALSE);
	B_AddFightSkill(self,NPC_TALENT_BOW,30,FALSE);
	B_AddFightSkill(self,NPC_TALENT_CROSSBOW,10,FALSE);
	CreateInvItems(self,ItMi_Gold,100);
	CreateInvItems(self,ItRw_Arrow,100);
	EquipItem(self,ItMw_Bartaxt);
	EquipItem(self,ItRw_Bow_L_03);
};

instance PC_L19(Npc_Default)
{
	name[0] = "Ja";
	guild = GIL_PAL;
	id = 0;
	voice = 15;
	level = 19;
	npcType = npctype_main;
	bodyStateInterruptableOverride = TRUE;
	exp = 95000;
	exp_next = 105000;
	lp = 0;
	attribute[ATR_STRENGTH] = 65;
	attribute[ATR_DEXTERITY] = 55;
	attribute[ATR_MANA_MAX] = 10;
	attribute[ATR_MANA] = 10;
	attribute[ATR_HITPOINTS_MAX] = 148;
	attribute[ATR_HITPOINTS] = 148;
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Player,BodyTex_N,ItAr_PAL_M);
	B_AddFightSkill(self,NPC_TALENT_1H,60,FALSE);
	B_AddFightSkill(self,NPC_TALENT_2H,30,FALSE);
	B_AddFightSkill(self,NPC_TALENT_BOW,30,FALSE);
	B_AddFightSkill(self,NPC_TALENT_CROSSBOW,10,FALSE);
	CreateInvItems(self,ItMi_Gold,100);
	CreateInvItems(self,ItRw_Arrow,100);
	CreateInvItems(self,ItRw_Bolt,100);
	EquipItem(self,ItMw_ElBastardo);
	EquipItem(self,ItRw_Bow_M_01);
	CreateInvItems(self,ItRu_PalLight,1);
	CreateInvItems(self,ItRu_PalLightHeal,1);
	CreateInvItems(self,ItRu_PalHolyBolt,1);
};

instance PC_L25(Npc_Default)
{
	name[0] = "Ja";
	guild = GIL_DJG;
	id = 0;
	voice = 15;
	level = 25;
	npcType = npctype_main;
	bodyStateInterruptableOverride = TRUE;
	exp = 162500;
	exp_next = 175500;
	lp = 0;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 65;
	attribute[ATR_MANA_MAX] = 20;
	attribute[ATR_MANA] = 20;
	attribute[ATR_HITPOINTS_MAX] = 290;
	attribute[ATR_HITPOINTS] = 290;
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Player,BodyTex_N,itar_djg_m);
	B_AddFightSkill(self,NPC_TALENT_1H,70,FALSE);
	B_AddFightSkill(self,NPC_TALENT_2H,30,FALSE);
	B_AddFightSkill(self,NPC_TALENT_BOW,50,FALSE);
	B_AddFightSkill(self,NPC_TALENT_CROSSBOW,30,FALSE);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKLOCK,1);
	CreateInvItems(self,ItMi_Gold,500);
	CreateInvItems(self,ItRw_Arrow,100);
	EquipItem(self,ItMw_Orkschlaechter);
	EquipItem(self,ItRw_Bow_M_04);
	CreateInvItems(self,ItKE_lockpick,10);
	CreateInvItems(self,ItMi_Flask,2);
	CreateInvItems(self,ItPo_Health_02,10);
	CreateInvItems(self,ItPo_Speed,5);
	CreateInvItems(self,ItLsTorch,50);
};

instance PC_L31(Npc_Default)
{
	name[0] = "Ja";
	guild = GIL_PAL;
	id = 0;
	voice = 15;
	level = 31;
	npcType = npctype_main;
	bodyStateInterruptableOverride = TRUE;
	exp = 248000;
	exp_next = 264000;
	lp = 0;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 70;
	attribute[ATR_MANA_MAX] = 40;
	attribute[ATR_MANA] = 40;
	attribute[ATR_HITPOINTS_MAX] = 412;
	attribute[ATR_HITPOINTS] = 412;
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Player,BodyTex_N,ItAr_PAl_H);
	B_AddFightSkill(self,NPC_TALENT_1H,50,FALSE);
	B_AddFightSkill(self,NPC_TALENT_2H,80,FALSE);
	B_AddFightSkill(self,NPC_TALENT_BOW,30,FALSE);
	B_AddFightSkill(self,NPC_TALENT_CROSSBOW,50,FALSE);
	CreateInvItems(self,ItMi_Gold,500);
	CreateInvItems(self,ItRw_Bolt,100);
	EquipItem(self,ItMw_2H_Blessed_03);
	EquipItem(self,ItRw_Crossbow_H_02);
	CreateInvItems(self,ItRu_PalLight,1);
	CreateInvItems(self,ItRu_PalLightHeal,1);
	CreateInvItems(self,ItRu_PalHolyBolt,1);
	CreateInvItems(self,ItRu_PalMediumHeal,1);
	CreateInvItems(self,ItRu_PalRepelEvil,1);
	CreateInvItems(self,ItRu_PalFullHeal,1);
	CreateInvItems(self,ItRu_PalDestroyEvil,1);
};

instance PC_E3Mage(Npc_Default)
{
	name[0] = "Ja";
	guild = GIL_KDF;
	id = 0;
	voice = 15;
	level = 31;
	npcType = npctype_main;
	bodyStateInterruptableOverride = TRUE;
	exp = 248000;
	exp_next = 264000;
	lp = 0;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Player,BodyTex_N,ItAr_KDF_H);
	B_AddFightSkill(self,NPC_TALENT_1H,40,FALSE);
	B_AddFightSkill(self,NPC_TALENT_2H,30,FALSE);
	B_AddFightSkill(self,NPC_TALENT_BOW,20,FALSE);
	B_AddFightSkill(self,NPC_TALENT_CROSSBOW,10,FALSE);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKLOCK,1);
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,1);
	Npc_SetTalentSkill(self,NPC_TALENT_RUNES,1);
	Npc_SetTalentSkill(self,NPC_TALENT_ALCHEMY,1);
	Npc_SetTalentSkill(self,NPC_TALENT_TAKEANIMALTROPHY,1);
	PLAYER_TALENT_ALCHEMY[POTION_Health_01] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_Health_02] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_Health_03] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_Mana_01] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_Mana_02] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_Mana_03] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_Speed] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Light] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Firebolt] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Icebolt] = TRUE;
	PLAYER_TALENT_RUNES[SPL_LightHeal] = TRUE;
	PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] = TRUE;
	PLAYER_TALENT_RUNES[SPL_InstantFireball] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Zap] = TRUE;
	PLAYER_TALENT_RUNES[SPL_SummonWolf] = TRUE;
	PLAYER_TALENT_RUNES[SPL_WindFist] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Sleep] = TRUE;
	PLAYER_TALENT_RUNES[SPL_MediumHeal] = TRUE;
	PLAYER_TALENT_RUNES[SPL_LightningFlash] = TRUE;
	PLAYER_TALENT_RUNES[SPL_ChargeFireball] = TRUE;
	PLAYER_TALENT_RUNES[SPL_SummonSkeleton] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Fear] = TRUE;
	PLAYER_TALENT_RUNES[SPL_IceCube] = TRUE;
	PLAYER_TALENT_RUNES[SPL_ChargeZap] = TRUE;
	PLAYER_TALENT_RUNES[SPL_SummonGolem] = TRUE;
	PLAYER_TALENT_RUNES[SPL_DestroyUndead] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Pyrokinesis] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Firestorm] = TRUE;
	PLAYER_TALENT_RUNES[SPL_IceWave] = TRUE;
	PLAYER_TALENT_RUNES[SPL_SummonDemon] = TRUE;
	PLAYER_TALENT_RUNES[SPL_FullHeal] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Firerain] = TRUE;
	PLAYER_TALENT_RUNES[SPL_BreathOfDeath] = TRUE;
	PLAYER_TALENT_RUNES[SPL_MassDeath] = TRUE;
	PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Shrink] = TRUE;
	EquipItem(self,ItMw_1h_MISC_Sword);
	EquipItem(self,ItAm_Mana_01);
	EquipItem(self,ItRu_Light);
	EquipItem(self,ItRu_InstantFireball);
	EquipItem(self,ItRu_IceCube);
	EquipItem(self,ItRu_FullHeal);
	EquipItem(self,ItRu_Firerain);
	EquipItem(self,ItRu_LightningFlash);
	EquipItem(self,ItRu_Shrink);
	CreateInvItems(self,ItMi_Gold,100);
	CreateInvItems(self,ItRu_MassDeath,1);
	CreateInvItems(self,ItRu_ArmyOfDarkness,1);
	CreateInvItems(self,ItRu_SumGol,1);
	CreateInvItems(self,ItSc_TrfSheep,5);
	CreateInvItems(self,ItSc_TrfWolf,5);
	CreateInvItems(self,ItSc_TrfDragonSnapper,3);
	CreateInvItems(self,ItMi_Flask,10);
	CreateInvItems(self,ItMi_RuneBlank,10);
	CreateInvItems(self,ItMi_Sulfur,10);
	CreateInvItems(self,ItMi_Quartz,10);
	CreateInvItems(self,ItMi_Pitch,10);
	CreateInvItems(self,ItMi_Rockcrystal,10);
	CreateInvItems(self,ItMi_Aquamarine,10);
	CreateInvItems(self,ItMi_HolyWater,10);
	CreateInvItems(self,ItMi_Coal,10);
	CreateInvItems(self,ItMi_DarkPearl,10);
	CreateInvItems(self,ItPl_SwampHerb,10);
	CreateInvItems(self,ItPl_Mana_Herb_01,10);
	CreateInvItems(self,ItPl_Mana_Herb_02,10);
	CreateInvItems(self,ItPl_Mana_Herb_03,10);
	CreateInvItems(self,ItPl_Health_Herb_01,10);
	CreateInvItems(self,ItPl_Health_Herb_02,10);
	CreateInvItems(self,ItPl_Health_Herb_03,10);
	CreateInvItems(self,ItPl_Dex_Herb_01,10);
	CreateInvItems(self,ItPl_Strength_Herb_01,10);
	CreateInvItems(self,ItPl_Speed_Herb_01,10);
	CreateInvItems(self,ItPl_Mushroom_01,10);
	CreateInvItems(self,ItPl_Mushroom_02,10);
	CreateInvItems(self,ItPl_Forestberry,10);
	CreateInvItems(self,ItPl_Blueplant,10);
	CreateInvItems(self,ItPl_Planeberry,10);
	CreateInvItems(self,ItPl_Temp_Herb,10);
	CreateInvItems(self,ItPl_Perm_Herb,10);
	CreateInvItems(self,ItPo_Mana_01,10);
	CreateInvItems(self,ItPo_Mana_02,5);
	CreateInvItems(self,ItPo_Mana_03,1);
	CreateInvItems(self,ItPo_Health_01,10);
	CreateInvItems(self,ItPo_Health_02,5);
	CreateInvItems(self,ItPo_Health_03,1);
	CreateInvItems(self,ItPo_Speed,5);
};

instance PC_E3Paladin(Npc_Default)
{
	name[0] = "Ja";
	guild = GIL_PAL;
	id = 0;
	voice = 15;
	level = 31;
	npcType = npctype_main;
	bodyStateInterruptableOverride = TRUE;
	exp = 248000;
	exp_next = 264000;
	lp = 0;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_MANA_MAX] = 50;
	attribute[ATR_MANA] = 50;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Player,BodyTex_N,ItAr_PAl_H);
	B_AddFightSkill(self,NPC_TALENT_1H,100,FALSE);
	B_AddFightSkill(self,NPC_TALENT_2H,90,FALSE);
	B_AddFightSkill(self,NPC_TALENT_BOW,80,FALSE);
	B_AddFightSkill(self,NPC_TALENT_CROSSBOW,70,FALSE);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,0);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKLOCK,1);
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,1);
	Npc_SetTalentSkill(self,NPC_TALENT_SMITH,1);
	Npc_SetTalentSkill(self,NPC_TALENT_TAKEANIMALTROPHY,1);
	PLAYER_TALENT_SMITH[WEAPON_Common] = TRUE;
	PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] = TRUE;
	PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] = TRUE;
	PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] = TRUE;
	PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] = TRUE;
	PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] = TRUE;
	PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] = TRUE;
	PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] = TRUE;
	PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] = TRUE;
	EquipItem(self,ItMw_2h_Pal_Sword);
	EquipItem(self,ItRw_Bow_H_01);
	CreateInvItems(self,ItRw_Crossbow_H_01,1);
	CreateInvItems(self,ItRw_Arrow,1000);
	CreateInvItems(self,ItRw_Bolt,1000);
	EquipItem(self,ItAm_Strg_01);
	EquipItem(self,ItRu_PalMediumHeal);
	EquipItem(self,ItRu_PalRepelEvil);
	CreateInvItems(self,ItMi_Gold,100);
	CreateInvItems(self,ItMi_Nugget,50);
	CreateInvItems(self,ItMiSwordraw,10);
	CreateInvItems(self,ItAt_DragonBlood,10);
	CreateInvItems(self,ItSc_InstantFireball,10);
	CreateInvItems(self,ItSc_TrfSheep,5);
	CreateInvItems(self,ItSc_TrfWolf,5);
	CreateInvItems(self,ItSc_TrfDragonSnapper,3);
	CreateInvItems(self,ItMi_Flask,10);
	CreateInvItems(self,ItMi_RuneBlank,10);
	CreateInvItems(self,ItPo_Mana_01,10);
	CreateInvItems(self,ItPo_Mana_02,5);
	CreateInvItems(self,ItPo_Mana_03,1);
	CreateInvItems(self,ItPo_Health_01,10);
	CreateInvItems(self,ItPo_Health_02,5);
	CreateInvItems(self,ItPo_Health_03,1);
	CreateInvItems(self,ItPo_Speed,5);
};
