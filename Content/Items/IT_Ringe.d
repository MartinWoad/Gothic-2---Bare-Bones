
const int Value_Ri_ProtFire = 200;
const int Ri_ProtFire = 2;
const int Value_Ri_ProtEdge = 200;
const int Ri_ProtEdge = 1;
const int Value_Ri_ProtMage = 200;
const int Ri_ProtMage = 2;
const int Value_Ri_ProtPoint = 200;
const int Ri_ProtPoint = 1;
const int Value_Ri_ProtFire02 = 500;
const int Ri_ProtFire02 = 4;
const int Value_Ri_ProtEdge02 = 500;
const int Ri_ProtEdge02 = 2;
const int Value_Ri_ProtMage02 = 500;
const int Ri_ProtMage02 = 4;
const int Value_Ri_ProtPoint02 = 500;
const int Ri_ProtPoint02 = 2;
const int Value_Ri_ProtTotal = 500;
const int Ri_TProtFire = 1;
const int Ri_TProtEdge = 1;
const int Ri_TProtMage = 1;
const int Ri_TProtPoint = 1;
const int Value_Ri_ProtTotal02 = 1000;
const int Ri_TProtFire02 = 2;
const int Ri_TProtEdge02 = 1;
const int Ri_TProtMage02 = 2;
const int Ri_TProtPoint02 = 1;
const int Value_Ri_Dex = 500;
const int Ri_Dex = 1;
const int Value_Ri_Dex02 = 1000;
const int Ri_Dex02 = 2;
const int Value_Ri_Mana = 500;
const int Ri_Mana = 2;
const int Value_Ri_Mana02 = 1000;
const int Ri_Mana02 = 4;
const int Value_Ri_Strg = 500;
const int Ri_Strg = 1;
const int Value_Ri_Strg02 = 1000;
const int Ri_Strg02 = 2;
const int Value_Ri_Hp = 500;
const int Ri_Hp = 5;
const int Value_Ri_Hp02 = 1000;
const int Ri_Hp02 = 10;
const int Value_Ri_HpMana = 1000;
const int Ri_HpMana_Hp = 5;
const int Ri_HpMana_Mana = 2;
const int Value_Ri_DexStrg = 1000;
const int Ri_DexStrg_Dex = 1;
const int Ri_DexStrg_Strg = 1;

instance ItRi_Prot_Fire_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_ProtFire;
	visual = "ItRi_Prot_Fire_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Fire_01;
	on_unequip = UnEquip_ItRi_Prot_Fire_01;
	description = "Pierœcieñ Ognia";
	text[2] = NAME_Prot_Fire;
	count[2] = Ri_ProtFire;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Prot_Fire_01()
{
	self.protection[PROT_FIRE] += Ri_ProtFire;
};

func void UnEquip_ItRi_Prot_Fire_01()
{
	self.protection[PROT_FIRE] -= Ri_ProtFire;
};


instance ItRi_Prot_Fire_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_ProtFire02;
	visual = "ItRi_Prot_Fire_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Fire_02;
	on_unequip = UnEquip_ItRi_Prot_Fire_02;
	description = "Pierœcieñ Wiecznego Ognia";
	text[2] = NAME_Prot_Fire;
	count[2] = Ri_ProtFire02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Prot_Fire_02()
{
	self.protection[PROT_FIRE] += Ri_ProtFire02;
};

func void UnEquip_ItRi_Prot_Fire_02()
{
	self.protection[PROT_FIRE] -= Ri_ProtFire02;
};


instance ItRi_Prot_Point_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_ProtPoint;
	visual = "ItRi_Prot_Point_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Point_01;
	on_unequip = UnEquip_ItRi_Prot_Point_01;
	description = "Pierœcieñ Dêbowej Skóry";
	text[2] = NAME_Prot_Edge;
	count[2] = Ri_ProtPoint;
	text[3] = NAME_Prot_Point;
	count[3] = Ri_ProtPoint;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Prot_Point_01()
{
	self.protection[PROT_POINT] += Ri_ProtPoint;
	self.protection[PROT_EDGE] += Ri_ProtPoint;
};

func void UnEquip_ItRi_Prot_Point_01()
{
	self.protection[PROT_POINT] -= Ri_ProtPoint;
	self.protection[PROT_EDGE] -= Ri_ProtPoint;
};


instance ItRi_Prot_Point_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_ProtPoint02;
	visual = "ItRi_Prot_Point_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Point_02;
	on_unequip = UnEquip_ItRi_Prot_Point_02;
	description = "Pierœcieñ Kamiennej Skóry";
	text[2] = NAME_Prot_Edge;
	count[2] = Ri_ProtPoint;
	text[3] = NAME_Prot_Point;
	count[3] = Ri_ProtPoint02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Prot_Point_02()
{
	self.protection[PROT_POINT] += Ri_ProtPoint02;
	self.protection[PROT_EDGE] += Ri_ProtPoint;
};

func void UnEquip_ItRi_Prot_Point_02()
{
	self.protection[PROT_POINT] -= Ri_ProtPoint02;
	self.protection[PROT_EDGE] -= Ri_ProtPoint;
};


instance ItRi_Prot_Edge_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_ProtEdge;
	visual = "ItRi_Prot_Edge_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Edge_01;
	on_unequip = UnEquip_ItRi_Prot_Edge_01;
	description = "Pierœcieñ ¯elaznej Skóry";
	text[2] = NAME_Prot_Edge;
	count[2] = Ri_ProtEdge;
	text[3] = NAME_Prot_Blunt;
	count[3] = Ri_ProtEdge;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Prot_Edge_01()
{
	self.protection[PROT_EDGE] += Ri_ProtEdge;
	self.protection[PROT_BLUNT] += Ri_ProtEdge;
};

func void UnEquip_ItRi_Prot_Edge_01()
{
	self.protection[PROT_EDGE] -= Ri_ProtEdge;
	self.protection[PROT_BLUNT] -= Ri_ProtEdge;
};


instance ItRi_Prot_Edge_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_ProtEdge02;
	visual = "ItRi_Prot_Edge_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Edge_02;
	on_unequip = UnEquip_ItRi_Prot_Edge_02;
	description = "Pierœcieñ Stalowej Skóry";
	text[2] = NAME_Prot_Edge;
	count[2] = Ri_ProtEdge02;
	text[3] = NAME_Prot_Blunt;
	count[3] = Ri_ProtEdge;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Prot_Edge_02()
{
	self.protection[PROT_EDGE] += Ri_ProtEdge02;
	self.protection[PROT_BLUNT] += Ri_ProtEdge;
};

func void UnEquip_ItRi_Prot_Edge_02()
{
	self.protection[PROT_EDGE] -= Ri_ProtEdge02;
	self.protection[PROT_BLUNT] -= Ri_ProtEdge;
};


instance ItRi_Prot_Mage_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_ProtMage;
	visual = "ItRi_Prot_Mage_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Mage_01;
	on_unequip = UnEquip_ItRi_Prot_Mage_01;
	description = "Pierœcieñ Wody";
	text[2] = NAME_Prot_Magic;
	count[2] = Ri_ProtMage;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Prot_Mage_01()
{
	self.protection[PROT_MAGIC] += Ri_ProtMage;
};

func void UnEquip_ItRi_Prot_Mage_01()
{
	self.protection[PROT_MAGIC] -= Ri_ProtMage;
};


instance ItRi_Prot_Mage_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_ProtMage02;
	visual = "ItRi_Prot_Mage_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Mage_02;
	on_unequip = UnEquip_ItRi_Prot_Mage_02;
	description = "Pierœcieñ Wzburzonej Wody";
	text[2] = NAME_Prot_Magic;
	count[2] = Ri_ProtMage02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Prot_Mage_02()
{
	self.protection[PROT_MAGIC] += Ri_ProtMage02;
};

func void UnEquip_ItRi_Prot_Mage_02()
{
	self.protection[PROT_MAGIC] -= Ri_ProtMage02;
};


instance ItRi_Prot_Total_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_ProtTotal;
	visual = "ItRi_Prot_Total_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Total_01;
	on_unequip = UnEquip_ItRi_Prot_Total_01;
	description = "Pierœcieñ Zwyciêstw";
	text[1] = NAME_Prot_Magic;
	count[1] = Ri_TProtMage;
	text[2] = NAME_Prot_Fire;
	count[2] = Ri_TProtFire;
	text[3] = NAME_Prot_Weapon;
	count[3] = Ri_TProtPoint;
	//text[4] = NAME_Prot_Edge;
	//count[4] = Ri_TProtEdge;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Prot_Total_01()
{
	self.protection[PROT_EDGE] += Ri_TProtEdge;
	self.protection[PROT_BLUNT] += Ri_TProtEdge;
	self.protection[PROT_POINT] += Ri_TProtPoint;
	self.protection[PROT_FIRE] += Ri_TProtFire;
	self.protection[PROT_MAGIC] += Ri_TProtMage;
};

func void UnEquip_ItRi_Prot_Total_01()
{
	self.protection[PROT_EDGE] -= Ri_TProtEdge;
	self.protection[PROT_BLUNT] -= Ri_TProtEdge;
	self.protection[PROT_POINT] -= Ri_TProtPoint;
	self.protection[PROT_FIRE] -= Ri_TProtFire;
	self.protection[PROT_MAGIC] -= Ri_TProtMage;
};


instance ItRi_Prot_Total_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_ProtTotal02;
	visual = "ItRi_Prot_Total_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Total_02;
	on_unequip = UnEquip_ItRi_Prot_Total_02;
	description = "Pierœcieñ Wielkich Zwyciêstw";
	text[1] = NAME_Prot_Magic;
	count[1] = Ri_TProtMage02;
	text[2] = NAME_Prot_Fire;
	count[2] = Ri_TProtFire02;
	text[3] = NAME_Prot_Weapon;
	count[3] = Ri_TProtPoint02;
	//text[4] = NAME_Prot_Edge;
	//count[4] = Ri_TProtEdge02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Prot_Total_02()
{
	self.protection[PROT_EDGE] += Ri_TProtEdge02;
	self.protection[PROT_BLUNT] += Ri_TProtEdge02;
	self.protection[PROT_POINT] += Ri_TProtPoint02;
	self.protection[PROT_FIRE] += Ri_TProtFire02;
	self.protection[PROT_MAGIC] += Ri_TProtMage02;
};

func void UnEquip_ItRi_Prot_Total_02()
{
	self.protection[PROT_EDGE] -= Ri_TProtEdge02;
	self.protection[PROT_BLUNT] -= Ri_TProtEdge02;
	self.protection[PROT_POINT] -= Ri_TProtPoint02;
	self.protection[PROT_FIRE] -= Ri_TProtFire02;
	self.protection[PROT_MAGIC] -= Ri_TProtMage02;
};


instance ItRi_Dex_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_Dex;
	visual = "ItRi_Dex_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Dex_01;
	on_unequip = UnEquip_ItRi_Dex_01;
	description = "Pierœcieñ Zrêcznoœci";
	text[2] = NAME_Bonus_Dex;
	count[2] = Ri_Dex;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Dex_01()
{
	B_RaiseAttribute(self,ATR_DEXTERITY,Ri_Dex,FALSE,TRUE);
};

func void UnEquip_ItRi_Dex_01()
{
	b_removeitemattribute(self,ATR_DEXTERITY,Ri_Dex);
};


instance ItRi_Dex_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_Dex02;
	visual = "ItRi_Dex_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Dex_02;
	on_unequip = UnEquip_ItRi_Dex_02;
	description = "Pierœcieñ Wielkiej Zrêcznoœci";
	text[2] = NAME_Bonus_Dex;
	count[2] = Ri_Dex02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Dex_02()
{
	B_RaiseAttribute(self,ATR_DEXTERITY,Ri_Dex02,FALSE,TRUE);
};

func void UnEquip_ItRi_Dex_02()
{
	b_removeitemattribute(self,ATR_DEXTERITY,Ri_Dex02);
};


instance ItRi_HP_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_Hp;
	visual = "ItRi_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Hp_01;
	on_unequip = UnEquip_ItRi_Hp_01;
	description = "Pierœcieñ ¯ycia";
	text[2] = NAME_Bonus_HP;
	count[2] = Ri_Hp;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Hp_01()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Ri_Hp;
	//self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Ri_Hp;
};

func void UnEquip_ItRi_Hp_01()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - Ri_Hp;
	/*
	if(self.attribute[ATR_HITPOINTS] > (Ri_Hp + 1))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - Ri_Hp;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};*/
};


instance ItRi_Hp_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_Hp02;
	visual = "ItRi_Hp_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Hp_02;
	on_unequip = UnEquip_ItRi_Hp_02;
	description = "Pierœcieñ Pe³ni ¯ycia";
	text[2] = NAME_Bonus_HP;
	count[2] = Ri_Hp02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Hp_02()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Ri_Hp02;
	//self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Ri_Hp02;
};

func void UnEquip_ItRi_Hp_02()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - Ri_Hp02;
	/*
	if(self.attribute[ATR_HITPOINTS] > (Ri_Hp02 + 1))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - Ri_Hp02;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};*/
};


instance ItRi_Str_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_Strg;
	visual = "ItRi_Str_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Str_01;
	on_unequip = UnEquip_ItRi_Str_01;
	description = "Pierœcieñ Si³y";
	text[2] = NAME_Bonus_Str;
	count[2] = Ri_Strg;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Str_01()
{
	B_RaiseAttribute(self,ATR_STRENGTH,Ri_Strg,FALSE,TRUE);
};

func void UnEquip_ItRi_Str_01()
{
	b_removeitemattribute(self,ATR_STRENGTH,Ri_Strg);
};


instance ItRi_Str_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_Strg02;
	visual = "ItRi_Str_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Str_02;
	on_unequip = UnEquip_ItRi_Str_02;
	description = "Pierœcieñ Wielkiej Si³y";
	text[2] = NAME_Bonus_Str;
	count[2] = Ri_Strg02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Str_02()
{
	B_RaiseAttribute(self,ATR_STRENGTH,Ri_Strg02,FALSE,TRUE);
};

func void UnEquip_ItRi_Str_02()
{
	b_removeitemattribute(self,ATR_STRENGTH,Ri_Strg02);
};


instance ItRi_Mana_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_Mana;
	visual = "ItRi_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Mana_01;
	on_unequip = UnEquip_ItRi_Mana_01;
	description = "Pierœcieñ Mocy";
	text[2] = NAME_Bonus_Mana;
	count[2] = Ri_Mana;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Mana_01()
{
	B_RaiseAttribute(self,ATR_MANA_MAX,Ri_Mana,FALSE,TRUE);
};

func void UnEquip_ItRi_Mana_01()
{
	b_removeitemattribute(self,ATR_MANA_MAX,Ri_Mana);
	/*
	if(self.attribute[ATR_MANA] >= Ri_Mana)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - Ri_Mana;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};*/
};


instance ItRi_Mana_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_Mana02;
	visual = "ItRi_Mana_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Mana_02;
	on_unequip = UnEquip_ItRi_Mana_02;
	description = "Pierœcieñ Gwiezdnej Mocy";
	text[2] = NAME_Bonus_Mana;
	count[2] = Ri_Mana02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Mana_02()
{
	B_RaiseAttribute(self,ATR_MANA_MAX,Ri_Mana02,FALSE,TRUE);
	//self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + Ri_Mana02;
};

func void UnEquip_ItRi_Mana_02()
{
	b_removeitemattribute(self,ATR_MANA_MAX,Ri_Mana02);
	/*
	if(self.attribute[ATR_MANA] >= Ri_Mana02)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - Ri_Mana02;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};*/
};


instance ItRi_Hp_Mana_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_HpMana;
	visual = "ItRi_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Hp_Mana_01;
	on_unequip = UnEquip_ItRi_Hp_Mana_01;
	description = "Pierœcieñ Oœwiecenia";
	text[2] = NAME_Bonus_Mana;
	count[2] = Ri_HpMana_Hp;
	text[3] = NAME_Bonus_HP;
	count[3] = Ri_HpMana_Mana;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Hp_Mana_01()
{
	//self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + Ri_HpMana_Mana;
	B_RaiseAttribute(self,ATR_MANA_MAX,Ri_HpMana_Mana,FALSE,TRUE);
	//self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Ri_HpMana_Hp;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Ri_HpMana_Hp;
};

func void UnEquip_ItRi_Hp_Mana_01()
{
	b_removeitemattribute(self,ATR_MANA_MAX,Ri_HpMana_Mana);
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - Ri_HpMana_Hp;
	/*
	if(self.attribute[ATR_HITPOINTS] > (Ri_HpMana_Hp + 1))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - Ri_HpMana_Hp;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
	if(self.attribute[ATR_MANA] >= Ri_HpMana_Hp)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - Ri_HpMana_Hp;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};*/
};


instance ItRi_Dex_Strg_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_DexStrg;
	visual = "ItRi_Dex_Strg_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Dex_Strg_01;
	on_unequip = UnEquip_ItRi_Dex_Strg_01;
	description = "Pierœcieñ Sprawnoœci";
	text[2] = NAME_Bonus_Str;
	count[2] = 4;
	text[3] = NAME_Bonus_Dex;
	count[3] = 4;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Dex_Strg_01()
{
	B_RaiseAttribute(self,ATR_STRENGTH,Ri_DexStrg_Strg,FALSE,TRUE);
	B_RaiseAttribute(self,ATR_DEXTERITY,Ri_DexStrg_Dex,FALSE,TRUE);
};

func void UnEquip_ItRi_Dex_Strg_01()
{
	b_removeitemattribute(self,ATR_STRENGTH,Ri_DexStrg_Strg);
	b_removeitemattribute(self,ATR_DEXTERITY,Ri_DexStrg_Dex);
};
