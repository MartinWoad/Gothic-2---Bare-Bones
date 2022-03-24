
func void B_LogEntry(var string topic,var string entry)
{
	Log_AddEntry(topic,entry);
	var string concatText;
	concatText = ConcatStrings(PRINT_NewLogEntry," - ");
	concatText = ConcatStrings(concatText,topic);
	//PrintScreen(PRINT_NewLogEntry,-1,YPOS_LOGENTRY,FONT_ScreenSmall,2);
	AI_PrintS_Ext(hero, concatText, Yellow());
	AI_Function_S(hero, Snd_Play, "LogEntry");

	//Snd_Play("LogEntry");
};

func void B_LogEntrySilent(var string topic,var string entry)
{
	Log_AddEntry(topic,entry);
};
