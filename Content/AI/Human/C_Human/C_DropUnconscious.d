
func int C_DropUnconscious()
{
	if((other.guild > GIL_SEPERATOR_HUM) || (other.guild == GIL_DMT))
	{
		return FALSE;
	};
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		if(self.guild != GIL_DMT)
		{
			return TRUE;
		};
	};
	return FALSE;
};

