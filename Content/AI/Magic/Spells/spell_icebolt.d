
const int SPL_COST_Icebolt = 7;
const int SPL_DAMAGE_Icebolt = 40;

instance Spell_IceBolt(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_Icebolt;
};


func int Spell_Logic_IceBolt(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_Icebolt)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_IceBolt()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_Icebolt;
	self.aivar[AIV_SelectSpell] = self.aivar[AIV_SelectSpell] + 1;
};

