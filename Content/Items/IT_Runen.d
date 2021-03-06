
const string Name_PaladinSpell = "Runa Paladyna";

const int Value_Ru_PalLight = 50;
const int Value_Ru_PalLightHeal = 50;
const int Value_Ru_PalHolyBolt = 50;
const int Value_Ru_PalMediumHeal = 100;
const int Value_Ru_PalRepelEvil = 100;
const int Value_Ru_PalFullHeal = 150;
const int Value_Ru_PalDestroyEvil = 150;
const int Value_Ru_Light = 50;
const int Value_Ru_Firebolt = 50;
const int Value_Ru_Zap = 50;
const int Value_Ru_LightHeal = 50;
const int Value_Ru_SumGobSkel = 50;
const int Value_Ru_InstantFireball = 100;
const int Value_Ru_Icebolt = 100;
const int Value_Ru_SumWolf = 100;
const int Value_Ru_Windfist = 100;
const int Value_Ru_Sleep = 100;
const int Value_Ru_MediumHeal = 150;
const int Value_Ru_SumSkel = 150;
const int Value_Ru_Fear = 150;
const int Value_Ru_IceCube = 150;
const int Value_Ru_ThunderBall = 150;
const int Value_Ru_Firestorm = 150;
const int Value_Ru_SumGol = 200;
const int Value_Ru_HarmUndead = 200;
const int Value_Ru_LightningFlash = 200;
const int Value_Ru_ChargeFireball = 200;
const int Value_Ru_IceWave = 250;
const int Value_Ru_SumDemon = 250;
const int Value_Ru_FullHeal = 250;
const int Value_Ru_Pyrokinesis = 250;
const int Value_Ru_Firerain = 300;
const int Value_Ru_BreathOfDeath = 300;
const int Value_Ru_MassDeath = 300;
const int Value_Ru_MasterOfDisaster = 300;
const int Value_Ru_ArmyOfDarkness = 300;
const int Value_Ru_Shrink = 300;
const int Value_Ru_PalTeleportSecret = 50;
const int Value_Ru_TeleportSeaport = 50;
const int Value_Ru_TeleportMonastery = 50;
const int Value_Ru_TeleportFarm = 50;
const int Value_Ru_TeleportXardas = 50;
const int Value_Ru_TeleportPassNW = 50;
const int Value_Ru_TeleportPassOW = 50;
const int Value_Ru_TeleportOC = 50;
const int Value_Ru_TeleportOWDemonTower = 50;
const int Value_Ru_TeleportTaverne = 50;
const int Value_Ru_Teleport_3 = 50;

instance ItRu_PalLight(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_PalLight;
	visual = "ItRu_PalLight.3ds";
	material = MAT_STONE;
	spell = SPL_PalLight;
	description = NAME_SPL_PalLight;
	text[0] = Name_PaladinSpell;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_PalLight;
	text[2] = NAME_Duration;
	count[2] = SPL_Duration_PalLIGHT;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_PalLightHeal(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_PalLightHeal;
	visual = "ItRu_PalLightHeal.3ds";
	material = MAT_STONE;
	spell = SPL_PalLightHeal;
	description = NAME_SPL_PalLightHeal;
	text[0] = Name_PaladinSpell;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_PalLightHeal;
	text[2] = NAME_HealingPerCast;
	count[2] = SPL_Heal_PalLightHeal;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_PalMediumHeal(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_PalMediumHeal;
	visual = "ItRu_PalMediumHeal.3ds";
	material = MAT_STONE;
	spell = SPL_PalMediumHeal;
	description = NAME_SPL_PalMediumHeal;
	text[0] = Name_PaladinSpell;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_PalMediumHeal;
	text[2] = NAME_HealingPerCast;
	count[2] = SPL_Heal_PalMediumHeal;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_PalFullHeal(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_PalFullHeal;
	visual = "ItRu_PalFullHeal.3ds";
	material = MAT_STONE;
	spell = SPL_PalFullHeal;
	description = NAME_SPL_PalFullHeal;
	text[0] = Name_PaladinSpell;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_PalFullHeal;
	text[2] = NAME_HealingPerCast;
	count[2] = SPL_Heal_PalFullHeal;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_PalHolyBolt(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_PalHolyBolt;
	visual = "ItRu_PalHolyBolt.3DS";
	material = MAT_STONE;
	spell = SPL_PalHolyBolt;
	description = NAME_SPL_PalHolyBolt;
	text[0] = Name_PaladinSpell;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_PalHolyBolt;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_Damage_PalHolyBolt;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_PalRepelEvil(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_PalRepelEvil;
	visual = "ItRu_PalRepelEvil.3DS";
	material = MAT_STONE;
	spell = SPL_PalRepelEvil;
	description = NAME_SPL_PalRepelEvil;
	text[0] = Name_PaladinSpell;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_PalRepelEvil;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_Damage_PalRepelEvil;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_PalDestroyEvil(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_PalDestroyEvil;
	visual = "ItRu_PalDestroyEvil.3DS";
	material = MAT_STONE;
	spell = SPL_PalDestroyEvil;
	description = NAME_SPL_PalDestroyEvil;
	text[0] = Name_PaladinSpell;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_PalDestroyEvil;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_Damage_PalDestroyEvil;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_PalTeleportSecret(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_PalTeleportSecret;
	visual = "ItRu_PalTeleportSecret.3DS";
	material = MAT_STONE;
	spell = SPL_PalTeleportSecret;
	description = NAME_SPL_PalTeleportSecret;
	text[0] = Name_PaladinSpell;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_TeleportSeaport(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_TeleportSeaport;
	visual = "ItRu_TeleportSeaport.3ds";
	material = MAT_STONE;
	spell = SPL_TeleportSeaport;
	description = NAME_SPL_TeleportSeaport;
	mag_circle = 2;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_TeleportMonastery(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_TeleportMonastery;
	visual = "ItRu_TeleportMonastery.3ds";
	material = MAT_STONE;
	spell = SPL_TeleportMonastery;
	description = NAME_SPL_TeleportMonastery;
	mag_circle = 2;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_TeleportFarm(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_TeleportFarm;
	visual = "ItRu_TeleportFarm.3ds";
	material = MAT_STONE;
	spell = SPL_TeleportFarm;
	description = NAME_SPL_TeleportFarm;
	mag_circle = 2;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_TeleportXardas(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_TeleportXardas;
	visual = "ItRu_TeleportXardas.3ds";
	material = MAT_STONE;
	spell = SPL_TeleportXardas;
	description = NAME_SPL_TeleportXardas;
	mag_circle = 2;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_TeleportPassNW(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_TeleportPassNW;
	visual = "ItRu_TeleportPassNW.3ds";
	material = MAT_STONE;
	spell = SPL_TeleportPassNW;
	description = NAME_SPL_TeleportPassNW;
	mag_circle = 2;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_TeleportPassOW(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_TeleportPassOW;
	visual = "ItRu_TeleportPassOW.3ds";
	material = MAT_STONE;
	spell = SPL_TeleportPassOW;
	description = NAME_SPL_TeleportPassOW;
	mag_circle = 2;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_TeleportOC(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_TeleportOC;
	visual = "ItRu_TeleportOC.3ds";
	material = MAT_STONE;
	spell = SPL_TeleportOC;
	description = NAME_SPL_TeleportOC;
	mag_circle = 2;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_TeleportOWDemonTower(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_TeleportOWDemonTower;
	visual = "ItRu_Teleport_2.3ds";
	material = MAT_STONE;
	spell = SPL_TeleportOWDemonTower;
	description = NAME_SPL_TeleportOWDemonTower;
	mag_circle = 2;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_TeleportTaverne(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_TeleportTaverne;
	visual = "ItRu_Teleport_2.3ds";
	material = MAT_STONE;
	spell = SPL_TeleportTaverne;
	description = NAME_SPL_TeleportTaverne;
	mag_circle = 2;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Teleport_3(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Teleport_3;
	visual = "ItRu_Teleport_3.3ds";
	material = MAT_STONE;
	spell = SPL_Teleport_3;
	description = NAME_SPL_Teleport_3;
	mag_circle = 2;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Light(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Light;
	visual = "ItRu_Light.3ds";
	material = MAT_STONE;
	spell = SPL_Light;
	mag_circle = 1;
	description = NAME_SPL_LIGHT;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_LIGHT;
	text[2] = NAME_Duration;
	count[2] = SPL_Duration_LIGHT;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_FireBolt(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Firebolt;
	visual = "ItRu_FireBolt.3DS";
	material = MAT_STONE;
	spell = SPL_Firebolt;
	mag_circle = 1;
	description = NAME_SPL_Firebolt;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Firebolt;
	text[2] = NAME_Dam_Fire;
	count[2] = SPL_Damage_Firebolt;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Zap(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Zap;
	visual = "ItRu_Zap.3DS";
	material = MAT_STONE;
	mag_circle = 1;
	spell = SPL_Zap;
	description = NAME_SPL_Zap;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Zap;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_Damage_Zap;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_LightHeal(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_LightHeal;
	visual = "ItRu_LightHeal.3ds";
	material = MAT_STONE;
	spell = SPL_LightHeal;
	mag_circle = 1;
	description = NAME_SPL_LightHeal;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_LightHeal;
	text[2] = NAME_HealingPerCast;
	count[2] = SPL_Heal_LightHeal;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_SumGobSkel(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_SumGobSkel;
	visual = "ItRu_SumGobSkel.3DS";
	material = MAT_STONE;
	spell = SPL_SummonGoblinSkeleton;
	mag_circle = 1;
	description = NAME_SPL_SummonGoblinSkeleton;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_SummonSkeleton;
	text[2] = "Niespokojne ko?ci";
	text[3] = "martwych goblin?w.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_InstantFireball(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_InstantFireball;
	visual = "ItRu_InstantFireball.3DS";
	material = MAT_STONE;
	mag_circle = 2;
	spell = SPL_InstantFireball;
	description = NAME_SPL_InstantFireball;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_InstantFireball;
	text[2] = NAME_Dam_Fire;
	count[2] = SPL_DAMAGE_InstantFireball;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Icebolt(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Icebolt;
	//visual = "ItRu_Icebolt.3ds";
	visual = "ItRu_Water04.3DS";
	material = MAT_STONE;
	spell = SPL_Icebolt;
	mag_circle = 2;
	description = NAME_SPL_Icebolt;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_Icebolt;
	text[2] = NAME_Dam_Point;
	count[2] = SPL_DAMAGE_Icebolt;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_SumWolf(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_SumWolf;
	visual = "ItRu_SumWolf.3DS";
	material = MAT_STONE;
	spell = SPL_SummonWolf;
	mag_circle = 2;
	description = NAME_SPL_SummonWolf;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_SummonSkeleton;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Windfist(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Windfist;
	visual = "ItRu_Windfist.3ds";
	material = MAT_STONE;
	spell = SPL_WindFist;
	mag_circle = 2;
	description = NAME_SPL_WINDFIST;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_Cost_WindFist;
	text[2] = NAME_Dam_Fly;
	count[2] = SPL_Damage_Windfist * 3;
	text[4] = NAME_ManaPerSec;
	count[4] = 1000 / 200;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Sleep(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Sleep;
	visual = "ItRu_Sleep.3ds";
	material = MAT_STONE;
	spell = SPL_Sleep;
	mag_circle = 2;
	description = NAME_SPL_Sleep;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Sleep;
	text[2] = NAME_Duration;
	count[2] = SPL_TIME_Sleep;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_MediumHeal(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_MediumHeal;
	visual = "ItRu_MediumHeal.3ds";
	material = MAT_STONE;
	spell = SPL_MediumHeal;
	mag_circle = 3;
	description = NAME_SPL_MediumHeal;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_MediumHeal;
	text[2] = NAME_HealingPerCast;
	count[2] = SPL_Heal_MediumHeal;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_LightningFlash(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_LightningFlash;
	visual = "ItRu_LightningFlash.3DS";
	material = MAT_STONE;
	mag_circle = 4;
	spell = SPL_LightningFlash;
	description = NAME_SPL_LightningFlash;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_LightningFlash;
	text[2] = NAME_Dam_Energy;
	count[2] = SPL_Damage_LightningFlash;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_ChargeFireball(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_ChargeFireball;
	visual = "ItRu_ChargeFireball.3DS";
	material = MAT_STONE;
	mag_circle = 4;
	spell = SPL_ChargeFireball;
	description = NAME_SPL_ChargeFireball;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_COST_ChargeFireball;
	text[2] = NAME_Dam_Fire;
	count[2] = SPL_Damage_ChargeFireball * 3;
	text[4] = NAME_ManaPerSec;
	count[4] = 1000 / 120;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_SumSkel(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_SumSkel;
	visual = "ItRu_SumSkel.3DS";
	material = MAT_STONE;
	spell = SPL_SummonSkeleton;
	mag_circle = 2;
	description = NAME_SPL_SummonSkeleton;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_SummonSkeleton;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Fear(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Fear;
	visual = "ItRu_Fear.3DS";
	material = MAT_STONE;
	mag_circle = 3;
	spell = SPL_Fear;
	description = NAME_SPL_Fear;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Fear;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_IceCube(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_IceCube;
	visual = "ItRu_IceCube.3ds";
	material = MAT_STONE;
	spell = SPL_IceCube;
	mag_circle = 3;
	description = NAME_SPL_IceCube;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_IceCube;
	text[2] = NAME_Dam_Frost;
	count[2] = SPL_FREEZE_DAMAGE;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_ThunderBall(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_ThunderBall;
	visual = "ItRu_ThunderBall.3ds";
	material = MAT_STONE;
	spell = SPL_ChargeZap;
	mag_circle = 3;
	description = NAME_SPL_ChargeZap;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_COST_ChargeZap;
	text[2] = NAME_Dam_Energy;
	count[2] = SPL_Damage_ChargeZap * 3;
	text[4] = NAME_ManaPerSec;
	count[4] = 1000 / 100;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_SumGol(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_SumGol;
	visual = "ItRu_SumGol.3DS";
	material = MAT_STONE;
	spell = SPL_SummonGolem;
	mag_circle = 4;
	description = NAME_SPL_SummonGolem;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_SummonSkeleton;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_HarmUndead(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_HarmUndead;
	visual = "ItRu_HarmUndead.3DS";
	material = MAT_STONE;
	spell = SPL_DestroyUndead;
	mag_circle = 4;
	description = NAME_SPL_DestroyUndead;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_DESTROYUNDEAD;
	text[2] = NAME_Dam_Energy;
	count[2] = SPL_Damage_DESTROYUNDEAD;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Pyrokinesis(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Pyrokinesis;
	visual = "ItRu_Pyrokinesis.3ds";
	material = MAT_STONE;
	spell = SPL_Pyrokinesis;
	mag_circle = 5;
	description = NAME_SPL_Pyrokinesis;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_COST_Firestorm;
	text[2] = NAME_Dam_Fire;
	count[2] = SPL_Damage_Firestorm * 3;
	text[4] = NAME_ManaPerSec;
	count[4] = 1000 / 120;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Firestorm(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Firestorm;
	visual = "ItRu_Firestorm.3ds";
	material = MAT_STONE;
	spell = SPL_Firestorm;
	mag_circle = 3;
	description = NAME_SPL_Firestorm;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_InstantFireStorm;
	text[2] = NAME_Dam_Fire;
	count[2] = SPL_Damage_InstantFireStorm;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_IceWave(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_IceWave;
	visual = "ItRu_IceWave.3ds";
	material = MAT_STONE;
	spell = SPL_IceWave;
	mag_circle = 5;
	description = NAME_SPL_IceWave;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_IceWave;
	text[2] = NAME_Dam_Frost;
	count[2] = SPL_FREEZE_DAMAGE;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_SumDemon(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_SumDemon;
	visual = "ItRu_SumDemon.3DS";
	material = MAT_STONE;
	spell = SPL_SummonDemon;
	mag_circle = 5;
	description = NAME_SPL_SummonDemon;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_SummonDemon;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_FullHeal(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_FullHeal;
	visual = "ItRu_FullHeal.3ds";
	material = MAT_STONE;
	spell = SPL_FullHeal;
	mag_circle = 5;
	description = NAME_SPL_FullHeal;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_FullHeal;
	text[2] = NAME_HealingPerCast;
	count[2] = SPL_Heal_FullHeal;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Firerain(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Firerain;
	visual = "ItRu_Firerain.3ds";
	material = MAT_STONE;
	spell = SPL_Firerain;
	mag_circle = 6;
	description = NAME_SPL_Firerain;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Firerain;
	text[2] = NAME_Dam_Fire;
	count[2] = SPL_Damage_FireRain;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_BreathOfDeath(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_BreathOfDeath;
	visual = "ItRu_BreathOfDeath.3ds";
	material = MAT_STONE;
	spell = SPL_BreathOfDeath;
	mag_circle = 6;
	description = NAME_SPL_BreathOfDeath;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_BreathOfDeath;
	text[2] = NAME_Dam_Energy;
	count[2] = SPL_Damage_BreathOfDeath;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_MassDeath(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = Value_Ru_MassDeath;
	visual = "ItRu_MassDeath.3ds";
	material = MAT_STONE;
	spell = SPL_MassDeath;
	mag_circle = 6;
	description = NAME_SPL_MassDeath;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_MassDeath;
	text[2] = NAME_Dam_Energy;
	count[2] = SPL_Damage_MassDeath;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_MasterOfDisaster(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_MasterOfDisaster;
	visual = "ItRu_MasterOfDesaster.3DS";
	material = MAT_STONE;
	spell = SPL_MasterOfDisaster;
	mag_circle = 6;
	description = NAME_SPL_MasterOfDisaster;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_MasterOfDisaster;
	text[2] = NAME_Dam_Energy;
	count[2] = SPL_DAMAGE_MasterOfDisaster;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_ArmyOfDarkness(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_ArmyOfDarkness;
	visual = "ItRu_ArmyOfDarkness.3DS";
	material = MAT_STONE;
	spell = SPL_ArmyOfDarkness;
	mag_circle = 6;
	description = NAME_SPL_ArmyOfDarkness;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_ArmyOfDarkness;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Shrink(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Shrink;
	visual = "ItRu_Shrink.3DS";
	material = MAT_STONE;
	spell = SPL_Shrink;
	mag_circle = 6;
	description = NAME_SPL_Shrink;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Shrink;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Deathbolt(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 0;
	visual = "ItRu_PalRepelEvil.3DS";
	material = MAT_STONE;
	spell = SPL_Deathbolt;
	mag_circle = 6;
	description = "Pocisk ?mierci";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_Deathbolt;
	text[2] = NAME_Dam_Fire;
	count[2] = SPL_DAMAGE_Deathbolt;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Deathball(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 0;
	visual = "ItRu_PalRepelEvil.3DS";
	material = MAT_STONE;
	spell = SPL_Deathball;
	mag_circle = 6;
	description = "?miertelna Kula";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_Deathball;
	text[2] = NAME_Dam_Fire;
	count[2] = SPL_DAMAGE_Deathball;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_Concussionbolt(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 0;
	visual = "ItRu_PalRepelEvil.3DS";
	material = MAT_STONE;
	spell = SPL_ConcussionBolt;
	mag_circle = 6;
	description = "Pocisk Og?uszaj?cy";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_Concussionbolt;
	text[2] = NAME_Dam_Energy;
	count[2] = SPL_DAMAGE_Concussionbolt;
	text[5] = NAME_Value;
	count[5] = value;
};
