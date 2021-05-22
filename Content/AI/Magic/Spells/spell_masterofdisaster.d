
const int SPL_COST_MasterOfDisaster = 50;
const int SPL_DAMAGE_MasterOfDisaster = 300;

instance Spell_MasterOfDisaster(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_MasterOfDisaster;
	damagetype = DAM_MAGIC;
};


func int Spell_Logic_MasterOfDisaster(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_MasterOfDisaster)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_MasterOfDisaster()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_MasterOfDisaster;
};

