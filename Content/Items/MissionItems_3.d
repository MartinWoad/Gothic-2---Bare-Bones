
instance ItMi_InnosEye_MIS(C_Item)
{
	name = "Oko Innosa";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 0;
	visual = "ItMi_InnosEye_MIS.3DS";
	material = MAT_STONE;
	description = name;
	on_equip = Equip_InnosEye;
	on_unequip = UnEquip_InnosEye;
	text[0] = "Pulsuje energią.";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Equip_InnosEye()
{
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Standup(self);
	Snd_Play("SFX_INNOSEYE");
};

func void UnEquip_InnosEye()
{
};


instance ItMi_InnosEye_Discharged_Mis(C_Item)
{
	name = "Oko Innosa";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 0;
	visual = "ItMi_InnosEye_MIS.3DS";
	material = MAT_STONE;
	description = name;
	on_equip = Equip_ItMi_InnosEye_Discharged_Mis;
	text[0] = "Oko jest martwe i pozbawione blasku.";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Equip_ItMi_InnosEye_Discharged_Mis()
{
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
};


instance ItMi_InnosEye_Broken_Mis(C_Item)
{
	name = "Oko Innosa";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 0;
	visual = "ItMi_InnosEye_MIS.3DS";
	material = MAT_STONE;
	description = name;
	on_equip = Equip_ItMi_InnosEye_Broken_Mis;
	text[0] = TEXT_Innoseye_Setting;
	text[1] = TEXT_Innoseye_Gem;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Equip_ItMi_InnosEye_Broken_Mis()
{
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
};


instance ItWr_PermissionToWearInnosEye_MIS(C_Item)
{
	name = "List Polecający";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_PermissionToWearInnosEye;
	scemeName = "MAP";
	description = "List Polecający";
	text[1] = "List polecający dla Pyrokara";
};


func void Use_PermissionToWearInnosEye()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Posiadacz tego listu ma zostać wpuszczony do świętych sal klasztoru.");
	Doc_PrintLines(nDocID,0,"Oko Innosa ma mu zostać wydane w trybie natychmiastowym.");
	Doc_PrintLines(nDocID,0,"Niniejsze rozkazy wydaję jako zarządca wyspy i reprezentant władzy królewskiej. Ich podstawą prawną jest układ o podziale Kościoła Innosa z 2. roku Ognia.");
	Doc_PrintLines(nDocID,0,"Oczekuję zatem, że zostaną one natychmiast wprowadzone w życie.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Niechaj Innos błogosławi Króla");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     Lord Hagen");
	Doc_Show(nDocID);
};


instance ItWr_XardasBookForPyrokar_Mis(C_Item)
{
	name = "Dwór Irdorath";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_XardasBookForPyrokar;
};


func void Use_XardasBookForPyrokar()
{
	Print(PRINT_IrdorathBookDoesntOpen);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
};


instance ItKe_CHEST_SEKOB_XARDASBOOK_MIS(C_Item)
{
	name = "Klucz Xardasa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_02;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "do kufra na farmie Sekoba.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_CorneliusTagebuch_Mis(C_Item)
{
	name = "Dziennik";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Dziennik";
	text[0] = "Dziennik Corneliusa.";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseCorneliusTagebuch;
};


func void UseCorneliusTagebuch()
{
	var int nDocID;
	Cornelius_IsLiar = TRUE;
	B_LogEntry(TOPIC_RescueBennet,"Oto dowód niewinności Benneta.");
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Jeśli Larius nadal będzie postępował w ten sposób, nic tu po mnie.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ostatniej nocy spotkało mnie coś dziwnego. Jeden z tych mężczyzn w czarnych kapturach złożył mi wizytę. Podobno są oni sługami zła, jednak mój gość miał w sobie coś, co budziło zaufanie. Niemal czułem bijącą od niego moc, choć kiedy przemówił, jego głos był spokojny.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Zaoferował mi 20.000 sztuk złota, jeśli doprowadzę do skazania jednego z najemników. Powiedział, że niedługo zrozumiem, co miał na myśli.");
	Doc_PrintLines(nDocID,1,"Oczywiście zgodziłem się od razu, ci najemnicy i tak nie zasługują na nic lepszego. Gdyby nie oni, moje życie byłoby dużo łatwiejsze. A złoto zapewni mi dobrobyt aż do końca mych dni.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Stało się - aresztowali jednego z najemników. Zamierzam dotrzymać danego słowa.");
	Doc_Show(nDocID);
	PrintScreen("",-1,-1,FONT_Screen,0);
};


instance ITWR_DementorObsessionBook_MIS(C_Item)
{
	name = "Almanach Opętanych";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_DementorObsessionBook;
};


func void Use_DementorObsessionBook()
{
	var int nDocID;
	Wld_PlayEffect("spellFX_Fear",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
	SC_ObsessionCounter = 100;
	B_SCIsObsessed(hero);
	if(hero.guild == GIL_KDF)
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"BOOK_MAGE_L.tga",0);
		Doc_SetPage(nDocID,1,"BOOK_MAGE_R.tga",0);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_SetFont(nDocID,0,FONT_BookHeadline);
		Doc_PrintLine(nDocID,0,"");
		Doc_SetFont(nDocID,0,FONT_Book);
		Doc_PrintLines(nDocID,0,"edef Kon dirandorix");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"in Sparady bell ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"el utoy");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Kho ray xaondron");
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"em piratoram endro");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,FONT_BookHeadline);
		Doc_SetFont(nDocID,1,FONT_Book);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		if(Kapitel >= 3)
		{
			Doc_PrintLine(nDocID,1,"           VINO");
			Doc_PrintLine(nDocID,1,"FERNANDO");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"        MALAK");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"BROMOR");
		};
		if(Kapitel >= 4)
		{
			Doc_PrintLine(nDocID,1,"    ENGROM");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"        RANDOLPH");
			Doc_PrintLine(nDocID,1,"");
		};
		if(Kapitel >= 5)
		{
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"SEKOB");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"            BRUTUS");
			Doc_PrintLine(nDocID,1,"");
		};
		Doc_Show(nDocID);
	};
};


instance ItWr_PyrokarsObsessionList(C_Item)
{
	name = "Magiczny List Pyrokara";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_PyrokarsObsessionList;
	scemeName = "MAP";
	description = name;
};


func void Use_PyrokarsObsessionList()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Opętani");
	Doc_SetFont(nDocID,0,FONT_Book);
	if(Kapitel >= 3)
	{
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"FERNANDO");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"VINO");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"MALAK");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"BROMOR");
	};
	if(Kapitel >= 4)
	{
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"ENGROM");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"RANDOLPH");
	};
	if(Kapitel >= 5)
	{
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"SEKOB");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"BRUTUS");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
	};
	Doc_Show(nDocID);
};


instance ItPo_HealHilda_MIS(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_HpEssenz;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_HealHilda;
	scemeName = "POTIONFAST";
	description = "Uzdrowienie Czarnej Gorączki";
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Essenz;
	text[5] = NAME_Value;
	count[5] = Value_HpEssenz;
};


func void Use_HealHilda()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Essenz);
};


instance ItMw_MalethsGehstock_MIS(C_Item)
{
	name = "Laska";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = Value_VLKMace;
	damageTotal = Damage_VLKMace;
	damagetype = DAM_BLUNT;
	range = Range_VLKMace;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_VLKMace;
	visual = "Itmw_008_1h_pole_01.3ds";
	description = name;
	text[0] = "Na gałce wygrawerowano";
	text[1] = "literę 'M'.";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_MalethsBanditGold(C_Item)
{
	name = "Sakwa Pełna Złota";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = Use_MalethsBanditGold;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_MalethsBanditGold()
{
	CreateInvItems(hero,ItMi_Gold,300);
	Print(PRINT_MalethBanditsGold);
	Snd_Play("Geldbeutel");
};


instance ItMi_Moleratlubric_MIS(C_Item)
{
	name = "Łój Kretoszczura";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Pitch;
	visual = "ItMi_Moleratlubric.3ds";
	material = MAT_WOOD;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItWr_BabosLetter_MIS(C_Item)
{
	name = "List do Babo";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_BabosLetter;
	scemeName = "MAP";
	description = "List do Babo.";
};


func void Use_BabosLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Drogi Babo,");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"pewnie zastanawiasz się, jak napisałyśmy ten list. Otóż zabrałyśmy wszystkie nasze oszczędności do Mistrza Marlasa i poprosiłyśmy, aby go dla nas napisał. życzymy ci wszystkiego najlepszego i przesyłamy ten obrazek jako prezent pożegnalny - niechaj przypomina ci o nas podczas nocy, które spędzisz w klasztorze.");
	Doc_PrintLines(nDocID,0,"Mamy nadzieję, że lubisz takie obrazki.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Fehta i Bonka");
	Doc_Show(nDocID);
};


instance ItWr_BabosPinUp_MIS(C_Item)
{
	name = "Portret Kobiety";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_BabosPinUp;
	scemeName = "MAP";
	description = "Portret nagiej kobiety.";
};


func void Use_BabosPinUp()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_Pinup.TGA",0);
	Doc_Show(nDocID);
};


instance ItWr_BabosDocs_MIS(C_Item)
{
	name = "Zwitek Papierów";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_BabosDocs;
	scemeName = "MAPSEALED";
	description = name;
	text[2] = "Kilka dokumentów";
	text[3] = "zwiniętych w rulon.";
};


func void Use_BabosDocs()
{
	BabosDocsOpen = TRUE;
	CreateInvItems(self,ItWr_BabosLetter_MIS,1);
	CreateInvItems(self,ItWr_BabosPinUp_MIS,1);
};


instance ItKe_IgarazChest_Mis(C_Item)
{
	name = "Klucz do Kufra";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz do kufra";
	text[3] = "należącego do Igaraza.";
};

instance ItWr_Astronomy_Mis(C_Item)
{
	name = "Boska Moc Gwiazd";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 400;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Astronomy;
};


var int Astronomy_once;

func void Use_Astronomy()
{
	var int nDocID;
	if(Astronomy_once == FALSE)
	{
		B_RaiseAttribute(self,ATR_MANA_MAX,2,TRUE,FALSE);
		Print(Print_ReadAstronomy);
		Astronomy_once = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"… jednak kiedy upór wołu połączy się z przebiegłością wojownika, strzeżcie się, albowiem będziecie świadkami wielkich zmian.");
	Doc_PrintLines(nDocID,0,"Upór wołu połączony z wytrwałością wojownika może zaburzyć odwieczny porządek. Kosmiczna materia oddzielająca wymiary staje się coraz cieńsza i słabsza. Wkrótce nie będzie w stanie powstrzymać istot Beliara przed wdarciem się do naszej rzeczywistości.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"W pradawnych czasach, kiedy oba światy były połączone silną więzią, słudzy Zła mogli bez przeszkód plądrować nasze ziemie, i tylko moc Innosa oraz jego Wybrańca pozwoliła nam odeprzeć ataki Wroga.");
	Doc_PrintLines(nDocID,1,"Jeśli taka sytuacja się powtórzy, niechaj Innos ma nas w swej opiece, albowiem od stuleci nie było pośród nas jego Wybrańca.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_Show(nDocID);
};


var int SC_ObsessionTimes;

instance ItPo_HealObsession_MIS(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_HpEssenz;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_HealObsession;
	scemeName = "POTIONFAST";
	description = "Uleczenie z Opętania";
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Essenz;
	text[5] = NAME_Value;
	count[5] = Value_HpEssenz;
};


func void Use_HealObsession()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Essenz);
	SC_ObsessionTimes = SC_ObsessionTimes + 1;
	B_ClearSCObsession(self);
	Wld_PlayEffect("spellFX_LIGHTSTAR_VIOLET",hero,hero,0,0,0,FALSE);
	Snd_Play("SFX_HealObsession");
};


instance ItSe_Golemchest_Mis(C_Item)
{
	name = "Skórzany Mieszek";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = Use_GolemChest;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "W sakwie pełno jest złota.";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_GolemChest()
{
	CreateInvItems(hero,ItMi_Gold,50);
	Print(PRINT_FoundGold50);
	Print(PRINT_FoundRing);
	CreateInvItems(hero,ItRi_Prot_Total_02,1);
	Snd_Play("Geldbeutel");
};


instance ItWr_ShatteredGolem_MIS(C_Item)
{
	name = "Bardzo Stara Mapa";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 150;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_ShatteredGolem_Mis;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_ShatteredGolem_Mis()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_ShatteredGolem.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
};


instance ItWr_DiegosLetter_MIS(C_Item)
{
	name = "List od Diega";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_DiegosLetter_Mis;
	scemeName = "MAP";
	description = "List Diega do Gerbrandta";
};


func void Use_DiegosLetter_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Gerbrandt, ");
	Doc_PrintLines(nDocID,0,"popełniłeś błąd, nie zabijając mnie...");
	Doc_PrintLines(nDocID,0,"Wróciłem do miasta i niedługo się spotkamy, a wtedy posiekam cię na plasterki. Znasz mnie wystarczająco długo, by wiedzieć, że nie żartuję.");
	Doc_PrintLines(nDocID,0,"Nie przypuszczałeś pewnie, że mogę jeszcze wrócić zza Bariery. To błąd...");
	Doc_PrintLines(nDocID,0,"Wróciłem, by odzyskać, co moje.");
	Doc_PrintLines(nDocID,0,"Jeśli życie ci miłe, uciekaj czym prędzej z miasta. A ja przejmę twój interes. W ten sposób będziemy kwita.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Diego");
	Doc_Show(nDocID);
};


instance ItSe_DiegosTreasure_Mis(C_Item)
{
	name = "Wypełniona Skórzana Torba";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = Use_DiegosTreasure;
	description = "Stara Skórzana Torba Diega";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_DiegosTreasure()
{
	OpenedDiegosBag = TRUE;
	CreateInvItems(self,ItMi_Gold,DiegosTreasure);
	Print(Print_DiegosTreasure);
	Snd_Play("Geldbeutel");
};


instance ItMi_UltharsHolyWater_Mis(C_Item)
{
	name = "Woda Święcona Ulthara";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = Value_HolyWater;
	visual = "ItMi_HolyWater.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


var int ItWr_MinenAnteil_Mis_OneTime;

instance ItWr_MinenAnteil_Mis(C_Item)
{
	name = "Udział w Kopalni Rudy Khorinis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = Value_HpElixier;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_MinenAnteil_Mis;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_MinenAnteil_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Udział w kopalni rudy");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Na mocy królewskiego Aktu Własności, wystawionego na część ziem królewskich, posiadacz tego dokumentu może eksploatować surowce tych ziem,");
	Doc_PrintLines(nDocID,0,"na obszarze nie większym jednak niż jeden ar królewski.");
	Doc_PrintLines(nDocID,0,"Na mocy Prawa o Miarach ar królewski równa się powierzchnią fragmentowi terenu o szerokości 16 kroków i długości 3.");
	Doc_PrintLines(nDocID,0,"Posiadacz tego dokumentu zostaje nadto zwolniony z obowiązków nakładanych przez prawa swobody dostępu,");
	Doc_PrintLines(nDocID,0,"jeśli jednak nie zdoła uiścić opłaty za użytkowane ziemie, to powrócą one na własność Korony.");
	Doc_PrintLine(nDocID,0,"         Podpisano");
	Doc_PrintLine(nDocID,0,"         Rządca królewski,");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"                Salandril");
	Doc_Show(nDocID);
	SC_KnowsProspektorSalandril = TRUE;
	if(ItWr_MinenAnteil_Mis_OneTime == FALSE)
	{
		B_LogEntry(TOPIC_MinenAnteile,"Gość, który sprzedał te udziały kupcom, ma na imię Salandril. Pewnie najłatwiej go będzie znaleźć w górnym Khorinis - chyba że już zwiał przed długim ramieniem sprawiedliwości.");
		if(Npc_IsDead(Salandril))
		{
			B_LogEntry(TOPIC_MinenAnteile,"Salandril nie żyje. Trzeba o tym powiedzieć Serpentesowi.");
		};
		ItWr_MinenAnteil_Mis_OneTime = TRUE;
	};
};


instance ItAm_Prot_BlackEye_Mis(C_Item)
{
	name = "Amulet Przyzywania Dusz";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = Value_Am_HpMana;
	visual = "ItAm_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[2] = "";
	text[3] = "Ochrona przed Czarnym Spojrzeniem";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};

instance ItMi_KarrasBlessedStone_Mis(C_Item)
{
	name = "Kamień z Poświęconej Ziemi";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_Rockcrystal.3ds";
	visual_skin = 0;
	material = MAT_STONE;
	description = name;
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_RichterKomproBrief_MIS(C_Item)
{
	name = "Zlecenie Sędziego";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_RichterKomproBrief;
	scemeName = "MAP";
	description = name;
};


func void Use_RichterKomproBrief()
{
	var int nDocID;
	SCKnowsRichterKomproBrief = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Morgahard - ty robaku! Lepiej rób, co ci każę, albo inaczej sobie pogadamy. Być może nawet będę musiał was aresztować.");
	Doc_PrintLines(nDocID,0,"Sprawę trzeba załatwić jutro w nocy, Larius coś podejrzewa.");
	Doc_PrintLines(nDocID,0,"Jeśli teraz nie wyciągniemy od niego forsy, to może nie być kolejnej okazji. Zadbam o to, abyście go spotkali wieczorem na targowisku.");
	Doc_PrintLines(nDocID,0,"Tylko nie róbcie hałasu. Chyba nie chcecie, żeby wsiedli na was strażnicy?");
	Doc_PrintLines(nDocID,0,"A gdyby miał go spotkać jakiś nieszczęśliwy wypadek, to ja płakał nie będę.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"          Główny sędzia i ");
	Doc_PrintLine(nDocID,0,"          królewski sekretarz");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_MorgahardTip(C_Item)
{
	name = "List";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_MorgahardTip;
	scemeName = "MAP";
	description = name;
};


func void Use_MorgahardTip()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Zrobiłem to. Mam nadzieję, że spotkamy się jeszcze, gdy całe zamieszanie przycichnie.");
	Doc_PrintLines(nDocID,0,"Nie martwcie się. Jeśli wszystko zawiedzie, poproszę Onara o załatwienie sprawy.");
	Doc_PrintLines(nDocID,0,"Wszystko będzie w porządku.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"                           M.");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_Map_Shrine_MIS(C_Item)
{
	name = "Mapa Świętych Kapliczek";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 200;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_Shrine_MIS;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Map_NewWorld_Shrine_MIS()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_Shrine.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
};


instance ItWr_VinosKellergeister_Mis(C_Item)
{
	name = "Duch Wina";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_VinosKellergeister_Mis;
};


func void Use_VinosKellergeister_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_RED_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_RED_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Duch Wina");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"... W swoim czasie spróbowałem niejednego, ale ten owoc, który dostałem w zeszłym tygodniu z zagranicy... przekroczył wszystkie oczekiwania...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"... sok z tego winnego grona ma bukiet bogatszy niż z jakiegokolwiek innego...");
	Doc_PrintLines(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_BookHeadline);
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"... nie jest źle, ale cały czas martwię się, że ktoś może mnie złapać w mojej tajnej pracowni. Nie mam pojęcia, co zrobiliby strażnicy, gdyby się o tym wszystkim dowiedzieli. Być może wyrzuciliby mnie poza Barierę...");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"... Nabrali podejrzeń. Muszę wszystko zostawić, dopóki sprawa troszkę nie przycichnie i nie nabiorę pewności, że nikt mnie już nie podejrzewa...");
	Doc_Show(nDocID);
};

