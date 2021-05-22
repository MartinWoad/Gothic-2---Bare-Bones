
const int SPL_Cost_PalLightHeal = 5;
const int SPL_Cost_PalMediumHeal = 10;
const int SPL_Cost_PalFullHeal = 15;
const int SPL_Cost_LightHeal = 5;
const int SPL_Cost_MediumHeal = 7;
const int SPL_Cost_FullHeal = 15;
const int SPL_Heal_PalLightHeal = 100;
const int SPL_Heal_PalMediumHeal = 200;
const int SPL_Heal_PalFullHeal = 400;
const int SPL_Heal_LightHeal = 100;
const int SPL_Heal_MediumHeal = 200;
const int SPL_Heal_FullHeal = 400;

instance Spell_Heal(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_CASTER;
	canTurnDuringInvest = 0;
};

instance Spell_PalHeal(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_CASTER;
	canTurnDuringInvest = 0;
};


func int Spell_Logic_PalLightHeal(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_PalLightHeal)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int Spell_Logic_PalMediumHeal(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_PalMediumHeal)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int Spell_Logic_PalFullHeal(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_PalFullHeal)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int Spell_Logic_LightHeal(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_LightHeal)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int Spell_Logic_MediumHeal(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_MediumHeal)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int Spell_Logic_FullHeal(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_FullHeal)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Heal()
{
	if(Npc_GetActiveSpell(self) == SPL_LightHeal)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_LightHeal;
		Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_Heal_LightHeal);
		return;
	};
	if(Npc_GetActiveSpell(self) == SPL_MediumHeal)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_MediumHeal;
		Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_Heal_MediumHeal);
		return;
	};
	if(Npc_GetActiveSpell(self) == SPL_FullHeal)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_FullHeal;
		Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_Heal_FullHeal);
		return;
	};
};

func void Spell_Cast_PalHeal()
{
	if(Npc_GetActiveSpell(self) == SPL_PalLightHeal)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_PalLightHeal;
		Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_Heal_PalLightHeal);
		return;
	};
	if(Npc_GetActiveSpell(self) == SPL_PalMediumHeal)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_PalMediumHeal;
		Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_Heal_PalMediumHeal);
		return;
	};
	if(Npc_GetActiveSpell(self) == SPL_PalFullHeal)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_PalFullHeal;
		Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_Heal_PalFullHeal);
		return;
	};
};

