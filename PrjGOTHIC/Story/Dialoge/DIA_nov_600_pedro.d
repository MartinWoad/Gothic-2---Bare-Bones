
instance DIA_PEDRO_EXIT(C_INFO)
{
	npc = nov_600_pedro;
	nr = 999;
	condition = dia_pedro_exit_condition;
	information = dia_pedro_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pedro_exit_condition()
{
	return TRUE;
};

func void dia_pedro_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PEDRO_WELCOME(C_INFO)
{
	npc = nov_600_pedro;
	nr = 1;
	condition = dia_pedro_welcome_condition;
	information = dia_pedro_welcome_info;
	important = TRUE;
};


func int dia_pedro_welcome_condition()
{
	return TRUE;
};

func void dia_pedro_welcome_info()
{
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_00");	//Witaj w klasztorze Innosa, nieznajomy.
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_01");	//Jestem Brat Pedro, pokorny s�uga Innosa i od�wierny �wi�tego klasztoru.
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_02");	//Co ci� do nas sprowadza?
};


instance DIA_PEDRO_WURST(C_INFO)
{
	npc = nov_600_pedro;
	nr = 2;
	condition = dia_pedro_wurst_condition;
	information = dia_pedro_wurst_info;
	permanent = FALSE;
	description = "Masz tu kawa�ek kie�basy, Bracie.";
};


func int dia_pedro_wurst_condition()
{
	if((KAPITEL < 3) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_pedro_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Pedro_Wurst_15_00");	//Masz tu kawa�ek kie�basy, Bracie.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_01");	//To mi�o, �e o mnie pomy�la�e�. Zwykle nikt o mnie nie pami�ta.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_02");	//M�g�by� mi da� jeszcze kawa�ek...
	AI_Output(other,self,"DIA_Pedro_Wurst_15_03");	//Nie ma mowy. Wtedy za ma�o mi zostanie.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_04");	//No wiesz? Jeden kawa�ek! Przecie� nikt nie zauwa�y. Mog� ci da� co� w zamian! Wiem, gdzie ro�nie sporo ognistych pokrzyw!
	AI_Output(self,other,"DIA_Pedro_Wurst_09_05");	//Je�li zaniesiesz je Neorasowi, na pewno da ci klucz do biblioteki. Co ty na to?
	b_giveinvitems(other,self,5687,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,4914);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,3);
	Info_ClearChoices(dia_pedro_wurst);
	Info_AddChoice(dia_pedro_wurst,"Niech b�dzie. Masz jeszcze jedno p�to.",dia_pedro_wurst_ja);
	Info_AddChoice(dia_pedro_wurst,"Nie ma mowy.",dia_pedro_wurst_nein);
};

func void dia_pedro_wurst_ja()
{
	AI_Output(other,self,"DIA_Pedro_Wurst_JA_15_00");	//Niech b�dzie. Masz jeszcze jedno p�to.
	AI_Output(self,other,"DIA_Pedro_Wurst_JA_09_01");	//�wietnie. Po drugiej stronie mostu, na lewo i na prawo, ro�nie du�o ognistych pokrzyw.
	b_giveinvitems(other,self,5687,1);
	Info_ClearChoices(dia_pedro_wurst);
};

func void dia_pedro_wurst_nein()
{
	AI_Output(other,self,"DIA_Pedro_Wurst_NEIN_15_00");	//Nie ma mowy.
	AI_Output(self,other,"DIA_Pedro_Wurst_NEIN_09_01");	//Chcesz si� podliza� Goraxowi, co? Wszyscy nowicjusze tak robi�...
	Info_ClearChoices(dia_pedro_wurst);
};


instance DIA_PEDRO_EINLASS(C_INFO)
{
	npc = nov_600_pedro;
	condition = dia_pedro_einlass_condition;
	information = dia_pedro_einlass_info;
	permanent = FALSE;
	description = "Chc� si� dosta� do klasztoru.";
};


func int dia_pedro_einlass_condition()
{
	if(Npc_KnowsInfo(hero,dia_pedro_welcome))
	{
		return TRUE;
	};
};

func void dia_pedro_einlass_info()
{
	AI_Output(other,self,"DIA_Pedro_EINLASS_15_00");	//Chc� si� dosta� do klasztoru.
	AI_Output(self,other,"DIA_Pedro_EINLASS_09_01");	//Tylko s�udzy Innosa mog� wej�� do �rodka.
	AI_Output(self,other,"DIA_Pedro_EINLASS_09_02");	//Je�li chcesz si� pomodli�, poszukaj kt�rej� z przydro�nych kapliczek. Tam r�wnie� znajdziesz odpowiedni� cisz� i spok�j.
};


instance DIA_PEDRO_TEMPEL(C_INFO)
{
	npc = nov_600_pedro;
	nr = 2;
	condition = dia_pedro_tempel_condition;
	information = dia_pedro_tempel_info;
	permanent = FALSE;
	description = "Co mam zrobi�, �eby przyj�to mnie do klasztoru?";
};


func int dia_pedro_tempel_condition()
{
	if(Npc_KnowsInfo(other,dia_pedro_einlass) && (hero.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pedro_tempel_info()
{
	AI_Output(other,self,"DIA_Pedro_TEMPEL_15_00");	//Co mam zrobi�, �eby przyj�to mnie do klasztoru?
	if(other.guild != GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_01");	//Wybra�e� ju� swoj� �cie�k�. Droga do klasztoru jest przed tob� zamkni�ta.
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_02");	//Je�li chcesz do��czy� do Bractwa Innosa, musisz pozna� regu�y klasztoru i wiernie ich przestrzega�.
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_03");	//Opr�cz tego, ka�dy nowy kandydat musi z�o�y� Innosowi ofiar� - owc� i...
		b_say_gold(self,other,SUMME_KLOSTER);
		AI_Output(other,self,"DIA_Pedro_TEMPEL_15_04");	//To du�o pieni�dzy.
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_05");	//To znak, �e rozpoczynasz nowe �ycie jako s�uga Innosa. Je�li zostaniesz przyj�ty, wszystkie twoje grzechy zostan� ci wybaczone.
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_06");	//Ale pami�taj: s�ug� Innosa zostaje si� na ca�e �ycie!
		Log_CreateTopic(TOPIC_KLOSTER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_KLOSTER,LOG_RUNNING);
		b_logentry(TOPIC_KLOSTER,"Aby zosta� nowicjuszem w klasztorze Innosa, b�d� potrzebowa� owcy i ogromnej sumy pieni�dzy.");
	};
};


instance DIA_PEDRO_RULES(C_INFO)
{
	npc = nov_600_pedro;
	nr = 2;
	condition = dia_pedro_rules_condition;
	information = dia_pedro_rules_info;
	permanent = FALSE;
	description = "Jakich regu� przestrzegaj� s�udzy Innosa?";
};


func int dia_pedro_rules_condition()
{
	if(Npc_KnowsInfo(other,dia_pedro_tempel))
	{
		return TRUE;
	};
};

func void dia_pedro_rules_info()
{
	AI_Output(other,self,"DIA_Pedro_Rules_15_00");	//Jakich regu� przestrzegaj� s�udzy Innosa?
	AI_Output(self,other,"DIA_Pedro_Rules_09_01");	//Innos jest bogiem prawdy i sprawiedliwo�ci, dlatego pod �adnym pozorem nie wolno nam oszukiwa� i �ama� prawa.
	AI_Output(self,other,"DIA_Pedro_Rules_09_02");	//Wyst�pienie przeciwko kt�remu� z braci lub okradanie klasztoru jest karane z ca�� surowo�ci�!
	AI_Output(self,other,"DIA_Pedro_Rules_09_03");	//Innos jest tak�e bogiem w�adzy i ognia.
	AI_Output(self,other,"DIA_Pedro_Rules_09_04");	//Jako nowicjusz musisz okazywa� szacunek i pos�usze�stwo wszystkim Magom Ognia.
	AI_Output(other,self,"DIA_Pedro_Rules_15_05");	//Rozumiem.
	AI_Output(self,other,"DIA_Pedro_Rules_09_06");	//Co wi�cej, obowi�zkiem ka�dego nowicjusza jest praca w klasztorze dla dobra ca�ej spo�eczno�ci.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_Rules_09_07");	//Je�li jeste� got�w przestrzega� tych zasad i z�o�ysz odpowiedni� ofiar�, mo�esz zosta� przyj�ty do klasztoru jako nowicjusz.
	};
};


instance DIA_PEDRO_AUFNAHME(C_INFO)
{
	npc = nov_600_pedro;
	condition = dia_pedro_aufnahme_condition;
	information = dia_pedro_aufnahme_info;
	permanent = TRUE;
	description = "Chc� zosta� nowicjuszem.";
};


var int dia_pedro_aufnahme_noperm;

func int dia_pedro_aufnahme_condition()
{
	if(Npc_KnowsInfo(hero,dia_pedro_rules) && (DIA_PEDRO_AUFNAHME_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_pedro_aufnahme_info()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_15_00");	//Chc� zosta� nowicjuszem.
	Npc_PerceiveAll(self);
	if(hero.guild != GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_AUFNAHME_09_01");	//Wybra�e� ju� �cie�k�, po kt�rej kroczysz. Droga magii jest dla ciebie zamkni�ta.
		DIA_PEDRO_AUFNAHME_NOPERM = TRUE;
	}
	else if((hero.guild == GIL_NONE) && (Npc_HasItems(hero,itmi_gold) >= SUMME_KLOSTER) && Wld_DetectNpc(self,follow_sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 1000))
	{
		AI_Output(self,hero,"DIA_Pedro_AUFNAHME_09_03");	//Widz�, �e got�w jeste� z�o�y� odpowiedni� ofiar�. Je�li nie zmieni�e� zdania, mo�esz teraz zosta� nowicjuszem w klasztorze.
		AI_Output(self,hero,"DIA_Pedro_AUFNAHME_09_04");	//Pami�taj jednak, �e od tej decyzji nie ma odwo�ania. Musisz mie� pewno��, �e wybierasz w�a�ciw� �cie�k�!
		Info_ClearChoices(dia_pedro_aufnahme);
		Info_AddChoice(dia_pedro_aufnahme,"Musz� to sobie jeszcze przemy�le�.",dia_pedro_aufnahme_no);
		Info_AddChoice(dia_pedro_aufnahme,"Tak, chc� po�wi�ci� swoje �ycie s�u�bie Innosowi.",dia_pedro_aufnahme_yes);
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_AUFNAHME_09_02");	//Nie masz jeszcze rzeczy potrzebnych do z�o�enia ofiary.
	};
};

func void dia_pedro_aufnahme_yes()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_YES_15_00");	//Tak, chc� po�wi�ci� swoje �ycie s�u�bie Innosowi.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_01");	//Zatem witaj w�r�d nas, Bracie. Oto klucz do bramy klasztoru.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_02");	//Teraz musisz dobrowolnie otworzy� te odrzwia i przekroczy� pr�g.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_03");	//Od dzi� jeste� nowicjuszem. No� t� szat�, by wszyscy wiedzieli, �e jeste� jednym z nas.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_04");	//W �rodku zg�o� si� do Parlana. Od dzi� on b�dzie si� tob� opiekowa�.
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_YES_15_05");	//Czy moje wyst�pki zostan� mi zapomniane?
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_06");	//Jeszcze nie. Porozmawiaj z Mistrzem Parlanem. On udzieli ci b�ogos�awie�stwa i oczy�ci z grzech�w.
	CreateInvItems(self,itke_innos_mis,1);
	b_giveinvitems(self,hero,5682,1);
	CreateInvItems(other,itar_nov_l,1);
	AI_EquipArmor(other,itar_nov_l);
	other.guild = GIL_NOV;
	Npc_SetTrueGuild(other,GIL_NOV);
	DIA_PEDRO_AUFNAHME_NOPERM = TRUE;
	NOV_AUFNAHME = TRUE;
	b_giveplayerxp(XP_AUFNAHMENOVIZE);
	Wld_AssignRoomToGuild("Kloster02",GIL_KDF);
	AI_StopProcessInfos(self);
};

func void dia_pedro_aufnahme_no()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_NO_15_00");	//Musz� to sobie jeszcze przemy�le�.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_NO_09_01");	//Wr��, gdy uznasz, �e jeste� gotowy.
	Info_ClearChoices(dia_pedro_aufnahme);
};


instance DIA_PEDRO_MONASTERY(C_INFO)
{
	npc = nov_600_pedro;
	nr = 90;
	condition = dia_pedro_monastery_condition;
	information = dia_pedro_monastery_info;
	permanent = TRUE;
	description = "Opowiedz mi o �yciu w klasztorze.";
};


func int dia_pedro_monastery_condition()
{
	return TRUE;
};

func void dia_pedro_monastery_info()
{
	AI_Output(other,self,"DIA_Pedro_Monastery_15_00");	//Opowiedz mi o �yciu w klasztorze.
	AI_Output(self,other,"DIA_Pedro_Monastery_09_01");	//Celem naszego �ycia jest s�u�ba wielkiemu Innosowi. My, nowicjusze, wykonujemy podstawowe prace, a w wolnych chwilach studiujemy stare pisma.
	AI_Output(self,other,"DIA_Pedro_Monastery_09_02");	//Naszymi opiekunami s� magowie, kt�rzy zg��biaj� sztuki tajemne.
};


instance DIA_PEDRO_PICKPOCKET(C_INFO)
{
	npc = nov_600_pedro;
	nr = 900;
	condition = dia_pedro_pickpocket_condition;
	information = dia_pedro_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_pedro_pickpocket_condition()
{
	return c_beklauen(45,60);
};

func void dia_pedro_pickpocket_info()
{
	Info_ClearChoices(dia_pedro_pickpocket);
	Info_AddChoice(dia_pedro_pickpocket,DIALOG_BACK,dia_pedro_pickpocket_back);
	Info_AddChoice(dia_pedro_pickpocket,DIALOG_PICKPOCKET,dia_pedro_pickpocket_doit);
};

func void dia_pedro_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_pedro_pickpocket);
};

func void dia_pedro_pickpocket_back()
{
	Info_ClearChoices(dia_pedro_pickpocket);
};

