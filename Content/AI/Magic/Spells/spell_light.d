
const int SPL_Cost_PalLight = 5;
const int SPL_Cost_LIGHT = 5;
const int SPL_Duration_PalLIGHT = 5;
const int SPL_Duration_LIGHT = 5;

instance Spell_Light(C_Spell_Proto)
{
	time_per_mana = 500;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_NONE;
	targetCollectRange = 0;
	targetCollectAzi = 0;
	targetCollectElev = 0;
};

instance Spell_PalLight(C_Spell_Proto)
{
	time_per_mana = 500;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_NONE;
	targetCollectRange = 0;
	targetCollectAzi = 0;
	targetCollectElev = 0;
};


func int Spell_Logic_PalLight(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_PalLight)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_PalLight()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_PalLight;
};

func int Spell_Logic_Light(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_LIGHT)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Light()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_LIGHT;
};

