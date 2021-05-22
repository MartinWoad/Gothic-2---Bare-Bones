
func int Spell_ProcessMana_Release(var int manaInvested)
{
	if(Npc_GetActiveSpell(self) == SPL_Pyrokinesis)
	{
		return SPL_SENDCAST;
	};
	if(Npc_GetActiveSpell(self) == SPL_ChargeFireball)
	{
		return SPL_SENDCAST;
	};
	if(Npc_GetActiveSpell(self) == SPL_ChargeZap)
	{
		return SPL_SENDCAST;
	};
	if(Npc_GetActiveSpell(self) == SPL_WindFist)
	{
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

