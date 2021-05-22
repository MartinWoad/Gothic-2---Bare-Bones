
instance STANDARDBRIEF(C_ITEM)
{
	name = "List";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usestandardbrief;
	scemename = "MAP";
	description = "Typowy List";
};


func void usestandardbrief()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"TypowyList");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla");
	Doc_Show(ndocid);
};


instance STANDARDBUCH(C_ITEM)
{
	name = "Typowa Ksi¹¿ka";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Typowa Ksi¹¿ka";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usestandardbuch;
};


func void usestandardbuch()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"TypowaKsi¹¿ka Strona 1");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,0,"Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bBla blaBla blaBla blaBlaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"TypowaKsi¹¿ka Strona 2");
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla");
	Doc_Show(ndocid);
};


instance ITWR_MAP_NEWWORLD(C_ITEM)
{
	name = "Mapa Terenów Khorinis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_map_newworld;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_map_newworld()
{
	var int document;
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_NewWorld.tga",TRUE);
	Doc_SetLevel(document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(document,-28000,50500,95500,-42500);
	Doc_Show(document);
};


instance ITWR_MAP_NEWWORLD_CITY(C_ITEM)
{
	name = "Mapa Miasta Khorinis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 50;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_map_newworld_city;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_map_newworld_city()
{
	var int document;
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_NewWorld_City.tga",TRUE);
	Doc_SetLevel(document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(document,-6900,11800,21600,-9400);
	Doc_Show(document);
};


instance ITWR_MAP_OLDWORLD(C_ITEM)
{
	name = "Mapa Górniczej Doliny";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 350;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_map_oldworld;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_map_oldworld()
{
	var int document;
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_OldWorld.tga",TRUE);
	Doc_SetLevel(document,"OldWorld\OldWorld.zen");
	Doc_SetLevelCoords(document,-78500,47500,54000,-53000);
	Doc_Show(document);
};


var int lerne_einhand;
var int lerne_zweihand;

instance ITWR_EINHANDBUCH(C_ITEM)
{
	name = "Sztuka Walki";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 5000;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Kunszt Obronny Po³udniowców";
	text[2] = "Ksi¹¿ka opisuj¹ca sztukê";
	text[3] = "walki broniami jednorêcznymi.";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = useeinhandbuch;
};


func void useeinhandbuch()
{
	var int ndocid;
	if((self.hitchance[NPC_TALENT_1H] >= 60) && (LERNE_EINHAND == FALSE))
	{
		Print("To dla ciebie zbyt oczywiste, ¿eby czegoœ siê nauczyæ.");
		LERNE_EINHAND = TRUE;
	}
	else if(LERNE_EINHAND == FALSE)
	{
		b_addfightskill(self,NPC_TALENT_1H,1,TRUE);
		Print(PRINT_LEARN1H);
		LERNE_EINHAND = TRUE;
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Red_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Red_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Kunszt Obronny Po³udniowców");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Po³udniowiec w porównaniu z mieszkañcem pó³nocy nie polega tak bardzo na sile fizycznej, preferuj¹c zwinnoœæ, a gor¹cy klimat jego ojczyzny zmusza go do korzystania z l¿ejszych i daj¹cych wiêksz¹ swobodê ruchów pancerzy. W zwi¹zku z tym styl walki ludzi po³udnia jest ca³kowicie inny od tego, do którego jesteœmy przyzwyczajeni. ");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,1,"");
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Prawdopodobnie najs³ynniejszym manewrem wywodz¹cym siê z po³udnia jest jednorêczny blok po³¹czony z krokiem wstecz: cofniêcie siê pozwala na zmniejszenie si³y wrogiego ciosu i umo¿liwia przyjêcie postawy u³atwiaj¹cej wyprowadzenie kontrataku.");
	Doc_PrintLine(ndocid,1,"");
	Doc_Show(ndocid);
};


instance ITWR_ZWEIHANDBUCH(C_ITEM)
{
	name = "Taktyka Walki";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 5000;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Bloki Dwurêczne";
	text[2] = "Ksi¹¿ka opisuj¹ca sztukê";
	text[3] = "walki broniami dwurêcznymi.";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usezweihandbuch;
};


func void usezweihandbuch()
{
	var int ndocid;
	if((self.hitchance[NPC_TALENT_2H] >= 60) && (LERNE_ZWEIHAND == FALSE))
	{
		Print("To dla ciebie zbyt oczywiste, ¿eby czegoœ siê nauczyæ.");
		LERNE_EINHAND = TRUE;
	}
	else if(LERNE_ZWEIHAND == FALSE)
	{
		b_addfightskill(self,NPC_TALENT_2H,1,TRUE);
		Print(PRINT_LEARN2H);
		LERNE_ZWEIHAND = TRUE;
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Red_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Red_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Bloki Dwurêczne");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Blokowanie ciosów przeciwnika za pomoc¹ broni dwurêcznej umo¿liwia silnym wojownikom gwa³towne powstrzymanie wroga i przerwanie ewentualnej kombinacji jego ciosów. ");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"");
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Zatrzymany w ten sposób przeciwnik traci inicjatywê i ³atwiej go potem skutecznie zaatakowaæ.    ");
	Doc_Show(ndocid);
};

