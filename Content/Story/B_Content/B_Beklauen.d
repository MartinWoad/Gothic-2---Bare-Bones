
func int C_Beklauen(var int TheftDex,var int TheftGold)
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == TRUE) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (other.attribute[ATR_DEXTERITY] >= (TheftDex - Theftdiff)) && (NpcObsessedByDMT == FALSE))
	{
		if(Npc_IsInState(self,ZS_Talk))
		{
			if(TheftDex <= 20)
			{
				TheftDexGlob = 10;
			}
			else
			{
				TheftDexGlob = TheftDex;
			};
			TheftGoldGlob = TheftGold;
		};
		return TRUE;
	};
};

func void B_Beklauen()
{
	if(other.attribute[ATR_DEXTERITY] >= TheftDexGlob)
	{
		B_StealInvItems(self,other,ItMi_Gold,TheftGoldGlob);

		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		Snd_Play("Geldbeutel");

		if(hero.attribute[ATR_DEXTERITY] - ATTRIBUTEFROMEQUIPMENT[ATR_DEXTERITY] < attributepotential[ATR_DEXTERITY])
		{
			heroDexterityExp += TheftDexGlob * 10;
			CheckWeaponLevelUp();
		};

	}
	else
	{
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};
