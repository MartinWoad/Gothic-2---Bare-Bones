
func void b_addpetzcrime(var C_NPC slf,var int crime)
{
	if(c_npcbelongstooldcamp(slf))
	{
		if(crime == CRIME_MURDER)
		{
			PETZCOUNTER_OLDCAMP_MURDER = PETZCOUNTER_OLDCAMP_MURDER + 1;
		};
		if(crime == CRIME_THEFT)
		{
			PETZCOUNTER_OLDCAMP_THEFT = PETZCOUNTER_OLDCAMP_THEFT + 1;
		};
		if(crime == CRIME_ATTACK)
		{
			PETZCOUNTER_OLDCAMP_ATTACK = PETZCOUNTER_OLDCAMP_ATTACK + 1;
		};
		if(crime == CRIME_SHEEPKILLER)
		{
			PETZCOUNTER_OLDCAMP_SHEEPKILLER = PETZCOUNTER_OLDCAMP_SHEEPKILLER + 1;
		};
	};
	if(c_npcbelongstocity(slf))
	{
		if(crime == CRIME_MURDER)
		{
			PETZCOUNTER_CITY_MURDER = PETZCOUNTER_CITY_MURDER + 1;
		};
		if(crime == CRIME_THEFT)
		{
			PETZCOUNTER_CITY_THEFT = PETZCOUNTER_CITY_THEFT + 1;
		};
		if(crime == CRIME_ATTACK)
		{
			PETZCOUNTER_CITY_ATTACK = PETZCOUNTER_CITY_ATTACK + 1;
		};
		if(crime == CRIME_SHEEPKILLER)
		{
			PETZCOUNTER_CITY_SHEEPKILLER = PETZCOUNTER_CITY_SHEEPKILLER + 1;
		};
	};
	if(c_npcbelongstomonastery(slf))
	{
		if(crime == CRIME_MURDER)
		{
			PETZCOUNTER_MONASTERY_MURDER = PETZCOUNTER_MONASTERY_MURDER + 1;
		};
		if(crime == CRIME_THEFT)
		{
			PETZCOUNTER_MONASTERY_THEFT = PETZCOUNTER_MONASTERY_THEFT + 1;
		};
		if(crime == CRIME_ATTACK)
		{
			PETZCOUNTER_MONASTERY_ATTACK = PETZCOUNTER_MONASTERY_ATTACK + 1;
		};
		if(crime == CRIME_SHEEPKILLER)
		{
			PETZCOUNTER_MONASTERY_SHEEPKILLER = PETZCOUNTER_MONASTERY_SHEEPKILLER + 1;
		};
	};
	if(c_npcbelongstofarm(slf))
	{
		if(crime == CRIME_MURDER)
		{
			PETZCOUNTER_FARM_MURDER = PETZCOUNTER_FARM_MURDER + 1;
		};
		if(crime == CRIME_THEFT)
		{
			PETZCOUNTER_FARM_THEFT = PETZCOUNTER_FARM_THEFT + 1;
		};
		if(crime == CRIME_ATTACK)
		{
			PETZCOUNTER_FARM_ATTACK = PETZCOUNTER_FARM_ATTACK + 1;
		};
		if(crime == CRIME_SHEEPKILLER)
		{
			PETZCOUNTER_FARM_SHEEPKILLER = PETZCOUNTER_FARM_SHEEPKILLER + 1;
		};
	};
};

