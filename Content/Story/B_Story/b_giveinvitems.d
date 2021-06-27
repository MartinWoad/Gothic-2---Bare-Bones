func int B_GiveInvItems(var C_Npc giver,var C_Npc taker,var int itemInstance,var int amount)
{
	var string concatText;
	//var int itemInstance; itemInstance = Hlp_GetInstanceID(item);

	if(Npc_IsPlayer(giver))
	{
		if(amount > Npc_HasItems(giver,itemInstance))
		{
			return FALSE;
		};
	};
	Npc_GetInvItem(giver, itemInstance);
	Npc_RemoveInvItems(giver,itemInstance,amount);
	CreateInvItems(taker,itemInstance,amount);
	if(Npc_IsPlayer(giver))
	{
		if(itemInstance == ItMi_Gold)
		{
			//concatText = ConcatStrings(IntToString(amount),PRINT_GoldGegeben);
			//concatText = ConcatStrings(Print_ItemReceived,IntToString(amount));
			concatText = ConcatStrings(Print_ItemGiven,item.name);
			concatText = ConcatStrings(concatText," x");
			concatText = ConcatStrings(concatText,IntToString(amount));
			//AI_PrintScreen(concatText,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
			PrintS_Ext(concatText, White());
		}
		else if(amount == 1)
		{
			//AI_PrintScreen(PRINT_ItemGegeben,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
			concatText = ConcatStrings(Print_ItemGiven,item.name);
			PrintS_Ext(concatText, White());
		}
		else
		{
			concatText = ConcatStrings(Print_ItemGiven,item.name);
			concatText = ConcatStrings(concatText," x");
			concatText = ConcatStrings(concatText,IntToString(amount));
			PrintS_Ext(concatText, White());
			//concatText = ConcatStrings(IntToString(amount),PRINT_ItemsGegeben);
			//AI_PrintScreen(concatText,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
		};
	}
	else if(Npc_IsPlayer(taker))
	{
		if(itemInstance == ItMi_Gold)
		{
			concatText = ConcatStrings(Print_ItemReceived,item.name);
			concatText = ConcatStrings(concatText," x");
			concatText = ConcatStrings(concatText,IntToString(amount));
			PrintS_Ext(concatText, White());
			//concatText = ConcatStrings(IntToString(amount),PRINT_GoldErhalten);
			//AI_PrintScreen(concatText,-1,YPOS_GoldTaken,FONT_ScreenSmall,2);
		}
		else if(amount == 1)
		{
			concatText = ConcatStrings(Print_ItemReceived,item.name);
			PrintS_Ext(concatText, White());
			//AI_PrintScreen(PRINT_ItemErhalten,-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		}
		else
		{
			concatText = ConcatStrings(Print_ItemReceived,item.name);
			concatText = ConcatStrings(concatText," x");
			concatText = ConcatStrings(concatText,IntToString(amount));
			PrintS_Ext(concatText, White());
			//concatText = ConcatStrings(IntToString(amount),PRINT_ItemsErhalten);
			//AI_PrintScreen(concatText,-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		};
	};
	return TRUE;
};

func int B_StealInvItems(var C_Npc giver,var C_Npc taker,var int itemInstance,var int amount)
{
	var string concatText;
	if(Npc_IsPlayer(giver))
	{
		if(amount > Npc_HasItems(giver,itemInstance))
		{
			return FALSE;
		};
	};
	Npc_GetInvItem(giver, itemInstance);
	Npc_RemoveInvItems(giver,itemInstance,amount);
	CreateInvItems(taker,itemInstance,amount);
	heroThefts -= item.value * amount;
	if(Npc_IsPlayer(taker))
	{
		if(itemInstance == ItMi_Gold)
		{
			//concatText = ConcatStrings(IntToString(amount),PRINT_GoldGegeben);
			//concatText = ConcatStrings(Print_ItemReceived,IntToString(amount));
			concatText = ConcatStrings(Print_ItemStolen,item.name);
			concatText = ConcatStrings(concatText," x");
			concatText = ConcatStrings(concatText,IntToString(amount));
			//AI_PrintScreen(concatText,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
			PrintS_Ext(concatText, Red());
		}
		else if(amount == 1)
		{
			//AI_PrintScreen(PRINT_ItemGegeben,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
			concatText = ConcatStrings(Print_ItemStolen,item.name);
			PrintS_Ext(concatText, Red());
		}
		else
		{
			concatText = ConcatStrings(Print_ItemStolen,item.name);
			concatText = ConcatStrings(concatText," x");
			concatText = ConcatStrings(concatText,IntToString(amount));
			PrintS_Ext(concatText, Red());
			//concatText = ConcatStrings(IntToString(amount),PRINT_ItemsGegeben);
			//AI_PrintScreen(concatText,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
		};
	};
	return TRUE;
};
