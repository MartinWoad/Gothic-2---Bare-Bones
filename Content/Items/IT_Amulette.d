
const int Value_Am_ProtFire = 250;
const int Am_ProtFire = 6;
const int Value_Am_ProtEdge = 250;
const int Am_ProtEdge = 3;
const int Value_Am_ProtMage = 250;
const int Am_ProtMage = 6;
const int Value_Am_ProtPoint = 250;
const int Am_ProtPoint = 3;
const int Value_Am_ProtTotal = 750;
const int Am_TProtFire = 3;
const int AM_TProtEdge = 3;
const int Am_TProtMage = 3;
const int Am_TProtPoint = 3;
const int Value_Am_Dex = 300;
const int Am_Dex = 3;
const int Value_Am_Mana = 300;
const int Am_Mana = 6;
const int Value_Am_Strg = 300;
const int Am_Strg = 3;
const int Value_Am_Hp = 300;
const int Am_Hp = 15;
const int Value_Am_HpMana = 500;
const int Am_HpMana_Hp = 10;
const int Am_HpMana_Mana = 4;
const int Value_Am_DexStrg = 500;
const int Am_DexStrg_Dex = 2;
const int Am_DexStrg_Strg = 2;

instance ItAm_Prot_Fire_01(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_Am_ProtFire;
	visual = "ItAm_Prot_Fire_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Prot_Fire_01;
	on_unequip = UnEquip_ItAm_Prot_Fire_01;
	description = "Amulet Ognia";
	text[2] = NAME_Prot_Fire;
	count[2] = Am_ProtFire;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Equip_ItAm_Prot_Fire_01()
{
	self.protection[PROT_FIRE] += Am_ProtFire;
};

func void UnEquip_ItAm_Prot_Fire_01()
{
	self.protection[PROT_FIRE] -= Am_ProtFire;
};


instance ItAm_Prot_Edge_01(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_Am_ProtEdge;
	visual = "ItAm_Prot_Edge_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Prot_Edge_01;
	on_unequip = UnEquip_ItAm_Prot_Edge_01;
	description = "Amulet Stalowej Sk�ry";
	text[2] = NAME_Prot_Edge;
	count[2] = Am_ProtEdge;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Equip_ItAm_Prot_Edge_01()
{
	self.protection[PROT_EDGE] += Am_ProtEdge;
	self.protection[PROT_BLUNT] += Am_ProtEdge;
};

func void UnEquip_ItAm_Prot_Edge_01()
{
	self.protection[PROT_EDGE] -= Am_ProtEdge;
	self.protection[PROT_BLUNT] -= Am_ProtEdge;
};


instance ItAm_Prot_Point_01(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_Am_ProtPoint;
	visual = "ItAm_Prot_Point_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Prot_Point_01;
	on_unequip = UnEquip_ItAm_Prot_Point_01;
	description = "Amulet D�bowej Sk�ry";
	text[2] = NAME_Prot_Point;
	count[2] = Am_ProtPoint;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Equip_ItAm_Prot_Point_01()
{
	self.protection[PROT_POINT] += Am_ProtPoint;
};

func void UnEquip_ItAm_Prot_Point_01()
{
	self.protection[PROT_POINT] -= Am_ProtPoint;
};


instance ItAm_Prot_Mage_01(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_Am_ProtMage;
	visual = "ItAm_Prot_Mage_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Prot_Mage_01;
	on_unequip = UnEquip_ItAm_Prot_Mage_01;
	description = "Amulet Duchowej Si�y";
	text[2] = NAME_Prot_Magic;
	count[2] = Am_ProtMage;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Equip_ItAm_Prot_Mage_01()
{
	self.protection[PROT_MAGIC] += Am_ProtMage;
};

func void UnEquip_ItAm_Prot_Mage_01()
{
	self.protection[PROT_MAGIC] -= Am_ProtMage;
};


instance ItAm_Prot_Total_01(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_Am_ProtTotal;
	visual = "ItAm_Prot_Total_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_Value_Am_ProtTotal;
	on_unequip = UnEquip_Value_Am_ProtTotal;
	description = "Amulet Magicznego Pancerza";
	text[1] = NAME_Prot_Fire;
	count[1] = Am_TProtFire;
	text[2] = NAME_Prot_Magic;
	count[2] = Am_TProtMage;
	text[3] = NAME_Prot_Point;
	count[3] = Am_TProtPoint;
	text[4] = NAME_Prot_Edge;
	count[4] = AM_TProtEdge;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Equip_Value_Am_ProtTotal()
{
	self.protection[PROT_EDGE] += AM_TProtEdge;
	self.protection[PROT_BLUNT] += AM_TProtEdge;
	self.protection[PROT_POINT] += Am_TProtPoint;
	self.protection[PROT_FIRE] += Am_TProtFire;
	self.protection[PROT_MAGIC] += Am_TProtMage;
};

func void UnEquip_Value_Am_ProtTotal()
{
	self.protection[PROT_EDGE] -= AM_TProtEdge;
	self.protection[PROT_BLUNT] -= AM_TProtEdge;
	self.protection[PROT_POINT] -= Am_TProtPoint;
	self.protection[PROT_FIRE] -= Am_TProtFire;
	self.protection[PROT_MAGIC] -= Am_TProtMage;
};


instance ItAm_Dex_01(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_Am_Dex;
	visual = "ItAm_Dex_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Dex_01;
	on_unequip = UnEquip_ItAm_Dex_01;
	description = "Amulet Zwinno�ci";
	text[2] = NAME_Bonus_Dex;
	count[2] = Am_Dex;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Equip_ItAm_Dex_01()
{
	B_RaiseAttribute(self,ATR_DEXTERITY,Am_Dex,FALSE,TRUE);
};

func void UnEquip_ItAm_Dex_01()
{
	b_removeitemattribute(self,ATR_DEXTERITY,Am_Dex);
};


instance ItAm_Strg_01(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_Am_Strg;
	visual = "ItAm_Strg_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Strg_01;
	on_unequip = UnEquip_ItAm_Strg_01;
	description = "Amulet Si�y";
	text[2] = NAME_Bonus_Str;
	count[2] = Am_Strg;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Equip_ItAm_Strg_01()
{
	B_RaiseAttribute(self,ATR_STRENGTH,Am_Strg,FALSE,TRUE);
};

func void UnEquip_ItAm_Strg_01()
{
	b_removeitemattribute(self,ATR_STRENGTH,Am_Strg);
};


instance ItAm_Hp_01(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_Am_Hp;
	visual = "ItAm_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Hp_01;
	on_unequip = UnEquip_ItAm_Hp_01;
	description = "Amulet �ycia";
	text[2] = NAME_Bonus_HP;
	count[2] = Am_Hp;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Equip_ItAm_Hp_01()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Am_Hp;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Am_Hp;
};

func void UnEquip_ItAm_Hp_01()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - Am_Hp;
	if(self.attribute[ATR_HITPOINTS] > (Am_Hp + 2))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - Am_Hp;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};


instance ItAm_Mana_01(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_Am_Mana;
	visual = "ItAm_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Mana_01;
	on_unequip = UnEquip_ItAm_Mana_01;
	description = "Amulet Magii";
	text[2] = NAME_Bonus_Mana;
	count[2] = 10;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Equip_ItAm_Mana_01()
{
	B_RaiseAttribute(self,ATR_MANA_MAX,Am_Mana,FALSE,TRUE);
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + Am_Mana;
};

func void UnEquip_ItAm_Mana_01()
{
	b_removeitemattribute(self,ATR_MANA_MAX,Am_Mana);
	if(self.attribute[ATR_MANA] > Am_Mana)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - Am_Mana;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};
};


instance ItAm_Dex_Strg_01(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_Am_DexStrg;
	visual = "ItAm_Dex_Strg_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Dex_Strg_01;
	on_unequip = UnEquip_ItAm_Dex_Strg_01;
	description = "Amulet Pot�gi";
	text[2] = NAME_Bonus_Dex;
	count[2] = Am_DexStrg_Dex;
	text[3] = NAME_Bonus_Str;
	count[3] = Am_DexStrg_Strg;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Equip_ItAm_Dex_Strg_01()
{
	B_RaiseAttribute(self,ATR_STRENGTH,Am_DexStrg_Strg,FALSE,TRUE);
	B_RaiseAttribute(self,ATR_DEXTERITY,Am_DexStrg_Dex,FALSE,TRUE);
};

func void UnEquip_ItAm_Dex_Strg_01()
{
	b_removeitemattribute(self,ATR_STRENGTH,Am_DexStrg_Strg);
	b_removeitemattribute(self,ATR_DEXTERITY,Am_DexStrg_Dex);
};


instance ItAm_Hp_Mana_01(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_Am_HpMana;
	visual = "ItAm_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Hp_Mana_01;
	on_unequip = UnEquip_ItAm_Hp_Mana_01;
	description = "Amulet O�wiecenia";
	text[2] = NAME_Bonus_HP;
	count[2] = Am_HpMana_Hp;
	text[3] = NAME_Bonus_Mana;
	count[3] = Am_HpMana_Mana;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Equip_ItAm_Hp_Mana_01()
{
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Am_HpMana_Hp;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Am_HpMana_Hp;
	B_RaiseAttribute(self,ATR_MANA_MAX,Am_HpMana_Mana,FALSE,TRUE);
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + Am_HpMana_Mana;
};

func void UnEquip_ItAm_Hp_Mana_01()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - Am_HpMana_Mana;
	b_removeitemattribute(self,ATR_MANA_MAX,Am_HpMana_Mana);
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - Am_HpMana_Hp;
	if(self.attribute[ATR_HITPOINTS] > (Am_HpMana_Hp + 1))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - Am_HpMana_Hp;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
	if(self.attribute[ATR_MANA] >= Am_HpMana_Hp)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - Am_HpMana_Hp;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 0;
	};
};

