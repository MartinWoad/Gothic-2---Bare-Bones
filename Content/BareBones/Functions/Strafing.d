/*
 * Movement during free aiming
 *
 * Gothic Free Aim (GFA) v1.2.0 - Free aiming for the video games Gothic 1 and Gothic 2 by Piranha Bytes
 * Copyright (C) 2016-2019  mud-freak (@szapp)
 *
 * This file is part of Gothic Free Aim.
 * <http://github.com/szapp/GothicFreeAim>
 *
 * Gothic Free Aim is free software: you can redistribute it and/or
 * modify it under the terms of the MIT License.
 * On redistribution this notice must remain intact and all copies must
 * identify the original author.
 *
 * Gothic Free Aim is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * MIT License for more details.
 *
 * You should have received a copy of the MIT License along with
 * Gothic Free Aim.  If not, see <http://opensource.org/licenses/MIT>.
 */


/*
 * Update movement animations during aiming (i.e. strafing in eight directions). The parameter 'movement' is the index
 * of animation to be played, see GFA_AIM_ANIS.
 */

 /*
  * Check the inheritance of a zCObject against a zCClassDef. Emulating zCObject::CheckInheritance() at 0x476E30 in G2.
  * This function is used in Wld_StopEffect_Ext().
  *
  * Taken from http://forum.worldofplayers.de/forum/threads/1495001?p=25548652
  */

  const string GFA_VERSION            = "Gothic Free Aim v1.2.0";
  const int    GFA_LEGO_FLAGS         = LeGo_HookEngine       // For initializing all hooks
                                      | LeGo_ConsoleCommands  // For console commands and debugging
                                      | LeGo_Random;          // For scattering and other uses of random numbers

  var   int    GFA_Flags;                                     // Flags for initialization of GFA
  const int    GFA_RANGED             = 1<<0;                 // Free aiming for ranged combat (bow and crossbow)
  const int    GFA_SPELLS             = 1<<1;                 // Free aiming for spell combat (spells)
  const int    GFA_REUSE_PROJECTILES  = 1<<2;                 // Enable collection and re-using of shot projectiles
  const int    GFA_CUSTOM_COLLISIONS  = 1<<3;                 // Custom collision/damage behaviors and hit registration
  const int    GFA_CRITICALHITS       = 1<<4;                 // Critical hits for ranged combat (e.g. head shots)
  const int    GFA_ALL                = (1<<5) - 1;           // Initialize all features

  const int    GFA_INITIALIZED        = 0;                    // Indicator whether GFA was initialized


  /* Free aiming and free movement */

  const int    GFA_ACTIVE             = 0;                    // Status indicator of free aiming/free movement
  const int    GFA_ACT_FREEAIM        = 1<<1;                 // Free aiming status (for spells only)
  const int    GFA_ACT_MOVEMENT       = 1<<2;                 // Free movement status
  const int    GFA_SPL_FREEAIM        = (FMODE_MAGIC          // Free aiming modifier for spells
                                         & ~GFA_ACT_MOVEMENT);

  const int    GFA_ACTIVE_CTRL_SCHEME = 1;                    // Control scheme of active FMODE (for Gothic 1 always 1)
  const int    GFA_CTRL_SCHEME_RANGED = 0;                    // Control scheme ranged
  const int    GFA_CTRL_SCHEME_SPELLS = 0;                    // Control scheme spells
  const int    GFA_SPELLS_G1_CTRL     = 1;                    // Internal reference for engine
  const float  GFA_MAX_TURN_RATE_G1   = 2.0;                  // Gothic 1 has a maximum turn rate (engine default: 2.0)

  const int    GFA_MIN_AIM_DIST       = 140;                  // Minimum targeting distance. Fixes vertical shooting bug
  const int    GFA_MAX_DIST           = 5000;                 // Distance for shooting/reticle. Do not change
  var   int    GFA_NO_AIM_NO_FOCUS;                           // Remove focus when not aiming (change in ini-file)
  var   int    GFA_RAY_INTERVAL;                              // Perform trace ray every x ms (change in ini-file)
  var   int    GFA_AimRayPrevCalcTime;                        // Time of last trace ray calculation

  const int    GFA_RETICLE_MIN_SIZE   = 32;                   // Reticle size in pixels (at its smallest)
  const int    GFA_RETICLE_MAX_SIZE   = 64;                   // Reticle size in pixels (at its biggest)
  const int    GFA_RETICLE_PTR        = 0;                    // Reticle zCView
  var   int    GFA_AimVobHasFX;                               // For performance: check whether FX needs to be removed

  const string GFA_CAMERA             = "CamModGFA";          // CCamSys_Def script instance

  const float  GFA_FOCUS_FAR_NPC      = 15.0;                 // NPC azimuth for ranged focus for free aiming
  const float  GFA_FOCUS_SPL_NPC      = 15.0;                 // NPC azimuth for spell focus for free aiming
  const int    GFA_FOCUS_SPL_ITM      = 0;                    // Item priority for spell focus for free aiming

  const int    GFA_FOCUS_FAR_NPC_DFT  = FLOATNULL;            // Backup NPC azimuth from ranged focus instance
  const int    GFA_FOCUS_SPL_NPC_DFT  = FLOATNULL;            // Backup NPC azimuth from spell focus instance
  const int    GFA_FOCUS_SPL_ITM_DFT  = 0;                    // Backup item priority from spell focus instance


  /* Aim movement */

  var   int    GFA_IsStrafing;                                // State of strafing (movement ID)
  const int    GFA_STRAFE_POSTCAST    = 500;                  // Time (ms) to remain in aim movement after casting a spell
  var   int    GFA_SpellPostCastDelay;                        // Keep record of post cast delay

  const int    GFA_MOVE_FORWARD       = 1<<0;                 // ID (first bit) for moving forward while aiming
  const int    GFA_MOVE_BACKWARD      = 1<<1;                 // ID (second bit) for moving backward while aiming
  const int    GFA_MOVE_LEFT          = 1<<2;                 // ID (third bit) for moving left while aiming
  const int    GFA_MOVE_RIGHT         = 1<<3;                 // ID (fourth bit) for moving right while aiming
  const int    GFA_MOVE_TRANS         = 11;                   // Transition ID
  const int    GFA_HURT_ANI           = 12;                   // Hurt animation ID

  const string GFA_AIM_ANIS[13]       = {                     // Names of aiming movement animations (upper case!)
      "_AIM_STAND",                                           //  0        Transition to standing (ranged combat only)
      "_AIM_MOVEF",                                           //  1  0001  GFA_MOVE_FORWARD
      "_AIM_MOVEB",                                           //  2  0010  GFA_MOVE_BACKWARD
      "",                                                     //  3
      "_AIM_MOVEL",                                           //  4  0100  GFA_MOVE_LEFT
      "_AIM_MOVELF",                                          //  5  0101  GFA_MOVE_LEFT | GFA_MOVE_FORWARD
      "_AIM_MOVELB",                                          //  6  0110  GFA_MOVE_LEFT | GFA_MOVE_BACKWARD
      "",                                                     //  7
      "_AIM_MOVER",                                           //  8  1000  GFA_MOVE_RIGHT
      "_AIM_MOVERF",                                          //  9  1001  GFA_MOVE_RIGHT | GFA_MOVE_FORWARD
      "_AIM_MOVERB",                                          // 10  1010  GFA_MOVE_RIGHT | GFA_MOVE_BACKWARD
      "_AIM_MOVE_2",                                          // 11        Transition prefix
      "_AIM_HURT"                                             // 12        Hurting animation: Caution, different layer
  };

  const int    GFA_MOVE_ANI_LAYER     = 2;                    // Layer of aiming movement animations (see Humans.mds)
  
  /* Ranged combat */

  const string GFA_TRAIL_FX           = "GFA_TRAIL_VFX";      // Trail strip FX. Should not be changed
  const string GFA_TRAIL_FX_SIMPLE    = "GFA_TRAIL_INST_VFX"; // Simplified trail strip FX for use in Gothic 1
  const string GFA_BREAK_FX           = "GFA_DESTROY_VFX";    // FX of projectile breaking on impact with world

  const int    GFA_DRAWTIME_READY     = 475;                  // Time (ms) for readying the weapon. Fixed by animation
  const int    GFA_DRAWTIME_RELOAD    = 1250;                 // Time (ms) for reloading the weapon. Fixed by animation
  var   int    GFA_BowDrawOnset;                              // Time onset of drawing the bow
  var   int    GFA_MouseMovedLast;                            // Time of last mouse movement

  const float  GFA_SCATTER_HIT        = 1.5;                  // (Visual angle)/2 within which everything is a hit
  const float  GFA_SCATTER_MISS       = 4.2;                  // (Visual angle)/2 outside which everything is a miss
  const float  GFA_SCATTER_MAX        = 6.0;                  // (Visual angle)/2 of maximum scatter (all in degrees)

  var   int    GFA_CollTrj[6];                                // Projectile trajectory of last collision candidate
  var   string GFA_HitModelNode;                              // Name of model node that was hit

  var   int    GFA_ProjectilePtr;                             // Pointer of currently colliding projectile (temporary)

  const int    DMG_NO_CHANGE          = 0;                    // Do not adjust the damage
  const int    DMG_DO_NOT_KNOCKOUT    = 1;                    // Normal damage, shot may kill but never knockout (HP != 1)
  const int    DMG_DO_NOT_KILL        = 2;                    // Normal damage, shot may knockout but never kill (HP > 0)
  const int    DMG_INSTANT_KNOCKOUT   = 3;                    // One shot knockout (HP = 1)
  const int    DMG_INSTANT_KILL       = 4;                    // One shot kill (HP = 0)

  const int    DMG_BEHAVIOR_MAX       = 4;


  /* Debugging */

  var   int    GFA_StatsShots;                                // Shooting statistics: Count total number of shots taken
  var   int    GFA_StatsHits;                                 // Shooting statistics: Count positive hits on target

  var   int    GFA_DebugTRTrj;                                // Handle of trace ray trajectory
  var   int    GFA_DebugTRBBox;                               // Handle of trace ray intersection
  var   int    GFA_DebugTRBBoxVob;                            // Handle of trace ray detected vob bounding box
  var   int    GFA_DebugCollTrj;                              // Handle of projectile trajectory
  var   int    GFA_DebugBoneBBox;                             // Handle of bone bounding box
  var   int    GFA_DebugBoneOBBox;                            // Handle of bone oriented bounding box


  /* Numerical constants */

  const int    FLOATONE_NEG           = -1082130432;          // -1 as float
  const int    FLOAT1C                = 1120403456;           // 100 as float
  const int    FLOAT3C                = 1133903872;           // 300 as float
  const int    FLOAT1K                = 1148846080;           // 1000 as float


  // Trafo matrix as zMAT4 is divided column wise
  const int zCVob__classDef                            = 10106072; //0x9A34D8
  const int zCVob__SetPositionWorld                    =  6404976; //0x61BB70
  const int zCVob__GetRigidBody                        =  6285664; //0x5FE960
  const int zCVob__TraceRay                            =  6291008; //0x5FFE40
  const int zCVob__SetAI                               =  6285552; //0x5FE8F0
  const int zCVob__SetSleeping                         =  6302000; //0x602930
  const int zCVob__RotateWorld                         =  6403360; //0x61B520
  const int zCRigidBody__SetVelocity                   =  5990096; //0x5B66D0                // Not used for Gothic 2
  const int zCCollisionReport__vtbl                    =  8592708; //0x831D44
  const int zCWorld__TraceRayNearestHit_Vob            =  6430624; //0x621FA0
  const int oCWorld__AddVobAsChild                     =  7863856; //0x77FE30
  const int zCWorld__SearchVobListByClass              =  6439504; //0x624250
  const int zCTrigger__vtbl                            =  8627196; //0x83A3FC
  const int oCTriggerScript__vtbl                      =  8582148; //0x82F404
  const int zString_CamModRanged                       =  9234704; //0x8CE910
  const int zString_CamModMagic                        =  9235048; //0x8CEA68
  const int zString_CamModNormal                       =  9234928; //0x8CE9F0                // Not used for Gothic 2
  const int zString_CamModMelee                        =  9234988; //0x8CEA2C                // Not used for Gothic 2
  const int zString_CamModRun                          =  9235008; //0x8CEA40                // Not used for Gothic 2
  const int oCAIHuman__Cam_Normal                      = 11195896; //0xAAD5F8                // Not used for Gothic 2
  const int oCAIHuman__Cam_Fight                       = 11195876; //0xAAD5E4                // Not used for Gothic 2
  const int oCAIHuman__CheckFocusVob_ranged            =  6928639; //0x69B8FD
  const int oCAIHuman__CheckFocusVob_spells            =  6928645; //0x69B905
  const int oCAniCtrl_Human__IsStanding                =  7003872; //0x6ADEE0
  const int oCAniCtrl_Human__Turn                      =  7005504; //0x6AE540
  const int oCAniCtrl_Human__CanToggleWalkModeTo       =  6995888; //0x6ABFB0
  const int oCAniCtrl_Human__ToggleWalkMode            =  7001344; //0x6AD500
  const int zCAIPlayer__CheckEnoughSpaceMoveDir        =  5313312; //0x511320
  const int oCNpc__player                              = 11216516; //0xAB2684
  const int oCNpc__TurnToEnemy_camCheck                =  7568757; //0x737D75
  const int oCNpc__GetAngles                           =  6820528; //0x6812B0
  const int oCNpc__SetFocusVob                         =  7547744; //0x732B60
  const int oCNpc__SetEnemy                            =  7556032; //0x734BC0
  const int oCNpc__SetBodyState                        =  7727392; //0x75E920
  const int oCNpc__GetInteractMob                      =  7646368; //0x74ACA0
  const int oCNpc__EV_Strafe_magicCombat               =  6833595; //0x6845BB
  const int oCNpc__Interrupt_stopAnisLayerA            =  7560322; //0x735C82
  const int oCNpc__RefreshNpc_createAmmoIfNone         =  7611174; //0x742326
  const int oCNpcFocus__InitFocusModes                 =  7072384; //0x6BEA80
  const int oCNpcFocus__Init                           =  7073344; //0x6BEE40
  const int oCNpcFocus__focusnames                     = 11208320; //0xAB0680
  const int oCNpcFocus__focuslist                      = 11208440; //0xAB06F8
  const int oCNpcFocus__focus                          = 11208504; //0xAB0738
  const int oCItem___CreateNewInstance                 =  7423040; //0x714440
  const int oCItem__InitByScript                       =  7412688; //0x711BD0
  const int oCItem__InsertEffect                       =  7416896; //0x712C40
  const int oCItem__RemoveEffect                       =  7416832; //0x712C00
  const int oCItem__MultiSlot                          =  7415200; //0x7125A0                // Not used for Gothic 2
  const int oCMag_Book__GetSelectedSpell               =  4683648; //0x477780
  const int oCMag_Book__GetSelectedSpellNr             =  4683728; //0x4777D0                // Not used for Gothic 2
  const int oCMag_Book__GetSpellItem                   =  4692992; //0x479C00                // Not used for Gothic 2
  const int oCMag_Book__StopSelectedSpell              =  4684048; //0x477910
  const int oCSpell__Open                              =  4741280; //0x4858A0
  const int zCProgMeshProto__classDef                  =  9972552; //0x982B48
  const int zCMaterial__classDef                       =  9275144; //0x8D8708
  const int oCVisualFX__classDef                       =  9234008; //0x8CE658
  const int oCVisualFX__Stop                           =  4799456; //0x493BE0
  const int oCVisualFX__SetTarget                      =  4788960; //0x4912E0
  const int zCModel__classDef                          =  9275680; //0x8D8920
  const int zCModel__TraceRay_softSkinCheck            =  5777440; //0x582820
  const int zCModel__CalcNodeListBBoxWorld             =  5738432; //0x578FC0
  const int zCModel__StartAni                          =  5746544; //0x57AF70
  const int zCModel__FadeOutAnisLayerRange             =  5763568; //0x57F1F0
  const int zCModel__StopAnisLayerRange                =  5763648; //0x57F240
  const int zCModelPrototype__SearchAniIndex           =  5808064; //0x589FC0
  const int zVEC3__NormalizeSafe                       =  4819488; //0x498A20
  const int zTBBox3D__CalcGreaterBBox3D                =  5522768; //0x544550
  const int zTBBox3D__TraceRay                         =  5528896; //0x545D40
  const int zCOBBox3D__Transform                       =  5544080; //0x549890
  const int ztimer                                     = 10073044; //0x99B3D4                // Not used for Gothic 2
  const int oCGame__s_bUseOldControls                  =  9118144; //0x8B21C0
  const int zCInput_Win32__s_mouseEnabled              =  9248108; //0x8D1D6C
  const int oCAIArrow__ReportCollisionToAI             =  6952240; //0x6A1530
  const int oCAIArrowBase__ReportCollisionToAI_PFXon1  =  6949324; //0x6A09CC
  const int oCAIArrowBase__ReportCollisionToAI_PFXon2  =  6949396; //0x6A0A14
  const int oCAIArrowBase__ReportCollisionToAI_collNpc =  6949734; //0x6A0B66
  const int oCAIArrow__ReportCollisionToAI_destroyPrj  =  0;                                 // Does not exist in Gothic 2
  const int oCAIArrow__ReportCollisionToAI_keepPlyStrp =  0;                                 // Does not exist in Gothic 2
  const int oCAIArrow__CanThisCollideWith_skipCheck    =  6952087; //0x6A1497
  const int oCAIArrow__CanThisCollideWith_npcShooter   =  6952106; //0x6A14AA
  const int oCAIHuman__MagicMode_g2ctrlCheck           =  4665380; //0x473024
  const int oCAIHuman__BowMode_g2ctrlCheck             =  6905643; //0x695F2B
  const int oCAIHuman__BowMode_shootingKey             =  6906610; //0x6962F2
  const int oCAIHuman__MagicMode_turnToTarget          =  0;                                 // Does not exist in Gothic 2
  const int oCAIHuman__PC_ActionMove_aimingKey         =  6922427; //0x69A0BB
  const int oCAIHuman__PC_Turnings                     =  6924608; //0x69A940
  const int zCCollObjectLevelPolys__s_oCollObjClass    =  9274192; //0x8D8350

  const int oCGame__HandleEvent_openInvCheck           =  7325123; //0x6FC5C3 // Hook len 5
  const int cGameManager__ApplySomeSettings_rtn        =  4362866; //0x429272 // Hook len 6
  const int cGameManager__HandleEvent_clearKeyBuffer   =  4370800; //0x42B170 // Hook len 6
  const int zCModel__CalcModelBBox3DWorld_rtn          =  5739160; //0x579298 // Hook len 6
  const int zCModel__TraceRay_positiveNodeHit          =  5779884; //0x5831AC // Hook len 7
  const int zCAIPlayer__IsSliding_true                 =  5297341; //0x50D4BD // Hook len 5
  const int oCAniCtrl_Human__SearchStandAni_walkmode   =  6967211; //0x6A4FAB // Hook len 6
  const int oCAIVobMove__DoAI_stopMovement             =  6945300; //0x69FA14 // Hook len 7
  const int oCAIHuman__PC_CheckSpecialStates_lie       =  6920688; //0x6999F0 // Hook len 5
  const int oCAIHuman__PC_ActionMove_bodyState         =  6922115; //0x699F83 // Hook len 6
  const int oCAIHuman__BowMode_aimCondition            =  6906730; //0x69636A // Hook len 5
  const int oCAIHuman__BowMode_interpolateAim          =  6906518; //0x696296 // Hook len 5
  const int oCAIHuman__BowMode_notAiming               =  6906078; //0x6960DE // Hook len 6
  const int oCAIHuman__BowMode_rtn                     =  6908156; //0x6968FC // Hook len 7
  const int oCAIHuman__MagicMode                       =  4665296; //0x472FD0 // Hook len 7
  const int oCAIHuman__MagicMode_rtn                   =  4666329; //0x4733D9 // Hook len 7
  const int oCAIArrow__SetupAIVob                      =  6951136; //0x6A10E0 // Hook len 6
  const int oCAIArrow__CanThisCollideWith_positive     =  6952212; //0x6A1514 // Hook len 7 (caution: len 6 in Gothic 1)
  const int oCAIArrow__DoAI_rtn                        =  6952073; //0x6A1489 // Hook len 6
  const int oCAIArrow__ReportCollisionToAI_collAll     =  6949315; //0x6A09C3 // Hook len 8
  const int oCAIArrow__ReportCollisionToAI_hitChc      =  6953482; //0x6A1A0A // Hook len 6
  const int oCAIArrow__ReportCollisionToAI_damage      =  6953711; //0x6A1AEF // Hook len 7
  const int oCAIArrowBase__DoAI_setLifeTime            =  6949017; //0x6A0899 // Hook len 7
  const int oCAIArrowBase__ReportCollisionToAI_hitNpc  =  6949832; //0x6A0BC8 // Hook len 5
  const int oCAIArrowBase__ReportCollisionToAI_hitVob  =  6949929; //0x6A0C29 // Hook len 5
  const int oCAIArrowBase__ReportCollisionToAI_hitWld  =  6949460; //0x6A0A54 // Hook len 5
  const int oCAIArrowBase__ReportCollisionToAI_collVob =  6949440; //0x6A0C18 // Hook len 5
  const int oCAIArrowBase__ReportCollisionToAI_collWld =  6949912; //0x6A0A40 // Hook len 5
  const int oCNpc__OnDamage_Hit_criticalHit            =  6718100; //0x668294 // Hook len 5  // Not used for Gothic 2
  const int oCNpc__OnDamage_Anim_stumbleAniName        =  6784975; //0x6787CF // Hook len 5  // Not used for Gothic 2
  const int oCNpc__OnDamage_Anim_gotHitAniName         =  6785116; //0x67885C // Hook len 5
  const int oCNpc__SetWeaponMode_player                =  7575921; //0x739971 // Hook len 6
  const int oCNpc__SetWeaponMode2_walkmode             =  7574116; //0x739264 // Hook len 6
  const int oCNpc__EV_AttackRun_playerTurn             =  7674197; //0x751955 // Hook len 7
  const int oCNpc__EV_Strafe_commonOffset              =  6831608; //0x683DF8 // Hook len 5
  const int oCNpc__EV_Strafe_g2ctrl                    =  6832857; //0x6842D9 // Hook len 6
  const int oCNpc__Interrupt_stopAnis                  =  7560261; //0x735C45 // Hook len 5
  const int oCSpell__Setup_initFallbackNone            =  4737961; //0x484BA9 // Hook len 6
  const int oCVisualFX__ProcessCollision_checkTarget   =  4807578; //0x495B9A // Hook len 6
  const int mouseUpdate                                =  5062907; //0x4D40FB // Hook len 5


  /*
   * Class offsets (Gothic 2)
   */
  const int zCClassDef_baseClassDef_offset             = 60;  //0x003C

  const int zCVob_bbox3D_offset                        = 124; //0x007C
  const int zCVob_trafoObjToWorld_offset               = 60;  //0x003C

  const int oCNpc_hitChance_offset                     = 472; //0x01D8

  const int oSDamageDescriptor_origin_offset           = 8;   //0x0008                       // Not used for Gothic 2

  const int oCItem_effect_offset                       = 564; //0x0234

  const int oCSpell_spellCasterNpc_offset              = 52;  //0x0034
  const int oCSpell_manaInvested_offset                = 72;  //0x0048
  const int oCSpell_C_Spell_offset                     = 128; //0x0080

  const int oCVisualFX_originVob_offset                = 1192;//0x04A8
  const int oCVisualFX_targetVob_offset                = 1200;//0x04B0
  const int oCVisualFX_instanceName_offset             = 1220;//0x04C4

  const int zCAICamera_elevation_offset                = 56;  //0x0038

  const int zCAIPlayer_bitfield1_forceModelHalt        = 1<<0;

  const int oCAniCtrl_Human_npc_offset                 = 300; //0x012C
  const int oCAniCtrl_Human_walkmode_offset            = 352; //0x0160
  const int oCAniCtrl_Human_t_stand_2_cast_offset      = 4572;//0x11DC
  const int oCAniCtrl_Human_s_cast_offset              = 4576;//0x11E0
  const int oCAniCtrl_Human_t_cast_2_shoot_offset      = 4580;//0x11E4
  const int oCAniCtrl_Human_s_shoot_offset             = 4588;//0x11EC
  const int oCAniCtrl_Human_t_shoot_2_stand_offset     = 4592;//0x11F0

  const int oCAIHuman_bitfield_offset                  = 4612;//0x1204
  const int oCAIHuman_bitfield_startObserveIntruder    = 1<<5;
  const int oCAIHuman_bitfield_dontKnowAniPlayed       = 1<<6;
  const int oCAIHuman_bitfield_spellReleased           = 1<<7;

  const int oCAIArrowBase_ignoreVobList_offset         = 48;  //0x0030
  const int oCAIArrowBase_lifeTime_offset              = 56;  //0x0038
  const int oCAIArrowBase_hostVob_offset               = 60;  //0x003C
  const int oCAIArrowBase_creatingImpactFX_offset      = 64;  //0x0040
  const int oCAIArrowBase_hasHit_offset                = 84;  //0x0054
  const int oCAIArrow_origin_offset                    = 92;  //0x005C
  const int oCAIArrow_destroyProjectile_offset         = 96;  //0x0060

  const int zCRigidBody_mass_offset                    = 0;   //0x0000
  const int zCRigidBody_xPos_offset                    = 80;  //0x0050
  const int zCRigidBody_gravity_offset                 = 236; //0x00EC
  const int zCRigidBody_velocity_offset                = 188; //0x00BC
  const int zCRigidBody_bitfield_offset                = 256; //0x0100
  const int zCRigidBody_bitfield_gravityActive         = 1<<0;

  const int zCModel_numActAnis_offset                  = 52;  //0x0034
  const int zCModel_actAniList_offset                  = 56;  //0x0037
  const int zCModel_hostVob_offset                     = 96;  //0x0060
  const int zCModel_prototypes_offset                  = 100; //0x0064
  const int zCModel_modelNodeInstArray_offset          = 112; //0x0070
  const int zCModel_meshSoftSkinList_offset            = 124; //0x007C
  const int zCModel_meshSoftSkinList_numInArray_offset = 132; //0x0084
  const int zCModel_masterFrameCtr_offset              = 200; //0x00C8
  const int zCModel_bbox3d_offset                      = 216; //0x00D8

  const int zCModelAni_aniID_offset                    = 76;  //0x004C

  const int zCModelNodeInst_protoNode_offset           = 4;   //0x0004
  const int zCModelNodeInst_visual_offset              = 8;   //0x0008
  const int zCModelNodeInst_trafoObjToCam_offset       = 76;  //0x004C
  const int zCModelNodeInst_bbox3D_offset              = 140; //0x008C

  const int zCModelNode_nodeName_offset                = 4;   //0x0004

  const int zCMeshSoftSkin_nodeIndexList_offset        = 216; //0x00D8
  const int zCMeshSoftSkin_nodeObbList_offset          = 228; //0x00E4

  const int zCVisual_materials_offset                  = 164; //0x00A4
  const int zCVisual_numMaterials_offset               = 168; //0x00A8

  const int zCPolygon_material_offset                  = 24;  //0x0018

  const int zCMaterial_texture_offset                  = 52; //0x0034
  const int zCMaterial_matGroup_offset                 = 64; //0x0040

  const int zCCollisionReport_pos_offset               = 8;   //0x0008
  const int zCCollisionReport_thisCollObj_offset       = 44;  //0x002C
  const int zCCollisionReport_hitCollObj_offset        = 48;  //0x0030

  const int zCCollisionObject_parent_offset            = 132; //0x0084
  const int zCCollObjectLevelPolys_polyList_offset     = 140; //0x008C

  const int zTraceRay_vob_ignore_no_cd_dyn             = 1<<0;  // Ignore vobs without collision
  const int zTraceRay_vob_bbox                         = 1<<2;  // Intersect bounding boxes (important to detect NPCs)
  const int zTraceRay_poly_normal                      = 1<<7;  // Report normal vector of intersection
  const int zTraceRay_poly_ignore_transp               = 1<<8;  // Ignore alpha polys (without this, trace ray is bugged)
  const int zTraceRay_poly_test_water                  = 1<<9;  // Intersect water
  const int zTraceRay_vob_ignore_projectiles           = 1<<14; // Ignore projectiles

  const int zTTraceRayReport_foundIntersection_offset  = 12;  //0x000C

  const int sizeof_zVEC3                               = 12;  //0x000C
  const int sizeof_zTBBox3D                            = 24;  //0x0018
  const int sizeof_zCOBBox3D                           = 68;  //0x0044
  const int sizeof_zTTraceRayReport                    = 40;  //0x0028
  const int sizeof_zCCollisionReport                   = 52;  //0x0034
  const int sizeof_zMAT4                               = 64;  //0x0040

  const int oCNpcFocus__num                            = 6;   // Number of different focus modes

  // Trafo matrix as zMAT4 is divided column wise
  const int zMAT4_rightVec                             = 0; // Right vector
  const int zMAT4_upVec                                = 1; // Up vector
  const int zMAT4_outVec                               = 2; // Out vector/at vector (facing direction)
  const int zMAT4_position                             = 3; // Position vector


 func int objCheckInheritance(var int objPtr, var int classDef) {
     if (!objPtr) || (!classDef) {
         return 0;
     };

     // Iterate over base classes
     var int curClassDef; curClassDef = MEM_GetClassDef(objPtr);
     while((curClassDef) && (curClassDef != classDef));
         curClassDef = MEM_ReadInt(curClassDef+zCClassDef_baseClassDef_offset);
     end;

     return (curClassDef == classDef);
 };

 func MEMINT_HelperClass getPlayerInst() {
     if (!MEM_ReadInt(oCNpc__player)) {
         var oCNpc ret; ret = MEM_NullToInst();
         MEMINT_StackPushInst(ret);
         return;
     };
     _^(MEM_ReadInt(oCNpc__player));
 };

func void StopStrafing() {

    var oCNpc her; her = getPlayerInst();
    var int movement; movement = 0;
    var string modifier; modifier = "";
    var int GFA_IsStrafing; GFA_IsStrafing = movement;

    // Send perception before anything else (every 1500 ms)
    var int newBodystate; newBodystate = -1;
    if (movement) {
        var int percTimer; percTimer += MEM_Timer.frameTime;
        if (percTimer >= 1500) {
            percTimer -= 1500;

            // Send perception depending on sneaking or walking
            if (MEM_ReadInt(her.anictrl+oCAniCtrl_Human_walkmode_offset) & NPC_SNEAK) {
                // Only relevant for Gothic 1, this perception disabled in Gothic 2
                Npc_SendPassivePerc(hero, PERC_OBSERVESUSPECT, hero, hero);

                // For Gothic 2, set BS_SNEAK
                newBodystate = BS_SNEAK;
            } else {
                Npc_SendPassivePerc(hero, PERC_ASSESSQUIETSOUND, hero, hero);
            };
        };
    } else if (GFA_IsStrafing) && (MEM_ReadInt(her.anictrl+oCAniCtrl_Human_walkmode_offset) & NPC_SNEAK) {
        // Reset body state if sneaking but not moving (like Gothic usually does)
        newBodystate = BS_STAND;
    };

    // Set body state if necessary
    if (newBodystate > -1) {
        newBodystate = newBodystate & ~BS_FLAG_INTERRUPTABLE & ~BS_FLAG_FREEHANDS;
        var int herPtr; herPtr = _@(her);
        const int call = 0;
        if (CALL_Begin(call)) {
            CALL_IntParam(_@(newBodystate));
            CALL__thiscall(_@(herPtr), oCNpc__SetBodyState);
            call = CALL_End();
        };
    };

    // Increase performance: Exit if movement did not change
    if (GFA_IsStrafing == movement) && (Hlp_StrCmp(modifier, lastMod)) {
        return;
    };

    // Remember last movement for animation transitions
    var int lastMove; lastMove = GFA_IsStrafing;
    var string lastMod; lastMod = modifier;
    GFA_IsStrafing = movement;

    // Get player model
    var int model; model = her._zCVob_visual;
    if (!objCheckInheritance(model, zCModel__classDef)) {
        return;
    };
    var int bitfield; bitfield = MEM_ReadInt(her.anictrl+oCAIHuman_bitfield_offset);
    var int zero;

    // Stop movement
    if (!movement) {
        const int call2 = 0;
        if (CALL_Begin(call2)) {
            CALL_IntParam(_@(GFA_MOVE_ANI_LAYER));
            CALL_IntParam(_@(GFA_MOVE_ANI_LAYER));
            CALL__thiscall(_@(model), zCModel__FadeOutAnisLayerRange);
            call2 = CALL_End();
        };

        // Send observe intruder perception (relevant for Gothic 1 only)
        if (bitfield & oCAIHuman_bitfield_startObserveIntruder) {
            MEM_WriteInt(aniCtrlPtr+oCAIHuman_bitfield_offset, bitfield & ~oCAIHuman_bitfield_startObserveIntruder);
            Npc_SendPassivePerc(hero, PERC_OBSERVEINTRUDER, hero, hero);
        };

        // For ranged combat, animations need to be actively blended back to standing (see below)
        if (her.fmode == FMODE_FAR) {
            // Set modifier (function usually does not receive a modifier if movement == 0)
            modifier = "BOW";
        } else if (her.fmode == FMODE_FAR+1) {
            modifier = "CBOW";
        } else {
            // For spell combat or no fight mode, it was sufficient to fade out the animation in the aim movement layer
            return;
        };

    } else {
        // Compute movement direction
        var zMAT4 herTrf; herTrf = _^(_@(her._zCVob_trafoObjToWorld));
        var int dir[3];
        var int dirPtr; dirPtr = _@(dir);

        // Front/back axis
        if (movement & GFA_MOVE_FORWARD) {
            dir[0] = herTrf.v0[zMAT4_outVec];
            dir[1] = herTrf.v1[zMAT4_outVec];
            dir[2] = herTrf.v2[zMAT4_outVec];
        } else if (movement & GFA_MOVE_BACKWARD) {
            dir[0] = negf(herTrf.v0[zMAT4_outVec]);
            dir[1] = negf(herTrf.v1[zMAT4_outVec]);
            dir[2] = negf(herTrf.v2[zMAT4_outVec]);
        } else {
            dir[0] = FLOATNULL;
            dir[1] = FLOATNULL;
            dir[2] = FLOATNULL;
        };

        // Left right axis (combine vector for diagonal movement directions)
        if (movement & GFA_MOVE_LEFT) || (movement & GFA_MOVE_RIGHT) {
            if (movement & GFA_MOVE_LEFT) {
                dir[0] = subf(dir[0], herTrf.v0[zMAT4_rightVec]);
                dir[1] = subf(dir[1], herTrf.v1[zMAT4_rightVec]);
                dir[2] = subf(dir[2], herTrf.v2[zMAT4_rightVec]);
            } else {
                dir[0] = addf(dir[0], herTrf.v0[zMAT4_rightVec]);
                dir[1] = addf(dir[1], herTrf.v1[zMAT4_rightVec]);
                dir[2] = addf(dir[2], herTrf.v2[zMAT4_rightVec]);
            };
            // Direction vector needs to be normalized
            const int call3 = 0;
            if (CALL_Begin(call3)) {
                CALL__thiscall(_@(dirPtr), zVEC3__NormalizeSafe);
                call3 = CALL_End();
            };
            MEM_CopyBytes(CALL_RetValAsPtr(), dirPtr, sizeof_zVEC3);
        };

        // Check if there is enough space in the computed movement direction
        var int aniCtrlPtr; aniCtrlPtr = her.anictrl;
        const int call4 = 0;
        if (CALL_Begin(call4)) {
            CALL_IntParam(_@(zero));
            CALL_PtrParam(_@(dirPtr));
            CALL__thiscall(_@(aniCtrlPtr), zCAIPlayer__CheckEnoughSpaceMoveDir);
            call4 = CALL_End();
        };
        if (!CALL_RetValAsInt()) {
            StopStrafing();
            return;
        };

        // Check force movement halt
        var zCAIPlayer playerAI; playerAI = _^(her.anictrl);
        if (playerAI.bitfield[1] & zCAIPlayer_bitfield1_forceModelHalt) {
            playerAI.bitfield[1] = playerAI.bitfield[1] & ~zCAIPlayer_bitfield1_forceModelHalt;
            StopStrafing();
            return;
        };

        // Moving: Set observe intruder flag (relevant for Gothic 1 only)
        MEM_WriteInt(aniCtrlPtr+oCAIHuman_bitfield_offset, bitfield | oCAIHuman_bitfield_startObserveIntruder);
    };

    // Add animation transition prefix (transition or state animation)
    var string prefix;
    var string postfix;
    if (lastMove & movement) || (!movement) {
        prefix = "T_";
        postfix = MEM_ReadStatStringArr(GFA_AIM_ANIS, GFA_MOVE_TRANS);
    } else {
        prefix = "S_";
        postfix = "";
    };
    // New animation
    postfix = ConcatStrings(postfix, MEM_ReadStatStringArr(GFA_AIM_ANIS, movement));

    // Get full name of complete animation
    var string aniName; aniName = ConcatStrings(ConcatStrings(prefix, modifier), postfix);
    var int aniNamePtr; aniNamePtr = _@s(aniName);

    // Check if spell animation with casting modifier exists (otherwise assume default)
    if (STR_Len(modifier) > 4) {
        var zCArray protoTypes; protoTypes = _^(model+zCModel_prototypes_offset);
        var int modelPrototype; modelPrototype = MEM_ReadInt(protoTypes.array);
        const int call5 = 0;
        if (CALL_Begin(call5)) {
            CALL__fastcall(_@(modelPrototype), _@(aniNamePtr), zCModelPrototype__SearchAniIndex);
            call5 = CALL_End();
        };

        // If animation with modifier does not exist, take base animation
        if (CALL_RetValAsInt() < 0) {
            // Remove spell casting modifier, 'MAG' should remain
            modifier = STR_Prefix(modifier, 3);
            aniName = ConcatStrings(ConcatStrings(prefix, modifier), postfix);
        };
    };

    // Start animation
    const int call6 = 0;
    if (CALL_Begin(call6)) {
        CALL_IntParam(_@(zero));
        CALL_PtrParam(_@(aniNamePtr));
        CALL__thiscall(_@(model), zCModel__StartAni);
        call6 = CALL_End();
    };
};
