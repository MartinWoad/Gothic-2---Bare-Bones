
const int Value_Apple = 8;
const int HP_Apple = 3;
const int Value_Cheese = 30;
const int HP_Cheese = 15;
const int Value_Bacon = 50;
const int HP_Bacon = 20;
const int Value_Bread = 20;
const int HP_Bread = 10;
const int Value_Fish = 15;
const int HP_Fish = 5;
const int Value_Rawmeat = 3;
const int HP_RawMeat = 3;
const int Value_Meat = 3;
const int HP_Meat = 6;
const int Value_Stew = 8;
const int HP_Stew = 20;
const int Value_FishSoup = 20;
const int HP_FishSoup = 10;
const int Value_Sausage = 30;
const int HP_Sausage = 12;
const int Value_Honey = 30;
const int HP_Honey = 12;
const int Value_Water = 10;
const int HP_Water = 8;
const int Value_Beer = 20;
const int HP_Beer = 3;
const int Mana_Beer = 1;
const int Value_Booze = 15;
const int HP_Booze = 4;
const int Mana_Booze = 1;
const int Value_Wine = 20;
const int HP_Wine = 2;
const int Mana_Wine = 1;
const int Value_Milk = 15;
const int HP_Milk = 5;
const int Mana_Milk = 1;

const int Toxicity_Honey = -3;
const int Toxicity_Water = -2;
const int Toxicity_Beer = 1;
const int Toxicity_Booze = 3;
const int Toxicity_Milk = -2;
const int Toxicity_Wine = 2;

const int Toxicity_RawMeat = 3;

const int SatietyLevelMax = 100;

const int HungerPercent = -1;
const int SleepHungerMultiplier = 2;
const int HungerTime = 100000; // 1 min = 60s = 60000ms

instance SatietyBar (GothicBar)
{
    //x = Print_Screen[PS_X] / 2;
		x = 100;
    y = Print_Screen[PS_Y] - 40;
    barTop = MEMINT_SwitchG1G2(2, 3);
    barLeft = 7;
    width = 180;
    height = 20;
    backTex = "Bar_Back.tga";
    barTex = "Bar_Food.tga";
		//barTex = "Bar_Misc.tga";
    value = 0;
    valueMax = SatietyLevelMax;
};

func void UpdateSatietyBar()
{
	Bar_SetValue(satietyBarHandle, satiety);
};

func void ChangeSatiety(var C_NPC slf, var int percent)
{
	if(Npc_IsPlayer(slf))
	{
		if(percent > 0)
		{
			if(satiety + percent < SatietyLevelMax)
			{
				satiety = satiety + percent;
			}
			else
			{
				satiety = SatietyLevelMax;
			};
		}
		else if (percent < 0)
		{
			if(satiety + percent > 0)
			{
				satiety = satiety + percent;
			}
			else if(satiety + percent == 0)
			{
				satiety = 0;
			}
			else if(satiety + percent < 0 && satiety >= 0)
			{
				AI_Output(slf,slf,"DIA_Thekla_Hunger_15_00");

				satiety = 0;
				if(self.attribute[ATR_HITPOINTS] > percent)
				{
					self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - percent;
				}
				else
				{
					self.attribute[ATR_HITPOINTS] = 1;
				};
			}
			else
			{
				satiety = 0;
				if(self.attribute[ATR_HITPOINTS] > percent)
				{
					self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - percent;
				}
				else
				{
					self.attribute[ATR_HITPOINTS] = 1;
				};
			};
		};
		UpdateSatietyBar();
	};
};

func void Hunger()
{
	var C_NPC her;
	her = Hlp_GetNpc(PC_Hero);
	ChangeSatiety(her, HungerPercent);
};

func void CheckSatiety()
{

};

instance ItFo_Apple(C_Item)
{
	name = "Jab³ko";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Apple;
	visual = "ItFo_Apple.3DS";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = Use_Apple;
	description = name;
	text[1] = NAME_Bonus_Satiety;
	count[1] = HP_Apple;
	//text[3] = "Œwie¿e jab³ko,";
	//text[4] = "soczyste i po¿ywne.";
	text[5] = NAME_Value;
	count[5] = Value_Apple;
};


func void Use_Apple()
{
	//Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Apple);
	ChangeSatiety(self, HP_Apple);
	if(Npc_IsPlayer(self))
	{
		Apple_Bonus = Apple_Bonus + 1;
		if(Apple_Bonus == 7)
		{
			Print(PRINT_Eat1);
		};
		if(Apple_Bonus == 15)
		{
			Print(PRINT_Eat2);
		};
		if(Apple_Bonus == 25)
		{
			Print(PRINT_Eat3);
			B_RaiseAttribute(self,ATR_STRENGTH,1,TRUE,FALSE);
			Print(PRINT_STR1);
		};
	};
};


instance ItFo_Cheese(C_Item)
{
	name = "Ser";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Cheese;
	visual = "ItFo_Cheese.3DS";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Cheese;
	description = name;
	text[1] = NAME_Bonus_Satiety;
	count[1] = HP_Cheese;
	text[5] = NAME_Value;
	count[5] = Value_Cheese;
};


func void Use_Cheese()
{
	//Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Cheese);
	ChangeSatiety(self, HP_Cheese);
};


instance ItFo_Bacon(C_Item)
{
	name = "Szynka";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Bacon;
	visual = "ItFo_Bacon.3ds";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Bacon;
	description = name;
	text[1] = NAME_Bonus_Satiety;
	count[1] = HP_Bacon;
	text[5] = NAME_Value;
	count[5] = Value_Bacon;
};


func void Use_Bacon()
{
	//Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Bacon);
	ChangeSatiety(self, HP_Bacon);
};


instance ItFo_Bread(C_Item)
{
	name = "Chleb";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Bread;
	visual = "ItFo_Bread.3DS";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Bread;
	description = name;
	text[1] = NAME_Bonus_Satiety;
	count[1] = HP_Bread;
	text[5] = NAME_Value;
	count[5] = Value_Bread;
};


func void Use_Bread()
{
	//Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Bread);
	ChangeSatiety(self, HP_Bread);
};


instance ItFo_Fish(C_Item)
{
	name = "Ryba";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Fish;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Fish;
	description = name;
	text[1] = NAME_Bonus_Satiety;
	count[1] = HP_Fish;
	text[5] = NAME_Value;
	count[5] = Value_Fish;
};


func void Use_Fish()
{
	//Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Fish);
	ChangeSatiety(self, HP_Fish);
};


instance ItFoMuttonRaw(C_Item)
{
	name = "Surowe Miêso";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Rawmeat;
	visual = "ItFoMuttonRaw.3DS";
	material = MAT_LEATHER;
	scemeName = "MEAT";
	on_state[0] = Use_RawMeat;
	description = name;
	text[1] = NAME_Bonus_Satiety;
	count[1] = HP_RawMeat;
	text[2] = NAME_Toxicity;
	count[2] = Toxicity_RawMeat;
	text[5] = NAME_Value;
	count[5] = Value_Rawmeat;
};


func void Use_RawMeat()
{
	//Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_RawMeat);
	ChangeToxicity(self, Toxicity_RawMeat);
	ChangeSatiety(self, HP_RawMeat);
};


instance ItFoMutton(C_Item)
{
	name = "Sma¿one Miêso";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Meat;
	visual = "ItFoMutton.3DS";
	material = MAT_LEATHER;
	scemeName = "MEAT";
	on_state[0] = Use_Meat;
	description = name;
	text[1] = NAME_Bonus_Satiety;
	count[1] = HP_Meat;
	text[5] = NAME_Value;
	count[5] = Value_Meat;
};


func void Use_Meat()
{
	//Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Meat);
	ChangeSatiety(self, HP_Meat);
};


instance ItFo_Stew(C_Item)
{
	name = "Gulasz";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Stew;
	visual = "ItFo_Stew.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = Use_Stew;
	description = name;
	text[1] = NAME_Bonus_Satiety;
	count[1] = HP_Stew;
	text[5] = NAME_Value;
	count[5] = Value_Stew;
};


func void Use_Stew()
{
  //Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Stew);
	ChangeSatiety(self, HP_Stew);
};


instance ItFo_XPStew(C_Item)
{
	name = "Gulasz Thekli";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Stew;
	visual = "ItFo_Stew.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = Use_XPStew;
	description = name;
	text[1] = NAME_Bonus_Satiety;
	count[1] = HP_Stew;
	text[5] = NAME_Value;
	count[5] = Value_Stew;
};


func void Use_XPStew()
{
	//Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Stew);
	ChangeSatiety(self, HP_Stew);
	Print(PRINT_STR1);
	B_RaiseAttribute(self,ATR_STRENGTH,1,TRUE,FALSE);
};


instance ItFo_CoragonsBeer(C_Item)
{
	name = "Piwo";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Beer;
	visual = "ItFo_Beer.3DS";
	material = MAT_GLAS;
	scemeName = "POTION";
	on_state[0] = Use_CoragonsBeerBeer;
	description = name;
	text[1] = NAME_Bonus_Satiety;
	count[1] = HP_Beer;
	text[2] = NAME_Toxicity;
	count[2] = Toxicity_Beer;
	//text[2] = NAME_Bonus_Mana;
	//count[2] = Mana_Beer;
	text[4] = "Specjalne piwo Coragona";
	text[5] = NAME_Value;
	count[5] = Value_Beer;
};


func void Use_CoragonsBeerBeer()
{
	//Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Beer);
	ChangeToxicity(self, Toxicity_Beer);
	ChangeSatiety(self, HP_Beer);

	B_RaiseAttribute(self,ATR_HITPOINTS_MAX,Mana_Beer,TRUE,FALSE);
	//Npc_ChangeAttribute(self,ATR_MANA,Mana_Beer);
};


instance ItFo_FishSoup(C_Item)
{
	name = "Zupa Rybna";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_FishSoup;
	visual = "ItFo_FishSoup.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = Use_FishSoup;
	description = name;
	text[1] = NAME_Bonus_Satiety;
	count[1] = HP_FishSoup;
	text[5] = NAME_Value;
	count[5] = Value_FishSoup;
};


func void Use_FishSoup()
{
	//Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_FishSoup);
	ChangeSatiety(self, HP_FishSoup);
};


instance ItFo_Sausage(C_Item)
{
	name = "Kie³basa";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Sausage;
	visual = "ItFo_Sausage.3DS";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Sausage;
	description = name;
	text[1] = NAME_Bonus_Satiety;
	count[1] = HP_Sausage;
	text[5] = NAME_Value;
	count[5] = Value_Sausage;
};


func void Use_Sausage()
{
	//Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Sausage);
	ChangeSatiety(self, HP_Sausage);
};


instance ItFo_Honey(C_Item)
{
	name = "Miód";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Honey;
	visual = "ItFo_Honey.3DS";
	material = MAT_STONE;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Honey;
	description = name;
	text[1] = NAME_Bonus_Satiety;
	count[1] = HP_Honey;
	text[2] = NAME_AntiToxicity;
	count[2] = -Toxicity_Honey;
	text[5] = NAME_Value;
	count[5] = Value_Honey;
};


func void Use_Honey()
{
	//Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Honey);
	ChangeToxicity(self, Toxicity_Honey);
	ChangeSatiety(self, HP_Honey);
};


instance ItFo_Water(C_Item)
{
	name = "Woda";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Water;
	visual = "ItFo_Water.3ds";
	material = MAT_GLAS;
	scemeName = "POTION";
	on_state[0] = Use_Water;
	description = name;
	text[2] = NAME_AntiToxicity;
	count[2] = -Toxicity_Water;
	//text[1] = NAME_Bonus_Satiety;
	//count[1] = HP_Water;
	text[5] = NAME_Value;
	count[5] = Value_Water;
};


func void Use_Water()
{
	ChangeToxicity(self, Toxicity_Water);
	//Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Water);
};


instance ItFo_Beer(C_Item)
{
	name = "Piwo";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Beer;
	visual = "ItFo_Beer.3DS";
	material = MAT_GLAS;
	scemeName = "POTION";
	on_state[0] = Use_Beer;
	description = name;
	text[1] = NAME_Bonus_Satiety;
	count[1] = HP_Beer;
	text[2] = NAME_Toxicity;
	count[2] = Toxicity_Beer;
	//text[2] = NAME_Bonus_Mana;
	//count[2] = Mana_Beer;
	//text[4] = "Mroczny Paladyn";
	text[5] = NAME_Value;
	count[5] = Value_Beer;
};


func void Use_Beer()
{
	//Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Beer);
	ChangeToxicity(self, Toxicity_Beer);
	ChangeSatiety(self, HP_Beer);
	//Npc_ChangeAttribute(self,ATR_MANA,Mana_Beer);
};


instance ItFo_Booze(C_Item)
{
	name = "Gin";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Booze;
	visual = "ItFo_Booze.3DS";
	material = MAT_GLAS;
	scemeName = "POTION";
	on_state[0] = Use_Booze;
	description = name;
	text[1] = NAME_Bonus_Satiety;
	count[1] = HP_Booze;
	text[2] = NAME_Toxicity;
	count[2] = Toxicity_Booze;
	//text[2] = NAME_Bonus_Mana;
	//count[2] = Mana_Booze;
	text[5] = NAME_Value;
	count[5] = Value_Booze;
};


func void Use_Booze()
{
	ChangeToxicity(self, Toxicity_Booze);
	ChangeSatiety(self, HP_Booze);
	//Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Booze);
	//Npc_ChangeAttribute(self,ATR_MANA,Mana_Booze);
};


instance ItFo_Wine(C_Item)
{
	name = "Wino";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Wine;
	visual = "ItFo_Wine.3DS";
	material = MAT_GLAS;
	scemeName = "POTION";
	on_state[0] = Use_Wine;
	description = name;
	text[1] = NAME_Bonus_Satiety;
	count[1] = HP_Wine;
	text[2] = NAME_Toxicity;
	count[2] = Toxicity_Wine;
	//text[2] = NAME_Bonus_Mana;
	//count[2] = Mana_Wine;
	text[5] = NAME_Value;
	count[5] = Value_Wine;
};


func void Use_Wine()
{
	//Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Wine);
	ChangeToxicity(self, Toxicity_Wine);
	ChangeSatiety(self, HP_Wine);
	//Npc_ChangeAttribute(self,ATR_MANA,Mana_Wine);
};


instance ItFo_Milk(C_Item)
{
	name = "Mleko";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Milk;
	visual = "ItFo_Milk.3DS";
	material = MAT_GLAS;
	scemeName = "POTION";
	on_state[0] = Use_Milk;
	description = name;
	text[1] = NAME_Bonus_Satiety;
	count[1] = HP_Milk;
	text[2] = NAME_AntiToxicity;
	count[2] = -Toxicity_Milk;
	//text[2] = NAME_Bonus_Mana;
	//count[2] = Mana_Milk;
	text[5] = NAME_Value;
	count[5] = Value_Milk;
};


func void Use_Milk()
{
	//Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Milk);
	ChangeToxicity(self, Toxicity_Milk);
	ChangeSatiety(self, HP_Milk);
	//Npc_ChangeAttribute(self,ATR_MANA,Mana_Milk);
};
