
func void B_AddPetzCrime(var C_Npc slf,var int crime)
{
	if(C_NpcBelongsToOldCamp(slf))
	{
		if(crime == CRIME_MURDER)
		{
			PETZCOUNTER_OldCamp_Murder = PETZCOUNTER_OldCamp_Murder + 1;
		};
		if(crime == CRIME_THEFT)
		{
			PETZCOUNTER_OldCamp_Theft = PETZCOUNTER_OldCamp_Theft + 1;
		};
		if(crime == CRIME_ATTACK)
		{
			PETZCOUNTER_OldCamp_Attack = PETZCOUNTER_OldCamp_Attack + 1;
		};
		if(crime == CRIME_SHEEPKILLER)
		{
			PETZCOUNTER_OldCamp_Sheepkiller = PETZCOUNTER_OldCamp_Sheepkiller + 1;
		};
	};
	if(C_NpcBelongsToCity(slf))
	{
		if(crime == CRIME_MURDER)
		{
			PETZCOUNTER_City_Murder = PETZCOUNTER_City_Murder + 1;
		};
		if(crime == CRIME_THEFT)
		{
			PETZCOUNTER_City_Theft = PETZCOUNTER_City_Theft + 1;
		};
		if(crime == CRIME_ATTACK)
		{
			PETZCOUNTER_City_Attack = PETZCOUNTER_City_Attack + 1;
		};
		if(crime == CRIME_SHEEPKILLER)
		{
			PETZCOUNTER_City_Sheepkiller = PETZCOUNTER_City_Sheepkiller + 1;
		};
	};
	if(C_NpcBelongsToMonastery(slf))
	{
		if(crime == CRIME_MURDER)
		{
			PETZCOUNTER_Monastery_Murder = PETZCOUNTER_Monastery_Murder + 1;
		};
		if(crime == CRIME_THEFT)
		{
			PETZCOUNTER_Monastery_Theft = PETZCOUNTER_Monastery_Theft + 1;
		};
		if(crime == CRIME_ATTACK)
		{
			PETZCOUNTER_Monastery_Attack = PETZCOUNTER_Monastery_Attack + 1;
		};
		if(crime == CRIME_SHEEPKILLER)
		{
			PETZCOUNTER_Monastery_Sheepkiller = PETZCOUNTER_Monastery_Sheepkiller + 1;
		};
	};
	if(C_NpcBelongsToFarm(slf))
	{
		if(crime == CRIME_MURDER)
		{
			PETZCOUNTER_Farm_Murder = PETZCOUNTER_Farm_Murder + 1;
		};
		if(crime == CRIME_THEFT)
		{
			PETZCOUNTER_Farm_Theft = PETZCOUNTER_Farm_Theft + 1;
		};
		if(crime == CRIME_ATTACK)
		{
			PETZCOUNTER_Farm_Attack = PETZCOUNTER_Farm_Attack + 1;
		};
		if(crime == CRIME_SHEEPKILLER)
		{
			PETZCOUNTER_Farm_Sheepkiller = PETZCOUNTER_Farm_Sheepkiller + 1;
		};
	};
};

