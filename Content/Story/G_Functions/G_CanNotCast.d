
func void G_CanNotCast(var int bIsPlayer,var int nCircleNeeded,var int nCirclePossessed)
{
	var string strMessage;
	var int nDifference;
	var string strCircleNeeded;
	nDifference = nCircleNeeded - nCirclePossessed;
	strCircleNeeded = IntToString(nCircleNeeded);
	strMessage = ConcatStrings(strMessage,PRINT_MAGCIRCLES_MISSING);
	strMessage = ConcatStrings(strMessage," ");
	strMessage = ConcatStrings(strMessage,strCircleNeeded);
	if(bIsPlayer)
	{
		PrintS(strMessage);
	};
	strMessage = "";
};
