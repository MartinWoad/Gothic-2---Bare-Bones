
const int COLL_DONOTHING = 0;
const int COLL_DOEVERYTHING = 1;
const int COLL_APPLYDAMAGE = 2;
const int COLL_APPLYHALVEDAMAGE = 4;
const int COLL_APPLYDOUBLEDAMAGE = 8;
const int COLL_APPLYVICTIMSTATE = 16;
const int COLL_DONTKILL = 32;

func int C_CanNpcCollideWithSpell(var int spellType)
{
	var C_Npc her;
	if((spellType == SPL_Zap) || (spellType == SPL_ChargeZap) || (spellType == SPL_WindFist) || (spellType == SPL_ConcussionBolt))
	{
		if((spellType == SPL_WindFist) && (Npc_GetDistToNpc(other,self) >= 1000))
		{
			return COLL_DONOTHING;
		};
		if(C_NpcIsDown(self) || (self.guild == GIL_STONEGOLEM) || (self.guild == GIL_ICEGOLEM) || (self.guild == GIL_FIREGOLEM) || (self.guild == GIL_SUMMONED_GOLEM) || (self.guild == GIL_DEMON) || (self.guild == GIL_SUMMONED_DEMON) || (self.guild == GIL_TROLL) || (self.guild == GIL_SUMMONED_GOLEM) || (self.guild == GIL_DRAGON))
		{
			return COLL_DONOTHING;
		};
		return COLL_APPLYDAMAGE | COLL_DONTKILL;
	};
	if((spellType == SPL_ChargeFireball) || (spellType == SPL_InstantFireball) || (spellType == SPL_Firerain) || (spellType == SPL_Firebolt) || (spellType == SPL_Firestorm) || (spellType == SPL_Pyrokinesis) || (spellType == SPL_Deathbolt) || (spellType == SPL_Deathball))
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};
		if((self.guild == GIL_FIREGOLEM) || (self.guild == GIL_STONEGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGONSNAPPER) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE) || (self.guild == GIL_DEMON) || (self.guild == GIL_SUMMONED_DEMON))
		{
			if((spellType == SPL_Deathbolt) || (spellType == SPL_Deathball))
			{
				return COLL_APPLYHALVEDAMAGE;
			};
			return COLL_DONOTHING;
		};
		if(self.guild == GIL_ICEGOLEM)
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		if((self.guild == GIL_STONEGOLEM) || (self.guild == GIL_ICEGOLEM) || (self.guild == GIL_FIREGOLEM) || (self.guild == GIL_SUMMONED_GOLEM) || (self.guild == GIL_DEMON) || (self.guild == GIL_SUMMONED_DEMON) || (self.guild == GIL_TROLL) || (self.guild == GIL_SUMMONED_GOLEM) || (self.guild == GIL_DRAGON))
		{
			return COLL_APPLYDAMAGE;
		};
	};
	if((spellType == SPL_IceCube) || (spellType == SPL_IceWave) || (spellType == SPL_Icebolt))
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};
		if((self.guild == GIL_FIREGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		if((self.guild == GIL_ICEGOLEM) || (self.guild == GIL_STONEGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_Icewolf) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE))
		{
			return COLL_DONOTHING;
		};
		if((self.guild == GIL_STONEGOLEM) || (self.guild == GIL_ICEGOLEM) || (self.guild == GIL_FIREGOLEM) || (self.guild == GIL_SUMMONED_GOLEM) || (self.guild == GIL_DEMON) || (self.guild == GIL_SUMMONED_DEMON) || (self.guild == GIL_TROLL) || (self.guild == GIL_SUMMONED_GOLEM) || (self.guild == GIL_DRAGON))
		{
			return COLL_APPLYDAMAGE;
		};
		if(C_NpcIsUndead(self))
		{
			return COLL_APPLYVICTIMSTATE;
		};
		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_LightningFlash)
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};
		if(C_NpcIsDown(self) || (self.guild == GIL_STONEGOLEM) || (self.guild == GIL_ICEGOLEM) || (self.guild == GIL_FIREGOLEM) || (self.guild == GIL_SUMMONED_GOLEM) || (self.guild == GIL_DEMON) || (self.guild == GIL_SUMMONED_DEMON) || (self.guild == GIL_TROLL) || (self.guild == GIL_SUMMONED_GOLEM) || (self.guild == GIL_DRAGON))
		{
			return COLL_APPLYDAMAGE;
		};
		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_Fear)
	{
		if((self.guild != GIL_DEMON) && (self.guild != GIL_FIREGOLEM) && (self.guild != GIL_ICEGOLEM) && (self.guild != GIL_STONEGOLEM) && (self.guild != GIL_SUMMONED_GOLEM) && (self.guild != GIL_SWAMPSHARK) && (self.guild != GIL_TROLL) && (self.guild != GIL_SKELETON) && (self.guild != GIL_SUMMONED_SKELETON) && (self.guild != GIL_ZOMBIE) && (self.guild != GIL_SUMMONED_DEMON) && (self.guild != GIL_DRAGON) && (C_NpcIsGateGuard(self) == FALSE))
		{
			return COLL_DOEVERYTHING;
		};
		return COLL_DONOTHING;
	};
	if(spellType == SPL_DestroyUndead)
	{
		if(C_NpcIsUndead(self))
		{
			return COLL_DOEVERYTHING;
		}
		else if(self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD)
		{
			return COLL_APPLYHALVEDAMAGE;
		}
		else
		{
			return COLL_DONOTHING;
		};
	};
	her = Hlp_GetNpc(PC_Hero);
	if(spellType == SPL_BreathOfDeath)
	{
		if((Npc_GetDistToNpc(other,self) >= 1000) || C_NpcIsUndead(self) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD) || (self.guild == GIL_DEMON) || (self.guild == GIL_SUMMONED_DEMON))
		{
			return COLL_DONOTHING;
		};
		if(self.guild != GIL_DRAGON)
		{
			return COLL_DOEVERYTHING;
		}
		else
		{
			return COLL_APPLYHALVEDAMAGE;
		};
		return COLL_DONOTHING;
	};
	if(spellType == SPL_MassDeath)
	{
		if((self.aivar[AIV_MM_REAL_ID] != ID_DRAGON_UNDEAD) && (self.guild != GIL_DEMON) && (self.guild != GIL_SUMMONED_DEMON) && !C_NpcIsUndead(self) && (self.guild != GIL_STONEGOLEM) && (self.guild != GIL_ICEGOLEM) && (self.guild != GIL_FIREGOLEM) && (self.guild != GIL_SUMMONED_GOLEM))
		{
			return COLL_DOEVERYTHING;
		};
		return COLL_DONOTHING;
	};
	if(spellType == SPL_MasterOfDisaster)
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};
	};
	if(spellType == SPL_Shrink)
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE) || (self.guild == GIL_DRAGON))
		{
			return COLL_DONOTHING;
		};
	};
	if((spellType == SPL_PalRepelEvil) || (spellType == SPL_PalDestroyEvil) || (spellType == SPL_PalHolyBolt))
	{
		if(C_NpcIsEvil(self) && (self.guild != GIL_BDT) && (self.guild != GIL_ORC) && (self.guild != GIL_ORC) && (self.guild != GIL_DRACONIAN))
		{
			if(self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD)
			{
				return COLL_APPLYHALVEDAMAGE;
			};
			if((self.guild == GIL_DRAGON) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGONSNAPPER) || (self.aivar[AIV_MM_REAL_ID] == ID_WARG))
			{
				return COLL_APPLYHALVEDAMAGE;
			}
			else
			{
				return COLL_DOEVERYTHING;
			};
		};
		return COLL_DONOTHING;
	};
	return COLL_DOEVERYTHING;
};
