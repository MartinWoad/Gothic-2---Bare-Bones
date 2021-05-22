
instance DIA_NADJA_EXIT(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 999;
	condition = dia_nadja_exit_condition;
	information = dia_nadja_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_nadja_exit_condition()
{
	return TRUE;
};

func void dia_nadja_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NADJA_PICKPOCKET(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 900;
	condition = dia_nadja_pickpocket_condition;
	information = dia_nadja_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40_FEMALE;
};


func int dia_nadja_pickpocket_condition()
{
	return c_beklauen(40,40);
};

func void dia_nadja_pickpocket_info()
{
	Info_ClearChoices(dia_nadja_pickpocket);
	Info_AddChoice(dia_nadja_pickpocket,DIALOG_BACK,dia_nadja_pickpocket_back);
	Info_AddChoice(dia_nadja_pickpocket,DIALOG_PICKPOCKET,dia_nadja_pickpocket_doit);
};

func void dia_nadja_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_nadja_pickpocket);
};

func void dia_nadja_pickpocket_back()
{
	Info_ClearChoices(dia_nadja_pickpocket);
};


instance DIA_NADJA_STANDARD(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 3;
	condition = dia_nadja_standard_condition;
	information = dia_nadja_standard_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_nadja_standard_condition()
{
	if(Npc_IsInState(self,zs_talk) && (BROMOR_PAY == FALSE))
	{
		return TRUE;
	};
};

func void dia_nadja_standard_info()
{
	AI_Output(self,other,"DIA_Nadja_STANDARD_16_00");	//Skarbie, nie mogê siê teraz tob¹ zaj¹æ. Jeœli chcesz siê zabawiæ, porozmawiaj z Bromorem.
	AI_StopProcessInfos(self);
};


instance DIA_NADJA_DANACH(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 2;
	condition = dia_nadja_danach_condition;
	information = dia_nadja_danach_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_nadja_danach_condition()
{
	if(Npc_IsInState(self,zs_talk) && (BROMOR_PAY == FALSE) && (NADJA_NACHT == TRUE))
	{
		return TRUE;
	};
};

func void dia_nadja_danach_info()
{
	AI_Output(self,other,"DIA_Nadja_Danach_16_00");	//Zapraszam ponownie.
	NADJA_NACHT = FALSE;
	AI_StopProcessInfos(self);
};


instance DIA_NADJA_HOCHGEHEN(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 3;
	condition = dia_nadja_hochgehen_condition;
	information = dia_nadja_hochgehen_info;
	important = FALSE;
	permanent = TRUE;
	description = "ChodŸmy na górê.";
};


func int dia_nadja_hochgehen_condition()
{
	if(BROMOR_PAY == 1)
	{
		return TRUE;
	};
};

func void dia_nadja_hochgehen_info()
{
	AI_Output(other,self,"DIA_Nadja_hochgehen_15_00");	//ChodŸmy na górê.
	AI_Output(self,other,"DIA_Nadja_hochgehen_16_01");	//To twój szczêœliwy dzieñ skarbie, chodŸmy.
	BROMOR_PAY = 2;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"DANCE");
};


instance DIA_NADJA_POPPEN(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 3;
	condition = dia_nadja_poppen_condition;
	information = dia_nadja_poppen_info;
	permanent = TRUE;
	description = "(Zabaw siê)";
};


func int dia_nadja_poppen_condition()
{
	if((BROMOR_PAY == 2) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_NADJA") < 200))
	{
		return TRUE;
	};
};

func void dia_nadja_poppen_info()
{
	AI_Output(self,other,"DIA_Nadja_Poppen_16_00");	//Nastêpne kilka godzin nale¿y do nas.
	AI_Output(self,other,"DIA_Nadja_Poppen_16_01");	//Czas siê trochê odprê¿yæ i zrelaksowaæ.
	Info_ClearChoices(dia_nadja_poppen);
	Info_AddChoice(dia_nadja_poppen,"Dobra...",dia_nadja_poppen_start);
};

func void dia_nadja_poppen_start()
{
	BROMOR_PAY = FALSE;
	NADJA_NACHT = NADJA_NACHT + 1;
	PlayVideo("LOVESCENE.BIK");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_NADJA_BUYHERB(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 2;
	condition = dia_nadja_buyherb_condition;
	information = dia_nadja_buyherb_info;
	permanent = TRUE;
	description = "Nie wiesz, gdzie móg³bym kupiæ trochê ziela?";
};


func int dia_nadja_buyherb_condition()
{
	if((MIS_ANDRE_REDLIGHT == LOG_RUNNING) && (Npc_KnowsInfo(other,dia_nadja_want_herb) == FALSE) && (NADJA_MONEY == FALSE))
	{
		return TRUE;
	};
};

func void dia_nadja_buyherb_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Nadja_BUYHERB_15_00");	//Czy mogê tu gdzieœ kupiæ ziele?
	if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_NADJA") < 200)
	{
		if((Hlp_IsItem(heroarmor,itar_mil_l) == TRUE) || (Hlp_IsItem(heroarmor,itar_mil_m) == TRUE))
		{
			AI_Output(self,other,"DIA_Nadja_BUYHERB_16_01");	//A sk¹d ja mam to wiedzieæ? Zreszt¹, nawet gdybym wiedzia³a, to i tak nie powiedzia³abym stra¿nikowi miejskiemu.
			UNDERCOVER_FAILED = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Nadja_BUYHERB_16_02");	//Jeœli mam ci coœ powiedzieæ, to lepiej wytrz¹œnij kilka sztuk z³ota z sakiewki.
			AI_Output(other,self,"DIA_Nadja_BUYHERB_15_03");	//Ile chcesz?
			AI_Output(self,other,"DIA_Nadja_BUYHERB_16_04");	//50 sztuk z³ota powinno wystarczyæ.
			NADJA_MONEY = TRUE;
		};
	}
	else
	{
		b_say(self,other,"$NOTNOW");
	};
};


instance DIA_NADJA_WANT_HERB(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 2;
	condition = dia_nadja_want_herb_condition;
	information = dia_nadja_want_herb_info;
	permanent = FALSE;
	description = "Powiedz mi, gdzie tu kupiê ziele (zap³aæ 50 sztuk z³ota).";
};


func int dia_nadja_want_herb_condition()
{
	if((Npc_HasItems(other,itmi_gold) >= 50) && (NADJA_MONEY == TRUE) && (MIS_ANDRE_REDLIGHT == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_nadja_want_herb_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Nadja_WANT_HERB_15_00");	//Teraz mów, gdzie mogê zdobyæ ziele.
	if((Hlp_IsItem(heroarmor,itar_mil_l) == TRUE) || (Hlp_IsItem(heroarmor,itar_mil_m) == TRUE) || (Hlp_IsItem(heroarmor,itar_pal_m) == TRUE) || (Hlp_IsItem(heroarmor,itar_pal_h) == TRUE))
	{
		AI_Output(self,other,"DIA_Nadja_WANT_HERB_16_01");	//Wybacz, jakoœ nie mogê sobie przypomnieæ.
	}
	else
	{
		b_giveinvitems(other,self,5113,50);
		AI_Output(self,other,"DIA_Nadja_WANT_HERB_16_02");	//Porozmawiaj z Bork¹, skarbie. Powinien mieæ jakieœ ziele.
		KNOWS_BORKA_DEALER = TRUE;
	};
};

