// Look for the function "DMG_OnDmg" to modify

class oSDamageDescriptor
{
	var int validFields; 		// zDWORD 0x00

	var int attackerVob; 		// zCVob* 0x04
	var int attackerNpc; 		// oCNpc* 0x08
	var int hitVob; 			// zCVob* 0x0C
	var int hitPfx;				// oCVisualFX* 0x10
	var int itemWeapon; 		// oCItem* 0x14

	var int spellID;			// zDWORD 0x18
	var int spellCat; 			// zDWORD 0x1C
	var int spellLevel;			// zDWORD 0x20

	var int dmgMode;			// zDWORD 0x24
	var int weaponMode;			// zDWORD 0x28

	var int dmgArray[8];	 	// zDWORD[8] 0x2C Vermutlich vor Abzug der Rüstungswerte
	var int dmgTotal;			// zREAL 0x4C // Nach Abzug der Rüstungswerte?
	var int dmgMultiplier;		// zREAL 0x50

	var int locationHit[3]; 	// zVEC3 0x54
	var int directionFly[3];	// zVEC3 0x58

	var string visualFXStr;		// zSTRING 0x5C

	var int duration;			// zREAL 0x60
	var int interval; 			// zREAL 0x64
	var int dmgPerInterval;		// zREAL 0x68
	var int dmgDontKill;		// zBOOL 0x6C

	var int bitfield; // 1 -> Once, 2 -> finished, 4 -> isDead, 8 -> isUnconscious

	var int azimuth;			// zREAL 0x74
	var int elevation;			// zREAL 0x78
	var int timeCurrent;		// zREAL 0x7C
	var int dmgReal;			// zREAL 0x80
	var int dmgEffective;		// zREAL 0x84
	var int dmgArrayEffective[8]; // zDWORD[8] 0x104 // Vermutlich nach Abzug der Rüstungswerte, ohne Mindestschaden
	var int vobParticleFX;		// zCVob* 0x108
	var int particleFX;			// zCParticleFX* 0x10C
	var int visualFX;			// zCVisualFX* 0x110
};

func int DMG_OnDmg(var int victimPtr, var int attackerPtr, var int dmg, var int dmgDescriptorPtr)
{
	var oSDamageDescriptor dmgDesc; dmgDesc = _^(dmgDescriptorPtr);
	var c_npc attackerNpc; attackerNpc = _^(attackerptr);
	var c_npc victimNpc; victimNpc = _^(victimPtr);

	var c_item c_item_Weapon_Attack_Count_Damage;	c_item_Weapon_Attack_Count_Damage 	= Npc_GetReadiedWeapon(attackerNpc);
	var oCItem Weapon_Attack_Count_Damage;		Weapon_Attack_Count_Damage 		= _^(MEM_InstToPtr(c_item_Weapon_Attack_Count_Damage));
	var int penetrated;

	var int DamageRoll;	DamageRoll = r_Max(99)+1;

	if (Npc_HasReadiedMeleeWeapon(attackerNpc))
	{

		var c_item tmpItm; tmpItm = Npc_GetReadiedWeapon(attackerNpc);
		var c_item wpn; wpn = Npc_GetReadiedWeapon(attackerNpc);

		var int wpnDmg; wpnDmg = tmpItm.damageTotal;

		var int armRes;
		If tmpItm.damagetype == DAM_EDGE	{ armRes = victimNpc.protection[PROT_EDGE]; }
		else if tmpItm.damagetype == DAM_BLUNT 	{ armRes = victimNpc.protection[PROT_BLUNT]; }
		else if tmpItm.damagetype == DAM_POINT 	{ armRes = victimNpc.protection[PROT_POINT]; };

		if (Weapon_Attack_Count_Damage.flags & ITEM_2HD_AXE || Weapon_Attack_Count_Damage.flags & ITEM_2HD_SWD)
		{
			dmg = (wpnDmg + attackerNpc.attribute[ATR_STRENGTH]);
			DamageRoll += attackerNpc.attribute[ATR_DEXTERITY]/5;
		}
		else ///Einhand
		{
			dmg = (wpnDmg + attackerNpc.attribute[ATR_STRENGTH]);
			DamageRoll += attackerNpc.attribute[ATR_DEXTERITY]/5;
		};

		dmg -= armRes;
		penetrated = dmg;

		if (Weapon_Attack_Count_Damage.flags & ITEM_2HD_AXE || Weapon_Attack_Count_Damage.flags & ITEM_2HD_SWD)
		{
			if(DamageRoll > (50 + attackerNpc.HitChance[NPC_TALENT_2H])/2)
			{
				dmg = dmg/10;

				if(penetrated > 0 && dmg < 5)
				{
						dmg = 5;
				};
			}
			else if(DamageRoll > (attackerNpc.HitChance[NPC_TALENT_2H]))
			{
				dmg = dmg/5;

				if(penetrated > 0 && dmg < 10)
				{
						dmg = 10;
				};
			}
			else if(DamageRoll > (attackerNpc.HitChance[NPC_TALENT_2H]/2))
			{
				dmg = dmg/2;

				if(penetrated > 0 && dmg < 15)
				{
						dmg = 15;
				};
			}
			else
			{
				if(penetrated > 0 && dmg < 20)
				{
						dmg = 20;
				};
			};
		}
		else
		{
			if(DamageRoll > (50 + attackerNpc.HitChance[NPC_TALENT_1H])/2)
			{
				dmg = dmg/10;

				if(penetrated > 0 && dmg < 5)
				{
						dmg = 5;
				};
			}
			else if(DamageRoll > (attackerNpc.HitChance[NPC_TALENT_1H]))
			{
				dmg = dmg/5;

				if(penetrated > 0 && dmg < 10)
				{
						dmg = 10;
				};
			}
			else if(DamageRoll > (attackerNpc.HitChance[NPC_TALENT_1H]/2))
			{
				dmg = dmg/2;

				if(penetrated > 0 && dmg < 15)
				{
						dmg = 15;
				};
			}
			else
			{
				if(penetrated > 0 && dmg < 20)
				{
						dmg = 20;
				};
			};
		};

	}
	else if(attackerNpc.guild > GIL_SEPERATOR_HUM)
	{

		if(DamageRoll > 75)
		{
			dmg = dmg/10;

			if(penetrated > 0 && dmg < 5)
			{
					dmg = 5;
			};
		}
		else if(DamageRoll > 50)
		{
			dmg = dmg/5;

			if(penetrated > 0 && dmg < 10)
			{
					dmg = 10;
			};
		}
		else if(DamageRoll > 25)
		{
			dmg = dmg/2;

			if(penetrated > 0 && dmg < 15)
			{
					dmg = 15;
			};

		}
		else
		{
			if(penetrated > 0 && dmg < 20)
			{
					dmg = 20;
			};
		};

	};


	//Learn Weapon Skills
	if (Npc_IsPlayer(attackerNpc))
	{
		if(victimNpc.aivar[AIV_INVINCIBLE] == FALSE && victimNpc.aivar[AIV_VictoryXPGiven] == FALSE)
		{
			var int weaponPercentage;
			var int secondaryWeaponPercentage;
			if (Weapon_Attack_Count_Damage.flags & (ITEM_SWD | ITEM_AXE))
			{
				weaponPercentage = attackerNpc.hitChance[NPC_TALENT_1H];
				secondaryWeaponPercentage = attackerNpc.hitChance[NPC_TALENT_2H];
				if(weaponPercentage < 10)
				{
					hero1hExp += dmg;
				}
				else if(weaponPercentage < 20 && heroKnows1hBasic1)
				{
					hero1hExp += dmg;
				}
				else if(weaponPercentage < 30 && heroKnows1hBasic2)
				{
					hero1hExp += dmg;
				}
				else if(weaponPercentage < 40 && heroKnows1hAdvanced1)
				{
					hero1hExp += dmg;
				}
				else if(weaponPercentage < 50 && heroKnows1hAdvanced2)
				{
					hero1hExp += dmg;
				}
				else if(weaponPercentage < 60 && heroKnows1hMaster)
				{
					hero1hExp += dmg;
				};

				if(Weapon_Attack_Count_Damage.flags & ITEM_AXE)
				{
					if(attackerNpc.attribute[ATR_STRENGTH] - ATTRIBUTEFROMEQUIPMENT[ATR_STRENGTH] < attributepotential[ATR_STRENGTH])
					{
						heroStrengthExp += dmg;
					};
				}
				else if (Weapon_Attack_Count_Damage.cond_atr[2] == ATR_STRENGTH)
				{
					//PrintS("Uderzenie mieczem pod si³ê!");
					if(attackerNpc.attribute[ATR_STRENGTH] - ATTRIBUTEFROMEQUIPMENT[ATR_STRENGTH] < attributepotential[ATR_STRENGTH])
					{
						heroStrengthExp += 3*dmg/4;
					};
					if(attackerNpc.attribute[ATR_DEXTERITY] - ATTRIBUTEFROMEQUIPMENT[ATR_DEXTERITY] < attributepotential[ATR_DEXTERITY])
					{
						heroDexterityExp += dmg/4;
					};
				}
				else if(Weapon_Attack_Count_Damage.cond_atr[2] == ATR_DEXTERITY)
				{
					//PrintS("Uderzenie mieczem pod zrêcznoœæ!");
					if(attackerNpc.attribute[ATR_STRENGTH] - ATTRIBUTEFROMEQUIPMENT[ATR_STRENGTH] < attributepotential[ATR_STRENGTH])
					{
						heroStrengthExp += dmg/2;
					};
					if(attackerNpc.attribute[ATR_DEXTERITY] - ATTRIBUTEFROMEQUIPMENT[ATR_DEXTERITY] < attributepotential[ATR_DEXTERITY])
					{
						heroDexterityExp += dmg/2;
					};
				};


				/*
				if(secondaryWeaponPercentage < 10)
				{
					hero2hExp += dmg/3;
				}
				else if(secondaryWeaponPercentage < 20 && heroKnows2hBasic1)
				{
					hero2hExp += dmg/3;
				}
				else if(secondaryWeaponPercentage < 30 && heroKnows2hBasic2)
				{
					hero2hExp += dmg/3;
				}
				else if(secondaryWeaponPercentage < 40 && heroKnows2hAdvanced1)
				{
					hero2hExp += dmg/3;
				}
				else if(secondaryWeaponPercentage < 50 && heroKnows2hAdvanced2)
				{
					hero2hExp += dmg/3;
				}
				else if(secondaryWeaponPercentage < 60 && heroKnows2hMaster)
				{
					hero2hExp += dmg/3;
				};
				*/
				//PrintS_Ext(ConcatStrings("Pos³ugiwanie broni¹: ", IntToString(hero1hExp)), White());
				//PrintS_Ext(ConcatStrings("Nastêpny poziom: ", IntToString(hero1hExp_NextLevel)), White());
			}
			else if (Weapon_Attack_Count_Damage.flags & (ITEM_2HD_SWD | ITEM_2HD_AXE))
			{
				weaponPercentage = attackerNpc.hitChance[NPC_TALENT_2H];
				secondaryWeaponPercentage = attackerNpc.hitChance[NPC_TALENT_1H];
				if(weaponPercentage < 10)
				{
					hero2hExp += dmg;
				}
				else if(weaponPercentage < 20 && heroKnows2hBasic1)
				{
					hero2hExp += dmg;
				}
				else if(weaponPercentage < 30 && heroKnows2hBasic2)
				{
					hero2hExp += dmg;
				}
				else if(weaponPercentage < 40 && heroKnows2hAdvanced1)
				{
					hero2hExp += dmg;
				}
				else if(weaponPercentage < 50 && heroKnows2hAdvanced2)
				{
					hero2hExp += dmg;
				}
				else if(weaponPercentage < 60 && heroKnows2hMaster)
				{
					hero2hExp += dmg;
				};

				if(attackerNpc.attribute[ATR_STRENGTH] - ATTRIBUTEFROMEQUIPMENT[ATR_STRENGTH] < attributepotential[ATR_STRENGTH])
				{
					heroStrengthExp += dmg;
				};
				/*
				if(secondaryWeaponPercentage < 10)
				{
					hero1hExp += dmg/3;
				}
				else if(secondaryWeaponPercentage < 20 && heroKnows1hBasic1)
				{
					hero1hExp += dmg/3;
				}
				else if(secondaryWeaponPercentage < 30 && heroKnows1hBasic2)
				{
					hero1hExp += dmg/3;
				}
				else if(secondaryWeaponPercentage < 40 && heroKnows1hAdvanced1)
				{
					hero1hExp += dmg/3;
				}
				else if(secondaryWeaponPercentage < 50 && heroKnows1hAdvanced2)
				{
					hero1hExp += dmg/3;
				}
				else if(secondaryWeaponPercentage < 60 && heroKnows1hMaster)
				{
					hero1hExp += dmg/3;
				};
				*/
			}
			else if (Weapon_Attack_Count_Damage.flags & (ITEM_BOW))
			{
				weaponPercentage = attackerNpc.hitChance[NPC_TALENT_BOW];
				secondaryWeaponPercentage = attackerNpc.hitChance[NPC_TALENT_CROSSBOW];
				if(weaponPercentage < 10)
				{
					heroBowExp += dmg;
				}
				else if(weaponPercentage < 20 && heroKnowsBowBasic1)
				{
					heroBowExp += dmg;
				}
				else if(weaponPercentage < 30 && heroKnowsBowBasic2)
				{
					heroBowExp += dmg;
				}
				else if(weaponPercentage < 40 && heroKnowsBowAdvanced1)
				{
					heroBowExp += dmg;
				}
				else if(weaponPercentage < 50 && heroKnowsBowAdvanced2)
				{
					heroBowExp += dmg;
				}
				else if(weaponPercentage < 60 && heroKnowsBowMaster)
				{
					heroBowExp += dmg;
				};

				if(attackerNpc.attribute[ATR_DEXTERITY] - ATTRIBUTEFROMEQUIPMENT[ATR_DEXTERITY] < attributepotential[ATR_DEXTERITY])
				{
					heroDexterityExp += dmg;
				};
				/*
				if(secondaryWeaponPercentage < 10)
				{
					heroCrossbowExp += dmg/3;
				}
				else if(secondaryWeaponPercentage < 20 && heroKnowsCrossbowBasic1)
				{
					heroCrossbowExp += dmg/3;
				}
				else if(secondaryWeaponPercentage < 30 && heroKnowsCrossbowBasic2)
				{
					heroCrossbowExp += dmg/3;
				}
				else if(secondaryWeaponPercentage < 40 && heroKnowsCrossbowAdvanced1)
				{
					heroCrossbowExp += dmg/3;
				}
				else if(secondaryWeaponPercentage < 50 && heroKnowsCrossbowAdvanced2)
				{
					heroCrossbowExp += dmg/3;
				}
				else if(secondaryWeaponPercentage < 60 && heroKnowsCrossbowMaster)
				{
					heroCrossbowExp += dmg/3;
				};
				*/
			}
			else if (Weapon_Attack_Count_Damage.flags & (ITEM_CROSSBOW))
			{
				weaponPercentage = attackerNpc.hitChance[NPC_TALENT_CROSSBOW];
				secondaryWeaponPercentage = attackerNpc.hitChance[NPC_TALENT_BOW];
				if(weaponPercentage < 10)
				{
					heroCrossbowExp += dmg;
				}
				else if(weaponPercentage < 20 && heroKnowsCrossbowBasic1)
				{
					heroCrossbowExp += dmg;
				}
				else if(weaponPercentage < 30 && heroKnowsCrossbowBasic2)
				{
					heroCrossbowExp += dmg;
				}
				else if(weaponPercentage < 40 && heroKnowsCrossbowAdvanced1)
				{
					heroCrossbowExp += dmg;
				}
				else if(weaponPercentage < 50 && heroKnowsCrossbowAdvanced2)
				{
					heroCrossbowExp += dmg;
				}
				else if(weaponPercentage < 60 && heroKnowsCrossbowMaster)
				{
					heroCrossbowExp += dmg;
				};

				if(attackerNpc.attribute[ATR_DEXTERITY] - ATTRIBUTEFROMEQUIPMENT[ATR_DEXTERITY] < attributepotential[ATR_DEXTERITY])
				{
					heroDexterityExp += dmg;
				};
				/*
				if(secondaryWeaponPercentage < 10)
				{
					heroBowExp += dmg/3;
				}
				else if(secondaryWeaponPercentage < 20 && heroKnowsBowBasic1)
				{
					heroBowExp += dmg/3;
				}
				else if(secondaryWeaponPercentage < 30 && heroKnowsBowBasic2)
				{
					heroBowExp += dmg/3;
				}
				else if(secondaryWeaponPercentage < 40 && heroKnowsBowAdvanced1)
				{
					heroBowExp += dmg/3;
				}
				else if(secondaryWeaponPercentage < 50 && heroKnowsBowAdvanced2)
				{
					heroBowExp += dmg/3;
				}
				else if(secondaryWeaponPercentage < 60 && heroKnowsBowMaster)
				{
					heroBowExp += dmg/3;
				};
				*/
			}
			else if(dmgDesc.spellID > 0 && attackerNpc.attribute[ATR_MANA_MAX] - ATTRIBUTEFROMEQUIPMENT[ATR_MANA_MAX] < attributepotential[ATR_MANA_MAX])
			{
				heroPowerExp += dmg;
			};

			CheckWeaponLevelUp();
		};
	};



	// Diese Funktion anpassen, wenn ihr den Schaden verändern wollt! 'dmg' ist der von Gothic berechnete Schaden
	return dmg;
};


var int _DMG_DmgDesc;

func void _DMG_OnDmg_Post()
{
	EDI = DMG_OnDmg(EBP, MEM_ReadInt(MEM_ReadInt(ESP+644)+8), EDI, _DMG_DmgDesc);
};

func void _DMG_OnDmg_Pre()
{
	_DMG_DmgDesc = ESI; // I'm preeeeetty sure it won't get moved in the meantime...
};

func void InitDamage()
{

	if(!hero1hExp_NextLevel)
	{
		hero1hExp_NextLevel = 50;
	};

	if(!hero2hExp_NextLevel)
	{
		hero2hExp_NextLevel = 50;
	};

	if(!heroBowExp_NextLevel)
	{
		heroBowExp_NextLevel = 50;
	};

	if(!heroCrossbowExp_NextLevel)
	{
		 heroCrossbowExp_NextLevel = 50;
	};

	if(!heroStrengthExp_NextLevel)
	{
		 heroStrengthExp_NextLevel = 50;
	};

	if(!heroDexterityExp_NextLevel)
	{
		 heroDexterityExp_NextLevel = 50;
	};

	if(!heroPowerExp_NextLevel)
	{
		 heroPowerExp_NextLevel = 50;
	};

	const int dmg = 0;
	if (dmg) { return; };
	HookEngineF(6736583/*0x66CAC7*/, 5, _DMG_OnDmg_Post);
	const int oCNpc__OnDamage_Hit = 6710800;
	HookEngineF(oCNpc__OnDamage_Hit, 7, _DMG_OnDmg_Pre);
	dmg = 1;
};
