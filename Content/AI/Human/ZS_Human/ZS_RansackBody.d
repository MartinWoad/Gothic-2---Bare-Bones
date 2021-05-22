
func void ZS_RansackBody()
{
	Perception_Set_Normal();
	AI_Standup(self);
	AI_GotoNpc(self,other);
};

func int ZS_RansackBody_Loop()
{
	return LOOP_END;
};

func void ZS_RansackBody_End()
{
	var int x;
	B_TurnToNpc(self,other);
	AI_PlayAni(self,"T_PLUNDER");
	if((Npc_HasItems(other,Holy_Hammer_MIS) > 0) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Garwig)))
	{
		CreateInvItems(self,Holy_Hammer_MIS,1);
		Npc_RemoveInvItems(other,Holy_Hammer_MIS,1);
	};
	if((Npc_HasItems(other,ItMw_2h_Rod) > 0) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rod)))
	{
		CreateInvItems(self,ItMw_2h_Rod,1);
		Npc_RemoveInvItems(other,ItMw_2h_Rod,1);
		AI_EquipBestMeleeWeapon(self);
	};
	if(Npc_HasItems(other,ItMi_Gold) > 0)
	{
		x = Npc_HasItems(other,ItMi_Gold);
		CreateInvItems(self,ItMi_Gold,x);
		Npc_RemoveInvItems(other,ItMi_Gold,x);
		B_Say(self,other,"$ITOOKYOURGOLD");
	}
	else
	{
		B_Say(self,other,"$SHITNOGOLD");
	};
	Npc_PerceiveAll(self);
	if(Wld_DetectItem(self,ITEM_KAT_NF) || Wld_DetectItem(self,ITEM_KAT_FF))
	{
		if(Npc_GetDistToItem(self,item) < 500)
		{
			AI_TakeItem(self,item);
			B_Say(self,self,"$ITAKEYOURWEAPON");
			AI_EquipBestMeleeWeapon(self);
			AI_EquipBestRangedWeapon(self);
		};
	};
	AI_StartState(self,ZS_HealSelf,0,"");
};

