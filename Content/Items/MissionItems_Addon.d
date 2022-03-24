
instance ITWR_SATURASFIRSTMESSAGE_ADDON_SEALED(C_ITEM)
{
	name = "Zapiecz�towana wiadomo��";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_saturasfirstmessage_sealed;
	scemename = "MAPSEALED";
	description = name;
	text[2] = "Ta wiadomo�� zosta�a dok�adnie zapiecz�towana.";
};


var int use_saturasfirstmessage_onetime;

func void use_saturasfirstmessage()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"Szanowny Vatrasie,");
	Doc_PrintLines(ndocid,0,"Dotarli�my do portalu. Mia�e� racj�.");
	Doc_PrintLines(ndocid,0,"S� znaki wskazuj�ce na to, �e naprawd� czcili Adanosa. Sprawd�, prosz�, moje notatki i potwierd� nasze ustalenia.");
	Doc_PrintLines(ndocid,0,"Od kilku dni nie widzieli�my tych dziwnych kamiennych istot.");
	Doc_PrintLines(ndocid,0,"Ziemia wci�� trz�sie si� z niewiadomych powod�w.");
	Doc_PrintLines(ndocid,0,"S�dz�, �e nasze badania wkr�tce wska�� nam, co mo�e by� tego przyczyn�.");
	Doc_PrintLines(ndocid,0,"Znaleziony przez nas ornament ma wi�ksze znaczenie, ni� wcze�niej s�dzili�my. Wydaje nam si�, �e jest to jaki� klucz-artefakt. Niestety, nie jest kompletny. Musimy go dok�adniej zbada�.");
	Doc_PrintLines(ndocid,0,"Wy�lij jednego z cz�onk�w Wodnego Kr�gu, by nam go dostarczy�. Je�li to mo�liwe, nie przysy�aj Cavalorna.");
	Doc_PrintLines(ndocid,0,"Poprosi�em go ju� o dostarczenie Ci tego listu. Wydaje mi si�, �e ju� wystarczaj�co nam pom�g�.");
	Doc_PrintLines(ndocid,0,"Mam nadziej�, �e post�pujemy w�a�ciwie.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Saturas");
	Doc_Show(ndocid);
	if((use_saturasfirstmessage_onetime == FALSE) && (MIS_ADDON_CAVALORN_LETTER2VATRAS != LOG_SUCCESS))
	{
		Log_CreateTopic(TOPIC_ADDON_KDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_KDW,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_KDW,"Zabra�em bandycie wiadomo��, kt�r� Cavalorn mia� dostarczy� Vatrasowi, Magowi Wody. To teraz moje zadanie.");
		use_saturasfirstmessage_onetime = TRUE;
	};
	if(SC_KNOWSRANGER == FALSE)
	{
		Log_CreateTopic(TOPIC_ADDON_RINGOFWATER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_RINGOFWATER,LOG_RUNNING);
		Log_AddEntry(TOPIC_ADDON_RINGOFWATER,"Istnieje stowarzyszenie zw�ce si� Wodnym Kr�giem. Wygl�da na to, �e rz�dz� nim Magowie Wody.");
	};
	if(SC_ISRANGER == FALSE)
	{
		Log_CreateTopic(TOPIC_ADDON_RINGOFWATER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_RINGOFWATER,LOG_RUNNING);
		Log_AddEntry(TOPIC_ADDON_RINGOFWATER,"Cavalorn nale�y do Wodnego Kr�gu.");
	};
	SC_KNOWSRANGER = TRUE;
};

func void use_saturasfirstmessage_sealed()
{
	CreateInvItems(self,itwr_saturasfirstmessage_addon,1);
	SATURASFIRSTMESSAGEOPENED = TRUE;
	use_saturasfirstmessage();
};


instance ITWR_SATURASFIRSTMESSAGE_ADDON(C_ITEM)
{
	name = "Otwarta wiadomo��";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_saturasfirstmessage;
	scemename = "MAP";
	description = name;
	text[2] = "List Saturasa do Vatrasa";
};

instance ITMI_ORNAMENT_ADDON(C_ITEM)
{
	name = "Ornament";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[0] = "Fragment du�ego, ozdobnego pier�cienia";
	inv_zbias = INVCAM_ENTF_MISC5_STANDARD;
};

instance ITMI_ORNAMENT_ADDON_VATRAS(C_ITEM)
{
	name = "Ornament";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[0] = "Fragment du�ego, ozdobnego pier�cienia";
	inv_zbias = INVCAM_ENTF_MISC5_STANDARD;
};

instance ITWR_MAP_NEWWORLD_ORNAMENTS_ADDON(C_ITEM)
{
	name = "Mapa Nefariusa";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_map_newworld_ornaments;
	description = name;
	text[0] = "Na mapie zaznaczono miejsca,";
	text[1] = "gdzie wed�ug Nefariusa znajduj� si� brakuj�ce ornamenty.";
	text[2] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_map_newworld_ornaments()
{
	var int document;
	if(Npc_IsPlayer(self))
	{
		b_setplayermap(itwr_map_newworld_ornaments_addon);
	};
	SC_SAW_ORNAMENT_MAP = TRUE;
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_NewWorld_Ornaments.tga",TRUE);
	Doc_SetLevel(document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(document,-28000,50500,95500,-42500);
	Doc_Show(document);
};


instance ITWR_MAP_NEWWORLD_DEXTER(C_ITEM)
{
	name = "Mapa teren�w Khorinis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 210;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_map_newworld_dexter;
	description = name;
	text[0] = "Skip zaznaczy� miejsce,";
	text[1] = "gdzie mog� znale�� szefa bandyt�w,";
	text[2] = "Dextera.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_map_newworld_dexter()
{
	var int document;
	if(Npc_IsPlayer(self))
	{
		b_setplayermap(itwr_map_newworld_dexter);
	};
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_NewWorld_Dexter.tga",TRUE);
	Doc_SetLevel(document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(document,-28000,50500,95500,-42500);
	Doc_Show(document);
};


prototype RANGERRING_PROTOTYPE(C_ITEM)
{
	name = "Pier�cie� z akwamarynem";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = VALUE_RI_HPMANA;
	visual = "ItRi_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_ranger_addon;
	on_unequip = unequip_itri_ranger_addon;
	description = "Symbol przynale�no�ci do Wodnego Kr�gu";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

func void equip_itri_ranger_addon()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if(ENTERED_ADDONWORLD == FALSE)
		{
			if(Npc_HasItems(hero,itri_ranger_addon) == FALSE)
			{
				RANGERRINGISLARESRING = TRUE;
			};
		};
		SCISWEARINGRANGERRING = TRUE;
		PrintS(PRINT_ADDON_SCISWEARINGRANGERRING);
	};
};

func void unequip_itri_ranger_addon()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if(SC_ISRANGER == FALSE)
		{
			SCISWEARINGRANGERRING = FALSE;
		};
		RANGERRINGISLARESRING = FALSE;
	};
};


instance ITRI_RANGER_LARES_ADDON(RANGERRING_PROTOTYPE)
{
	text[1] = "Ten pier�cie� nale�y do Laresa.";
};

instance ITRI_RANGER_ADDON(RANGERRING_PROTOTYPE)
{
	text[1] = "To m�j pier�cie�.";
};

instance ITRI_LANCERING(RANGERRING_PROTOTYPE)
{
	text[1] = "Ten pier�cie� nale�y do Lance'a.";
};

instance ITMI_PORTALRING_ADDON(C_ITEM)
{
	name = "Ozdobny pier�cie�";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_PortalRing_01.3DS";
	material = MAT_STONE;
	description = "Ten pier�cie� otwiera portal";
	inv_zbias = INVCAM_ENTF_MISC3_STANDARD;
};

instance ITWR_MARTIN_MILIZEMPFEHLUNG_ADDON(C_ITEM)
{
	name = "List polecaj�cy od Martina";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_martinmilizempfehlung_addon;
	scemename = "MAP";
	description = "List polecaj�cy dla Lorda Andre";
	text[2] = "powinien mi umo�liwi�";
	text[3] = "wst�pienie w szeregi stra�y.";
};


func void use_martinmilizempfehlung_addon()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Drogi Lordzie Andre,");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Wraz z tym listem przysy�am Ci nowego rekruta do naszej stra�y.");
	Doc_PrintLines(ndocid,0,"Udowodni� swoj� przydatno��, wykonuj�c trudne i odpowiedzialne zadania.");
	Doc_PrintLines(ndocid,0,"Jestem pewien, �e b�dzie si� dobrze spisywa�, broni�c kr�la oraz mieszka�c�w tego miasta.");
	Doc_PrintLine(ndocid,0,"Innosie, chro� kr�la.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Kwatermistrz Martin");
	Doc_Show(ndocid);
};


instance ITWR_RAVENSKIDNAPPERMISSION_ADDON(C_ITEM)
{
	name = "Rozkazy";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_ravenskidnappermission_addon;
	scemename = "MAP";
	description = name;
	text[2] = "Zabra�em ten list";
	text[3] = "bandycie Dexterowi.";
};


var int use_ravenskidnappermission_addon_onetime;

func void use_ravenskidnappermission_addon()
{
	var int ndocid;
	if((use_ravenskidnappermission_addon_onetime == FALSE) && (MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE != 0))
	{
		Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Teraz mam to na pi�mie. Kruk, dawny magnat, stoi za porwaniami mieszka�c�w Khorinis. Jego kryj�wka znajduje si� gdzie� za g�rami, w p�nocno-wschodniej cz�ci Khorinis. Vatras powinien zobaczy� ten dokument.");
		use_ravenskidnappermission_addon_onetime = TRUE;
	};
	SCKNOWSMISSINGPEOPLEAREINADDONWORLD = TRUE;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLines(ndocid,0,"Dexter, ty draniu!");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Kiedy jeszcze by�em magnatem, mo�na by�o bardziej na tobie polega�.");
	Doc_PrintLines(ndocid,0,"Je�li nie zdo�asz porwa� wi�cej ludzi z miasta i przys�a� ich do mnie, to b�dziemy mieli niez�y problem z ch�opakami w naszej kryj�wce.");
	Doc_PrintLines(ndocid,0,"Potrzebuj� tu wi�cej niewolnik�w albo ch�opaki zaczn� si� buntowa�. Chyba nie musz� ci m�wi�, co to znaczy, prawda?");
	Doc_PrintLines(ndocid,0,"Jestem bardzo bliski dostania si� do �wi�tyni. Nie mog� sobie pozwoli� na �adne, absolutnie �adne k�opoty.");
	Doc_PrintLines(ndocid,0,"A, jest jeszcze jeden problem:");
	Doc_PrintLines(ndocid,0,"Pr�dzej czy p�niej b�dziemy musieli znale�� drog� przez wysokie g�ry w p�nocno-wschodnim Khorinis. Piraci nie zapewni� nam transportu, kiedy przestaniemy im p�aci�.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Kruk");
	Doc_Show(ndocid);
};


instance ITWR_VATRAS_KDFEMPFEHLUNG_ADDON(C_ITEM)
{
	name = "List polecaj�cy od Vatrasa";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_vatraskdfempfehlung_addon;
	scemename = "MAP";
	description = "List polecaj�cy od Vatrasa";
	text[2] = "powinien pom�c mi";
	text[3] = "wej�� do klasztoru Mag�w Ognia";
	text[4] = "bez zap�aty.";
};


func void use_vatraskdfempfehlung_addon()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Bracia Ognia");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"W�a�nie poinformowano mnie, �e aby do��czy� do waszego stowarzyszenia, trzeba wnie�� op�at�.");
	Doc_PrintLines(ndocid,0,"List ten dostarczy oddany cz�owiek, kt�ry chcia�by zosta� nowicjuszem w waszych szeregach.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Vatras");
	Doc_Show(ndocid);
};


instance ITMI_LOSTINNOSSTATUE_DARON(C_ITEM)
{
	name = "Cenny pos��ek Innosa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_INNOSSTATUE;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_LUCIASLOVELETTER_ADDON(C_ITEM)
{
	name = "List po�egnalny Lucii";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_luciasloveletter_addon;
	scemename = "MAP";
	description = name;
};


func void use_luciasloveletter_addon()
{
	var int ndocid;
	Log_CreateTopic(TOPIC_ADDON_LUCIA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_LUCIA,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_LUCIA,"Lucia napisa�a list po�egnalny dla Elvricha. Z pewno�ci� b�dzie chcia� go przeczyta�.");
	MIS_LUCIASLETTER = LOG_RUNNING;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Najdro�szy Elvrichu,");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"�adne s�owa nie oddadz� tego, jak mi przykro.");
	Doc_PrintLines(ndocid,0,"Wiem, �e ci�ko b�dzie ci to zrozumie�. Dosz�am jednak do wniosku, �e lepiej b�dzie dla nas obojga, je�li znajdziesz sobie porz�dniejsz� dziewczyn�.");
	Doc_PrintLines(ndocid,0,"Udaj� si� w miejsce, z kt�rego ju� nie wr�c�. Zapomnij o mnie. Nieprzyzwoita dziewczyna jak ja nie zas�uguje na takiego dobrego ch�opaka. �egnaj.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Lucia");
	Doc_Show(ndocid);
};


prototype EFFECTITEMPROTOTYPE_ADDON(C_ITEM)
{
	name = "Kamie�";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_COAL;
	visual = "ItMi_Coal.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ITMI_AMBOSSEFFEKT_ADDON(EFFECTITEMPROTOTYPE_ADDON)
{
};

instance ITMI_ORNAMENTEFFEKT_FARM_ADDON(EFFECTITEMPROTOTYPE_ADDON)
{
};

instance ITMI_ORNAMENTEFFEKT_FOREST_ADDON(EFFECTITEMPROTOTYPE_ADDON)
{
};

instance ITMI_ORNAMENTEFFEKT_BIGFARM_ADDON(EFFECTITEMPROTOTYPE_ADDON)
{
};

instance ITMI_RAKE(C_ITEM)
{
	name = "Grabie";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_RAKE;
	visual = "ItMi_Rake.3DS";
	material = MAT_WOOD;
	scemename = "RAKE";
	on_state[1] = use_rake;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void use_rake()
{
};


instance ITRI_ADDON_BANDITTRADER(C_ITEM)
{
	name = "Pier�cie� gildii";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 5;
	visual = "ItRi_Prot_Point_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = "Rze�biony pier�cie�";
	text[2] = "zamorskiej gildii Araxos";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

instance ITWR_ADDON_BANDITTRADER(C_ITEM)
{
	name = "Dostawa";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_addon_bandittrader;
	scemename = "MAP";
	description = name;
	text[2] = "Zabra�em ten list bandytom";
	text[3] = "za farm� Sekoba.";
};


var int use_itwr_addon_bandittrader_onetime;

func void use_itwr_addon_bandittrader()
{
	var int ndocid;
	BANDITTRADER_LIEFERUNG_GELESEN = TRUE;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"15 kr�tkich mieczy");
	Doc_PrintLines(ndocid,0,"20 pa�aszy");
	Doc_PrintLines(ndocid,0,"25 bochenk�w chleba");
	Doc_PrintLines(ndocid,0,"15 butelek wina");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"To ju� ostatni raz.");
	Doc_PrintLines(ndocid,0,"Zaczyna robi� si� za gor�co.");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Fernando");
	Doc_Show(ndocid);
	if((MIS_VATRAS_FINDTHEBANDITTRADER != 0) && (use_itwr_addon_bandittrader_onetime == FALSE))
	{
		b_logentry(TOPIC_ADDON_BANDITTRADER,"Znalaz�em dokument potwierdzaj�cy, �e Fernando jest handlarzem broni�, kt�rego szukam.");
		use_itwr_addon_bandittrader_onetime = TRUE;
	};
};


instance ITWR_VATRAS2SATURAS_FINDRAVEN(C_ITEM)
{
	name = "Przesy�ka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_vatras2saturas_findraven_sealed;
	scemename = "MAPSEALED";
	description = name;
	text[2] = "Wiadomo�� Vatrasa dla Saturasa";
};


func void use_vatras2saturas_findraven()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"Szanowny Saturasie,");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Mam nadziej�, �e zbli�asz si� do ko�ca. Sytuacja w mie�cie ostatnio si� uspokoi�a. Jednak obawiam si�, �e to cisza przed burz�. Pospiesz si�, prosz�. Potrzebuj� ci� tutaj.");
	Doc_PrintLines(ndocid,0,"Przestudiowa�em zapiski i potwierdzam twoje podejrzenia. Symbole rzeczywi�cie wskazuj� na kultur�, kt�ra czci�a Adanosa. Dlatego musimy pozosta� czujni i nie da� si� za�lepi� s�owom fa�szywych prorok�w.");
	Doc_PrintLines(ndocid,0,"Zaginieni mieszka�cy zostali porwani przez Kruka, by�ego magnata. S� w rejonie, do kt�rego z pewno�ci� zaprowadzi nas portal.");
	Doc_PrintLines(ndocid,0,"Jeszcze jedno � przysy�am Ci pomocnika. Osoba, kt�ra przyniesie ten list, jest do�� wyj�tkowa. Za ka�dym razem, gdy na ciebie spogl�da, ma w oku ten charakterystyczny b�ysk. Nie jestem jeszcze tego ca�kiem pewien, ale mo�liwe, �e to ON, nawet je�li inaczej go sobie wyobra�ali�my.");
	Doc_PrintLines(ndocid,0,"Sprawd� go. Wierz�, �e mam racj�.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Vatras");
	Doc_Show(ndocid);
};

func void use_vatras2saturas_findraven_sealed()
{
	CreateInvItems(self,itwr_vatras2saturas_findraven_opened,1);
	VATRAS2SATURAS_FINDRAVEN_OPEN = TRUE;
	use_vatras2saturas_findraven();
};


instance ITWR_VATRAS2SATURAS_FINDRAVEN_OPENED(C_ITEM)
{
	name = "Otwarta przesy�ka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_vatras2saturas_findraven;
	scemename = "MAP";
	description = name;
	text[2] = "Wiadomo�� Vatrasa dla Saturasa";
};

instance ITAM_ADDON_WISPDETECTOR(C_ITEM)
{
	name = "Amulet z rudy";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = VALUE_AM_DEXSTRG;
	visual = "ItAm_Mana_01.3ds";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_BLUE";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_wispdetector;
	on_unequip = unequip_wispdetector;
	description = "Amulet szukaj�cego ognika";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


var int equip_wispdetector_onetime;

func void equip_wispdetector()
{
	var C_NPC detwsp;
	if(equip_wispdetector_onetime == FALSE)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] = TRUE;
		WISPSEARCHING = WISPSEARCH_NF;
		equip_wispdetector_onetime = TRUE;
	};
	detwsp = Hlp_GetNpc(wisp_detector);
	AI_Teleport(detwsp,"TOT");
	Wld_SpawnNpcRange(self,wisp_detector,1,500);
	Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",wisp_detector,wisp_detector,0,0,0,FALSE);
	Snd_Play("MFX_Transform_Cast");
};

func void unequip_wispdetector()
{
	var C_NPC detwsp;
	detwsp = Hlp_GetNpc(wisp_detector);
	if(Npc_IsDead(detwsp) == FALSE)
	{
		Snd_Play("WSP_Dead_A1");
	};
	AI_Teleport(detwsp,"TOT");
	b_removenpc(detwsp);
	AI_Teleport(detwsp,"TOT");
};


instance ITFO_ADDON_KROKOFLEISCH_MISSION(C_ITEM)
{
	name = "Mi�so bagiennego szczura";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_RAWMEAT;
	visual = "ItFoMuttonRaw.3DS";
	material = MAT_LEATHER;
	scemename = "MEAT";
	description = name;
	text[1] = "Ma podejrzany zapach!";
	text[5] = NAME_VALUE;
	count[5] = VALUE_RAWMEAT;
};

instance ITRI_ADDON_MORGANSRING_MISSION(C_ITEM)
{
	name = "Pier�cie� Morgana";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 500;
	visual = "ItRi_Prot_Total_02.3DS";
	material = MAT_METAL;
	on_equip = equip_morgansring;
	on_unequip = unequip_morgansring;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = name;
	text[1] = "Pier�cie� zdobiony jest mn�stwem pi�knych run.";
	text[2] = NAME_ADDON_BONUS_1H;
	count[2] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_morgansring()
{
	b_addfightskill(self,NPC_TALENT_1H,10);
};

func void unequip_morgansring()
{
	b_addfightskill(self,NPC_TALENT_1H,-10);
};


instance ITMI_FOCUS(C_ITEM)
{
	name = "Kamie� ogniskuj�cy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_Focus.3DS";
	material = MAT_STONE;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = name;
};

instance ITMI_ADDON_STEEL_PAKET(C_ITEM)
{
	name = "Pakiet stali";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 300;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Ta paczka jest NAPRAWD� ci�ka.";
	text[3] = "Zawiera spor� bry�� stali.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_STONEPLATECOMMON_ADDON(C_ITEM)
{
	name = "Stara kamienna tablica";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = VALUE_STONEPLATECOMMON;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_LEATHER;
	on_state[0] = use_stoneplatecommon;
	scemename = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	text[2] = "Szara kamienna tablica";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = VALUE_STONEPLATECOMMON;
};


func void use_stoneplatecommon()
{
	var int ndocid;
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,1);
		Doc_SetPage(ndocid,0,"Maya_Stoneplate_03.TGA",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,-1,70,50,90,50,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Kasta wojownik�w wywo�a�a gniew naszego boga.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"RADEMES, nast�pca QUARHODRONA, zosta� wyp�dzony. Ale jego z�owroga moc dotar�a do nas nawet z jego miejsca wygnania.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Byli�my wobec niej bezsilni.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Na JARKENDAR spad� gniew ADANOSA!");
	}
	else
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,1);
		Doc_SetPage(ndocid,0,"Maya_Stoneplate_02.TGA",0);
		b_say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITMI_ADDON_STONE_01(C_ITEM)
{
	name = "Czerwona kamienna tablica";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_03.3ds";
	material = MAT_STONE;
	on_state[0] = use_addon_stone_01;
	scemename = "MAP";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	text[2] = "Czerwona kamienna tablica";
	text[3] = "";
};


func void use_addon_stone_01()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Adanos_Stoneplate_02.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,70,50,90,50,1);
	Doc_PrintLine(ndocid,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(ndocid,0,"My, trzej pozostali przyw�dcy Rady Pi�ciu, za�o�yli�my pu�apki w �wi�tyni i zapiecz�towali�my jej wej�cie. Oby miecz na zawsze ju� pozosta� w mroku.");
	}
	else
	{
		Doc_PrintLines(ndocid,0,"Erfjkemvfj Hwoqmnyhan ckh. Fjewheege Egdgsmkd Ygc slje asdkjhnead Gkjsdhad Uhndter rygilliambwe ewzbfujbwe Iuhdfb. Revfnbrebuiwe ewohjfribwe wef. Sebnejbuwd Weinfiwjf Ihwqpjrnn.");
		b_say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITMI_ADDON_STONE_05(C_ITEM)
{
	name = "��ta kamienna tablica";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_04.3ds";
	material = MAT_STONE;
	on_state[0] = use_addon_stone_05;
	scemename = "MAP";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	text[2] = "��ta kamienna tablica";
	text[3] = "";
};


func void use_addon_stone_05()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Adanos_Stoneplate_01.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,70,50,90,50,1);
	Doc_PrintLine(ndocid,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(ndocid,0,"Ja, kt�ry sprzeciwi�em si� rozkazom tr�jki, zbudowa�em pierwsz� pu�apk�. I tylko ja znam w�a�ciwe wrota.");
	}
	else
	{
		Doc_PrintLines(ndocid,0,"Fjewheege Egdgsmkd Ygc slje asdkjhnead Gkjsdhad Uhnd Esfjwedbwe ewzbfujbwe Iuhdfb. Sebnejbuwd Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh.");
		b_say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITMI_ADDON_STONE_03(C_ITEM)
{
	name = "Niebieska kamienna tablica";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_05.3ds";
	material = MAT_STONE;
	on_state[0] = use_addon_stone_03;
	scemename = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = name;
	text[2] = "Niebieska kamienna tablica";
	text[3] = "";
};


func void use_addon_stone_03()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Adanos_Stoneplate_03.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,70,50,90,50,1);
	Doc_PrintLine(ndocid,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(ndocid,0,"KHARDIMON przygotowa� drug� pu�apk�. Tylko ten, kto nie zejdzie ze �cie�ki �wiat�a, dotrze do trzeciej komnaty.");
	}
	else
	{
		Doc_PrintLines(ndocid,0,"KHARDIMON Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh. Gkjsdhad Uhnd Esfjwedbwe ewzbfujbwe.");
		b_say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITMI_ADDON_STONE_04(C_ITEM)
{
	name = "Zielona kamienna tablica";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_01.3ds";
	material = MAT_STONE;
	on_state[0] = use_addon_stone_04;
	scemename = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = name;
	text[2] = "Zielona kamienna tablica";
	text[3] = "";
};


func void use_addon_stone_04()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Adanos_Stoneplate_04.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,70,50,90,50,1);
	Doc_PrintLine(ndocid,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(ndocid,0,"Trzecia pu�apka zosta�a zbudowana przez QUARHODRONA i jedynie on wie, jak otworzy� bram�.");
	}
	else
	{
		Doc_PrintLines(ndocid,0,"Esfjwedbwe ewzbfujbwe. Fjewheege QUARHODRON Ygc slje asdkjhnead. Sebnejbuwd Weinfiwjf Ihwqpjrnn. Gkjsdhad Uhnd.");
		b_say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITMI_ADDON_STONE_02(C_ITEM)
{
	name = "Fioletowa kamienna tablica";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_02.3ds";
	material = MAT_STONE;
	on_state[0] = use_addon_stone_02;
	scemename = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = name;
	text[2] = "Fioletowa kamienna tablica";
	text[3] = "";
};


func void use_addon_stone_02()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Adanos_Stoneplate_05.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,70,50,90,50,1);
	Doc_PrintLine(ndocid,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(ndocid,0,"QUARHODRON by� te� tym, kt�ry z pomoc� KHARDIMONA zapiecz�towa� zewn�trzn� bram� �wi�tyni. �aden z nich nie prze�y� tego rytua�u.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Jedynie ja pozosta�em, aby by� �wiadkiem tych wydarze�.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Oby RADEMES przez ca�� wieczno�� gni� wewn�trz �wi�tyni!");
	}
	else
	{
		Doc_PrintLines(ndocid,0,"QUARHODRON Ygc slje asdkjhnead. KHARDIMON Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh. Fjewheege Egdgsmkd Esfjwedbwe asdkjhnead. Gkjsdhad Uhnd.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Revfnbrebuiwe ewohjfribwe wef. Sebnejbuwd Weinfiwjf Ihwqpjrnn.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Erfjkemvfj RADEMES Fjewheege Egdgsmkd!");
		b_say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITMI_ADDON_KOMPASS_MIS(C_ITEM)
{
	name = "Z�oty kompas";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItMi_Compass_01.3DS";
	material = MAT_STONE;
	description = name;
};

instance ITSE_ADDON_FRANCISCHEST(C_ITEM)
{
	name = "Skrzynia ze skarbem";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_GoldChest.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = francischest;
	description = "Skrzynia ze skarbem";
	text[0] = "Skrzynia jest dosy� ci�ka.";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void francischest()
{
	CreateInvItems(hero,itmi_goldchest,1);
	CreateInvItems(hero,itmw_francisdagger_mis,1);
	CreateInvItems(hero,itmi_gold,153);
	CreateInvItems(hero,itmi_goldcup,1);
	CreateInvItems(hero,itmi_silvernecklace,1);
	CreateInvItems(hero,itwr_addon_francisabrechnung_mis,1);
	Snd_Play("Geldbeutel");
	PrintS("Zdoby�em stert� r�nych rzeczy.");
};


instance ITWR_ADDON_FRANCISABRECHNUNG_MIS(C_ITEM)
{
	name = "Wynagrodzenie";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usefrancisabrechnung_mis;
};


func void usefrancisabrechnung_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Statek kupiecki 'Syrena'");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Suma �up�w: 14560");
	Doc_PrintLine(ndocid,0,"-----------------------");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Za�oga       : 9840");
	Doc_PrintLine(ndocid,0,"Oficerowie   : 2500");
	Doc_PrintLine(ndocid,0,"Kapitan      : 1200");
	Doc_PrintLine(ndocid,0,"----------------------------");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"moja dzia�ka  : 2220");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Fregata 'Miriam'");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Suma �up�w: 4890");
	Doc_PrintLine(ndocid,0,"----------------------------");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Za�oga       : 2390");
	Doc_PrintLine(ndocid,0,"Oficerowie   : 500");
	Doc_PrintLine(ndocid,0,"Kapitan      : 500");
	Doc_PrintLine(ndocid,0,"----------------------------");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"moja dzia�ka  : 1000");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Statek handlowy 'Nico'");
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Suma �up�w: 9970");
	Doc_PrintLine(ndocid,1,"----------------------------");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Za�oga       : 5610");
	Doc_PrintLine(ndocid,1,"Oficerowie   : 1500");
	Doc_PrintLine(ndocid,1,"Kapitan      : 1000");
	Doc_PrintLine(ndocid,1,"----------------------------");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"moja dzia�ka  : 1860");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Statek kupiecki 'Maria'");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Suma �up�w: 7851");
	Doc_PrintLine(ndocid,1,"----------------------------");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Za�oga       : 4000");
	Doc_PrintLine(ndocid,1,"Oficerowie   : 750");
	Doc_PrintLine(ndocid,1,"Kapitan      : 1000");
	Doc_PrintLine(ndocid,1,"----------------------------");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"moja dzia�ka  : 1701");
	Doc_PrintLine(ndocid,1,"");
	FRANCIS_HASPROOF = TRUE;
	Doc_Show(ndocid);
	b_say(self,self,"$ADDON_THISLITTLEBASTARD");
};


instance ITWR_ADDON_GREGSLOGBUCH_MIS(C_ITEM)
{
	name = "Dziennik";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_01.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Dziennik Grega";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usegregslogbuch;
};


func void usegregslogbuch()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLines(ndocid,0,"Mam ju� do�� tej pla�y! Wok� tylko piasek. Nie mog� nawet spa�, bo mnie wsz�dzie sw�dzi. Czas, �eby Kruk w ko�cu sypn�� z�otem za wi�ni�w i �eby�my w ko�cu st�d odp�yn�li. Co� mi si� zdaje, �e musz� powa�nie pogada� z tym bufonem.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Co ten pacan sobie wyobra�a? Kaza� odprawi� mnie z kwitkiem swoim �mierdz�cym najemnikom. Wkr�tce si� dowie, z kim ma do czynienia. Na pocz�tek za�atwi� tego s�u�alca Bloodwyna.");
	Doc_PrintLines(ndocid,0,"Je�li wkr�tce nie zap�aci, b�d� musia� zrobi� si� naprawd� niemi�y.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLines(ndocid,1,"Bandyci si� rozzuchwalili. Wci�� nie zap�acili za ostatni transport. Po prostu za ma�o wiemy. Musz� wybada�, co planuje Kruk.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Wezm� wi�kszo�� za�ogi na kontynent i zabezpieczymy rud�. Francis zostanie z paroma lud�mi i ufortyfikuje ob�z.");
	Doc_PrintLines(ndocid,1,"Aby mie� pewno��, �e ka�dy ma zaj�cie, da�em Bonesowi zbroj�. Przekradnie si� w niej do obozu bandyt�w i dowie si�, co knuje Kruk.");
	GREG_GAVEARMORTOBONES = TRUE;
	Doc_Show(ndocid);
};


instance ITKE_ADDON_BLOODWYN_01(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Klucz Bloodwyna";
	text[2] = "Pasuje do skrzyni";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_ADDON_HEILER(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Klucz kamiennego stra�nika";
	text[2] = "Pasuje do skrzyni";
	text[3] = "w dziwnym budynku na bagnie";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_TEMPELTORKEY(C_ITEM)
{
	name = "Kamienna tablica Quarhodrona";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_STONE;
	scemename = "MAP";
	on_state[0] = use_tempeltorkey;
	text[2] = "Klucz do �wi�tyni Adanosa";
};


func void use_tempeltorkey()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Maya_Stoneplate_03.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"  Jhehedra Akhantar");
	Doc_Show(ndocid);
};


instance ITMI_ADDON_BLOODWYN_KOPF(C_ITEM)
{
	name = "G�owa Bloodwyna";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Head_Bloodwyn_01.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_ADDON_TREASUREMAP(C_ITEM)
{
	name = "Mapa do skarbu";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_treasuremap;
	description = name;
	text[0] = "";
	text[1] = "Na mapie s� zaznaczone jakie� miejsca.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_treasuremap()
{
	var int document;
	if(Npc_IsPlayer(self))
	{
		b_setplayermap(itwr_addon_treasuremap);
	};
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_AddonWorld_Treasures.tga",TRUE);
	Doc_SetLevel(document,"Addon\AddonWorld.zen");
	Doc_SetLevelCoords(document,-47783,36300,43949,-32300);
	Doc_Show(document);
};


instance ITMI_ADDON_GREGSTREASUREBOTTLE_MIS(C_ITEM)
{
	name = "Wiadomo�� w butelce";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Water.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_gregsbottle;
	scemename = "MAPSEALED";
	description = name;
	text[2] = "W �rodku jest kawa�ek papieru";
};


func void use_gregsbottle()
{
	b_playerfinditem(itwr_addon_treasuremap,1);
};


instance ITMI_EROLSKELCH(C_ITEM)
{
	name = "P�kni�ta srebrna misa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 125;
	visual = "ItMi_SilverChalice.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

