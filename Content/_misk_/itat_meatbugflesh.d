
const int Value_Meatbugflesh = 1;
const int Value_SheepFur = 10;
const int Value_WolfFur = 10;
const int Value_BugMandibles = 15;
const int Value_Claw = 15;
const int Value_LurkerClaw = 15;
const int Value_Teeth = 15;
const int Value_CrawlerMandibles = 15;
const int Value_Wing = 20;
const int Value_Sting = 25;
const int VALUE_LURKERSKIN = 25;
const int Value_WargFur = 25;
const int Value_DrgSnapperHorn = 100;
const int Value_CrawlerPlate = 25;
const int Value_ShadowFur = 50;
const int Value_SharkSkin = 200;
const int Value_TrollFur = 100;
const int Value_WaranFiretongue = 50;
const int Value_ShadowHorn = 100;
const int Value_SharkTeeth = 50;
const int Value_TrollTooth = 50;
const int Value_TrollBlackFur = 500;
const int Value_GoblinBone = 10;
const int Value_SkeletonBone = 10;
const int Value_DemonHeart = 50;
const int Value_StoneGolemHeart = 50;
const int Value_FireGolemHeart = 50;
const int Value_IceGolemHeart = 50;
const int Value_UndeadDragonSoulStone = 400;
const int Value_IcedragonHeart = 400;
const int Value_FiredragonHeart = 400;
const int Value_SwampdragonHeart = 400;
const int Value_RockdragonHeart = 400;
const int Value_DragonBlood = 50;
const int Value_DragonScale = 50;

instance ItAt_Meatbugflesh(C_Item)
{
	name = "Owadzie Mi?so";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Meatbugflesh;
	visual = "ItAt_Meatbugflesh.3DS";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Meatbugflesh;
	description = name;
	text[0] = "";
	text[1] = NAME_Bonus_Satiety;
	count[1] = 3;
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Meatbugflesh()
{
	ChangeSatiety(self,3);
};


instance ItAt_SheepFur(C_Item)
{
	name = "Owcza Sk?ra";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SheepFur;
	visual = "ItAt_SheepFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_WolfFur(C_Item)
{
	name = "Sk?ra Wilka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_WolfFur;
	visual = "ItAt_WolfFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_BugMandibles(C_Item)
{
	name = "?uwaczki Polnej Bestii";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_BugMandibles;
	visual = "ItAt_BugMandibles.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Claw(C_Item)
{
	name = "Pazury";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Claw;
	visual = "ItAt_Claw.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_LurkerClaw(C_Item)
{
	name = "Pazur Topielca";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_LurkerClaw;
	visual = "ItAt_LurkerClaw.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Teeth(C_Item)
{
	name = "K?y";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Teeth;
	visual = "ItAt_Teeth.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_CrawlerMandibles(C_Item)
{
	name = "?uwaczki Pe?zacza";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_CrawlerMandibles;
	visual = "ItAt_CrawlerMandibles.3DS";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = Use_Mandibles;
	description = name;
	text[0] = "Mo?na je otworzy? w celu";
	text[1] = "wypicia zawartej w nich wydzieliny,";
	text[2] = "kt?ra pozwala zregenerowa? energi? magiczn?.";
	text[3] = "Bardzo truj?ce.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Mandibles()
{
	if(Npc_IsPlayer(self)) //(Mandibles_Bonus <= 9)
	{
		if(CheckToxicity(self))
		{
			Npc_ChangeAttribute(self,ATR_MANA,self.attribute[ATR_MANA_MAX]);
		};
		ChangeToxicity(self, 75);
		//Mandibles_Bonus = Mandibles_Bonus + 1;
	};
};


instance ItAt_Wing(C_Item)
{
	name = "Skrzyd?a";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wing;
	visual = "ItAt_Wing.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Sting(C_Item)
{
	name = "??d?o";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Sting;
	scemeName = "FOOD";
	on_state[0] = Use_Sting;
	visual = "ItAt_Sting.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "Zawiera";
	text[2] = "truj?c? wydzielin?.";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Sting()
{
	if(Knows_Bloodfly == TRUE && Npc_IsPlayer(self))
	{
			if(CheckToxicity(self))
			{
				Npc_ChangeAttribute(self,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
			};
			ChangeToxicity(self, 50);
			//Print(PRINT_FullyHealed);
			//Bloodfly_Bonus = Bloodfly_Bonus + 1;

		//if(Bloodfly_Bonus <= 10)
	//	{
		//	Npc_ChangeAttribute(self,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
			//Print(PRINT_FullyHealed);
			//Bloodfly_Bonus = Bloodfly_Bonus + 1;
		//}
		//else
		//{
			//Print(PRINT_Mandibles);
		//};
	}
	else if(Npc_IsPlayer(self))
	{
		//Print(PRINT_Bloodfly);
		ChangeToxicity(self, 50);
	};
};


instance itat_LurkerSkin(C_Item)
{
	name = "Sk?ra Topielca";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_LURKERSKIN;
	visual = "ItAt_LurkerSkin.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_WargFur(C_Item)
{
	name = "Sk?ra Warga";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_WargFur;
	visual = "ItAt_WargFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_DrgSnapperHorn(C_Item)
{
	name = "R?g Smoczego Z?bacza";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_DrgSnapperHorn;
	visual = "ItAt_DrgSnapperHorn.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_CrawlerPlate(C_Item)
{
	name = "P?yty Pancerza Pe?zacza";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_CrawlerPlate;
	visual = "ItAt_CrawlerPlate.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_ShadowFur(C_Item)
{
	name = "Sk?ra Cieniostwora";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_ShadowFur;
	visual = "ItAt_ShadowFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_SharkSkin(C_Item)
{
	name = "Sk?ra B?otnego W??a";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SharkSkin;
	visual = "ItAt_SharkSkin.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_TrollFur(C_Item)
{
	name = "Sk?ra Trolla";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_TrollFur;
	visual = "ItAt_TrollFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_TrollBlackFur(C_Item)
{
	name = "Sk?ra Czarnego Trolla";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_TrollBlackFur;
	visual = "ItAt_TrollFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_WaranFiretongue(C_Item)
{
	name = "J?zyk Ognistego Jaszczura";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_WaranFiretongue;
	visual = "ItAt_WaranFiretongue.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_ShadowHorn(C_Item)
{
	name = "R?g Cieniostwora";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_ShadowHorn;
	visual = "ItAt_ShadowHorn.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_SharkTeeth(C_Item)
{
	name = "K?y B?otnego W??a";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SharkTeeth;
	visual = "ItAt_SharkTeeth.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_TrollTooth(C_Item)
{
	name = "Kie? Trolla";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_TrollTooth;
	visual = "ItAt_TrollTooth.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
};

instance ItAt_StoneGolemHeart(C_Item)
{
	name = "Serce Kamiennego Golema";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_StoneGolemHeart;
	visual = "ItAt_StoneGolemHeart.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_FireGolemHeart(C_Item)
{
	name = "Serce Ognistego Golema";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_FireGolemHeart;
	visual = "ItAt_FireGolemHeart.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_IceGolemHeart(C_Item)
{
	name = "Serce Lodowego Golema";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_IceGolemHeart;
	visual = "ItAt_IceGolemHeart.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_GoblinBone(C_Item)
{
	name = "Ko?? Goblina";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_GoblinBone;
	visual = "ItAt_GoblinBone.3DS";
	material = MAT_WOOD;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_SkeletonBone(C_Item)
{
	name = "Ko?? Szkieletu";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SkeletonBone;
	visual = "ItAt_SkeletonBone.3DS";
	material = MAT_WOOD;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_DemonHeart(C_Item)
{
	name = "Serce Demona";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_DemonHeart;
	visual = "ItAt_DemonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_UndeadDragonSoulStone(C_Item)
{
	name = "Kamie? Duszy Nieumar?ego Smoka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_UndeadDragonSoulStone;
	visual = "ItAt_UndeadDragonSoulStone.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ItAt_IcedragonHeart(C_Item)
{
	name = "Serce Lodowego Smoka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_IcedragonHeart;
	visual = "ItAt_IcedragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_RockdragonHeart(C_Item)
{
	name = "Serce Kamiennego Smoka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_RockdragonHeart;
	visual = "ItAt_RockdragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_SwampdragonHeart(C_Item)
{
	name = "Serce B?otnego Smoka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_SwampdragonHeart;
	visual = "ItAt_SwampdragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_FiredragonHeart(C_Item)
{
	name = "Serce Ognistego Smoka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_FiredragonHeart;
	visual = "ItAt_FiredragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_DragonBlood(C_Item)
{
	name = "Smocza Krew";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_DragonBlood;
	visual = "ItAt_DragonBlood.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ItAt_DragonScale(C_Item)
{
	name = "Smocze ?uski";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_DragonScale;
	visual = "ItAt_DragonScale.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};
