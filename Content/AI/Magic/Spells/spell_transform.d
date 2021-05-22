
const int SPL_Cost_TrfSheep = 5;
const int SPL_Cost_TrfScavenger = 5;
const int SPL_Cost_TrfGiantRat = 5;
const int SPL_Cost_TrfGiantBug = 5;
const int SPL_Cost_TrfWolf = 10;
const int SPL_Cost_TrfWaran = 15;
const int SPL_Cost_TrfSnapper = 20;
const int SPL_Cost_TrfWarg = 25;
const int SPL_Cost_TrfFireWaran = 25;
const int SPL_Cost_TrfLurker = 15;
const int SPL_Cost_TrfShadowbeast = 30;
const int SPL_Cost_TrfDragonSnapper = 30;

instance Spell_Transform(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_NONE;
	canTurnDuringInvest = 0;
};


func int Spell_Logic_TrfSheep(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfSheep)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfSheep;
		Npc_SetActiveSpellInfo(self,Sheep);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int Spell_Logic_TrfScavenger(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfScavenger)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfScavenger;
		Npc_SetActiveSpellInfo(self,Scavenger);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int Spell_Logic_TrfGiantRat(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfGiantRat)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfGiantRat;
		Npc_SetActiveSpellInfo(self,Giant_Rat);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int Spell_Logic_TrfGiantBug(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfGiantBug)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfGiantBug;
		Npc_SetActiveSpellInfo(self,Giant_Bug);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int Spell_Logic_TrfWolf(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfWolf)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfWolf;
		Npc_SetActiveSpellInfo(self,Wolf);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int Spell_Logic_TrfWaran(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfWaran)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfWaran;
		Npc_SetActiveSpellInfo(self,Waran);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int Spell_Logic_TrfSnapper(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfSnapper)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfSnapper;
		Npc_SetActiveSpellInfo(self,Snapper);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int Spell_Logic_TrfWarg(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfWarg)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfWarg;
		Npc_SetActiveSpellInfo(self,Warg);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int Spell_Logic_TrfFireWaran(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfFireWaran)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfFireWaran;
		Npc_SetActiveSpellInfo(self,FireWaran);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int Spell_Logic_TrfLurker(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfLurker)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfLurker;
		Npc_SetActiveSpellInfo(self,Lurker);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int Spell_Logic_TrfShadowbeast(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfShadowbeast)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfShadowbeast;
		Npc_SetActiveSpellInfo(self,Shadowbeast);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int Spell_Logic_TrfDragonSnapper(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfDragonSnapper)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfDragonSnapper;
		Npc_SetActiveSpellInfo(self,DragonSnapper);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

