
func void player_mob_missing_key_or_lockpick()
{
	//PrintS(PRINT_Picklock_or_KeyMissing);
	PrintS_Ext(PRINT_Picklock_or_KeyMissing, White());
	AI_PlayAni(self,"T_DONTKNOW");
	B_Say_Overlay(self,self,"$PICKLOCKORKEYMISSING");
};

func void player_mob_missing_key()
{
	//PrintS(PRINT_KeyMissing);
	PrintS_Ext(PRINT_KeyMissing, White());
	AI_PlayAni(self,"T_DONTKNOW");
	B_Say_Overlay(self,self,"$KEYMISSING");
};

func void player_mob_missing_lockpick()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		//PrintS(PRINT_NoPicklockTalent);
		PrintS_Ext(PRINT_NoPicklockTalent, White());
		AI_PlayAni(self,"T_DONTKNOW");
		B_Say_Overlay(self,self,"$NOPICKLOCKTALENT");
	}
	else
	{
		//PrintS(PRINT_PicklockMissing);
		PrintS_Ext(PRINT_PicklockMissing, White());
		AI_PlayAni(self,"T_DONTKNOW");
		B_Say_Overlay(self,self,"$PICKLOCKMISSING");
	};
};

func void player_mob_never_open()
{
	//PrintS(PRINT_NeverOpen);
	PrintS_Ext(PRINT_NeverOpen, White());
	AI_PlayAni(self,"T_DONTKNOW");
};

func void player_mob_missing_item()
{
	//PrintS(PRINT_MissingItem);
	PrintS_Ext(PRINT_MissingItem, White());
	AI_PlayAni(self,"T_DONTKNOW");
	B_Say_Overlay(self,self,"$MISSINGITEM");
};

func void player_mob_another_is_using()
{
	//PrintS(PRINT_AnotherUser);
	PrintS_Ext(PRINT_AnotherUser, White());
	AI_PlayAni(self,"T_DONTKNOW");
};

func void player_mob_too_far_away()
{
	//PrintS(PRINT_Toofar_Away);
	PrintS_Ext(PRINT_Toofar_Away, White());
	AI_PlayAni(self,"T_DONTKNOW");
};

func void player_mob_wrong_side()
{
	//PrintS(PRINT_WrongSide);
	PrintS_Ext(PRINT_WrongSide, White());
	AI_PlayAni(self,"T_DONTKNOW");
};

func void player_trade_not_enough_gold()
{
	//PrintS(PRINT_Trade_Not_Enough_Gold);
	PrintS_Ext(PRINT_Trade_Not_Enough_Gold, White());
};
