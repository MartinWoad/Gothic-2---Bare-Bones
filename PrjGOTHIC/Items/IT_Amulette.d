
const int VALUE_AM_PROTFIRE = 250;
const int AM_PROTFIRE = 6;
const int VALUE_AM_PROTEDGE = 250;
const int AM_PROTEDGE = 3;
const int VALUE_AM_PROTMAGE = 250;
const int AM_PROTMAGE = 6;
const int VALUE_AM_PROTPOINT = 250;
const int AM_PROTPOINT = 3;
const int VALUE_AM_PROTTOTAL = 750;
const int AM_TPROTFIRE = 3;
const int AM_TPROTEDGE = 3;
const int AM_TPROTMAGE = 3;
const int AM_TPROTPOINT = 3;
const int VALUE_AM_DEX = 300;
const int AM_DEX = 3;
const int VALUE_AM_MANA = 300;
const int AM_MANA = 6;
const int VALUE_AM_STRG = 300;
const int AM_STRG = 3;
const int VALUE_AM_HP = 300;
const int AM_HP = 15;
const int VALUE_AM_HPMANA = 500;
const int AM_HPMANA_HP = 10;
const int AM_HPMANA_MANA = 4;
const int VALUE_AM_DEXSTRG = 500;
const int AM_DEXSTRG_DEX = 2;
const int AM_DEXSTRG_STRG = 2;

instance ITAM_PROT_FIRE_01(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = VALUE_AM_PROTFIRE;
	visual = "ItAm_Prot_Fire_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_prot_fire_01;
	on_unequip = unequip_itam_prot_fire_01;
	description = "Amulet Ognia";
	text[2] = NAME_PROT_FIRE;
	count[2] = AM_PROTFIRE;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_prot_fire_01()
{
	self.protection[PROT_FIRE] += AM_PROTFIRE;
};

func void unequip_itam_prot_fire_01()
{
	self.protection[PROT_FIRE] -= AM_PROTFIRE;
};


instance ITAM_PROT_EDGE_01(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = VALUE_AM_PROTEDGE;
	visual = "ItAm_Prot_Edge_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_prot_edge_01;
	on_unequip = unequip_itam_prot_edge_01;
	description = "Amulet Stalowej Skóry";
	text[2] = NAME_PROT_EDGE;
	count[2] = AM_PROTEDGE;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_prot_edge_01()
{
	self.protection[PROT_EDGE] += AM_PROTEDGE;
	self.protection[PROT_BLUNT] += AM_PROTEDGE;
};

func void unequip_itam_prot_edge_01()
{
	self.protection[PROT_EDGE] -= AM_PROTEDGE;
	self.protection[PROT_BLUNT] -= AM_PROTEDGE;
};


instance ITAM_PROT_POINT_01(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = VALUE_AM_PROTPOINT;
	visual = "ItAm_Prot_Point_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_prot_point_01;
	on_unequip = unequip_itam_prot_point_01;
	description = "Amulet Dêbowej Skóry";
	text[2] = NAME_PROT_POINT;
	count[2] = AM_PROTPOINT;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_prot_point_01()
{
	self.protection[PROT_POINT] += AM_PROTPOINT;
};

func void unequip_itam_prot_point_01()
{
	self.protection[PROT_POINT] -= AM_PROTPOINT;
};


instance ITAM_PROT_MAGE_01(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = VALUE_AM_PROTMAGE;
	visual = "ItAm_Prot_Mage_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_prot_mage_01;
	on_unequip = unequip_itam_prot_mage_01;
	description = "Amulet Duchowej Si³y";
	text[2] = NAME_PROT_MAGIC;
	count[2] = AM_PROTMAGE;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_prot_mage_01()
{
	self.protection[PROT_MAGIC] += AM_PROTMAGE;
};

func void unequip_itam_prot_mage_01()
{
	self.protection[PROT_MAGIC] -= AM_PROTMAGE;
};


instance ITAM_PROT_TOTAL_01(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = VALUE_AM_PROTTOTAL;
	visual = "ItAm_Prot_Total_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_value_am_prottotal;
	on_unequip = unequip_value_am_prottotal;
	description = "Amulet Magicznego Pancerza";
	text[1] = NAME_PROT_FIRE;
	count[1] = AM_TPROTFIRE;
	text[2] = NAME_PROT_MAGIC;
	count[2] = AM_TPROTMAGE;
	text[3] = NAME_PROT_POINT;
	count[3] = AM_TPROTPOINT;
	text[4] = NAME_PROT_EDGE;
	count[4] = AM_TPROTEDGE;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_value_am_prottotal()
{
	self.protection[PROT_EDGE] += AM_TPROTEDGE;
	self.protection[PROT_BLUNT] += AM_TPROTEDGE;
	self.protection[PROT_POINT] += AM_TPROTPOINT;
	self.protection[PROT_FIRE] += AM_TPROTFIRE;
	self.protection[PROT_MAGIC] += AM_TPROTMAGE;
};

func void unequip_value_am_prottotal()
{
	self.protection[PROT_EDGE] -= AM_TPROTEDGE;
	self.protection[PROT_BLUNT] -= AM_TPROTEDGE;
	self.protection[PROT_POINT] -= AM_TPROTPOINT;
	self.protection[PROT_FIRE] -= AM_TPROTFIRE;
	self.protection[PROT_MAGIC] -= AM_TPROTMAGE;
};


instance ITAM_DEX_01(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = VALUE_AM_DEX;
	visual = "ItAm_Dex_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_dex_01;
	on_unequip = unequip_itam_dex_01;
	description = "Amulet Zwinnoœci";
	text[2] = NAME_BONUS_DEX;
	count[2] = AM_DEX;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_dex_01()
{
	b_raiseattribute(self,ATR_DEXTERITY,AM_DEX,FALSE,TRUE);
};

func void unequip_itam_dex_01()
{
	b_removeitemattribute(self,ATR_DEXTERITY,AM_DEX);
};


instance ITAM_STRG_01(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = VALUE_AM_STRG;
	visual = "ItAm_Strg_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_strg_01;
	on_unequip = unequip_itam_strg_01;
	description = "Amulet Si³y";
	text[2] = NAME_BONUS_STR;
	count[2] = AM_STRG;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_strg_01()
{
	b_raiseattribute(self,ATR_STRENGTH,AM_STRG,FALSE,TRUE);
};

func void unequip_itam_strg_01()
{
	b_removeitemattribute(self,ATR_STRENGTH,AM_STRG);
};


instance ITAM_HP_01(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = VALUE_AM_HP;
	visual = "ItAm_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_hp_01;
	on_unequip = unequip_itam_hp_01;
	description = "Amulet ¯ycia";
	text[2] = NAME_BONUS_HP;
	count[2] = AM_HP;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_hp_01()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + AM_HP;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + AM_HP;
};

func void unequip_itam_hp_01()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - AM_HP;
	if(self.attribute[ATR_HITPOINTS] > (AM_HP + 2))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - AM_HP;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};


instance ITAM_MANA_01(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = VALUE_AM_MANA;
	visual = "ItAm_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_mana_01;
	on_unequip = unequip_itam_mana_01;
	description = "Amulet Magii";
	text[2] = NAME_BONUS_MANA;
	count[2] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_mana_01()
{
	b_raiseattribute(self,ATR_MANA_MAX,AM_MANA,FALSE,TRUE);
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + AM_MANA;
};

func void unequip_itam_mana_01()
{
	b_removeitemattribute(self,ATR_MANA_MAX,AM_MANA);
	if(self.attribute[ATR_MANA] > AM_MANA)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - AM_MANA;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};
};


instance ITAM_DEX_STRG_01(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = VALUE_AM_DEXSTRG;
	visual = "ItAm_Dex_Strg_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_dex_strg_01;
	on_unequip = unequip_itam_dex_strg_01;
	description = "Amulet Potêgi";
	text[2] = NAME_BONUS_DEX;
	count[2] = AM_DEXSTRG_DEX;
	text[3] = NAME_BONUS_STR;
	count[3] = AM_DEXSTRG_STRG;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_dex_strg_01()
{
	b_raiseattribute(self,ATR_STRENGTH,AM_DEXSTRG_STRG,FALSE,TRUE);
	b_raiseattribute(self,ATR_DEXTERITY,AM_DEXSTRG_DEX,FALSE,TRUE);
};

func void unequip_itam_dex_strg_01()
{
	b_removeitemattribute(self,ATR_STRENGTH,AM_DEXSTRG_STRG);
	b_removeitemattribute(self,ATR_DEXTERITY,AM_DEXSTRG_DEX);
};


instance ITAM_HP_MANA_01(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = VALUE_AM_HPMANA;
	visual = "ItAm_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_hp_mana_01;
	on_unequip = unequip_itam_hp_mana_01;
	description = "Amulet Oœwiecenia";
	text[2] = NAME_BONUS_HP;
	count[2] = AM_HPMANA_HP;
	text[3] = NAME_BONUS_MANA;
	count[3] = AM_HPMANA_MANA;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_hp_mana_01()
{
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + AM_HPMANA_HP;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + AM_HPMANA_HP;
	b_raiseattribute(self,ATR_MANA_MAX,AM_HPMANA_MANA,FALSE,TRUE);
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + AM_HPMANA_MANA;
};

func void unequip_itam_hp_mana_01()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - AM_HPMANA_MANA;
	b_removeitemattribute(self,ATR_MANA_MAX,AM_HPMANA_MANA);
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - AM_HPMANA_HP;
	if(self.attribute[ATR_HITPOINTS] > (AM_HPMANA_HP + 1))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - AM_HPMANA_HP;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
	if(self.attribute[ATR_MANA] >= AM_HPMANA_HP)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - AM_HPMANA_HP;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 0;
	};
};

