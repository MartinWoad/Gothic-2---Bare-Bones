/*##############################################################
  Idea:
    This code is useful if you want to display information
    in the character menu that you cannot or do not want to
    link to an Npc-Talent or Attribute.

    Traditionally, the Engine fills in values itself, for example
    initialising the menu Item MENU_ITEM_LEVEL with hero.level,
    or retrieving the string in MENU_ITEM_PLAYERGUILD according to
    hero.guild and the table TXT_GUILDS (see Text.d).

    Because the way in which the engine retrieves these values
    is hardcoded, you have only limited controll on what is
    displayed in the character menu.

    The following code is aimed to give you more control,
    allowing you to implement additional talents (more
    than NPC_TALENT_MAX) or statistical information
    (like number of monsters killed) that are not represented
    in attributes or talents.
    You also have more controll on how the information is
    displayed, for example as a value (100), a fraction (30/100)
    with a unit (32 Coins), as a percentage (42%) or in
    any other way you fancy.

    Usage:
        1.) Call Install_Character_Menu_Hook() in INIT_GLOBAL
          after having called LeGo_Init.
        2.) For each piece of information you want to display,
          create a menu item in Scripts\System\Menu\Menu_Status.d
          You need to specify the position of the menu item there.
          Use e.g. MENU_ITEM_STATUS_HEADING as a reference.
          Lets say your new menu item is called MENU_ITEM_GOLD.
        3.) At the top of Menu_Status.d, update MENU_STATUS
          such that your new menu item is listed as well.
        4.) In the function Update_Character_Menu (see below)
          you need to "calculate" the value that should be
          displayed within the menu item (calculating might
          be as easy as specifying a variable).
          Use the function Update_Menu_Item.
          This may look like this:
            var int gold;
            gold = Npc_HasItems(hero, ItMi_Gold);
            var string s;
            s = ConcatStrings(IntToString(gold), " Coins");
            Update_Menu_Item("MENU_ITEM_GOLD", s);
        5.) If you need additional labels or headings,
          create additional menu items in Menu_Status.d for it.
          For example a label "Gold:".
          You can use MENU_ITEM_STATUS_HEADING as a reference.
          Don't forget to list all new items in MENU_STATUS.
        5.) Do not call Update_Character_Menu yourself.
          This is automatically done for you each time
          the character menu is opened.
        6.) Do not try to manage menu items that the engine
          manages itself. For example you will not be able
          to change the value in MENU_ITEM_LEARN, because
          the engine will always display the number of learn points there, negating your changes.
          If, for example, you want to display the player strength,
          create a new menu item or rename the old menu item
          instead of just using MENU_ITEM_ATTRIBUTE_1.

    The function Update_Character_Menu currently contains
    code for replacing the heading "CHARAKTERPROFIL" in the
    status menu with a string displaying number of gold coins
    in the hero's inventory.
    This is supposed to serve as an example.
    After following only step 1 above this should already work.
##############################################################*/

// [INTERAL]
    func void Update_Menu_Item(var string name, var string val) {
        var int itPtr;
        itPtr = MEM_GetMenuItemByString(name);

        if (!itPtr) {
            MEM_Error(ConcatStrings("Update_Menu_Item: Invalid Menu Item: ", name));
            return;
        };

        //void __thiscall zCMenuItem::SetText(val = val, line = 0, drawNow = true)
        const int SetText = 5114800;

        CALL_IntParam(true);
        CALL_IntParam(0);
        CALL_zStringPtrParam(val);
        CALL__thiscall(itPtr, SetText);
    };

    //Call this is INIT_GLOBAL after LeGo_Init.
    func void Install_Character_Menu_Hook() {
        //at oCMenu_Status::SetLearnPoints
        const int done = false;
        if(!done) {
            HookEngineF(4707920, 6, Update_Character_Menu);
            done = true;
        };
    };
// [/INTERNAL]

// Fill in this function according to your needs:
func void Update_Character_Menu() {
    /* Usage:
        Update_Menu_Item([Name of the Menu Item],
                         [new String value]);
    */

    //Replace heading with number of coins
    //var int gold;
    //gold = Npc_HasItems(hero, ItMi_Gold);
    //var string s;
    //s = ConcatStrings(IntToString(gold), " Coins");
    //Update_Menu_Item("MENU_ITEM_STATUS_HEADING", s);
    if(heroKnows1hMaster)
    {
      Update_Menu_Item("MENU_ITEM_TALENT_1_RANK", NAME_CombatSkill_Title_Master);
    }
    else if(heroKnows1hAdvanced2)
    {
      Update_Menu_Item("MENU_ITEM_TALENT_1_RANK", NAME_CombatSkill_Title_Expert);
    }
    else if(heroKnows1hAdvanced1)
    {
      Update_Menu_Item("MENU_ITEM_TALENT_1_RANK", NAME_CombatSkill_Title_Fencer);
    }
    else if(heroKnows1hBasic2)
    {
      Update_Menu_Item("MENU_ITEM_TALENT_1_RANK", NAME_CombatSkill_Title_Adept);
    }
    else if(heroKnows1hBasic1)
    {
      Update_Menu_Item("MENU_ITEM_TALENT_1_RANK", NAME_CombatSkill_Title_Amateur);
    }
    else
    {
      Update_Menu_Item("MENU_ITEM_TALENT_1_RANK", NAME_CombatSkill_Title_None);
    };

    if(heroKnows2hMaster)
    {
      Update_Menu_Item("MENU_ITEM_TALENT_2_RANK", NAME_CombatSkill_Title_Master);
    }
    else if(heroKnows2hAdvanced2)
    {
      Update_Menu_Item("MENU_ITEM_TALENT_2_RANK", NAME_CombatSkill_Title_Expert);
    }
    else if(heroKnows2hAdvanced1)
    {
      Update_Menu_Item("MENU_ITEM_TALENT_2_RANK", NAME_CombatSkill_Title_Warrior);
    }
    else if(heroKnows2hBasic2)
    {
      Update_Menu_Item("MENU_ITEM_TALENT_2_RANK", NAME_CombatSkill_Title_Adept);
    }
    else if(heroKnows2hBasic1)
    {
      Update_Menu_Item("MENU_ITEM_TALENT_2_RANK", NAME_CombatSkill_Title_Amateur);
    }
    else
    {
      Update_Menu_Item("MENU_ITEM_TALENT_2_RANK", NAME_CombatSkill_Title_None);
    };

    if(heroKnowsBowMaster)
    {
      Update_Menu_Item("MENU_ITEM_TALENT_3_RANK", NAME_CombatSkill_Title_Master);
    }
    else if(heroKnowsBowAdvanced2)
    {
      Update_Menu_Item("MENU_ITEM_TALENT_3_RANK", NAME_CombatSkill_Title_Expert);
    }
    else if(heroKnowsBowAdvanced1)
    {
      Update_Menu_Item("MENU_ITEM_TALENT_3_RANK", NAME_CombatSkill_Title_Bowman);
    }
    else if(heroKnowsBowBasic2)
    {
      Update_Menu_Item("MENU_ITEM_TALENT_3_RANK", NAME_CombatSkill_Title_Adept);
    }
    else if(heroKnowsBowBasic1)
    {
      Update_Menu_Item("MENU_ITEM_TALENT_3_RANK", NAME_CombatSkill_Title_Amateur);
    }
    else
    {
      Update_Menu_Item("MENU_ITEM_TALENT_3_RANK", NAME_CombatSkill_Title_None);
    };

    if(heroKnowsCrossbowMaster)
    {
      Update_Menu_Item("MENU_ITEM_TALENT_4_RANK", NAME_CombatSkill_Title_Master);
    }
    else if(heroKnowsCrossbowAdvanced2)
    {
      Update_Menu_Item("MENU_ITEM_TALENT_4_RANK", NAME_CombatSkill_Title_Expert);
    }
    else if(heroKnowsCrossbowAdvanced1)
    {
      Update_Menu_Item("MENU_ITEM_TALENT_4_RANK", NAME_CombatSkill_Title_CrossBowman);
    }
    else if(heroKnowsCrossbowBasic2)
    {
      Update_Menu_Item("MENU_ITEM_TALENT_4_RANK", NAME_CombatSkill_Title_Adept);
    }
    else if(heroKnowsCrossbowBasic1)
    {
      Update_Menu_Item("MENU_ITEM_TALENT_4_RANK", NAME_CombatSkill_Title_Amateur);
    }
    else
    {
      Update_Menu_Item("MENU_ITEM_TALENT_4_RANK", NAME_CombatSkill_Title_None);
    };

    var string strength;
    //strength = ConcatStrings(IntToString(hero.attribute[ATR_STRENGTH] - ATTRIBUTEBONUS[ATR_STRENGTH] - ATTRIBUTEFROMEQUIPMENT[ATR_STRENGTH]), "/");
    //strength = ConcatStrings(strength, IntToString(hero.attribute[ATR_STRENGTH]));
    strength = ConcatStrings(IntToString(hero.attribute[ATR_STRENGTH]), "/");
    strength = ConcatStrings(strength, IntToString(attributepotential[ATR_STRENGTH]));

    var string dexterity;
    //dexterity = ConcatStrings(IntToString(hero.attribute[ATR_DEXTERITY] - ATTRIBUTEBONUS[ATR_DEXTERITY] - ATTRIBUTEFROMEQUIPMENT[ATR_DEXTERITY]), "/");
    //dexterity = ConcatStrings(dexterity, IntToString(hero.attribute[ATR_DEXTERITY]));
    dexterity = ConcatStrings(IntToString(hero.attribute[ATR_DEXTERITY]), "/");
    dexterity = ConcatStrings(dexterity, IntToString(attributepotential[ATR_DEXTERITY]));

    var string power;
    //dexterity = ConcatStrings(IntToString(hero.attribute[ATR_DEXTERITY] - ATTRIBUTEBONUS[ATR_DEXTERITY] - ATTRIBUTEFROMEQUIPMENT[ATR_DEXTERITY]), "/");
    //dexterity = ConcatStrings(dexterity, IntToString(hero.attribute[ATR_DEXTERITY]));
    power = ConcatStrings(IntToString(hero.attribute[ATR_MANA_MAX]), "/");
    power = ConcatStrings(power, IntToString(attributepotential[ATR_MANA_MAX]));



    Update_Menu_Item("MENU_ITEM_ATTRIBUTE_1_DETAILED", strength);
    Update_Menu_Item("MENU_ITEM_ATTRIBUTE_2_DETAILED", dexterity);
    Update_Menu_Item("MENU_ITEM_ATTRIBUTE_3_DETAILED", power);

};
