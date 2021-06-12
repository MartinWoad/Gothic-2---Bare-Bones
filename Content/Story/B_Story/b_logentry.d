
func void B_LogEntry(var string topic,var string entry)
{
	Log_AddEntry(topic,entry);
	//PrintScreen(PRINT_NewLogEntry,-1,YPOS_LOGENTRY,FONT_ScreenSmall,2);
	PrintS_Ext(PRINT_NewLogEntry, Yellow());
	Snd_Play("LogEntry");
};
