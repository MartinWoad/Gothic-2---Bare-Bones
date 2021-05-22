
func void Use_Bookstand_01_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(hero.guild == GIL_NOV)
		{
			KNOWS_FIRE_CONTEST = TRUE;
			Log_CreateTopic(TOPIC_FireContest,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_FireContest,LOG_Running);
			B_LogEntry(TOPIC_FireContest,"Jako nowicjusz mam prawo za��da� Pr�by Ognia, a ka�dy z trzech mag�w nale��cych do Najwy�szej Rady przydzieli mi jakie� zadanie. Po uko�czeniu wszystkich misji zostan� przyj�ty do Kr�gu Ognia.");
		};
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Pr�ba Ognia");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Nowicjusz mo�e uwa�a�, �e jest gotowy na do��czenie do Kr�gu Ognia, ale nie od razu dost�pi tego zaszczytu. Gdy dobrze si� zastanowi i nadal b�dzie uparcie d��y� do swego celu, to mo�e skorzysta� z prawa za��dania Pr�by, nie mo�e mu odm�wi� �aden mag. Ca�a procedura nie ogranicza si� do Pr�by Magii - kandydat musi r�wnie� zosta� o�wiecony przez p�omienie, gdy wyrazi tak� wol� przed Najwy�sz� Rad�, stanie przed PR�B� OGNIA,");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"kt�ra sprawdzi jego zr�czno��, si�� i m�dro��. Ka�de z trzech zada� zostanie zlecone przez innego cz�onka Najwy�szej Rady i dopiero po wykonaniu wszystkich trzech kandydat b�dzie m�g� z�o�y� Przysi�g� Ognia i zbrata� si� z p�omieniami.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Taka jest wola Innosa i tako� si� stanie.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Najwy�sza Rada");
		Doc_Show(nDocID);
	};
};


var int FinalDragonEquipment_Once;

func void Use_FINALDRAGONEQUIPMENT_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"... Mam nadziej�, �e Bariera ochroni rud� przed zakusami Beliara. Kr�l w swej naiwno�ci wierzy, �e stworzyli�my j�, �eby nie dopu�ci� do ucieczek. Niechaj nadal tak s�dzi, je�li dzi�ki temu uda si� nam osi�gn�� nasze odleglejsze cele. Mo�emy tylko marzy� o czasie na przygotowanie si� do nadchodz�cej walki. To na ni� skieruj� ca�� sw� moc, gdy tylko Bariera dooko�a G�rniczej Doliny zostanie uko�czona.");
		Doc_PrintLines(nDocID,0,"");
		if(hero.guild == GIL_KDF)
		{
			PlayerGetsAmulettOfDeath = TRUE;
			PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] = TRUE;
			B_LogEntry(TOPIC_TalentRunes,"Sk�adniki runy '�wi�ty pocisk': 1 porcja wody �wi�conej, nie potrzeba zwoju z zakl�ciem");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"... Na runicznym stole obla�em wod� �wi�con�, zgodnie z instrukcjami, pusty kamie� runiczny. Kamie� uleg� zniszczeniu... To zakl�cie jest chyba przeznaczone tylko dla Wybra�ca.");
			Doc_PrintLines(nDocID,1,"Na stra�y klasztoru pozostawi�em �wi�t� Aur� Innosa. Przeor b�dzie o ni� dba�, dop�ki nie objawi si� Wybraniec.");
			Doc_PrintLines(nDocID,1,"�zy Innosa mog� odegra� ogromn� rol� w nadchodz�cej walce, niebezpiecznie wi�c trzyma� je na widoku publicznym. Lepiej schowam je tu, w bibliotece.");
			Doc_Show(nDocID);
		}
		else if(hero.guild == GIL_PAL)
		{
			PAL_KnowsAbout_FINAL_BLESSING = TRUE;
			PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] = TRUE;
			PrintScreen(PRINT_LearnPalTeleportSecret,-1,-1,FONT_Screen,2);
			Log_CreateTopic(TOPIC_TalentRunes,LOG_NOTE);
			B_LogEntry(TOPIC_TalentRunes,"Tworzenie run wymaga u�ycia odpowiednich sk�adnik�w. Ca�y proces wymaga jeszcze odpowiedniego sto�u i pustego kamienia runicznego.");
			B_LogEntry(TOPIC_TalentRunes,"Sk�adniki runy 'Tajny teleport': 1 porcja �ez Innosa");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Aby m�c si� dosta� do ukrytego miejsca, musisz stworzy� specjaln� run� teleportuj�c� - b�dzie ci do tego potrzebny pusty kamie� runiczny i ma�a buteleczka wody �wi�conej.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Jestem prawie pewien, �e paladyni wykorzystywali �zy Innosa w dawno zapomnianym rytuale znanym jako Konsekracja Miecza. Za pomoc� znalezionej wcze�niej ma�ej buteleczki powinienem wi�c nada� konsekrowanej broni dodatkow� moc.");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		}
		else
		{
			PlayergetsFinalDJGArmor = TRUE;
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Fragment ksi�gi 'Bro� smoczego pana'.");
			Doc_PrintLines(nDocID,1,"Aby zbroicy ze smoczych �usek twardo�ci nielichej doda�, pokry� trza �uski takowe rud� w dolinie na wyspie Karynis kopan�.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"By ostrze po�lednie zdatnym dla smoczego pana uczyni�, krwi� smok�w obla� je nale�y. Pi�� porcji posoki sprawi, �e ostrze ostre niezwykle b�dzie i moc niezr�wnan� zyska.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Uwaga: nazwa 'Karynis' nawi�zuje prawdopodobnie do obszar�w znanych obecnie jako Khorinis.");
			Doc_Show(nDocID);
		};
		if(FinalDragonEquipment_Once == FALSE)
		{
			B_GivePlayerXP(XP_FinalDragonEquipment);
			FinalDragonEquipment_Once = TRUE;
		};
	};
};

