
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
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_01");	//Jestem Brat Pedro, pokorny s³uga Innosa i odŸwierny œwiêtego klasztoru.
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_02");	//Co ciê do nas sprowadza?
};


instance DIA_PEDRO_WURST(C_INFO)
{
	npc = nov_600_pedro;
	nr = 2;
	condition = dia_pedro_wurst_condition;
	information = dia_pedro_wurst_info;
	permanent = FALSE;
	description = "Masz tu kawa³ek kie³basy, Bracie.";
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
	AI_Output(other,self,"DIA_Pedro_Wurst_15_00");	//Masz tu kawa³ek kie³basy, Bracie.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_01");	//To mi³o, ¿e o mnie pomyœla³eœ. Zwykle nikt o mnie nie pamiêta.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_02");	//Móg³byœ mi daæ jeszcze kawa³ek...
	AI_Output(other,self,"DIA_Pedro_Wurst_15_03");	//Nie ma mowy. Wtedy za ma³o mi zostanie.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_04");	//No wiesz? Jeden kawa³ek! Przecie¿ nikt nie zauwa¿y. Mogê ci daæ coœ w zamian! Wiem, gdzie roœnie sporo ognistych pokrzyw!
	AI_Output(self,other,"DIA_Pedro_Wurst_09_05");	//Jeœli zaniesiesz je Neorasowi, na pewno da ci klucz do biblioteki. Co ty na to?
	b_giveinvitems(other,self,5687,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,4914);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,3);
	Info_ClearChoices(dia_pedro_wurst);
	Info_AddChoice(dia_pedro_wurst,"Niech bêdzie. Masz jeszcze jedno pêto.",dia_pedro_wurst_ja);
	Info_AddChoice(dia_pedro_wurst,"Nie ma mowy.",dia_pedro_wurst_nein);
};

func void dia_pedro_wurst_ja()
{
	AI_Output(other,self,"DIA_Pedro_Wurst_JA_15_00");	//Niech bêdzie. Masz jeszcze jedno pêto.
	AI_Output(self,other,"DIA_Pedro_Wurst_JA_09_01");	//Œwietnie. Po drugiej stronie mostu, na lewo i na prawo, roœnie du¿o ognistych pokrzyw.
	b_giveinvitems(other,self,5687,1);
	Info_ClearChoices(dia_pedro_wurst);
};

func void dia_pedro_wurst_nein()
{
	AI_Output(other,self,"DIA_Pedro_Wurst_NEIN_15_00");	//Nie ma mowy.
	AI_Output(self,other,"DIA_Pedro_Wurst_NEIN_09_01");	//Chcesz siê podlizaæ Goraxowi, co? Wszyscy nowicjusze tak robi¹...
	Info_ClearChoices(dia_pedro_wurst);
};


instance DIA_PEDRO_EINLASS(C_INFO)
{
	npc = nov_600_pedro;
	condition = dia_pedro_einlass_condition;
	information = dia_pedro_einlass_info;
	permanent = FALSE;
	description = "Chcê siê dostaæ do klasztoru.";
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
	AI_Output(other,self,"DIA_Pedro_EINLASS_15_00");	//Chcê siê dostaæ do klasztoru.
	AI_Output(self,other,"DIA_Pedro_EINLASS_09_01");	//Tylko s³udzy Innosa mog¹ wejœæ do œrodka.
	AI_Output(self,other,"DIA_Pedro_EINLASS_09_02");	//Jeœli chcesz siê pomodliæ, poszukaj którejœ z przydro¿nych kapliczek. Tam równie¿ znajdziesz odpowiedni¹ ciszê i spokój.
};


instance DIA_PEDRO_TEMPEL(C_INFO)
{
	npc = nov_600_pedro;
	nr = 2;
	condition = dia_pedro_tempel_condition;
	information = dia_pedro_tempel_info;
	permanent = FALSE;
	description = "Co mam zrobiæ, ¿eby przyjêto mnie do klasztoru?";
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
	AI_Output(other,self,"DIA_Pedro_TEMPEL_15_00");	//Co mam zrobiæ, ¿eby przyjêto mnie do klasztoru?
	if(other.guild != GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_01");	//Wybra³eœ ju¿ swoj¹ œcie¿kê. Droga do klasztoru jest przed tob¹ zamkniêta.
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_02");	//Jeœli chcesz do³¹czyæ do Bractwa Innosa, musisz poznaæ regu³y klasztoru i wiernie ich przestrzegaæ.
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_03");	//Oprócz tego, ka¿dy nowy kandydat musi z³o¿yæ Innosowi ofiarê - owcê i...
		b_say_gold(self,other,SUMME_KLOSTER);
		AI_Output(other,self,"DIA_Pedro_TEMPEL_15_04");	//To du¿o pieniêdzy.
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_05");	//To znak, ¿e rozpoczynasz nowe ¿ycie jako s³uga Innosa. Jeœli zostaniesz przyjêty, wszystkie twoje grzechy zostan¹ ci wybaczone.
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_06");	//Ale pamiêtaj: s³ug¹ Innosa zostaje siê na ca³e ¿ycie!
		Log_CreateTopic(TOPIC_KLOSTER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_KLOSTER,LOG_RUNNING);
		b_logentry(TOPIC_KLOSTER,"Aby zostaæ nowicjuszem w klasztorze Innosa, bêdê potrzebowa³ owcy i ogromnej sumy pieniêdzy.");
	};
};


instance DIA_PEDRO_RULES(C_INFO)
{
	npc = nov_600_pedro;
	nr = 2;
	condition = dia_pedro_rules_condition;
	information = dia_pedro_rules_info;
	permanent = FALSE;
	description = "Jakich regu³ przestrzegaj¹ s³udzy Innosa?";
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
	AI_Output(other,self,"DIA_Pedro_Rules_15_00");	//Jakich regu³ przestrzegaj¹ s³udzy Innosa?
	AI_Output(self,other,"DIA_Pedro_Rules_09_01");	//Innos jest bogiem prawdy i sprawiedliwoœci, dlatego pod ¿adnym pozorem nie wolno nam oszukiwaæ i ³amaæ prawa.
	AI_Output(self,other,"DIA_Pedro_Rules_09_02");	//Wyst¹pienie przeciwko któremuœ z braci lub okradanie klasztoru jest karane z ca³¹ surowoœci¹!
	AI_Output(self,other,"DIA_Pedro_Rules_09_03");	//Innos jest tak¿e bogiem w³adzy i ognia.
	AI_Output(self,other,"DIA_Pedro_Rules_09_04");	//Jako nowicjusz musisz okazywaæ szacunek i pos³uszeñstwo wszystkim Magom Ognia.
	AI_Output(other,self,"DIA_Pedro_Rules_15_05");	//Rozumiem.
	AI_Output(self,other,"DIA_Pedro_Rules_09_06");	//Co wiêcej, obowi¹zkiem ka¿dego nowicjusza jest praca w klasztorze dla dobra ca³ej spo³ecznoœci.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_Rules_09_07");	//Jeœli jesteœ gotów przestrzegaæ tych zasad i z³o¿ysz odpowiedni¹ ofiarê, mo¿esz zostaæ przyjêty do klasztoru jako nowicjusz.
	};
};


instance DIA_PEDRO_AUFNAHME(C_INFO)
{
	npc = nov_600_pedro;
	condition = dia_pedro_aufnahme_condition;
	information = dia_pedro_aufnahme_info;
	permanent = TRUE;
	description = "Chcê zostaæ nowicjuszem.";
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
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_15_00");	//Chcê zostaæ nowicjuszem.
	Npc_PerceiveAll(self);
	if(hero.guild != GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_AUFNAHME_09_01");	//Wybra³eœ ju¿ œcie¿kê, po której kroczysz. Droga magii jest dla ciebie zamkniêta.
		DIA_PEDRO_AUFNAHME_NOPERM = TRUE;
	}
	else if((hero.guild == GIL_NONE) && (Npc_HasItems(hero,itmi_gold) >= SUMME_KLOSTER) && Wld_DetectNpc(self,follow_sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 1000))
	{
		AI_Output(self,hero,"DIA_Pedro_AUFNAHME_09_03");	//Widzê, ¿e gotów jesteœ z³o¿yæ odpowiedni¹ ofiarê. Jeœli nie zmieni³eœ zdania, mo¿esz teraz zostaæ nowicjuszem w klasztorze.
		AI_Output(self,hero,"DIA_Pedro_AUFNAHME_09_04");	//Pamiêtaj jednak, ¿e od tej decyzji nie ma odwo³ania. Musisz mieæ pewnoœæ, ¿e wybierasz w³aœciw¹ œcie¿kê!
		Info_ClearChoices(dia_pedro_aufnahme);
		Info_AddChoice(dia_pedro_aufnahme,"Muszê to sobie jeszcze przemyœleæ.",dia_pedro_aufnahme_no);
		Info_AddChoice(dia_pedro_aufnahme,"Tak, chcê poœwiêciæ swoje ¿ycie s³u¿bie Innosowi.",dia_pedro_aufnahme_yes);
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_AUFNAHME_09_02");	//Nie masz jeszcze rzeczy potrzebnych do z³o¿enia ofiary.
	};
};

func void dia_pedro_aufnahme_yes()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_YES_15_00");	//Tak, chcê poœwiêciæ swoje ¿ycie s³u¿bie Innosowi.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_01");	//Zatem witaj wœród nas, Bracie. Oto klucz do bramy klasztoru.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_02");	//Teraz musisz dobrowolnie otworzyæ te odrzwia i przekroczyæ próg.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_03");	//Od dziœ jesteœ nowicjuszem. Noœ tê szatê, by wszyscy wiedzieli, ¿e jesteœ jednym z nas.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_04");	//W œrodku zg³oœ siê do Parlana. Od dziœ on bêdzie siê tob¹ opiekowa³.
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_YES_15_05");	//Czy moje wystêpki zostan¹ mi zapomniane?
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_06");	//Jeszcze nie. Porozmawiaj z Mistrzem Parlanem. On udzieli ci b³ogos³awieñstwa i oczyœci z grzechów.
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
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_NO_15_00");	//Muszê to sobie jeszcze przemyœleæ.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_NO_09_01");	//Wróæ, gdy uznasz, ¿e jesteœ gotowy.
	Info_ClearChoices(dia_pedro_aufnahme);
};


instance DIA_PEDRO_MONASTERY(C_INFO)
{
	npc = nov_600_pedro;
	nr = 90;
	condition = dia_pedro_monastery_condition;
	information = dia_pedro_monastery_info;
	permanent = TRUE;
	description = "Opowiedz mi o ¿yciu w klasztorze.";
};


func int dia_pedro_monastery_condition()
{
	return TRUE;
};

func void dia_pedro_monastery_info()
{
	AI_Output(other,self,"DIA_Pedro_Monastery_15_00");	//Opowiedz mi o ¿yciu w klasztorze.
	AI_Output(self,other,"DIA_Pedro_Monastery_09_01");	//Celem naszego ¿ycia jest s³u¿ba wielkiemu Innosowi. My, nowicjusze, wykonujemy podstawowe prace, a w wolnych chwilach studiujemy stare pisma.
	AI_Output(self,other,"DIA_Pedro_Monastery_09_02");	//Naszymi opiekunami s¹ magowie, którzy zg³êbiaj¹ sztuki tajemne.
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

