var int playermapinstance;

func int b_getplayermap()
{
	return PLAYERMAPINSTANCE;
};

func int b_setplayermap(var int mapinstance)
{
	PLAYERMAPINSTANCE = mapinstance;
	return PLAYERMAPINSTANCE;
};

func int b_getbestplayermap()
{
	if(CURRENTLEVEL == NEWWORLD_ZEN)
	{
		if(Npc_HasItems(hero,itwr_map_newworld) >= 1)
		{
			return itwr_map_newworld;
		}
		else if(Npc_HasItems(hero,itwr_map_shrine_mis) >= 1)
		{
			return itwr_map_shrine_mis;
		}
		else if(Npc_HasItems(hero,itwr_map_caves_mis) >= 1)
		{
			return itwr_map_caves_mis;
		}
		else if(Npc_HasItems(hero,itwr_shatteredgolem_mis) >= 1)
		{
			return itwr_shatteredgolem_mis;
		}
		else if(Npc_HasItems(hero,itwr_map_orcelite_mis) >= 1)
		{
			return itwr_map_orcelite_mis;
		}
		else if(Npc_HasItems(hero,itwr_map_newworld_city) >= 1)
		{
			return itwr_map_newworld_city;
		};
	}
	else if(CURRENTLEVEL == OLDWORLD_ZEN)
	{
		if(Npc_HasItems(hero,itwr_map_oldworld) >= 1)
		{
			return itwr_map_oldworld;
		}
		else if(Npc_HasItems(hero,itwr_map_oldworld_oremines_mis) >= 1)
		{
			return itwr_map_oldworld_oremines_mis;
		};
	}
	else if(CURRENTLEVEL == DRAGONISLAND_ZEN)
	{
	};
	return 0;
};

func int b_getanyplayermap()
{
	if(Npc_HasItems(hero,itwr_map_newworld) >= 1)
	{
		return itwr_map_newworld;
	}
	else if(Npc_HasItems(hero,itwr_map_shrine_mis) >= 1)
	{
		return itwr_map_shrine_mis;
	}
	else if(Npc_HasItems(hero,itwr_map_caves_mis) >= 1)
	{
		return itwr_map_caves_mis;
	}
	else if(Npc_HasItems(hero,itwr_shatteredgolem_mis) >= 1)
	{
		return itwr_shatteredgolem_mis;
	}
	else if(Npc_HasItems(hero,itwr_map_orcelite_mis) >= 1)
	{
		return itwr_map_orcelite_mis;
	}
	else if(Npc_HasItems(hero,itwr_map_newworld_city) >= 1)
	{
		return itwr_map_newworld_city;
	}
	else if(Npc_HasItems(hero,itwr_map_oldworld) >= 1)
	{
		return itwr_map_oldworld;
	}
	else if(Npc_HasItems(hero,itwr_map_oldworld_oremines_mis) >= 1)
	{
		return itwr_map_oldworld_oremines_mis;
	};
	return 0;
};

func int player_hotkey_screen_map()
{
	var int oldinstance;
	var int newinstance;
	oldinstance = b_getplayermap();
	if((oldinstance > 0) && (Npc_HasItems(hero,oldinstance) < 1))
	{
		oldinstance = 0;
	};
	b_setplayermap(oldinstance);
	newinstance = oldinstance;
	if(CURRENTLEVEL != NEWWORLD_ZEN)
	{
		if((oldinstance == itwr_map_caves_mis) || (oldinstance == itwr_map_newworld) || (oldinstance == itwr_map_newworld_city) || (oldinstance == itwr_map_orcelite_mis) || (oldinstance == itwr_map_shrine_mis) || (oldinstance == itwr_shatteredgolem_mis))
		{
			newinstance = 0;
		};
	};
	if(CURRENTLEVEL != OLDWORLD_ZEN)
	{
		if((oldinstance == itwr_map_oldworld) || (oldinstance == itwr_map_oldworld_oremines_mis))
		{
			newinstance = 0;
		};
	};
	if(CURRENTLEVEL != DRAGONISLAND_ZEN)
	{
	};
	if(newinstance <= 0)
	{
		newinstance = b_getbestplayermap();
	};
	if((newinstance <= 0) && (oldinstance <= 0))
	{
		newinstance = b_getanyplayermap();
	};
	if(newinstance > 0)
	{
		b_setplayermap(newinstance);
		return newinstance;
	}
	else
	{
		return oldinstance;
	};
};
