
const int SPL_COST_Concussionbolt = 5;
const int SPL_DAMAGE_Concussionbolt = 150;

instance Spell_Concussionbolt(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_Concussionbolt;
};


func int Spell_Logic_Concussionbolt(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_Concussionbolt)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Concussionbolt()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_Concussionbolt;
};

