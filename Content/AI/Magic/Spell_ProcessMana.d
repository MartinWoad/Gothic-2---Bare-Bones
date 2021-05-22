
func int Spell_ProcessMana(var int manaInvested)
{
	if(Npc_GetActiveSpell(self) == SPL_PalLight)
	{
		return Spell_Logic_PalLight(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_PalLightHeal)
	{
		return Spell_Logic_PalLightHeal(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_PalHolyBolt)
	{
		return Spell_Logic_PalHolyBolt(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_PalMediumHeal)
	{
		return Spell_Logic_PalMediumHeal(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_PalRepelEvil)
	{
		return Spell_Logic_PalRepelEvil(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_PalFullHeal)
	{
		return Spell_Logic_PalFullHeal(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_PalDestroyEvil)
	{
		return Spell_Logic_PalDestroyEvil(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_PalTeleportSecret)
	{
		return Spell_Logic_PalTeleportSecret(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportSeaport)
	{
		return Spell_Logic_TeleportSeaport(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportMonastery)
	{
		return Spell_Logic_TeleportMonastery(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportFarm)
	{
		return Spell_Logic_TeleportFarm(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportXardas)
	{
		return Spell_Logic_TeleportXardas(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportPassNW)
	{
		return Spell_Logic_TeleportPassNW(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportPassOW)
	{
		return Spell_Logic_TeleportPassOW(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportOC)
	{
		return Spell_Logic_TeleportOC(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportOWDemonTower)
	{
		return Spell_Logic_TeleportOWDemonTower(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportTaverne)
	{
		return Spell_Logic_TeleportTaverne(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_Light)
	{
		return Spell_Logic_Light(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_Firebolt)
	{
		return Spell_Logic_Firebolt(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_Icebolt)
	{
		return Spell_Logic_IceBolt(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_Zap)
	{
		return Spell_Logic_Zap(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_LightHeal)
	{
		return Spell_Logic_LightHeal(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_SummonGoblinSkeleton)
	{
		return Spell_Logic_SummonGoblinSkeleton(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_InstantFireball)
	{
		return Spell_Logic_InstantFireball(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_SummonWolf)
	{
		return Spell_Logic_SummonWolf(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_WindFist)
	{
		return Spell_Logic_WindFist(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_Sleep)
	{
		return Spell_Logic_Sleep(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_MediumHeal)
	{
		return Spell_Logic_MediumHeal(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_LightningFlash)
	{
		return Spell_Logic_LightningFlash(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_ChargeFireball)
	{
		return Spell_Logic_ChargeFireball(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_ChargeZap)
	{
		return Spell_Logic_ChargeZap(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_SummonSkeleton)
	{
		return Spell_Logic_SummonSkeleton(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_Fear)
	{
		return Spell_Logic_Fear(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_IceCube)
	{
		return Spell_Logic_IceCube(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_ChargeZap)
	{
		return Spell_Logic_ChargeZap(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_SummonGolem)
	{
		return Spell_Logic_SummonGolem(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_DestroyUndead)
	{
		return Spell_Logic_DestroyUndead(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_Pyrokinesis)
	{
		return Spell_Logic_Pyrokinesis(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_Firestorm)
	{
		return Spell_Logic_Firestorm(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_IceWave)
	{
		return Spell_Logic_IceWave(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_SummonDemon)
	{
		return Spell_Logic_SummonDemon(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_FullHeal)
	{
		return Spell_Logic_FullHeal(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_Firerain)
	{
		return Spell_Logic_Firerain(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_BreathOfDeath)
	{
		return Spell_Logic_BreathOfDeath(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_MassDeath)
	{
		return Spell_Logic_Massdeath(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_ArmyOfDarkness)
	{
		return Spell_Logic_ArmyOfDarkness(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_Shrink)
	{
		return Spell_Logic_Shrink(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TrfSheep)
	{
		return Spell_Logic_TrfSheep(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TrfScavenger)
	{
		return Spell_Logic_TrfScavenger(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TrfGiantRat)
	{
		return Spell_Logic_TrfGiantRat(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TrfGiantBug)
	{
		return Spell_Logic_TrfGiantBug(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TrfWolf)
	{
		return Spell_Logic_TrfWolf(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TrfWaran)
	{
		return Spell_Logic_TrfWaran(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TrfSnapper)
	{
		return Spell_Logic_TrfSnapper(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TrfWarg)
	{
		return Spell_Logic_TrfWarg(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TrfFireWaran)
	{
		return Spell_Logic_TrfFireWaran(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TrfLurker)
	{
		return Spell_Logic_TrfLurker(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TrfShadowbeast)
	{
		return Spell_Logic_TrfShadowbeast(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TrfDragonSnapper)
	{
		return Spell_Logic_TrfDragonSnapper(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_Charm)
	{
		return Spell_Logic_Charm(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_MasterOfDisaster)
	{
		return Spell_Logic_MasterOfDisaster(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_ConcussionBolt)
	{
		return Spell_Logic_Concussionbolt(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_Deathbolt)
	{
		return Spell_Logic_Deathbolt(manaInvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_Deathball)
	{
		return Spell_Logic_Deathball(manaInvested);
	};
	return FALSE;
};

