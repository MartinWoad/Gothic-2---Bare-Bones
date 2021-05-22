
var int Rethon_ItemsGiven_Chapter_1;
var int Rethon_ItemsGiven_Chapter_2;
var int Rethon_ItemsGiven_Chapter_3;
var int Rethon_ItemsGiven_Chapter_4;
var int Rethon_ItemsGiven_Chapter_5;
var int rethon_itemsgiven_chapter_6;

func void B_GiveTradeInv_Rethon(var C_Npc slf)
{
	if(Rethon_ItemsGiven_Chapter_4 == FALSE)
	{
		CreateInvItems(slf,ItMw_Inquisitor,1);
		CreateInvItems(slf,ItMw_Streitaxt2,1);
		CreateInvItems(slf,ItMw_Kriegshammer2,1);
		CreateInvItems(slf,ItMw_Orkschlaechter,1);
		CreateInvItems(slf,ItMw_Folteraxt,1);
		CreateInvItems(slf,ItMw_Krummschwert,1);
		CreateInvItems(slf,ItMw_Barbarenstreitaxt,1);
		Rethon_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Rethon_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMw_Berserkeraxt,1);
		Rethon_ItemsGiven_Chapter_5 = TRUE;
	};
	if((Kapitel >= 6) && (RETHON_ITEMSGIVEN_CHAPTER_6 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,300);
		RETHON_ITEMSGIVEN_CHAPTER_6 = TRUE;
	};
};

