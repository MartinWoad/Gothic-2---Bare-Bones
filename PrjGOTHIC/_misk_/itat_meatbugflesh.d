
const int VALUE_MEATBUGFLESH = 1;
const int VALUE_SHEEPFUR = 10;
const int VALUE_WOLFFUR = 10;
const int VALUE_BUGMANDIBLES = 15;
const int VALUE_CLAW = 15;
const int VALUE_LURKERCLAW = 15;
const int VALUE_TEETH = 15;
const int VALUE_CRAWLERMANDIBLES = 15;
const int VALUE_WING = 20;
const int VALUE_STING = 25;
const int VALUE_LURKERSKIN = 25;
const int VALUE_WARGFUR = 25;
const int VALUE_DRGSNAPPERHORN = 100;
const int VALUE_CRAWLERPLATE = 25;
const int VALUE_SHADOWFUR = 50;
const int VALUE_SHARKSKIN = 200;
const int VALUE_TROLLFUR = 100;
const int VALUE_WARANFIRETONGUE = 50;
const int VALUE_SHADOWHORN = 100;
const int VALUE_SHARKTEETH = 50;
const int VALUE_TROLLTOOTH = 50;
const int VALUE_TROLLBLACKFUR = 500;
const int VALUE_GOBLINBONE = 10;
const int VALUE_SKELETONBONE = 10;
const int VALUE_DEMONHEART = 50;
const int VALUE_STONEGOLEMHEART = 50;
const int VALUE_FIREGOLEMHEART = 50;
const int VALUE_ICEGOLEMHEART = 50;
const int VALUE_UNDEADDRAGONSOULSTONE = 400;
const int VALUE_ICEDRAGONHEART = 400;
const int VALUE_FIREDRAGONHEART = 400;
const int VALUE_SWAMPDRAGONHEART = 400;
const int VALUE_ROCKDRAGONHEART = 400;
const int VALUE_DRAGONBLOOD = 50;
const int VALUE_DRAGONSCALE = 50;

instance ITAT_MEATBUGFLESH(C_ITEM)
{
	name = "Owadzie Miêso";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MEATBUGFLESH;
	visual = "ItAt_Meatbugflesh.3DS";
	material = MAT_LEATHER;
	scemename = "FOODHUGE";
	on_state[0] = use_meatbugflesh;
	description = name;
	text[0] = "";
	text[1] = NAME_BONUS_HP;
	count[1] = 10;
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_meatbugflesh()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,10);
};


instance ITAT_SHEEPFUR(C_ITEM)
{
	name = "Owcza Skóra";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SHEEPFUR;
	visual = "ItAt_SheepFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_WOLFFUR(C_ITEM)
{
	name = "Skóra Wilka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_WOLFFUR;
	visual = "ItAt_WolfFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_BUGMANDIBLES(C_ITEM)
{
	name = "¯uwaczki Polnej Bestii";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_BUGMANDIBLES;
	visual = "ItAt_BugMandibles.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_CLAW(C_ITEM)
{
	name = "Pazury";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_CLAW;
	visual = "ItAt_Claw.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_LURKERCLAW(C_ITEM)
{
	name = "Pazur Topielca";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_LURKERCLAW;
	visual = "ItAt_LurkerClaw.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_TEETH(C_ITEM)
{
	name = "K³y";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_TEETH;
	visual = "ItAt_Teeth.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_CRAWLERMANDIBLES(C_ITEM)
{
	name = "¯uwaczki Pe³zacza";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_CRAWLERMANDIBLES;
	visual = "ItAt_CrawlerMandibles.3DS";
	material = MAT_LEATHER;
	scemename = "FOOD";
	on_state[0] = use_mandibles;
	description = name;
	text[0] = "Mo¿na je otworzyæ w celu";
	text[1] = "wypicia zawartej w nich wydzieliny,";
	text[2] = "która pozwala zregenerowaæ manê.";
	text[3] = "Efekt z czasem przemija.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_mandibles()
{
	if(MANDIBLES_BONUS <= 9)
	{
		Npc_ChangeAttribute(self,ATR_MANA,self.attribute[ATR_MANA_MAX]);
		MANDIBLES_BONUS = MANDIBLES_BONUS + 1;
	}
	else
	{
		PrintScreen(PRINT_MANDIBLES,-1,YPOS_LEVELUP,FONT_SCREENSMALL,2);
	};
};


instance ITAT_WING(C_ITEM)
{
	name = "Skrzyd³a";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_WING;
	visual = "ItAt_Wing.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_STING(C_ITEM)
{
	name = "¯¹d³o";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_STING;
	scemename = "FOOD";
	on_state[0] = use_sting;
	visual = "ItAt_Sting.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "Zawiera";
	text[2] = "truj¹c¹ wydzielinê.";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_sting()
{
	if(KNOWS_BLOODFLY == TRUE)
	{
		if(BLOODFLY_BONUS <= 10)
		{
			Npc_ChangeAttribute(self,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
			Print(PRINT_FULLYHEALED);
			BLOODFLY_BONUS = BLOODFLY_BONUS + 1;
		}
		else
		{
			Print(PRINT_MANDIBLES);
		};
	}
	else
	{
		Print(PRINT_BLOODFLY);
		if(self.attribute[ATR_HITPOINTS] > 1)
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 1;
		};
	};
};


instance ITAT_LURKERSKIN(C_ITEM)
{
	name = "Skóra Topielca";
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
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_WARGFUR(C_ITEM)
{
	name = "Skóra Warga";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_WARGFUR;
	visual = "ItAt_WargFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_DRGSNAPPERHORN(C_ITEM)
{
	name = "Róg Smoczego Zêbacza";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_DRGSNAPPERHORN;
	visual = "ItAt_DrgSnapperHorn.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_CRAWLERPLATE(C_ITEM)
{
	name = "P³yty Pancerza Pe³zacza";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_CRAWLERPLATE;
	visual = "ItAt_CrawlerPlate.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_SHADOWFUR(C_ITEM)
{
	name = "Skóra Cieniostwora";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SHADOWFUR;
	visual = "ItAt_ShadowFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_SHARKSKIN(C_ITEM)
{
	name = "Skóra B³otnego Wê¿a";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SHARKSKIN;
	visual = "ItAt_SharkSkin.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_TROLLFUR(C_ITEM)
{
	name = "Skóra Trolla";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_TROLLFUR;
	visual = "ItAt_TrollFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_TROLLBLACKFUR(C_ITEM)
{
	name = "Skóra Czarnego Trolla";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_TROLLBLACKFUR;
	visual = "ItAt_TrollFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_WARANFIRETONGUE(C_ITEM)
{
	name = "Jêzyk Ognistego Jaszczura";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_WARANFIRETONGUE;
	visual = "ItAt_WaranFiretongue.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_SHADOWHORN(C_ITEM)
{
	name = "Róg Cieniostwora";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SHADOWHORN;
	visual = "ItAt_ShadowHorn.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_SHARKTEETH(C_ITEM)
{
	name = "K³y B³otnego Wê¿a";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SHARKTEETH;
	visual = "ItAt_SharkTeeth.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_TROLLTOOTH(C_ITEM)
{
	name = "Kie³ Trolla";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_TROLLTOOTH;
	visual = "ItAt_TrollTooth.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
};

instance ITAT_STONEGOLEMHEART(C_ITEM)
{
	name = "Serce Kamiennego Golema";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_STONEGOLEMHEART;
	visual = "ItAt_StoneGolemHeart.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_FIREGOLEMHEART(C_ITEM)
{
	name = "Serce Ognistego Golema";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_FIREGOLEMHEART;
	visual = "ItAt_FireGolemHeart.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_ICEGOLEMHEART(C_ITEM)
{
	name = "Serce Lodowego Golema";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_ICEGOLEMHEART;
	visual = "ItAt_IceGolemHeart.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_GOBLINBONE(C_ITEM)
{
	name = "Koœæ Goblina";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_GOBLINBONE;
	visual = "ItAt_GoblinBone.3DS";
	material = MAT_WOOD;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_SKELETONBONE(C_ITEM)
{
	name = "Koœæ Szkieletu";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SKELETONBONE;
	visual = "ItAt_SkeletonBone.3DS";
	material = MAT_WOOD;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_DEMONHEART(C_ITEM)
{
	name = "Serce Demona";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_DEMONHEART;
	visual = "ItAt_DemonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_UNDEADDRAGONSOULSTONE(C_ITEM)
{
	name = "Kamieñ Duszy Nieumar³ego Smoka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_UNDEADDRAGONSOULSTONE;
	visual = "ItAt_UndeadDragonSoulStone.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ITAT_ICEDRAGONHEART(C_ITEM)
{
	name = "Serce Lodowego Smoka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_ICEDRAGONHEART;
	visual = "ItAt_IcedragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_ROCKDRAGONHEART(C_ITEM)
{
	name = "Serce Kamiennego Smoka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_ROCKDRAGONHEART;
	visual = "ItAt_RockdragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_SWAMPDRAGONHEART(C_ITEM)
{
	name = "Serce B³otnego Smoka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_SWAMPDRAGONHEART;
	visual = "ItAt_SwampdragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_FIREDRAGONHEART(C_ITEM)
{
	name = "Serce Ognistego Smoka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_FIREDRAGONHEART;
	visual = "ItAt_FiredragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_DRAGONBLOOD(C_ITEM)
{
	name = "Smocza Krew";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_DRAGONBLOOD;
	visual = "ItAt_DragonBlood.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ITAT_DRAGONSCALE(C_ITEM)
{
	name = "Smocze £uski";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_DRAGONSCALE;
	visual = "ItAt_DragonScale.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

