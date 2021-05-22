
func int c_npcisdangerousmonster(var C_Npc slf)
{
	if((slf.aivar[AIV_MM_REAL_ID] == ID_WARG) || (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGONSNAPPER) || (slf.aivar[AIV_MM_REAL_ID] == ID_WARAN) || (slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLER) || (slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLERWARRIOR) || (slf.aivar[AIV_MM_REAL_ID] == ID_SNAPPER) || (slf.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST) || (slf.aivar[AIV_MM_REAL_ID] == ID_HARPY) || (slf.aivar[AIV_MM_REAL_ID] == ID_STONEGOLEM) || (slf.aivar[AIV_MM_REAL_ID] == ID_FIREGOLEM) || (slf.aivar[AIV_MM_REAL_ID] == ID_ICEGOLEM) || (slf.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_GOLEM) || (slf.aivar[AIV_MM_REAL_ID] == ID_TROLL) || (slf.aivar[AIV_MM_REAL_ID] == ID_TROLL_BLACK) || (slf.aivar[AIV_MM_REAL_ID] == ID_SWAMPSHARK) || (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE) || (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE) || (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ROCK) || (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_SWAMP))
	{
		return TRUE;
	};
	return FALSE;
};

func int c_npcisdeadlymonster(var C_Npc slf)
{
	if((slf.aivar[AIV_MM_REAL_ID] == ID_WARG) || (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGONSNAPPER) || (slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLERWARRIOR) || (slf.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST) || (slf.aivar[AIV_MM_REAL_ID] == ID_STONEGOLEM) || (slf.aivar[AIV_MM_REAL_ID] == ID_FIREGOLEM) || (slf.aivar[AIV_MM_REAL_ID] == ID_ICEGOLEM) || (slf.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_GOLEM) || (slf.aivar[AIV_MM_REAL_ID] == ID_TROLL) || (slf.aivar[AIV_MM_REAL_ID] == ID_TROLL_BLACK) || (slf.aivar[AIV_MM_REAL_ID] == ID_SWAMPSHARK) || (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE) || (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE) || (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ROCK) || (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_SWAMP))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_WantToFlee(var C_Npc slf,var C_Npc oth)
{
	if(((self.guild == GIL_BAU) || (self.guild == GIL_VLK) || (self.guild == GIL_OUT) || (self.guild == GIL_BDT) || (self.guild == GIL_NOV) || (self.guild == GIL_STRF)) && (self.attribute[ATR_HITPOINTS_MAX] < 200))
	{
		if(c_npcisdangerousmonster(oth) || C_NpcIsEvil(oth))
		{
			return TRUE;
		};
	}
	else if(((self.guild == GIL_BAU) || (self.guild == GIL_VLK) || (self.guild == GIL_OUT) || (self.guild == GIL_BDT) || (self.guild == GIL_NOV) || (self.guild == GIL_STRF) || (self.guild == GIL_SLD) || (self.guild == GIL_MIL)) && (self.attribute[ATR_HITPOINTS_MAX] < 300))
	{
		if(c_npcisdeadlymonster(oth) || (C_NpcIsEvil(oth) && (oth.guild != GIL_GOBBO_SKELETON) && (oth.guild != GIL_SUMMONED_GOBBO_SKELETON)))
		{
			return TRUE;
		};
	};
	return FALSE;
};

