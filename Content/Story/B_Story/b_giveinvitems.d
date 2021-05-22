
func int B_GiveInvItems(var C_Npc giver,var C_Npc taker,var int itemInstance,var int amount)
{
	var string concatText;
	if(Npc_IsPlayer(giver))
	{
		if(amount > Npc_HasItems(giver,itemInstance))
		{
			return FALSE;
		};
	};
	Npc_RemoveInvItems(giver,itemInstance,amount);
	CreateInvItems(taker,itemInstance,amount);
	if(Npc_IsPlayer(giver))
	{
		if(itemInstance == ItMi_Gold)
		{
			concatText = ConcatStrings(IntToString(amount),PRINT_GoldGegeben);
			AI_PrintScreen(concatText,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
		}
		else if(amount == 1)
		{
			AI_PrintScreen(PRINT_ItemGegeben,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
		}
		else
		{
			concatText = ConcatStrings(IntToString(amount),PRINT_ItemsGegeben);
			AI_PrintScreen(concatText,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
		};
	}
	else if(Npc_IsPlayer(taker))
	{
		if(itemInstance == ItMi_Gold)
		{
			concatText = ConcatStrings(IntToString(amount),PRINT_GoldErhalten);
			AI_PrintScreen(concatText,-1,YPOS_GoldTaken,FONT_ScreenSmall,2);
		}
		else if(amount == 1)
		{
			AI_PrintScreen(PRINT_ItemErhalten,-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		}
		else
		{
			concatText = ConcatStrings(IntToString(amount),PRINT_ItemsErhalten);
			AI_PrintScreen(concatText,-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		};
	};
	return TRUE;
};

