
func int B_SelectSpell(var C_Npc slf,var C_Npc oth)
{
	if((slf.npcType == NPCTYPE_FRIEND) && Npc_IsPlayer(oth) && (oth.guild < GIL_SEPERATOR_HUM))
	{
		if((slf.guild == GIL_KDF) || (slf.aivar[AIV_MagicUser] == MAGIC_ALWAYS))
		{
			if(Npc_HasItems(slf,ItRu_Sleep) == 0)
			{
				CreateInvItems(slf,ItRu_Sleep,1);
			};
			B_ReadySpell(slf,SPL_Sleep,SPL_Cost_Sleep);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if((slf.guild == GIL_DMT) && (slf.aivar[AIV_MagicUser] == MAGIC_ALWAYS))
	{
		if((oth.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_GOLEM) || (oth.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_DEMON))
		{
			if(Npc_HasItems(slf,ItRu_LightningFlash) == 0)
			{
				CreateInvItems(slf,ItRu_LightningFlash,1);
			};
			B_ReadySpell(slf,SPL_LightningFlash,SPL_Cost_LightningFlash);
		}
		else if(oth.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_SKELETON)
		{
			if(Npc_HasItems(slf,ItRu_HarmUndead) == 0)
			{
				CreateInvItems(slf,ItRu_HarmUndead,1);
			};
			B_ReadySpell(slf,SPL_DestroyUndead,SPL_Cost_DESTROYUNDEAD);
		}
		else if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_1299_OberDementor_DI)) && (Npc_GetDistToNpc(oth,slf) >= 1000))
		{
			if(Npc_HasItems(slf,ItRu_Deathball) == 0)
			{
				CreateInvItems(slf,ItRu_Deathball,1);
			};
			B_ReadySpell(slf,SPL_Deathball,SPL_COST_Deathball);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_1299_OberDementor_DI))
		{
			if(Npc_HasItems(slf,ItRu_BreathOfDeath) == 0)
			{
				CreateInvItems(slf,ItRu_BreathOfDeath,1);
			};
			B_ReadySpell(slf,SPL_BreathOfDeath,SPL_Cost_BreathOfDeath);
		}
		else if((MIS_ReadyforChapter4 == FALSE) && (Kapitel < 4))
		{
			if(Npc_HasItems(slf,ItRu_InstantFireball) == 0)
			{
				CreateInvItems(slf,ItRu_InstantFireball,1);
			};
			B_ReadySpell(slf,SPL_InstantFireball,SPL_COST_InstantFireball);
		}
		else if((Kapitel < 6) && (Npc_GetDistToNpc(oth,slf) >= 1000))
		{
			if(Npc_HasItems(slf,ItRu_Deathball) == 0)
			{
				CreateInvItems(slf,ItRu_Deathball,1);
			};
			B_ReadySpell(slf,SPL_Deathbolt,SPL_COST_Deathbolt);
		}
		else if(Kapitel < 6)
		{
			if(Npc_HasItems(slf,ItRu_BreathOfDeath) == 0)
			{
				CreateInvItems(slf,ItRu_BreathOfDeath,1);
			};
			B_ReadySpell(slf,SPL_BreathOfDeath,SPL_Cost_BreathOfDeath);
		}
		else if(Npc_GetDistToNpc(oth,slf) >= 1000)
		{
			if(Npc_HasItems(slf,ItRu_Deathbolt) == 0)
			{
				CreateInvItems(slf,ItRu_Deathbolt,1);
			};
			B_ReadySpell(slf,SPL_Deathbolt,SPL_COST_Deathbolt);
		}
		else
		{
			if(Npc_HasItems(slf,ItRu_BreathOfDeath) == 0)
			{
				CreateInvItems(slf,ItRu_BreathOfDeath,1);
			};
			B_ReadySpell(slf,SPL_BreathOfDeath,SPL_Cost_BreathOfDeath);
		};
		return TRUE;
	};
	if((slf.guild == GIL_KDF) || (slf.aivar[AIV_MagicUser] == MAGIC_ALWAYS))
	{
		if(Npc_HasItems(slf,ItRu_Concussionbolt) == 0)
		{
			CreateInvItems(slf,ItRu_Concussionbolt,1);
		};
		if(Npc_HasItems(slf,ItRu_InstantFireball) == 0)
		{
			CreateInvItems(slf,ItRu_InstantFireball,1);
		};
		if(Npc_HasItems(slf,ItRu_Deathball) == 0)
		{
			CreateInvItems(slf,ItRu_Deathball,1);
		};
		if(Npc_HasItems(slf,ItRu_FullHeal) == 0)
		{
			CreateInvItems(slf,ItRu_FullHeal,1);
		};
		if(self.attribute[ATR_HITPOINTS] < 100)
		{
			B_ReadySpell(slf,SPL_FullHeal,SPL_Cost_FullHeal);
			return TRUE;
		}
		else if((oth.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_GOLEM) || (oth.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_DEMON))
		{
			if(Npc_HasItems(slf,ItRu_LightningFlash) == 0)
			{
				CreateInvItems(slf,ItRu_LightningFlash,1);
			};
			B_ReadySpell(slf,SPL_LightningFlash,SPL_Cost_LightningFlash);
			return TRUE;
		}
		else if(oth.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_SKELETON)
		{
			if(Npc_HasItems(slf,ItRu_HarmUndead) == 0)
			{
				CreateInvItems(slf,ItRu_HarmUndead,1);
			};
			B_ReadySpell(slf,SPL_DestroyUndead,SPL_Cost_DESTROYUNDEAD);
			return TRUE;
		}
		else if(oth.guild > GIL_SEPERATOR_HUM)
		{
			if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(VLK_439_Vatras)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(VLK_439_Vatras_DI)))
			{
				if(Npc_HasItems(slf,ItRu_ThunderBall) == 0)
				{
					CreateInvItems(slf,ItRu_ThunderBall,1);
				};
				B_ReadySpell(slf,SPL_ChargeZap,SPL_COST_ChargeZap);
			}
			else
			{
				B_ReadySpell(slf,SPL_InstantFireball,SPL_COST_InstantFireball);
			};
			return TRUE;
		}
		else if(C_NpcHasAttackReasonToKill(self))
		{
			if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(VLK_439_Vatras)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(VLK_439_Vatras_DI)))
			{
				if(Npc_HasItems(slf,ItRu_ThunderBall) == 0)
				{
					CreateInvItems(slf,ItRu_ThunderBall,1);
				};
				B_ReadySpell(slf,SPL_ChargeZap,SPL_COST_ChargeZap);
			}
			else
			{
				B_ReadySpell(slf,SPL_InstantFireball,SPL_COST_InstantFireball);
			};
			return TRUE;
		}
		else
		{
			B_ReadySpell(slf,SPL_ConcussionBolt,SPL_COST_Concussionbolt);
			return TRUE;
		};
	};
	if(slf.guild == GIL_PAL)
	{
		if(slf.fight_tactic == FAI_NAILED)
		{
			return FALSE;
		};
		if(Npc_HasItems(slf,ItRu_PalHolyBolt) == 0)
		{
			CreateInvItems(slf,ItRu_PalHolyBolt,1);
		};
		if((Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE) && (C_NpcIsEvil(oth) && (oth.guild != GIL_BDT)))
		{
			B_ReadySpell(slf,SPL_PalHolyBolt,SPL_Cost_PalHolyBolt);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(slf.guild == GIL_SKELETON_MAGE)
	{
		if(Npc_HasItems(slf,ItRu_SumSkel) == 0)
		{
			CreateInvItems(slf,ItRu_SumSkel,1);
		};
		if(Npc_HasItems(slf,ItRu_IceCube) == 0)
		{
			CreateInvItems(slf,ItRu_IceCube,1);
		};
		if(Npc_HasItems(slf,ItRu_Icebolt) == 0)
		{
			CreateInvItems(slf,ItRu_Icebolt,1);
		};
		if(slf.aivar[AIV_SelectSpell] >= 6)
		{
			slf.aivar[AIV_SelectSpell] = 1;
		};
		if(!Npc_IsInState(oth,ZS_MagicFreeze) && (slf.aivar[AIV_SelectSpell] == 0))
		{
			B_ReadySpell(slf,SPL_IceCube,SPL_Cost_IceCube);
			return TRUE;
		}
		else if(slf.aivar[AIV_SelectSpell] == 1)
		{
			B_ReadySpell(slf,SPL_SummonSkeleton,SPL_Cost_SummonSkeleton);
			return TRUE;
		}
		else
		{
			B_ReadySpell(slf,SPL_Icebolt,SPL_COST_Icebolt);
			return TRUE;
		};
	};
	if(slf.guild == GIL_ICEGOLEM)
	{
		if(Npc_HasItems(slf,ItRu_IceCube) == 0)
		{
			CreateInvItems(slf,ItRu_IceCube,1);
		};
		if((Npc_GetDistToNpc(slf,oth) < FIGHT_DIST_MELEE) || Npc_IsInState(oth,ZS_MagicFreeze))
		{
			return FALSE;
		}
		else
		{
			B_ReadySpell(slf,SPL_IceCube,SPL_Cost_IceCube);
			return TRUE;
		};
	};
	if(slf.guild == GIL_FIREGOLEM)
	{
		if(Npc_HasItems(slf,ItRu_InstantFireball) == 0)
		{
			CreateInvItems(slf,ItRu_InstantFireball,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			B_ReadySpell(slf,SPL_InstantFireball,SPL_COST_InstantFireball);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_SWAMP)
	{
		if(Npc_HasItems(slf,ItRu_InstantFireball) == 0)
		{
			CreateInvItems(slf,ItRu_InstantFireball,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > 1000)
		{
			B_ReadySpell(slf,SPL_InstantFireball,SPL_COST_InstantFireball);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ROCK)
	{
		if(Npc_HasItems(slf,ItRu_InstantFireball) == 0)
		{
			CreateInvItems(slf,ItRu_InstantFireball,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > 1000)
		{
			B_ReadySpell(slf,SPL_InstantFireball,SPL_COST_InstantFireball);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE)
	{
		if(Npc_HasItems(slf,ItRu_InstantFireball) == 0)
		{
			CreateInvItems(slf,ItRu_InstantFireball,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > 1000)
		{
			B_ReadySpell(slf,SPL_InstantFireball,SPL_COST_InstantFireball);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE)
	{
		if(Npc_HasItems(slf,ItRu_InstantFireball) == 0)
		{
			CreateInvItems(slf,ItRu_InstantFireball,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > 1000)
		{
			B_ReadySpell(slf,SPL_InstantFireball,SPL_COST_InstantFireball);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD)
	{
		Npc_ClearAIQueue(self);
		if(Npc_HasItems(slf,ItRu_Deathball) == 0)
		{
			CreateInvItems(slf,ItRu_Deathball,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > 800)
		{
			B_ReadySpell(slf,SPL_Deathball,SPL_COST_Deathball);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN)
	{
		if(Npc_HasItems(slf,ItRu_InstantFireball) == 0)
		{
			CreateInvItems(slf,ItRu_InstantFireball,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			B_ReadySpell(slf,SPL_InstantFireball,SPL_COST_InstantFireball);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	return FALSE;
};
