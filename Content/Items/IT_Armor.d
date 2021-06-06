
const int VALUE_ITAR_Governor = 1100;
const int VALUE_ITAR_Judge = 800;
const int VALUE_ITAR_Smith = 100;
const int VALUE_ITAR_Barkeeper = 100;
const int VALUE_ITAR_Vlk_L = 100;
const int VALUE_ITAR_Vlk_M = 100;
const int VALUE_ITAR_Vlk_H = 100;
const int VALUE_ITAR_VlkBabe_L = 150;
const int VALUE_ITAR_VlkBabe_M = 150;
const int VALUE_ITAR_VlkBabe_H = 150;
const int VALUE_ITAR_MIL_L = 0;//500;
const int VALUE_ITAR_MIL_M = 0;//2500;
const int VALUE_ITAR_PAL_M = 0;//5000;
const int VALUE_ITAR_PAL_H = 0;//10000;
const int VALUE_ITAR_Bau_L = 80;
const int VALUE_ITAR_Bau_M = 100;
const int VALUE_ITAR_BauBabe_L = 80;
const int VALUE_ITAR_BauBabe_M = 80;
const int VALUE_ITAR_SLD_L = 0;//300;
const int VALUE_ITAR_SLD_M = 0;//500;
const int VALUE_ITAR_DJG_Crawler = 600;//600;
const int VALUE_ITAR_SLD_H = 0;//1000;
const int VALUE_ITAR_NOV_L = 0;//280;
const int VALUE_ITAR_KDF_L = 0;//500;
const int VALUE_ITAR_KDF_H = 0;//3000;
const int VALUE_ITAR_Leather_L = 250;
const int VALUE_ITAR_BDT_M = 0;//550;
const int VALUE_ITAR_BDT_H = 0;//2100;
const int VALUE_ITAR_DJG_L = 0;//3000;
const int VALUE_ITAR_DJG_M = 0;//12000;
const int VALUE_ITAR_DJG_H = 0;//20000;
const int VALUE_ITAR_DJG_Babe = 0;
const int VALUE_ITAR_XARDAS = 0;//15000;
const int VALUE_ITAR_LESTER = 0;//300;
const int VALUE_ITAR_Diego = 0;//450;
const int VALUE_ITAR_CorAngar = 0;//600;
const int VALUE_ITAR_Dementor = 0;
const int VALUE_ITAR_KDW_H = 0;//450;
const int VALUE_ITAR_Prisoner = 10;

instance ITAR_Governor(C_Item)
{
	name = "Kaftan Gubernatora";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Governor;
	wear = WEAR_TORSO;
	visual = "ItAr_Governor.3ds";
	visual_change = "Armor_Governor.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;

	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];

	/*
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;*/
};

instance ITAR_Judge(C_Item)
{
	name = "Szata S�dziego";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Judge;
	wear = WEAR_TORSO;
	visual = "ItAr_Governor.3DS";
	visual_change = "Armor_Judge.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];

	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_Smith(C_Item)
{
	name = "Str�j Kowala";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Smith;
	wear = WEAR_TORSO;
	visual = "ItAr_Smith.3DS";
	visual_change = "Armor_Smith.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_Barkeeper(C_Item)
{
	name = "Str�j Karczmarza";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Barkeeper;
	wear = WEAR_TORSO;
	visual = "ItAr_Wirt.3DS";
	visual_change = "Armor_Barkeeper.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];

	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_Vlk_L(C_Item)
{
	name = "Str�j Obywatela";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Vlk_L;
	wear = WEAR_TORSO;
	visual = "ItAr_VLK_L.3DS";
	visual_change = "Armor_Vlk_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];

	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_Vlk_M(C_Item)
{
	name = "Str�j Obywatela";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Vlk_M;
	wear = WEAR_TORSO;
	visual = "ItAr_VLK_M.3DS";
	visual_change = "Armor_Vlk_M.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];

	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_Vlk_H(C_Item)
{
	name = "Str�j Obywatela";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Vlk_H;
	wear = WEAR_TORSO;
	visual = "ItAr_VLK_H.3DS";
	visual_change = "Armor_Vlk_H.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];

	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_VlkBabe_L(C_Item)
{
	name = "Suknia Obywatelki";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	protection[PROT_FLY] = 0;
	value = VALUE_ITAR_VlkBabe_L;
	wear = WEAR_TORSO;
	visual = "ItAr_VLKBabe.3DS";
	visual_change = "Armor_VlkBabe_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];

	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_VlkBabe_M(C_Item)
{
	name = "Suknia Obywatelki";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_VlkBabe_M;
	wear = WEAR_TORSO;
	visual = "ItAr_VLKBabe.3DS";
	visual_change = "Armor_VlkBabe_M.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];

	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_VlkBabe_H(C_Item)
{
	name = "Suknia Obywatelki";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_VlkBabe_H;
	wear = WEAR_TORSO;
	visual = "ItAr_VLKBabe.3DS";
	visual_change = "Armor_VlkBabe_H.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];

	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_Mil_L(C_Item)
{
	name = "Lekki Pancerz Stra�y";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_mil_l;
	wear = WEAR_TORSO;
	visual = "ItAr_MIL_L.3DS";
	visual_change = "Armor_Mil_L.asc";
	visual_skin = 0;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];

	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
};

instance ItAr_MIL_M(C_Item)
{
	name = "Ci�ki Pancerz Stra�y";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 35;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 0;
	value = value_itar_mil_m;
	wear = WEAR_TORSO;
	visual = "ItAr_MIL_M.3DS";
	visual_change = "Armor_MIL_M.asc";
	visual_skin = 0;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];

	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
};

instance ItAr_PAL_M(C_Item)
{
	name = "Pancerz Rycerza";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 15;
	value = value_itar_pal_m;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_M.3ds";
	visual_change = "Armor_Pal_M.asc";
	visual_skin = 0;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	material = MAT_METAL;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
};

instance ItAr_PAl_H(C_Item)
{
	name = "Zbroja Paladyna";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 25;
	value = value_itar_pal_h;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_H.3ds";
	visual_change = "Armor_Pal_H.asc";
	visual_skin = 0;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	material = MAT_METAL;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
};

instance ITAR_Bau_L(C_Item)
{
	name = "Str�j Parobka";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Bau_L;
	wear = WEAR_TORSO;
	visual = "ItAr_Bau_L.3DS";
	visual_change = "Armor_Bau_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];

	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_Bau_M(C_Item)
{
	name = "Str�j Farmera";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Bau_M;
	wear = WEAR_TORSO;
	visual = "ItAr_Bau_M.3ds";
	visual_change = "Armor_Bau_M.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];

	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_BauBabe_L(C_Item)
{
	name = "Suknia Farmerki";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_BauBabe_L;
	wear = WEAR_TORSO;
	visual = "ItAr_VLKBabe.3DS";
	visual_change = "Armor_BauBabe_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];

	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_BauBabe_M(C_Item)
{
	name = "Suknia Farmerki";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_BauBabe_M;
	wear = WEAR_TORSO;
	visual = "ItAr_VLKBabe.3DS";
	visual_change = "Armor_BauBabe_M.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];

	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAr_Sld_L(C_Item)
{
	name = "Lekki Pancerz Najemnika";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_sld_l;
	wear = WEAR_TORSO;
	visual = "ItAr_Sld_L.3ds";
	visual_change = "Armor_Sld_L.asc";
	visual_skin = 0;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 25;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];

	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
};

instance itar_sld_M(C_Item)
{
	name = "�redni Pancerz Najemnika";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_sld_m;
	wear = WEAR_TORSO;
	visual = "ItAr_Sld_M.3ds";
	visual_change = "Armor_Sld_M.asc";
	visual_skin = 0;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 35;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];

	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
};

instance ItAr_Sld_H(C_Item)
{
	name = "Ci�ki Pancerz Najemnika";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	value = value_itar_sld_h;
	wear = WEAR_TORSO;
	visual = "ItAr_Sld_H.3ds";
	visual_change = "Armor_Sld_H.asc";
	visual_skin = 0;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 45;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
};

instance ITAR_DJG_Crawler(C_Item)
{
	name = "Zbroja z Pancerzy Pe�zaczy";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 25;
	protection[PROT_BLUNT] = 25;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_DJG_Crawler;
	wear = WEAR_TORSO;
	visual = "ItAr_Djg_Crawler.3ds";
	visual_change = "Armor_Djg_Crawler.asc";
	visual_skin = 0;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Value;
	count[5] = value;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
};

instance ITAR_DJG_L(C_Item)
{
	name = "Lekki Pancerz �owcy Smok�w";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 25;
	protection[PROT_BLUNT] = 35;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 5;
	value = value_itar_djg_l;
	wear = WEAR_TORSO;
	visual = "ItAr_Djg_L.3ds";
	visual_change = "Armor_Djg_L.asc";
	visual_skin = 0;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
};

instance ITAR_DJG_M(C_Item)
{
	name = "�redni Pancerz �owcy Smok�w";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 35;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 45;
	protection[PROT_FIRE] = 40;
	protection[PROT_MAGIC] = 10;
	value = value_itar_djg_m;
	wear = WEAR_TORSO;
	visual = "ItAr_Djg_M.3ds";
	visual_change = "Armor_Djg_M.asc";
	visual_skin = 0;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
};

instance ITAR_DJG_H(C_Item)
{
	name = "Ci�ki Pancerz �owcy Smok�w";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 45;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 15;
	value = value_itar_djg_h;
	wear = WEAR_TORSO;
	visual = "ItAr_Djg_H.3ds";
	visual_change = "Armor_Djg_H.asc";
	visual_skin = 0;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
};

instance ITAR_DJG_Babe(C_Item)
{
	name = "Kobiecy Pancerz �owcy Smok�w";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_DJG_Babe;
	wear = WEAR_TORSO;
	visual = "ItAr_Djg_L.3DS";
	visual_change = "Armor_Djg_Babe.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
};

instance ItAr_NOV_L(C_Item)
{
	name = "Str�j Nowicjusza";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 5;
	value = value_itar_nov_l;
	wear = WEAR_TORSO;
	visual = "ItAr_Nov_L.3ds";
	visual_change = "Armor_Nov_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
};

instance ItAr_KDF_L(C_Item)
{
	name = "Szata Ognia";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 10;
	value = value_itar_kdf_l;
	wear = WEAR_TORSO;
	visual = "ItAr_KdF_L.3ds";
	visual_change = "Armor_Kdf_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
};

instance ItAr_KDF_H(C_Item)
{
	name = "Zdobiona Szata Ognia";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 40;
	protection[PROT_MAGIC] = 20;
	value = value_itar_kdf_h;
	wear = WEAR_TORSO;
	visual = "ItAr_KdF_H.3ds";
	visual_change = "Armor_Kdf_H.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
};

instance ITAR_Leather_L(C_Item)
{
	name = "Sk�rzany Pancerz";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Leather_L;
	wear = WEAR_TORSO;
	visual = "ItAr_Leather_L.3ds";
	visual_change = "Armor_Leather_L.asc";
	visual_skin = 0;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Value;
	count[5] = value;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
};

instance ItAr_BDT_M(C_Item)
{
	name = "Lekki Str�j Szkodnika";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_bdt_m;
	wear = WEAR_TORSO;
	visual = "ItAr_Bdt_M.3ds";
	visual_change = "Armor_Bdt_M.asc";
	visual_skin = 0;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];

	text[5] = NAME_Value;
	count[5] = value;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
};

instance ItAr_BDT_H(C_Item)
{
	name = "�redni Str�j Szkodnika";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 35;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	value = value_itar_bdt_h;
	wear = WEAR_TORSO;
	visual = "ItAr_Bdt_H.3ds";
	visual_change = "Armor_Bdt_H.asc";
	visual_skin = 0;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 25;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];

	text[5] = NAME_Value;
	count[5] = value;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
};

instance ITAR_Xardas(C_Item)
{
	name = "Szata Mrocznej Magii";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 50;
	value = value_itar_xardas;
	wear = WEAR_TORSO;
	visual = "ItAr_Xardas.3ds";
	visual_change = "Armor_Xardas.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
};

instance ITAR_Lester(C_Item)
{
	name = "Szata Lestera";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 10;
	value = value_itar_lester;
	wear = WEAR_TORSO;
	visual = "ItAr_Lester.3ds";
	visual_change = "Armor_Lester.asc";
	visual_skin = 0;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];

	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
};

instance ITAR_Diego(C_Item)
{
	name = "Pancerz Cienia";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Diego;
	wear = WEAR_TORSO;
	visual = "ItAr_Diego.3ds";
	visual_change = "Armor_Diego.asc";
	visual_skin = 0;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
};

instance ITAR_CorAngar(C_Item)
{
	name = "Pancerz Cor Angara";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 35;
	protection[PROT_BLUNT] = 35;
	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 10;
	value = VALUE_ITAR_CorAngar;
	wear = WEAR_TORSO;
	visual = "ItAr_CorAngar.3ds";
	visual_change = "Armor_CorAngar.asc";
	visual_skin = 0;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
};

instance ITAR_Dementor(C_Item)
{
	name = "Mroczny P�aszcz";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 40;
	value = VALUE_ITAR_Dementor;
	wear = WEAR_TORSO;
	visual = "ItAr_Xardas.3ds";
	visual_change = "Armor_Dementor.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
};

instance ITAR_KDW_H(C_Item)
{
	name = "Szata Wody";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 30;
	value = value_itar_kdw_h;
	wear = WEAR_TORSO;
	visual = "ItAr_KdW_H.3ds";
	visual_change = "Armor_KdW_H.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
};

instance ITAR_Prisoner(C_Item)
{
	name = "�achy Skaza�ca";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Prisoner;
	wear = WEAR_TORSO;
	visual = "ItAr_Prisoner.3ds";
	visual_change = "Armor_Prisoner.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Blunt;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_Prot_Edge;
	count[2] = protection[PROT_EDGE];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];

	text[5] = NAME_Value;
	count[5] = value;
};
