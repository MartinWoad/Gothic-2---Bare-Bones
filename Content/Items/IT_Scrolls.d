
const string Name_PaladinScroll = "Po?wi?cony Zw?j";

const int Value_Sc_PalLight = 5;
const int Value_Sc_PalLightHeal = 35;
const int Value_Sc_PalHolyBolt = 100;
const int Value_Sc_PalMediumHeal = 175;
const int Value_Sc_PalRepelEvil = 350;
const int Value_Sc_PalFullHeal = 600;
const int Value_Sc_PalDestroyEvil = 750;
const int Value_Sc_Light = 5;
const int Value_Sc_Firebolt = 15;
const int Value_Sc_Charm = 100;
const int Value_Sc_Icebolt = 80;
const int Value_Sc_LightHeal = 35;
const int Value_Sc_SumGobSkel = 50;
const int Value_Sc_InstantFireball = 75;
const int Value_Sc_Zap = 50;
const int Value_Sc_SumWolf = 100;
const int Value_Sc_Windfist = 125;
const int Value_Sc_Sleep = 150;
const int Value_Sc_MediumHeal = 175;
const int Value_Sc_LightningFlash = 275;
const int Value_Sc_ChargeFireball = 300;
const int Value_Sc_SumSkel = 215;
const int Value_Sc_Fear = 225;
const int Value_Sc_IceCube = 250;
const int Value_Sc_ThunderBall = 250;
const int Value_Sc_SumGol = 325;
const int Value_Sc_HarmUndead = 350;
const int Value_Sc_Pyrokinesis = 500;
const int Value_Sc_Firestorm = 200;
const int Value_Sc_IceWave = 425;
const int Value_Sc_SumDemon = 425;
const int Value_Sc_FullHeal = 600;
const int Value_Sc_Firerain = 600;
const int Value_Sc_BreathOfDeath = 650;
const int Value_Sc_MassDeath = 750;
const int Value_Sc_ArmyOfDarkness = 900;
const int Value_Sc_Shrink = 1000;
const int Value_Sc_TrfSheep = 10;
const int Value_Sc_TrfScavenger = 50;
const int Value_Sc_TrfGiantRat = 50;
const int Value_Sc_TrfGiantBug = 50;
const int Value_Sc_TrfWolf = 55;
const int Value_Sc_TrfWaran = 55;
const int Value_Sc_TrfSnapper = 55;
const int Value_Sc_TrfWarg = 55;
const int Value_Sc_TrfFireWaran = 60;
const int Value_Sc_TrfLurker = 65;
const int Value_Sc_TrfShadowbeast = 75;
const int Value_Sc_TrfDragonSnapper = 100;

instance ItSc_PalLight(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_PalLight;
	visual = "ItSc_PalLight.3DS";
	material = MAT_LEATHER;
	spell = SPL_Light;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_LIGHT;
	description = NAME_SPL_PalLight;
	text[0] = Name_PaladinScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_PalLight;
	text[2] = NAME_Duration;
	count[2] = SPL_Duration_PalLIGHT;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_PalLightHeal(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_PalLightHeal;
	visual = "ItSc_PalLightHeal.3DS";
	material = MAT_LEATHER;
	spell = SPL_PalLightHeal;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_PalLightHeal;
	description = NAME_SPL_PalLightHeal;
	text[0] = Name_PaladinScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_PalLightHeal;
	text[2] = NAME_HealingPerCast;
	count[2] = SPL_Heal_PalLightHeal;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_PalHolyBolt(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_PalHolyBolt;
	visual = "ItSc_PalHolyBolt.3DS";
	material = MAT_LEATHER;
	spell = SPL_PalHolyBolt;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_PalHolyBolt;
	description = NAME_SPL_PalHolyBolt;
	text[0] = Name_PaladinScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_PalHolyBolt;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_Damage_PalHolyBolt;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_PalMediumHeal(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_PalMediumHeal;
	visual = "ItSc_PalMediumHeal.3DS";
	material = MAT_LEATHER;
	spell = SPL_PalMediumHeal;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_PalMediumHeal;
	description = NAME_SPL_PalMediumHeal;
	text[0] = Name_PaladinScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_PalMediumHeal;
	text[2] = NAME_HealingPerCast;
	count[2] = SPL_Heal_PalMediumHeal;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_PalRepelEvil(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_PalRepelEvil;
	visual = "ItSc_PalRepelEvil.3DS";
	material = MAT_LEATHER;
	spell = SPL_PalRepelEvil;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_PalRepelEvil;
	description = NAME_SPL_PalRepelEvil;
	text[0] = Name_PaladinScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_PalRepelEvil;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_Damage_PalRepelEvil;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_PalFullHeal(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_PalFullHeal;
	visual = "ItSc_PalFullHeal.3DS";
	material = MAT_LEATHER;
	spell = SPL_PalFullHeal;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_PalFullHeal;
	description = NAME_SPL_PalFullHeal;
	text[0] = Name_PaladinScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_PalFullHeal;
	text[2] = NAME_HealingPerCast;
	count[2] = SPL_Heal_PalFullHeal;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_PalDestroyEvil(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_PalDestroyEvil;
	visual = "ItSc_PalDestroyEvil.3DS";
	material = MAT_LEATHER;
	spell = SPL_PalDestroyEvil;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_PalDestroyEvil;
	description = NAME_SPL_PalDestroyEvil;
	text[0] = Name_PaladinScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_PalDestroyEvil;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_Damage_PalDestroyEvil;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_Light(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_Light;
	visual = "ItSc_Light.3DS";
	material = MAT_LEATHER;
	spell = SPL_Light;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_LIGHT;
	description = NAME_SPL_LIGHT;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_LIGHT;
	text[2] = NAME_Duration;
	count[2] = SPL_Duration_LIGHT;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_Firebolt(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_Firebolt;
	visual = "ItSc_Firebolt.3DS";
	material = MAT_LEATHER;
	spell = SPL_Firebolt;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Firebolt;
	description = NAME_SPL_Firebolt;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Firebolt;
	text[2] = NAME_Dam_Fire;
	count[2] = SPL_Damage_Firebolt;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_Icebolt(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_Icebolt;
	//visual = "ItSc_Icebolt.3ds";
	visual = "ItSc_Water04.3DS";
	material = MAT_LEATHER;
	spell = SPL_Icebolt;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_Icebolt;
	description = NAME_SPL_Icebolt;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_Icebolt;
	text[2] = NAME_Dam_Point;
	count[2] = SPL_DAMAGE_Icebolt;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_LightHeal(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_LightHeal;
	visual = "ItSc_LightHeal.3DS";
	material = MAT_LEATHER;
	spell = SPL_LightHeal;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_LightHeal;
	description = NAME_SPL_LightHeal;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_LightHeal;
	text[2] = NAME_HealingPerCast;
	count[2] = SPL_Heal_LightHeal;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_SumGobSkel(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_SumGobSkel;
	visual = "ItSc_SumGobSkel.3DS";
	material = MAT_LEATHER;
	spell = SPL_SummonGoblinSkeleton;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_SummonGoblinSkeleton;
	description = NAME_SPL_SummonGoblinSkeleton;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_SummonGoblinSkeleton;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_InstantFireball(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_InstantFireball;
	visual = "ItSc_InstantFireball.3DS";
	material = MAT_LEATHER;
	spell = SPL_InstantFireball;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_InstantFireball;
	description = NAME_SPL_InstantFireball;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_InstantFireball;
	text[2] = NAME_Dam_Fire;
	count[2] = SPL_DAMAGE_InstantFireball;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_Zap(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_Zap;
	visual = "ItSc_Zap.3DS";
	material = MAT_LEATHER;
	spell = SPL_Zap;
	description = NAME_SPL_Zap;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Zap;
	text[2] = NAME_Dam_Energy;
	count[2] = SPL_Damage_Zap;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_SumWolf(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_SumWolf;
	visual = "ItSc_SumWolf.3DS";
	material = MAT_LEATHER;
	spell = SPL_SummonWolf;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_SummonWolf;
	description = NAME_SPL_SummonWolf;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_SummonWolf;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_Windfist(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_Windfist;
	visual = "ItSc_Windfist.3DS";
	material = MAT_LEATHER;
	spell = SPL_WindFist;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 10;
	description = NAME_SPL_WINDFIST;
	text[0] = NAME_MageScroll;
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_Cost_WindFist;
	text[2] = NAME_Dam_Fly;
	count[2] = SPL_Damage_Windfist * 3;
	text[4] = NAME_ManaPerSec;
	count[4] = 1000 / 200;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_Sleep(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_Sleep;
	visual = "ItSc_Sleep.3DS";
	material = MAT_LEATHER;
	spell = SPL_Sleep;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Sleep;
	description = NAME_SPL_Sleep;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Sleep;
	text[2] = NAME_Duration;
	count[2] = SPL_TIME_Sleep;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_Charm(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_Charm;
	visual = "ItSc_Sleep.3DS";
	material = MAT_LEATHER;
	spell = SPL_Charm;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Charm;
	description = NAME_SPL_Charm;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Charm;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_MediumHeal(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_MediumHeal;
	visual = "ItSc_MediumHeal.3DS";
	material = MAT_LEATHER;
	spell = SPL_MediumHeal;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_MediumHeal;
	description = NAME_SPL_MediumHeal;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_MediumHeal;
	text[2] = NAME_HealingPerCast;
	count[2] = SPL_Heal_MediumHeal;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_LightningFlash(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_LightningFlash;
	visual = "ItSc_LightningFlash.3DS";
	material = MAT_LEATHER;
	spell = SPL_LightningFlash;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_LightningFlash;
	description = NAME_SPL_LightningFlash;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_LightningFlash;
	text[2] = NAME_Dam_Energy;
	count[2] = SPL_Damage_LightningFlash;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_ChargeFireBall(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_ChargeFireball;
	visual = "ItSc_ChargeFireball.3DS";
	material = MAT_LEATHER;
	spell = SPL_ChargeFireball;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 15;
	description = NAME_SPL_ChargeFireball;
	text[0] = NAME_MageScroll;
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_COST_ChargeFireball;
	text[2] = NAME_Dam_Fire;
	count[2] = SPL_Damage_ChargeFireball * 3;
	text[4] = NAME_ManaPerSec;
	count[4] = 1000 / 120;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_SumSkel(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_SumSkel;
	visual = "ItSc_SumSkel.3DS";
	material = MAT_LEATHER;
	spell = SPL_SummonSkeleton;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_SummonSkeleton;
	description = NAME_SPL_SummonSkeleton;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_SummonSkeleton;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_Fear(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_Fear;
	visual = "ItSc_Fear.3DS";
	material = MAT_LEATHER;
	spell = SPL_Fear;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Fear;
	description = NAME_SPL_Fear;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Fear;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_IceCube(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_IceCube;
	visual = "ItSc_IceCube.3DS";
	material = MAT_LEATHER;
	spell = SPL_IceCube;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_IceCube;
	description = NAME_SPL_IceCube;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_IceCube;
	text[2] = NAME_Dam_Frost;
	count[2] = SPL_FREEZE_DAMAGE;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_ThunderBall(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_ThunderBall;
	visual = "ItSc_ThunderBall.3DS";
	material = MAT_LEATHER;
	spell = SPL_ChargeZap;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 18;
	description = NAME_SPL_ChargeZap;
	text[0] = NAME_MageScroll;
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_COST_ChargeZap;
	text[2] = NAME_Dam_Energy;
	count[2] = SPL_Damage_ChargeZap * 3;
	text[4] = NAME_ManaPerSec;
	count[4] = 1000 / 100;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_SumGol(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_SumGol;
	visual = "ItSc_SumGol.3DS";
	material = MAT_LEATHER;
	spell = SPL_SummonGolem;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_SummonGolem;
	description = NAME_SPL_SummonGolem;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_SummonGolem;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_HarmUndead(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_HarmUndead;
	visual = "ItSc_HarmUndead.3DS";
	material = MAT_LEATHER;
	spell = SPL_DestroyUndead;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_DESTROYUNDEAD;
	description = NAME_SPL_DestroyUndead;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_DESTROYUNDEAD;
	text[2] = NAME_Dam_Energy;
	count[2] = SPL_Damage_DESTROYUNDEAD;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_Pyrokinesis(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_Pyrokinesis;
	visual = "ItSc_Pyrokinesis.3DS";
	material = MAT_LEATHER;
	spell = SPL_Pyrokinesis;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 25;
	description = NAME_SPL_Pyrokinesis;
	text[0] = NAME_MageScroll;
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_COST_Firestorm;
	text[2] = NAME_Dam_Fire;
	count[2] = SPL_Damage_Firestorm * 3;
	text[4] = NAME_ManaPerSec;
	count[4] = 1000 / 120;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_Firestorm(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_Firestorm;
	visual = "ItSc_Firestorm.3DS";
	material = MAT_LEATHER;
	spell = SPL_Firestorm;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_InstantFireStorm;
	description = NAME_SPL_Firestorm;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_InstantFireStorm;
	text[2] = NAME_Dam_Fire;
	count[2] = SPL_Damage_InstantFireStorm;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_IceWave(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 110;
	visual = "ItSc_IceWave.3DS";
	material = MAT_LEATHER;
	spell = SPL_IceWave;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_IceWave;
	description = NAME_SPL_IceWave;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_IceWave;
	text[2] = NAME_Dam_Frost;
	count[2] = SPL_FREEZE_DAMAGE;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_SumDemon(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_SumDemon;
	visual = "ItSc_SumDemon.3DS";
	material = MAT_LEATHER;
	spell = SPL_SummonDemon;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_SummonDemon;
	description = NAME_SPL_SummonDemon;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_SummonDemon;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_FullHeal(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_FullHeal;
	visual = "ItSc_FullHeal.3DS";
	material = MAT_LEATHER;
	spell = SPL_FullHeal;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_FullHeal;
	description = NAME_SPL_FullHeal;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_FullHeal;
	text[2] = NAME_HealingPerCast;
	count[2] = SPL_Heal_FullHeal;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_Firerain(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_Firerain;
	visual = "ItSc_Firerain.3DS";
	material = MAT_LEATHER;
	spell = SPL_Firerain;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Firerain;
	description = NAME_SPL_Firerain;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Firerain;
	text[2] = NAME_Dam_Fire;
	count[2] = SPL_Damage_FireRain;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_BreathOfDeath(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_BreathOfDeath;
	visual = "ItSc_BreathOfDeath.3ds";
	material = MAT_LEATHER;
	spell = SPL_BreathOfDeath;
	description = NAME_SPL_BreathOfDeath;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_BreathOfDeath;
	text[2] = NAME_Dam_Energy;
	count[2] = SPL_Damage_BreathOfDeath;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_MassDeath(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_MassDeath;
	visual = "ItSc_MassDeath.3ds";
	material = MAT_LEATHER;
	spell = SPL_MassDeath;
	description = NAME_SPL_MassDeath;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_MassDeath;
	text[2] = NAME_Dam_Energy;
	count[2] = SPL_Damage_MassDeath;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_ArmyOfDarkness(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_ArmyOfDarkness;
	visual = "ItSc_ArmyOfDarkness.3DS";
	material = MAT_LEATHER;
	spell = SPL_ArmyOfDarkness;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_ArmyOfDarkness;
	description = NAME_SPL_ArmyOfDarkness;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_ArmyOfDarkness;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_Shrink(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_Shrink;
	visual = "ItSc_Shrink.3DS";
	material = MAT_LEATHER;
	spell = SPL_Shrink;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Shrink;
	description = NAME_SPL_Shrink;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Shrink;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_TrfSheep(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_TrfSheep;
	visual = "ItSc_TrfSheep.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfSheep;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_TrfSheep;
	description = NAME_SPL_TrfSheep;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_TrfSheep;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_TrfScavenger(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_TrfScavenger;
	visual = "ItSc_TrfScavenger.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfScavenger;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_TrfScavenger;
	description = NAME_SPL_TrfScavenger;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_TrfScavenger;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_TrfGiantRat(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_TrfGiantRat;
	visual = "ItSc_TrfGiantRat.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfGiantRat;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_TrfGiantRat;
	description = NAME_SPL_TrfGiantRat;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_TrfGiantRat;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_TrfGiantBug(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_TrfGiantBug;
	visual = "ItSc_TrfGiantBug.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfGiantBug;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_TrfGiantBug;
	description = NAME_SPL_TrfGiantBug;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_TrfGiantBug;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_TrfWolf(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_TrfWolf;
	visual = "ItSc_TrfWolf.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfWolf;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_TrfWolf;
	description = NAME_SPL_TrfWolf;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_TrfWolf;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_TrfWaran(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_TrfWaran;
	visual = "ItSc_TrfWaran.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfWaran;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_TrfWaran;
	description = NAME_SPL_TrfWaran;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_TrfWaran;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_TrfSnapper(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_TrfSnapper;
	visual = "ItSc_TrfSnapper.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfSnapper;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_TrfSnapper;
	description = NAME_SPL_TrfSnapper;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_TrfSnapper;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_TrfWarg(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_TrfWarg;
	visual = "ItSc_TrfWarg.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfWarg;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_TrfWarg;
	description = NAME_SPL_TrfWarg;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_TrfWarg;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_TrfFireWaran(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_TrfFireWaran;
	visual = "ItSc_TrfFireWaran.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfFireWaran;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_TrfFireWaran;
	description = NAME_SPL_TrfFireWaran;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_TrfFireWaran;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_TrfLurker(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_TrfLurker;
	visual = "ItSc_TrfLurker.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfLurker;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_TrfLurker;
	description = NAME_SPL_TrfLurker;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_TrfLurker;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_TrfShadowbeast(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_TrfShadowbeast;
	visual = "ItSc_TrfShadowbeast.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfShadowbeast;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_TrfShadowbeast;
	description = NAME_SPL_TrfShadowbeast;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_TrfShadowbeast;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_TrfDragonSnapper(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_TrfDragonSnapper;
	visual = "ItSc_TrfDragonSnapper.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfDragonSnapper;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_TrfDragonSnapper;
	description = NAME_SPL_TrfDragonSnapper;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_TrfDragonSnapper;
	text[5] = NAME_Value;
	count[5] = value;
};
