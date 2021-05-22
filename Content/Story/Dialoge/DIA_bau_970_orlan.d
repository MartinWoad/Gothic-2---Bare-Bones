
instance DIA_Orlan_EXIT(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 999;
	condition = DIA_Orlan_EXIT_Condition;
	information = DIA_Orlan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Orlan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Orlan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Orlan_Wein(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = DIA_Orlan_Wein_Condition;
	information = DIA_Orlan_Wein_Info;
	permanent = FALSE;
	description = "Przynosz� wino z klasztoru.";
};


func int DIA_Orlan_Wein_Condition()
{
	if((MIS_GoraxWein == LOG_Running) && (Npc_HasItems(other,ItFo_Wine) >= 12))
	{
		return TRUE;
	};
};

func void DIA_Orlan_Wein_Info()
{
	AI_Output(other,self,"DIA_Orlan_Wein_15_00");	//Przynosz� wino z klasztoru.
	AI_Output(self,other,"DIA_Orlan_Wein_05_01");	//Doskonale, w�a�nie na nie czeka�em.
	AI_Output(self,other,"DIA_Orlan_Wein_05_02");	//Ustali�em ju� cen� z Mistrzem Goraxem. Zap�ac� ci od r�ki 100 sztuk z�ota.
	Info_ClearChoices(DIA_Orlan_Wein);
	Info_AddChoice(DIA_Orlan_Wein,"W porz�dku, daj to z�oto.",DIA_Orlan_Wein_JA);
	Info_AddChoice(DIA_Orlan_Wein,"My�lisz, �e trafi�e� na idiot�?",DIA_Orlan_Wein_NEIN);
};

func void DIA_Orlan_Wein_JA()
{
	AI_Output(other,self,"DIA_Orlan_Wein_JA_15_00");	//W porz�dku, daj to z�oto.
	AI_Output(self,other,"DIA_Orlan_Wein_JA_05_01");	//Oto ono. Interesy z tob� to prawdziwa przyjemno��.
	B_GiveInvItems(self,other,ItMi_Gold,100);
	B_GiveInvItems(other,self,ItFo_Wine,12);
	Info_ClearChoices(DIA_Orlan_Wein);
};

func void DIA_Orlan_Wein_NEIN()
{
	AI_Output(other,self,"DIA_Orlan_Wein_NEIN_15_00");	//My�lisz, �e trafi�e� na idiot�? Cena wynosi 240 sztuk z�ota.
	AI_Output(self,other,"DIA_Orlan_Wein_NEIN_05_01");	//Widz�, �e Gorax ostrzeg� ci� przede mn�, co? Dobra, pos�uchaj, mo�e ubiliby�my ma�y interesik. Zap�ac� ci 100 sztuk z�ota za wino.
	AI_Output(self,other,"DIA_Orlan_Wein_NEIN_05_02");	//Ty powiesz Goraxowi, �e ci� oszuka�em, a ja dam ci CZTERY magiczne zwoje.
	Info_ClearChoices(DIA_Orlan_Wein);
	Info_AddChoice(DIA_Orlan_Wein,"Hej, po prostu dawaj 240 sztuk z�ota!",DIA_Orlan_Wein_Nie);
	Info_AddChoice(DIA_Orlan_Wein,"Brzmi nie�le. Daj mi te magiczne zwoje.",DIA_Orlan_Wein_Okay);
	Info_AddChoice(DIA_Orlan_Wein,"Co to za zwoje?",DIA_Orlan_Wein_Was);
};

func void DIA_Orlan_Wein_Nie()
{
	AI_Output(other,self,"DIA_Orlan_Wein_Nie_15_00");	//Hej, po prostu dawaj 240 sztuk z�ota!
	AI_Output(self,other,"DIA_Orlan_Wein_Nie_05_01");	//Nie interesuje ci� wsp�praca, h�? Niech b�dzie, oto twoje z�oto.
	B_GiveInvItems(self,other,ItMi_Gold,240);
	B_GiveInvItems(other,self,ItFo_Wine,12);
	Info_ClearChoices(DIA_Orlan_Wein);
};

func void DIA_Orlan_Wein_Okay()
{
	var string text;
	text = ConcatStrings("4",PRINT_ItemsErhalten);
	PrintScreen(text,-1,-1,FONT_ScreenSmall,2);
	B_GiveInvItems(self,other,ItMi_Gold,100);
	AI_Output(other,self,"DIA_Orlan_Wein_Okay_15_00");	//Brzmi nie�le. Daj mi te magiczne zwoje.
	AI_Output(self,other,"DIA_Orlan_Wein_Okay_05_01");	//Oto zwoje i z�oto.
	B_GiveInvItems(other,self,ItFo_Wine,12);
	CreateInvItems(hero,ItSc_Light,2);
	CreateInvItems(hero,ItSc_LightHeal,1);
	CreateInvItems(hero,ItSc_SumGobSkel,1);
	Info_ClearChoices(DIA_Orlan_Wein);
};

func void DIA_Orlan_Wein_Was()
{
	AI_Output(other,self,"DIA_Orlan_Wein_Was_15_00");	//Co to za zwoje?
	AI_Output(self,other,"DIA_Orlan_Wein_Was_05_01");	//Nie mam poj�cia. Jeden z go�ci po prostu... po prostu je tutaj zostawi�, taak.
};


instance DIA_Orlan_WERBISTDU(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 2;
	condition = DIA_Orlan_WERBISTDU_Condition;
	information = DIA_Orlan_WERBISTDU_Info;
	description = "Kim jeste�?";
};


func int DIA_Orlan_WERBISTDU_Condition()
{
	return TRUE;
};

func void DIA_Orlan_WERBISTDU_Info()
{
	AI_Output(other,self,"DIA_Orlan_WERBISTDU_15_00");	//Kim jeste�?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_01");	//Mam na imi� Orlan, jestem w�a�cicielem tej mi�ej gospody.
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_02");	//Czego ci potrzeba, w�drowcze? Szukasz mo�e miecza albo przyzwoitej zbroi?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_03");	//Jakiej� odmiany po rozmowach z tymi wiejskimi sztywniakami, a mo�e po prostu informacji?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_04");	//Je�li si�gniesz po sakiewk�, dam ci to, a mo�e i wi�cej.
};


instance DIA_Orlan_RUESTUNG(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 5;
	condition = DIA_Orlan_RUESTUNG_Condition;
	information = DIA_Orlan_RUESTUNG_Info;
	permanent = TRUE;
	description = "Jakie zbroje mo�esz mi zaoferowa�?";
};


var int DIA_Orlan_RUESTUNG_noPerm;

func int DIA_Orlan_RUESTUNG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU) && (DIA_Orlan_RUESTUNG_noPerm == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Orlan_RUESTUNG_Info()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_15_00");	//Jakie zbroje mo�esz mi zaoferowa�?
	AI_Output(self,other,"DIA_Orlan_RUESTUNG_05_01");	//Mam tu jedn�, kt�ra na pewno ci si� spodoba.
	Info_ClearChoices(DIA_Orlan_RUESTUNG);
	Info_AddChoice(DIA_Orlan_RUESTUNG,Dialog_Back,DIA_Orlan_RUESTUNG_BACK);
	Info_AddChoice(DIA_Orlan_RUESTUNG,"Kup sk�rzany pancerz. 250 sztuk z�ota.",DIA_Orlan_RUESTUNG_Buy);
};

func void DIA_Orlan_RUESTUNG_Buy()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_Buy_15_00");	//Kupi� ten sk�rzany pancerz.
	if(B_GiveInvItems(other,self,ItMi_Gold,VALUE_ITAR_Leather_L))
	{
		AI_Output(self,other,"DIA_Orlan_RUESTUNG_Buy_05_01");	//M�dra decyzja.
		CreateInvItems(self,ITAR_Leather_L,1);
		B_GiveInvItems(self,other,ITAR_Leather_L,1);
		AI_EquipBestArmor(other);
		DIA_Orlan_RUESTUNG_noPerm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_RUESTUNG_Buy_05_02");	//Przykro mi. Dop�ki nie masz czym zap�aci�, z interesu nici.
	};
	Info_ClearChoices(DIA_Orlan_RUESTUNG);
};

func void DIA_Orlan_RUESTUNG_BACK()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_BACK_15_00");	//Pomy�l� o tym.
	AI_Output(self,other,"DIA_Orlan_RUESTUNG_BACK_05_01");	//Jak chcesz. Ale nie zastanawiaj si� zbyt d�ugo.
	Info_ClearChoices(DIA_Orlan_RUESTUNG);
};


instance DIA_Orlan_TRADE(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 70;
	condition = DIA_Orlan_TRADE_Condition;
	information = DIA_Orlan_TRADE_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Poka� mi swoje towary.";
};


func int DIA_Orlan_TRADE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU))
	{
		return TRUE;
	};
};

func void DIA_Orlan_TRADE_Info()
{
	AI_Output(other,self,"DIA_Orlan_TRADE_15_00");	//Poka� mi swoje towary.
	B_GiveTradeInv(self);
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_01");	//Oczywi�cie. To dla mnie zaszczyt, go�ci� tu kogo� takiego.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_02");	//Oczywi�cie, Panie.
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_03");	//Je�li mo�esz zap�aci�.
	};
};


instance DIA_Orlan_HotelZimmer(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 6;
	condition = DIA_Orlan_HotelZimmer_Condition;
	information = DIA_Orlan_HotelZimmer_Info;
	permanent = TRUE;
	description = "Ile bierzesz za pok�j?";
};


var int Orlan_SCGotHotelZimmer;
var int Orlan_SCGotHotelZimmerDay;

func int DIA_Orlan_HotelZimmer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU) && (Orlan_SCGotHotelZimmer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orlan_HotelZimmer_Info()
{
	AI_Output(other,self,"DIA_Orlan_HotelZimmer_15_00");	//Ile bierzesz za pok�j?
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_01");	//Dla rycerzy Kr�la zawsze znajdzie si� jaki� pok�j, oczywi�cie za darmo.
		}
		else
		{
			AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_02");	//Nie �mia�bym wzi�� op�aty za pok�j od ziemskiego przedstawiciela Innosa.
		};
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_03");	//Oto klucz od pokoi na pi�trze. Wybierz, kt�ry zechcesz.
		CreateInvItems(self,itke_orlan_hotelzimmer,1);
		B_GiveInvItems(self,other,itke_orlan_hotelzimmer,1);
		Orlan_SCGotHotelZimmer = TRUE;
		Orlan_SCGotHotelZimmerDay = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_04");	//Je�li zap�acisz 50 sztuk z�ota, b�dziesz m�g� mieszka� w wybranym pokoju przez nast�pny tydzie�.
		Info_ClearChoices(DIA_Orlan_HotelZimmer);
		Info_AddChoice(DIA_Orlan_HotelZimmer,"Drogie to jak cholera...",DIA_Orlan_HotelZimmer_nein);
		Info_AddChoice(DIA_Orlan_HotelZimmer,"W porz�dku, oto pieni�dze.",DIA_Orlan_HotelZimmer_ja);
	};
};

func void DIA_Orlan_HotelZimmer_ja()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(other,self,"DIA_Orlan_HotelZimmer_ja_15_00");	//W porz�dku, oto pieni�dze.
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_ja_05_01");	//Oto klucz. Pokoje s� na pi�trze, tylko pami�taj - staraj si� wszystkiego nie zapaskudzi� i p�a� regularnie czynsz.
		CreateInvItems(self,itke_orlan_hotelzimmer,1);
		B_GiveInvItems(self,other,itke_orlan_hotelzimmer,1);
		Orlan_SCGotHotelZimmerDay = Wld_GetDay();
		Orlan_SCGotHotelZimmer = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_ja_05_02");	//Nie masz 50 sztuk z�ota. Najpierw pieni�dze, potem przyjemno��.
	};
	Info_ClearChoices(DIA_Orlan_HotelZimmer);
};

func void DIA_Orlan_HotelZimmer_nein()
{
	AI_Output(other,self,"DIA_Orlan_HotelZimmer_nein_15_00");	//Cholernie drogo.
	AI_Output(self,other,"DIA_Orlan_HotelZimmer_nein_05_01");	//W takim razie, przyjacielu, poszukaj gdzie indziej.
	Info_ClearChoices(DIA_Orlan_HotelZimmer);
};


var int Orlan_AngriffWegenMiete;

instance DIA_Orlan_MieteFaellig(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 10;
	condition = DIA_Orlan_MieteFaellig_Condition;
	information = DIA_Orlan_MieteFaellig_Info;
	important = TRUE;
	permanent = TRUE;
};


var int DIA_Orlan_MieteFaellig_NoMore;

func int DIA_Orlan_MieteFaellig_Condition()
{
	if((Orlan_AngriffWegenMiete == TRUE) && (DIA_Orlan_MieteFaellig_NoMore == FALSE))
	{
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			return FALSE;
		};
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			Orlan_SCGotHotelZimmerDay = Wld_GetDay();
			Orlan_AngriffWegenMiete = FALSE;
			return FALSE;
		};
	};
	if((Orlan_SCGotHotelZimmer == TRUE) && (Orlan_SCGotHotelZimmerDay <= (Wld_GetDay() - 7)) && (DIA_Orlan_MieteFaellig_NoMore == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orlan_MieteFaellig_Info()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_05_00");	//Twa wizyta bardzo mnie raduje, prosz�, zosta�, jak d�ugo zechcesz.
		DIA_Orlan_MieteFaellig_NoMore = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_05_01");	//Kiedy w ko�cu dostan� m�j czynsz?
		Info_ClearChoices(DIA_Orlan_MieteFaellig);
		Info_AddChoice(DIA_Orlan_MieteFaellig,"Daruj sobie. Nie dostaniesz nic wi�cej.",DIA_Orlan_MieteFaellig_nein);
		Info_AddChoice(DIA_Orlan_MieteFaellig,"Oto twoje 50 sztuk z�ota.",DIA_Orlan_MieteFaellig_ja);
	};
};


var int DIA_Orlan_MieteFaellig_OneTime;

func void DIA_Orlan_MieteFaellig_ja()
{
	AI_Output(other,self,"DIA_Orlan_MieteFaellig_ja_15_00");	//Oto twoje 50 sztuk z�ota.
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_01");	//Ach... Czas najwy�szy.
		if(DIA_Orlan_MieteFaellig_OneTime == FALSE)
		{
			AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_02");	//Gdzie� ty si� podziewasz ca�ymi dniami?
			AI_Output(other,self,"DIA_Orlan_MieteFaellig_ja_15_03");	//Nie chcesz wiedzie�.
			AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_04");	//Mmh. C�, to nie moja sprawa.
			DIA_Orlan_MieteFaellig_OneTime = TRUE;
		};
		Orlan_SCGotHotelZimmerDay = Wld_GetDay();
		Info_ClearChoices(DIA_Orlan_MieteFaellig);
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_05");	//S�uchaj no, pr�bujesz zrobi� ze mnie idiot�? Nie sta� ci� nawet, �eby zap�aci� za jedzenie. Ju� ja ci poka�� ty, ty...
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};

func void DIA_Orlan_MieteFaellig_nein()
{
	AI_Output(other,self,"DIA_Orlan_MieteFaellig_nein_15_00");	//Daruj sobie. Ju� nic wi�cej nie dostaniesz.
	AI_Output(self,other,"DIA_Orlan_MieteFaellig_nein_05_01");	//Ju� ja ci� naucz�, ty �a�osny oszu�cie.
	Orlan_AngriffWegenMiete = TRUE;
	Info_ClearChoices(DIA_Orlan_MieteFaellig);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Orlan_WETTKAMPFLAEUFT(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 7;
	condition = DIA_Orlan_WETTKAMPFLAEUFT_Condition;
	information = DIA_Orlan_WETTKAMPFLAEUFT_Info;
	important = TRUE;
};


func int DIA_Orlan_WETTKAMPFLAEUFT_Condition()
{
	if((DIA_Randolph_ICHGEBEDIRGELD_noPerm == TRUE) && (MIS_Rukhar_Wettkampf_Day <= (Wld_GetDay() - 2)))
	{
		return TRUE;
	};
};

func void DIA_Orlan_WETTKAMPFLAEUFT_Info()
{
	AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_00");	//No, jeste� nareszcie. Czeka�em na ciebie.
	AI_Output(other,self,"DIA_Orlan_WETTKAMPFLAEUFT_15_01");	//Co si� sta�o?
	AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_02");	//Konkurs picia w�a�nie si� zako�czy�.
	AI_Output(other,self,"DIA_Orlan_WETTKAMPFLAEUFT_15_03");	//Kto wygra�?
	if((Mob_HasItems("CHEST_RUKHAR",ItFo_Booze) == FALSE) && (Mob_HasItems("CHEST_RUKHAR",ItFo_Water) == TRUE))
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_04");	//Tym razem zwyci�y� Randolph. Rukhar chyba mia� z�y dzie�.
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_05");	//Rukhar po raz kolejny nie da� Randolphowi szans. Mo�na si� by�o tego spodziewa�.
		Rukhar_Won_Wettkampf = TRUE;
	};
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_06");	//Mam nadziej�, �e to ju� ostatni raz. Nie chc� tu wi�cej takich podejrzanych zabaw.
	};
	B_GivePlayerXP(XP_Rukhar_WettkampfVorbei);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	B_StartOtherRoutine(Randolph,"Start");
	if(Hlp_IsValidNpc(Rukhar))
	{
		if(Rukhar_Won_Wettkampf == TRUE)
		{
			B_StartOtherRoutine(Rukhar,"WettkampfRukharWon");
		}
		else
		{
			B_StartOtherRoutine(Rukhar,"WettkampfRukharLost");
		};
	};
	MIS_Rukhar_Wettkampf = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Orlan_EINGEBROCKT(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 8;
	condition = DIA_Orlan_EINGEBROCKT_Condition;
	information = DIA_Orlan_EINGEBROCKT_Info;
	important = TRUE;
};


func int DIA_Orlan_EINGEBROCKT_Condition()
{
	if((DIA_Randolph_ICHGEBEDIRGELD_noPerm == TRUE) && (MIS_Rukhar_Wettkampf == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Orlan_EINGEBROCKT_Info()
{
	AI_Output(self,other,"DIA_Orlan_EINGEBROCKT_05_00");	//Nie�le� mnie urz�dzi�. B�d� musia� dalej uwa�a� na Rukhara.
	AI_Output(other,self,"DIA_Orlan_EINGEBROCKT_15_01");	//Jak to?
	AI_Output(self,other,"DIA_Orlan_EINGEBROCKT_05_02");	//Lepiej, �eby nikt si� nie dowiedzia� o jego ma�ym konkursie. To �le wp�ywa na interesy.
};


instance DIA_Orlan_Perm(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 99;
	condition = DIA_Orlan_Perm_Condition;
	information = DIA_Orlan_Perm_Info;
	permanent = TRUE;
	description = "Jak id� interesy?";
};


func int DIA_Orlan_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU))
	{
		return TRUE;
	};
};

func void DIA_Orlan_Perm_Info()
{
	AI_Output(other,self,"DIA_Orlan_Perm_15_00");	//Jak id� interesy?
	if(Kapitel <= 2)
	{
		AI_Output(self,other,"DIA_Orlan_Perm_05_01");	//Wiesz, bywa�o lepiej.
		AI_Output(self,other,"DIA_Orlan_Perm_05_02");	//Ludzie niezbyt ochoczo wydaj� teraz pieni�dze.
	}
	else if(Kapitel >= 3)
	{
		AI_Output(self,other,"DIA_Orlan_Perm_05_03");	//Mam nadziej�, �e czarni magowie wkr�tce si� st�d wynios�, inaczej b�d� musia� zamkn�� gospod�.
		AI_Output(self,other,"DIA_Orlan_Perm_05_04");	//Ludzie boj� si� tu przychodzi�.
	};
};


instance DIA_Orlan_Minenanteil(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = DIA_Orlan_Minenanteil_Condition;
	information = DIA_Orlan_Minenanteil_Info;
	description = "Sprzedajesz udzia�y w kopalni?";
};


func int DIA_Orlan_Minenanteil_Condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running) && Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU))
	{
		return TRUE;
	};
};

func void DIA_Orlan_Minenanteil_Info()
{
	AI_Output(other,self,"DIA_Orlan_Minenanteil_15_00");	//Sprzedajesz udzia�y w kopalni?
	AI_Output(self,other,"DIA_Orlan_Minenanteil_05_01");	//Jasne. U mnie dostaniesz wszystko, czego dusza zapragnie.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Orlan_PICKPOCKET(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 900;
	condition = DIA_Orlan_PICKPOCKET_Condition;
	information = DIA_Orlan_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Orlan_PICKPOCKET_Condition()
{
	return C_Beklauen(89,260);
};

func void DIA_Orlan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Orlan_PICKPOCKET);
	Info_AddChoice(DIA_Orlan_PICKPOCKET,Dialog_Back,DIA_Orlan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Orlan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Orlan_PICKPOCKET_DoIt);
};

func void DIA_Orlan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Orlan_PICKPOCKET);
};

func void DIA_Orlan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Orlan_PICKPOCKET);
};

