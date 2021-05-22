
const int VALUE_RI_PROTFIRE = 100;
const int RI_PROTFIRE = 2;
const int VALUE_RI_PROTEDGE = 100;
const int RI_PROTEDGE = 1;
const int VALUE_RI_PROTMAGE = 100;
const int RI_PROTMAGE = 2;
const int VALUE_RI_PROTPOINT = 100;
const int RI_PROTPOINT = 1;
const int VALUE_RI_PROTFIRE02 = 200;
const int RI_PROTFIRE02 = 4;
const int VALUE_RI_PROTEDGE02 = 200;
const int RI_PROTEDGE02 = 2;
const int VALUE_RI_PROTMAGE02 = 200;
const int RI_PROTMAGE02 = 4;
const int VALUE_RI_PROTPOINT02 = 200;
const int RI_PROTPOINT02 = 2;
const int VALUE_RI_PROTTOTAL = 250;
const int RI_TPROTFIRE = 2;
const int RI_TPROTEDGE = 1;
const int RI_TPROTMAGE = 2;
const int RI_TPROTPOINT = 1;
const int VALUE_RI_PROTTOTAL02 = 500;
const int RI_TPROTFIRE02 = 4;
const int RI_TPROTEDGE02 = 2;
const int RI_TPROTMAGE02 = 4;
const int RI_TPROTPOINT02 = 2;
const int VALUE_RI_DEX = 100;
const int RI_DEX = 1;
const int VALUE_RI_DEX02 = 200;
const int RI_DEX02 = 2;
const int VALUE_RI_MANA = 100;
const int RI_MANA = 2;
const int VALUE_RI_MANA02 = 200;
const int RI_MANA02 = 4;
const int VALUE_RI_STRG = 100;
const int RI_STRG = 1;
const int VALUE_RI_STRG02 = 200;
const int RI_STRG02 = 2;
const int VALUE_RI_HP = 100;
const int RI_HP = 5;
const int VALUE_RI_HP02 = 200;
const int RI_HP02 = 10;
const int VALUE_RI_HPMANA = 250;
const int RI_HPMANA_HP = 5;
const int RI_HPMANA_MANA = 2;
const int VALUE_RI_DEXSTRG = 250;
const int RI_DEXSTRG_DEX = 1;
const int RI_DEXSTRG_STRG = 1;

instance ITRI_PROT_FIRE_01(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_RI_PROTFIRE;
	visual = "ItRi_Prot_Fire_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_prot_fire_01;
	on_unequip = unequip_itri_prot_fire_01;
	description = "Pierœcieñ Ognia";
	text[2] = NAME_PROT_FIRE;
	count[2] = RI_PROTFIRE;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_prot_fire_01()
{
	self.protection[PROT_FIRE] += RI_PROTFIRE;
};

func void unequip_itri_prot_fire_01()
{
	self.protection[PROT_FIRE] -= RI_PROTFIRE;
};


instance ITRI_PROT_FIRE_02(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_RI_PROTFIRE02;
	visual = "ItRi_Prot_Fire_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_prot_fire_02;
	on_unequip = unequip_itri_prot_fire_02;
	description = "Pierœcieñ Wiecznego Ognia";
	text[2] = NAME_PROT_FIRE;
	count[2] = RI_PROTFIRE02;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_prot_fire_02()
{
	self.protection[PROT_FIRE] += RI_PROTFIRE02;
};

func void unequip_itri_prot_fire_02()
{
	self.protection[PROT_FIRE] -= RI_PROTFIRE02;
};


instance ITRI_PROT_POINT_01(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_RI_PROTPOINT;
	visual = "ItRi_Prot_Point_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_prot_point_01;
	on_unequip = unequip_itri_prot_point_01;
	description = "Pierœcieñ Drewnianej Skóry";
	text[2] = NAME_PROT_POINT;
	count[2] = RI_PROTPOINT;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_prot_point_01()
{
	self.protection[PROT_POINT] += RI_PROTPOINT;
};

func void unequip_itri_prot_point_01()
{
	self.protection[PROT_POINT] -= RI_PROTPOINT;
};


instance ITRI_PROT_POINT_02(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_RI_PROTPOINT02;
	visual = "ItRi_Prot_Point_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_prot_point_02;
	on_unequip = unequip_itri_prot_point_02;
	description = "Pierœcieñ Kamiennej Skóry";
	text[2] = NAME_PROT_POINT;
	count[2] = RI_PROTPOINT02;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_prot_point_02()
{
	self.protection[PROT_POINT] += RI_PROTPOINT02;
};

func void unequip_itri_prot_point_02()
{
	self.protection[PROT_POINT] -= RI_PROTPOINT02;
};


instance ITRI_PROT_EDGE_01(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_RI_PROTEDGE;
	visual = "ItRi_Prot_Edge_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_prot_edge_01;
	on_unequip = unequip_itri_prot_edge_01;
	description = "Pierœcieñ ¯elaznej Skóry";
	text[2] = NAME_PROT_EDGE;
	count[2] = RI_PROTEDGE;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_prot_edge_01()
{
	self.protection[PROT_EDGE] += RI_PROTEDGE;
	self.protection[PROT_BLUNT] += RI_PROTEDGE;
};

func void unequip_itri_prot_edge_01()
{
	self.protection[PROT_EDGE] -= RI_PROTEDGE;
	self.protection[PROT_BLUNT] -= RI_PROTEDGE;
};


instance ITRI_PROT_EDGE_02(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_RI_PROTEDGE02;
	visual = "ItRi_Prot_Edge_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_prot_edge_02;
	on_unequip = unequip_itri_prot_edge_02;
	description = "Pierœcieñ Magicznej Skóry";
	text[2] = NAME_PROT_EDGE;
	count[2] = RI_PROTEDGE02;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_prot_edge_02()
{
	self.protection[PROT_EDGE] += RI_PROTEDGE02;
	self.protection[PROT_BLUNT] += RI_PROTEDGE02;
};

func void unequip_itri_prot_edge_02()
{
	self.protection[PROT_EDGE] -= RI_PROTEDGE02;
	self.protection[PROT_BLUNT] -= RI_PROTEDGE02;
};


instance ITRI_PROT_MAGE_01(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_RI_PROTMAGE;
	visual = "ItRi_Prot_Mage_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_prot_mage_01;
	on_unequip = unequip_itri_prot_mage_01;
	description = "Pierœcieñ Zas³ony przed Magi¹";
	text[2] = NAME_PROT_MAGIC;
	count[2] = RI_PROTMAGE;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_prot_mage_01()
{
	self.protection[PROT_MAGIC] += RI_PROTMAGE;
};

func void unequip_itri_prot_mage_01()
{
	self.protection[PROT_MAGIC] -= RI_PROTMAGE;
};


instance ITRI_PROT_MAGE_02(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_RI_PROTMAGE02;
	visual = "ItRi_Prot_Mage_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_prot_mage_02;
	on_unequip = unequip_itri_prot_mage_02;
	description = "Pierœcieñ Ochrony przed Magi¹";
	text[2] = NAME_PROT_MAGIC;
	count[2] = RI_PROTMAGE02;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_prot_mage_02()
{
	self.protection[PROT_MAGIC] += RI_PROTMAGE02;
};

func void unequip_itri_prot_mage_02()
{
	self.protection[PROT_MAGIC] -= RI_PROTMAGE02;
};


instance ITRI_PROT_TOTAL_01(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_RI_PROTTOTAL;
	visual = "ItRi_Prot_Total_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_prot_total_01;
	on_unequip = unequip_itri_prot_total_01;
	description = "Pierœcieñ Wiecznych Zwyciêstw";
	text[1] = NAME_PROT_MAGIC;
	count[1] = RI_TPROTMAGE;
	text[2] = NAME_PROT_FIRE;
	count[2] = RI_TPROTFIRE;
	text[3] = NAME_PROT_POINT;
	count[3] = RI_TPROTPOINT;
	text[4] = NAME_PROT_EDGE;
	count[4] = RI_TPROTEDGE;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_prot_total_01()
{
	self.protection[PROT_EDGE] += RI_TPROTEDGE;
	self.protection[PROT_BLUNT] += RI_TPROTEDGE;
	self.protection[PROT_POINT] += RI_TPROTPOINT;
	self.protection[PROT_FIRE] += RI_TPROTFIRE;
	self.protection[PROT_MAGIC] += RI_TPROTMAGE;
};

func void unequip_itri_prot_total_01()
{
	self.protection[PROT_EDGE] -= RI_TPROTEDGE;
	self.protection[PROT_BLUNT] -= RI_TPROTEDGE;
	self.protection[PROT_POINT] -= RI_TPROTPOINT;
	self.protection[PROT_FIRE] -= RI_TPROTFIRE;
	self.protection[PROT_MAGIC] -= RI_TPROTMAGE;
};


instance ITRI_PROT_TOTAL_02(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_RI_PROTTOTAL02;
	visual = "ItRi_Prot_Total_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_prot_total_02;
	on_unequip = unequip_itri_prot_total_02;
	description = "Pierœcieñ Nietykalnoœci";
	text[1] = NAME_PROT_MAGIC;
	count[1] = RI_TPROTMAGE02;
	text[2] = NAME_PROT_FIRE;
	count[2] = RI_TPROTFIRE02;
	text[3] = NAME_PROT_POINT;
	count[3] = RI_TPROTPOINT02;
	text[4] = NAME_PROT_EDGE;
	count[4] = RI_TPROTEDGE02;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_prot_total_02()
{
	self.protection[PROT_EDGE] += RI_TPROTEDGE02;
	self.protection[PROT_BLUNT] += RI_TPROTEDGE02;
	self.protection[PROT_POINT] += RI_TPROTPOINT02;
	self.protection[PROT_FIRE] += RI_TPROTFIRE02;
	self.protection[PROT_MAGIC] += RI_TPROTMAGE02;
};

func void unequip_itri_prot_total_02()
{
	self.protection[PROT_EDGE] -= RI_TPROTEDGE02;
	self.protection[PROT_BLUNT] -= RI_TPROTEDGE02;
	self.protection[PROT_POINT] -= RI_TPROTPOINT02;
	self.protection[PROT_FIRE] -= RI_TPROTFIRE02;
	self.protection[PROT_MAGIC] -= RI_TPROTMAGE02;
};


instance ITRI_DEX_01(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_RI_DEX;
	visual = "ItRi_Dex_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_dex_01;
	on_unequip = unequip_itri_dex_01;
	description = "Pierœcieñ Zdolnoœci";
	text[2] = NAME_BONUS_DEX;
	count[2] = RI_DEX;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_dex_01()
{
	b_raiseattribute(self,ATR_DEXTERITY,RI_DEX,FALSE,TRUE);
};

func void unequip_itri_dex_01()
{
	b_removeitemattribute(self,ATR_DEXTERITY,RI_DEX);
};


instance ITRI_DEX_02(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_RI_DEX02;
	visual = "ItRi_Dex_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_dex_02;
	on_unequip = unequip_itri_dex_02;
	description = "Pierœcieñ Zrêcznoœci";
	text[2] = NAME_BONUS_DEX;
	count[2] = RI_DEX02;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_dex_02()
{
	b_raiseattribute(self,ATR_DEXTERITY,RI_DEX02,FALSE,TRUE);
};

func void unequip_itri_dex_02()
{
	b_removeitemattribute(self,ATR_DEXTERITY,RI_DEX02);
};


instance ITRI_HP_01(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_RI_HP;
	visual = "ItRi_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_hp_01;
	on_unequip = unequip_itri_hp_01;
	description = "Pierœcieñ ¯ycia";
	text[2] = NAME_BONUS_HP;
	count[2] = RI_HP;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_hp_01()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + RI_HP;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + RI_HP;
};

func void unequip_itri_hp_01()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - RI_HP;
	if(self.attribute[ATR_HITPOINTS] > (RI_HP + 1))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - RI_HP;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};


instance ITRI_HP_02(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_RI_HP02;
	visual = "ItRi_Hp_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_hp_02;
	on_unequip = unequip_itri_hp_02;
	description = "Pierœcieñ ¯ywotnoœci";
	text[2] = NAME_BONUS_HP;
	count[2] = RI_HP02;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_hp_02()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + RI_HP02;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + RI_HP02;
};

func void unequip_itri_hp_02()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - RI_HP02;
	if(self.attribute[ATR_HITPOINTS] > (RI_HP02 + 1))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - RI_HP02;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};


instance ITRI_STR_01(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_RI_STRG;
	visual = "ItRi_Str_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_str_01;
	on_unequip = unequip_itri_str_01;
	description = "Pierœcieñ Mocy";
	text[2] = NAME_BONUS_STR;
	count[2] = RI_STRG;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_str_01()
{
	b_raiseattribute(self,ATR_STRENGTH,RI_STRG,FALSE,TRUE);
};

func void unequip_itri_str_01()
{
	b_removeitemattribute(self,ATR_STRENGTH,RI_STRG);
};


instance ITRI_STR_02(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_RI_STRG02;
	visual = "ItRi_Str_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_str_02;
	on_unequip = unequip_itri_str_02;
	description = "Pierœcieñ Si³y";
	text[2] = NAME_BONUS_STR;
	count[2] = RI_STRG02;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_str_02()
{
	b_raiseattribute(self,ATR_STRENGTH,RI_STRG02,FALSE,TRUE);
};

func void unequip_itri_str_02()
{
	b_removeitemattribute(self,ATR_STRENGTH,RI_STRG02);
};


instance ITRI_MANA_01(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_RI_MANA;
	visual = "ItRi_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_mana_01;
	on_unequip = unequip_itri_mana_01;
	description = "Pierœcieñ Magii";
	text[2] = NAME_BONUS_MANA;
	count[2] = RI_MANA;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_mana_01()
{
	b_raiseattribute(self,ATR_MANA_MAX,RI_MANA,FALSE,TRUE);
};

func void unequip_itri_mana_01()
{
	b_removeitemattribute(self,ATR_MANA_MAX,RI_MANA);
	if(self.attribute[ATR_MANA] >= RI_MANA)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - RI_MANA;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};
};


instance ITRI_MANA_02(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_RI_MANA02;
	visual = "ItRi_Mana_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_mana_02;
	on_unequip = unequip_itri_mana_02;
	description = "Pierœcieñ Gwiezdnej Mocy";
	text[2] = NAME_BONUS_MANA;
	count[2] = RI_MANA02;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_mana_02()
{
	b_raiseattribute(self,ATR_MANA_MAX,RI_MANA02,FALSE,TRUE);
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + RI_MANA02;
};

func void unequip_itri_mana_02()
{
	b_removeitemattribute(self,ATR_MANA_MAX,RI_MANA02);
	if(self.attribute[ATR_MANA] >= RI_MANA02)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - RI_MANA02;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};
};


instance ITRI_HP_MANA_01(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_RI_HPMANA;
	visual = "ItRi_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_hp_mana_01;
	on_unequip = unequip_itri_hp_mana_01;
	description = "Pierœcieñ Oœwiecenia";
	text[2] = NAME_BONUS_MANA;
	count[2] = RI_HPMANA_HP;
	text[3] = NAME_BONUS_HP;
	count[3] = RI_HPMANA_MANA;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_hp_mana_01()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + RI_HPMANA_MANA;
	b_raiseattribute(self,ATR_MANA_MAX,RI_HPMANA_MANA,FALSE,TRUE);
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + RI_HPMANA_HP;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + RI_HPMANA_HP;
};

func void unequip_itri_hp_mana_01()
{
	b_removeitemattribute(self,ATR_MANA_MAX,RI_HPMANA_MANA);
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - RI_HPMANA_HP;
	if(self.attribute[ATR_HITPOINTS] > (RI_HPMANA_HP + 1))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - RI_HPMANA_HP;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
	if(self.attribute[ATR_MANA] >= RI_HPMANA_HP)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - RI_HPMANA_HP;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};
};


instance ITRI_DEX_STRG_01(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_RI_DEXSTRG;
	visual = "ItRi_Dex_Strg_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_dex_strg_01;
	on_unequip = unequip_itri_dex_strg_01;
	description = "Pierœcieñ Kondycji";
	text[2] = NAME_BONUS_STR;
	count[2] = 4;
	text[3] = NAME_BONUS_DEX;
	count[3] = 4;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_dex_strg_01()
{
	b_raiseattribute(self,ATR_STRENGTH,RI_DEXSTRG_STRG,FALSE,TRUE);
	b_raiseattribute(self,ATR_DEXTERITY,RI_DEXSTRG_DEX,FALSE,TRUE);
};

func void unequip_itri_dex_strg_01()
{
	b_removeitemattribute(self,ATR_STRENGTH,RI_DEXSTRG_STRG);
	b_removeitemattribute(self,ATR_DEXTERITY,RI_DEXSTRG_DEX);
};

