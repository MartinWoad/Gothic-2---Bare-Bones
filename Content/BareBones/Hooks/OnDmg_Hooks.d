// Look for the function "DMG_OnDmg" to modify

class oSDamageDescriptor {
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


func int DMG_OnDmg(var int victimPtr, var int attackerPtr, var int dmg, var int dmgDescriptorPtr) {
	var oSDamageDescriptor dmgDesc; dmgDesc = _^(dmgDescriptorPtr);
	var c_npc attackerNpc; attackerNpc = _^(attackerptr);
        var c_npc victimNpc; victimNpc = _^(victimPtr);

	// Diese Funktion anpassen, wenn ihr den Schaden verändern wollt! 'dmg' ist der von Gothic berechnete Schaden
	return dmg;
};
	

var int _DMG_DmgDesc;

func void _DMG_OnDmg_Post() {
	EDI = DMG_OnDmg(EBP, MEM_ReadInt(MEM_ReadInt(ESP+644)+8), EDI, _DMG_DmgDesc);
};

func void _DMG_OnDmg_Pre() {
	_DMG_DmgDesc = ESI; // I'm preeeeetty sure it won't get moved in the meantime...
};

func void InitDamage() {
	const int dmg = 0;
	if (dmg) { return; };
	HookEngineF(6736583/*0x66CAC7*/, 5, _DMG_OnDmg_Post);
	const int oCNpc__OnDamage_Hit = 6710800;
	HookEngineF(oCNpc__OnDamage_Hit, 7, _DMG_OnDmg_Pre);
	dmg = 1;
};
