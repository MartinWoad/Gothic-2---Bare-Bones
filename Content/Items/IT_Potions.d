
const int Value_HpEssenz = 25;
const int HP_Essenz = 50;
const int Value_HpExtrakt = 35;
const int HP_Extrakt = 70;
const int Value_HpElixier = 50;
const int HP_Elixier = 100;
const int Value_ManaEssenz = 25;
const int Mana_Essenz = 50;
const int Value_ManaExtrakt = 40;
const int Mana_Extrakt = 75;
const int Value_ManaElixier = 60;
const int Mana_Elixier = 100;
const int Value_StrElixier = 800;
const int STR_Elixier = 2;
const int Value_DexElixier = 800;
const int DEX_Elixier = 2;
const int Value_HpMaxElixier = 1500;
const int HPMax_Elixier = 5;
const int Value_ManaMaxElixier = 1500;
const int ManaMax_Elixier = 2;
const int Value_MegaDrink = 1800;
const int STRorDEX_MegaDrink = 5;
const int Value_Speed = 200;
const int Time_Speed = 300000;

const int ToxicityLevel1 = 20;
const int ToxicityLevel2 = 40;
const int ToxicityLevel3 = 60;
const int ToxicityLevel4 = 80;
const int ToxicityLevelMax = 100;

const int Toxicity_HpEssenz = 3;
const int Toxicity_ManaEssenz = 5;

func void ChangeToxicity(var C_NPC slf, var int percent)
{
	if(Npc_IsPlayer(slf))
	{
		if(percent > 0)
		{
			if(toxicity + percent < ToxicityLevelMax)
			{
				toxicity = toxicity + percent;
			}
			else
			{
				toxicity = ToxicityLevelMax;
			};
			
			if(toxicity == ToxicityLevelMax)
			{
				slf.attribute[ATR_HITPOINTS] = 0;
			}
			else if(toxicity >= ToxicityLevel4 && toxicity - percent < ToxicityLevel4)
			{
				PrintScreen(PRINT_ToxicityLevel4,-1,YPOS_XPGained,FONT_ScreenSmall,2);
				slf.attribute[ATR_MANA] = 0;
			}
			else if(toxicity >= ToxicityLevel3 && toxicity - percent < ToxicityLevel3)
			{
				PrintScreen(PRINT_ToxicityLevel3,-1,YPOS_XPGained,FONT_ScreenSmall,2);
			}
			else if(toxicity >= ToxicityLevel2 && toxicity - percent < ToxicityLevel2)
			{
				PrintScreen(PRINT_ToxicityLevel2,-1,YPOS_XPGained,FONT_ScreenSmall,2);
			}
			else if(toxicity >= ToxicityLevel1 && toxicity - percent < ToxicityLevel1)
			{
				PrintScreen(PRINT_ToxicityLevel1,-1,YPOS_XPGained,FONT_ScreenSmall,2);
			};
		}
		else if (percent < 0)
		{
			if(toxicity + percent > 0)
			{
				toxicity = toxicity + percent;
			}
			else
			{
				toxicity = 0;
			};
		};
	};
};

instance ItPo_Mana_01(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_ManaEssenz;
	visual = "ItPo_Mana_01.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Mana_01;
	scemeName = "POTIONFAST";
	description = "Esencja Many";
	text[1] = NAME_Bonus_Mana;
	count[1] = Mana_Essenz;
	text[2] = NAME_Toxicity;
	count[2] = Toxicity_ManaEssenz;
	text[5] = NAME_Value;
	count[5] = Value_ManaEssenz;
};


func void UseItPo_Mana_01()
{
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Essenz);
	ChangeToxicity(self, Toxicity_ManaEssenz);
};


instance ItPo_Mana_02(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_ManaExtrakt;
	visual = "ItPo_Mana_02.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Mana_02;
	scemeName = "POTIONFAST";
	description = "Ekstrakt Many";
	text[1] = NAME_Bonus_Mana;
	count[1] = Mana_Extrakt;
	text[5] = NAME_Value;
	count[5] = Value_ManaExtrakt;
};


func void UseItPo_Mana_02()
{
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Extrakt);
};


instance ItPo_Mana_03(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_ManaElixier;
	visual = "ItPo_Mana_03.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Mana_03;
	scemeName = "POTIONFAST";
	description = "Eliksir Many";
	text[1] = NAME_Bonus_Mana;
	count[1] = Mana_Elixier;
	text[5] = NAME_Value;
	count[5] = Value_ManaElixier;
};


func void UseItPo_Mana_03()
{
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Elixier);
};


instance ItPo_Health_01(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_HpEssenz;
	visual = "ItPo_Health_01.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Health_01;
	scemeName = "POTIONFAST";
	description = "Esencja Lecznicza";
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Essenz;
	text[5] = NAME_Value;
	count[5] = Value_HpEssenz;
};


func void UseItPo_Health_01()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Essenz);
};


instance ItPo_Health_02(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_HpExtrakt;
	visual = "ItPo_Health_02.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Health_02;
	scemeName = "POTIONFAST";
	description = "Ekstrakt Leczniczy";
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Extrakt;
	text[5] = NAME_Value;
	count[5] = Value_HpExtrakt;
};


func void UseItPo_Health_02()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Extrakt);
};


instance ItPo_Health_03(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_HpElixier;
	visual = "ItPo_Health_03.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Health_03;
	scemeName = "POTIONFAST";
	description = "Eliksir Leczniczy";
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Elixier;
	text[5] = NAME_Value;
	count[5] = Value_HpElixier;
};


func void UseItPo_Health_03()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Elixier);
};


instance ItPo_Perm_STR(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_StrElixier;
	visual = "ItPo_Perm_STR.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Perm_STR;
	scemeName = "POTIONFAST";
	description = "Eliksir Si�y";
	text[1] = NAME_Bonus_Str;
	count[1] = STR_Elixier;
	text[5] = NAME_Value;
	count[5] = Value_StrElixier;
};


func void UseItPo_Perm_STR()
{
	B_RaiseAttribute(self,ATR_STRENGTH,STR_Elixier,TRUE,FALSE);
};


instance ItPo_Perm_DEX(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_DexElixier;
	visual = "ItPo_Perm_DEX.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Perm_DEX;
	scemeName = "POTIONFAST";
	description = "Eliksir Zr�czno�ci";
	text[1] = NAME_Bonus_Dex;
	count[1] = DEX_Elixier;
	text[5] = NAME_Value;
	count[5] = Value_DexElixier;
};


func void UseItPo_Perm_DEX()
{
	B_RaiseAttribute(self,ATR_DEXTERITY,DEX_Elixier,TRUE,FALSE);
};


instance ItPo_Perm_Health(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_HpMaxElixier;
	visual = "ItPo_Perm_Health.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Perm_Health;
	scemeName = "POTIONFAST";
	description = "Eliksir �ycia";
	text[1] = NAME_Bonus_HpMax;
	count[1] = HPMax_Elixier;
	text[5] = NAME_Value;
	count[5] = Value_HpMaxElixier;
};


func void UseItPo_Perm_Health()
{
	B_RaiseAttribute(self,ATR_HITPOINTS_MAX,HPMax_Elixier,TRUE,FALSE);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HPMax_Elixier);
};


instance ItPo_Perm_Mana(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_ManaMaxElixier;
	visual = "ItPo_Perm_Mana.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Perm_Mana;
	scemeName = "POTIONFAST";
	description = "Eliksir Ducha";
	text[1] = NAME_Bonus_ManaMax;
	count[1] = ManaMax_Elixier;
	text[5] = NAME_Value;
	count[5] = Value_ManaMaxElixier;
};


func void UseItPo_Perm_Mana()
{
	B_RaiseAttribute(self,ATR_MANA_MAX,ManaMax_Elixier,TRUE,FALSE);
	Npc_ChangeAttribute(self,ATR_MANA,ManaMax_Elixier);
};


instance ItPo_Speed(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_Speed;
	visual = "ItPo_Speed.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Speed;
	scemeName = "POTIONFAST";
	description = "Mikstura Szybko�ci";
	text[1] = "Tymczasowo zwi�ksza twoj� szybko��.";
	text[3] = NAME_Duration;
	count[3] = Time_Speed / 60000;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItPo_Speed()
{
	Mdl_ApplyOverlayMdsTimed(self,"HUMANS_SPRINT.MDS",Time_Speed);
};


instance ItPo_MegaDrink(C_Item)
{
	name = "Embarla Firgasto";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_MegaDrink;
	visual = "ItPo_Perm_Mana.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_MegaDrink;
	scemeName = "POTIONFAST";
	description = name;
	text[3] = "Skutki nieznane.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItPo_MegaDrink()
{
	if(self.attribute[ATR_STRENGTH] < self.attribute[ATR_DEXTERITY])
	{
		B_RaiseAttribute(self,ATR_DEXTERITY,STRorDEX_MegaDrink,TRUE,FALSE);
	}
	else
	{
		B_RaiseAttribute(self,ATR_STRENGTH,STRorDEX_MegaDrink,TRUE,FALSE);
	};
	Npc_ChangeAttribute(self,ATR_MANA,-ATR_MANA);
	Snd_Play("DEM_Warn");
};


