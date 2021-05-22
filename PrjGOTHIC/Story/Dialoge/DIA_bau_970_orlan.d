
instance DIA_ORLAN_EXIT(C_INFO)
{
	npc = bau_970_orlan;
	nr = 999;
	condition = dia_orlan_exit_condition;
	information = dia_orlan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_orlan_exit_condition()
{
	return TRUE;
};

func void dia_orlan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORLAN_WEIN(C_INFO)
{
	npc = bau_970_orlan;
	nr = 3;
	condition = dia_orlan_wein_condition;
	information = dia_orlan_wein_info;
	permanent = FALSE;
	description = "Przynoszê wino z klasztoru.";
};


func int dia_orlan_wein_condition()
{
	if((MIS_GORAXWEIN == LOG_RUNNING) && (Npc_HasItems(other,itfo_wine) >= 12))
	{
		return TRUE;
	};
};

func void dia_orlan_wein_info()
{
	AI_Output(other,self,"DIA_Orlan_Wein_15_00");	//Przynoszê wino z klasztoru.
	AI_Output(self,other,"DIA_Orlan_Wein_05_01");	//Doskonale, w³aœnie na nie czeka³em.
	AI_Output(self,other,"DIA_Orlan_Wein_05_02");	//Ustali³em ju¿ cenê z Mistrzem Goraxem. Zap³acê ci od rêki 100 sztuk z³ota.
	Info_ClearChoices(dia_orlan_wein);
	Info_AddChoice(dia_orlan_wein,"W porz¹dku, daj to z³oto.",dia_orlan_wein_ja);
	Info_AddChoice(dia_orlan_wein,"Myœlisz, ¿e trafi³eœ na idiotê?",dia_orlan_wein_nein);
};

func void dia_orlan_wein_ja()
{
	AI_Output(other,self,"DIA_Orlan_Wein_JA_15_00");	//W porz¹dku, daj to z³oto.
	AI_Output(self,other,"DIA_Orlan_Wein_JA_05_01");	//Oto ono. Interesy z tob¹ to prawdziwa przyjemnoœæ.
	b_giveinvitems(self,other,5113,100);
	b_giveinvitems(other,self,4924,12);
	Info_ClearChoices(dia_orlan_wein);
};

func void dia_orlan_wein_nein()
{
	AI_Output(other,self,"DIA_Orlan_Wein_NEIN_15_00");	//Myœlisz, ¿e trafi³eœ na idiotê? Cena wynosi 240 sztuk z³ota.
	AI_Output(self,other,"DIA_Orlan_Wein_NEIN_05_01");	//Widzê, ¿e Gorax ostrzeg³ ciê przede mn¹, co? Dobra, pos³uchaj, mo¿e ubilibyœmy ma³y interesik. Zap³acê ci 100 sztuk z³ota za wino.
	AI_Output(self,other,"DIA_Orlan_Wein_NEIN_05_02");	//Ty powiesz Goraxowi, ¿e ciê oszuka³em, a ja dam ci CZTERY magiczne zwoje.
	Info_ClearChoices(dia_orlan_wein);
	Info_AddChoice(dia_orlan_wein,"Hej, po prostu dawaj 240 sztuk z³ota!",dia_orlan_wein_nie);
	Info_AddChoice(dia_orlan_wein,"Brzmi nieŸle. Daj mi te magiczne zwoje.",dia_orlan_wein_okay);
	Info_AddChoice(dia_orlan_wein,"Co to za zwoje?",dia_orlan_wein_was);
};

func void dia_orlan_wein_nie()
{
	AI_Output(other,self,"DIA_Orlan_Wein_Nie_15_00");	//Hej, po prostu dawaj 240 sztuk z³ota!
	AI_Output(self,other,"DIA_Orlan_Wein_Nie_05_01");	//Nie interesuje ciê wspó³praca, hê? Niech bêdzie, oto twoje z³oto.
	b_giveinvitems(self,other,5113,240);
	b_giveinvitems(other,self,4924,12);
	Info_ClearChoices(dia_orlan_wein);
};

func void dia_orlan_wein_okay()
{
	var string text;
	text = ConcatStrings("4",PRINT_ITEMSERHALTEN);
	PrintScreen(text,-1,-1,FONT_SCREENSMALL,2);
	b_giveinvitems(self,other,5113,100);
	AI_Output(other,self,"DIA_Orlan_Wein_Okay_15_00");	//Brzmi nieŸle. Daj mi te magiczne zwoje.
	AI_Output(self,other,"DIA_Orlan_Wein_Okay_05_01");	//Oto zwoje i z³oto.
	b_giveinvitems(other,self,4924,12);
	CreateInvItems(hero,itsc_light,2);
	CreateInvItems(hero,itsc_lightheal,1);
	CreateInvItems(hero,itsc_sumgobskel,1);
	Info_ClearChoices(dia_orlan_wein);
};

func void dia_orlan_wein_was()
{
	AI_Output(other,self,"DIA_Orlan_Wein_Was_15_00");	//Co to za zwoje?
	AI_Output(self,other,"DIA_Orlan_Wein_Was_05_01");	//Nie mam pojêcia. Jeden z goœci po prostu... po prostu je tutaj zostawi³, taak.
};


instance DIA_ORLAN_WERBISTDU(C_INFO)
{
	npc = bau_970_orlan;
	nr = 2;
	condition = dia_orlan_werbistdu_condition;
	information = dia_orlan_werbistdu_info;
	description = "Kim jesteœ?";
};


func int dia_orlan_werbistdu_condition()
{
	return TRUE;
};

func void dia_orlan_werbistdu_info()
{
	AI_Output(other,self,"DIA_Orlan_WERBISTDU_15_00");	//Kim jesteœ?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_01");	//Mam na imiê Orlan, jestem w³aœcicielem tej mi³ej gospody.
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_02");	//Czego ci potrzeba, wêdrowcze? Szukasz mo¿e miecza albo przyzwoitej zbroi?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_03");	//Jakiejœ odmiany po rozmowach z tymi wiejskimi sztywniakami, a mo¿e po prostu informacji?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_04");	//Jeœli siêgniesz po sakiewkê, dam ci to, a mo¿e i wiêcej.
};


instance DIA_ORLAN_RUESTUNG(C_INFO)
{
	npc = bau_970_orlan;
	nr = 5;
	condition = dia_orlan_ruestung_condition;
	information = dia_orlan_ruestung_info;
	permanent = TRUE;
	description = "Jakie zbroje mo¿esz mi zaoferowaæ?";
};


var int dia_orlan_ruestung_noperm;

func int dia_orlan_ruestung_condition()
{
	if(Npc_KnowsInfo(other,dia_orlan_werbistdu) && (DIA_ORLAN_RUESTUNG_NOPERM == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_orlan_ruestung_info()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_15_00");	//Jakie zbroje mo¿esz mi zaoferowaæ?
	AI_Output(self,other,"DIA_Orlan_RUESTUNG_05_01");	//Mam tu jedn¹, która na pewno ci siê spodoba.
	Info_ClearChoices(dia_orlan_ruestung);
	Info_AddChoice(dia_orlan_ruestung,DIALOG_BACK,dia_orlan_ruestung_back);
	Info_AddChoice(dia_orlan_ruestung,"Kup skórzany pancerz. 250 sztuk z³ota.",dia_orlan_ruestung_buy);
};

func void dia_orlan_ruestung_buy()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_Buy_15_00");	//Kupiê ten skórzany pancerz.
	if(b_giveinvitems(other,self,5113,VALUE_ITAR_LEATHER_L))
	{
		AI_Output(self,other,"DIA_Orlan_RUESTUNG_Buy_05_01");	//M¹dra decyzja.
		CreateInvItems(self,itar_leather_l,1);
		b_giveinvitems(self,other,4845,1);
		AI_EquipBestArmor(other);
		DIA_ORLAN_RUESTUNG_NOPERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_RUESTUNG_Buy_05_02");	//Przykro mi. Dopóki nie masz czym zap³aciæ, z interesu nici.
	};
	Info_ClearChoices(dia_orlan_ruestung);
};

func void dia_orlan_ruestung_back()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_BACK_15_00");	//Pomyœlê o tym.
	AI_Output(self,other,"DIA_Orlan_RUESTUNG_BACK_05_01");	//Jak chcesz. Ale nie zastanawiaj siê zbyt d³ugo.
	Info_ClearChoices(dia_orlan_ruestung);
};


instance DIA_ORLAN_TRADE(C_INFO)
{
	npc = bau_970_orlan;
	nr = 70;
	condition = dia_orlan_trade_condition;
	information = dia_orlan_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Poka¿ mi swoje towary.";
};


func int dia_orlan_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_orlan_werbistdu))
	{
		return TRUE;
	};
};

func void dia_orlan_trade_info()
{
	AI_Output(other,self,"DIA_Orlan_TRADE_15_00");	//Poka¿ mi swoje towary.
	b_givetradeinv(self);
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_01");	//Oczywiœcie. To dla mnie zaszczyt, goœciæ tu kogoœ takiego.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_02");	//Oczywiœcie, Panie.
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_03");	//Jeœli mo¿esz zap³aciæ.
	};
};


instance DIA_ORLAN_HOTELZIMMER(C_INFO)
{
	npc = bau_970_orlan;
	nr = 6;
	condition = dia_orlan_hotelzimmer_condition;
	information = dia_orlan_hotelzimmer_info;
	permanent = TRUE;
	description = "Ile bierzesz za pokój?";
};


var int orlan_scgothotelzimmer;
var int orlan_scgothotelzimmerday;

func int dia_orlan_hotelzimmer_condition()
{
	if(Npc_KnowsInfo(other,dia_orlan_werbistdu) && (ORLAN_SCGOTHOTELZIMMER == FALSE))
	{
		return TRUE;
	};
};

func void dia_orlan_hotelzimmer_info()
{
	AI_Output(other,self,"DIA_Orlan_HotelZimmer_15_00");	//Ile bierzesz za pokój?
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_01");	//Dla rycerzy Króla zawsze znajdzie siê jakiœ pokój, oczywiœcie za darmo.
		}
		else
		{
			AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_02");	//Nie œmia³bym wzi¹æ op³aty za pokój od ziemskiego przedstawiciela Innosa.
		};
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_03");	//Oto klucz od pokoi na piêtrze. Wybierz, który zechcesz.
		CreateInvItems(self,itke_orlan_hotelzimmer,1);
		b_giveinvitems(self,other,5725,1);
		ORLAN_SCGOTHOTELZIMMER = TRUE;
		ORLAN_SCGOTHOTELZIMMERDAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_04");	//Jeœli zap³acisz 50 sztuk z³ota, bêdziesz móg³ mieszkaæ w wybranym pokoju przez nastêpny tydzieñ.
		Info_ClearChoices(dia_orlan_hotelzimmer);
		Info_AddChoice(dia_orlan_hotelzimmer,"Drogie to jak cholera...",dia_orlan_hotelzimmer_nein);
		Info_AddChoice(dia_orlan_hotelzimmer,"W porz¹dku, oto pieni¹dze.",dia_orlan_hotelzimmer_ja);
	};
};

func void dia_orlan_hotelzimmer_ja()
{
	if(b_giveinvitems(other,self,5113,50))
	{
		AI_Output(other,self,"DIA_Orlan_HotelZimmer_ja_15_00");	//W porz¹dku, oto pieni¹dze.
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_ja_05_01");	//Oto klucz. Pokoje s¹ na piêtrze, tylko pamiêtaj - staraj siê wszystkiego nie zapaskudziæ i p³aæ regularnie czynsz.
		CreateInvItems(self,itke_orlan_hotelzimmer,1);
		b_giveinvitems(self,other,5725,1);
		ORLAN_SCGOTHOTELZIMMERDAY = Wld_GetDay();
		ORLAN_SCGOTHOTELZIMMER = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_ja_05_02");	//Nie masz 50 sztuk z³ota. Najpierw pieni¹dze, potem przyjemnoœæ.
	};
	Info_ClearChoices(dia_orlan_hotelzimmer);
};

func void dia_orlan_hotelzimmer_nein()
{
	AI_Output(other,self,"DIA_Orlan_HotelZimmer_nein_15_00");	//Cholernie drogo.
	AI_Output(self,other,"DIA_Orlan_HotelZimmer_nein_05_01");	//W takim razie, przyjacielu, poszukaj gdzie indziej.
	Info_ClearChoices(dia_orlan_hotelzimmer);
};


var int orlan_angriffwegenmiete;

instance DIA_ORLAN_MIETEFAELLIG(C_INFO)
{
	npc = bau_970_orlan;
	nr = 10;
	condition = dia_orlan_mietefaellig_condition;
	information = dia_orlan_mietefaellig_info;
	important = TRUE;
	permanent = TRUE;
};


var int dia_orlan_mietefaellig_nomore;

func int dia_orlan_mietefaellig_condition()
{
	if((ORLAN_ANGRIFFWEGENMIETE == TRUE) && (DIA_ORLAN_MIETEFAELLIG_NOMORE == FALSE))
	{
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
		{
			return FALSE;
		};
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON)
		{
			ORLAN_SCGOTHOTELZIMMERDAY = Wld_GetDay();
			ORLAN_ANGRIFFWEGENMIETE = FALSE;
			return FALSE;
		};
	};
	if((ORLAN_SCGOTHOTELZIMMER == TRUE) && (ORLAN_SCGOTHOTELZIMMERDAY <= (Wld_GetDay() - 7)) && (DIA_ORLAN_MIETEFAELLIG_NOMORE == FALSE))
	{
		return TRUE;
	};
};

func void dia_orlan_mietefaellig_info()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_05_00");	//Twa wizyta bardzo mnie raduje, proszê, zostañ, jak d³ugo zechcesz.
		DIA_ORLAN_MIETEFAELLIG_NOMORE = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_05_01");	//Kiedy w koñcu dostanê mój czynsz?
		Info_ClearChoices(dia_orlan_mietefaellig);
		Info_AddChoice(dia_orlan_mietefaellig,"Daruj sobie. Nie dostaniesz nic wiêcej.",dia_orlan_mietefaellig_nein);
		Info_AddChoice(dia_orlan_mietefaellig,"Oto twoje 50 sztuk z³ota.",dia_orlan_mietefaellig_ja);
	};
};


var int dia_orlan_mietefaellig_onetime;

func void dia_orlan_mietefaellig_ja()
{
	AI_Output(other,self,"DIA_Orlan_MieteFaellig_ja_15_00");	//Oto twoje 50 sztuk z³ota.
	if(b_giveinvitems(other,self,5113,50))
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_01");	//Ach... Czas najwy¿szy.
		if(DIA_ORLAN_MIETEFAELLIG_ONETIME == FALSE)
		{
			AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_02");	//Gdzie¿ ty siê podziewasz ca³ymi dniami?
			AI_Output(other,self,"DIA_Orlan_MieteFaellig_ja_15_03");	//Nie chcesz wiedzieæ.
			AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_04");	//Mmh. Có¿, to nie moja sprawa.
			DIA_ORLAN_MIETEFAELLIG_ONETIME = TRUE;
		};
		ORLAN_SCGOTHOTELZIMMERDAY = Wld_GetDay();
		Info_ClearChoices(dia_orlan_mietefaellig);
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_05");	//S³uchaj no, próbujesz zrobiæ ze mnie idiotê? Nie staæ ciê nawet, ¿eby zap³aciæ za jedzenie. Ju¿ ja ci poka¿ê ty, ty...
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	};
};

func void dia_orlan_mietefaellig_nein()
{
	AI_Output(other,self,"DIA_Orlan_MieteFaellig_nein_15_00");	//Daruj sobie. Ju¿ nic wiêcej nie dostaniesz.
	AI_Output(self,other,"DIA_Orlan_MieteFaellig_nein_05_01");	//Ju¿ ja ciê nauczê, ty ¿a³osny oszuœcie.
	ORLAN_ANGRIFFWEGENMIETE = TRUE;
	Info_ClearChoices(dia_orlan_mietefaellig);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_ORLAN_WETTKAMPFLAEUFT(C_INFO)
{
	npc = bau_970_orlan;
	nr = 7;
	condition = dia_orlan_wettkampflaeuft_condition;
	information = dia_orlan_wettkampflaeuft_info;
	important = TRUE;
};


func int dia_orlan_wettkampflaeuft_condition()
{
	if((DIA_RANDOLPH_ICHGEBEDIRGELD_NOPERM == TRUE) && (MIS_RUKHAR_WETTKAMPF_DAY <= (Wld_GetDay() - 2)))
	{
		return TRUE;
	};
};

func void dia_orlan_wettkampflaeuft_info()
{
	AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_00");	//No, jesteœ nareszcie. Czeka³em na ciebie.
	AI_Output(other,self,"DIA_Orlan_WETTKAMPFLAEUFT_15_01");	//Co siê sta³o?
	AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_02");	//Konkurs picia w³aœnie siê zakoñczy³.
	AI_Output(other,self,"DIA_Orlan_WETTKAMPFLAEUFT_15_03");	//Kto wygra³?
	if((Mob_HasItems("CHEST_RUKHAR",itfo_booze) == FALSE) && (Mob_HasItems("CHEST_RUKHAR",itfo_water) == TRUE))
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_04");	//Tym razem zwyciê¿y³ Randolph. Rukhar chyba mia³ z³y dzieñ.
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_05");	//Rukhar po raz kolejny nie da³ Randolphowi szans. Mo¿na siê by³o tego spodziewaæ.
		RUKHAR_WON_WETTKAMPF = TRUE;
	};
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_06");	//Mam nadziejê, ¿e to ju¿ ostatni raz. Nie chcê tu wiêcej takich podejrzanych zabaw.
	};
	b_giveplayerxp(XP_RUKHAR_WETTKAMPFVORBEI);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	b_startotherroutine(randolph,"Start");
	if(Hlp_IsValidNpc(rukhar))
	{
		if(RUKHAR_WON_WETTKAMPF == TRUE)
		{
			b_startotherroutine(rukhar,"WettkampfRukharWon");
		}
		else
		{
			b_startotherroutine(rukhar,"WettkampfRukharLost");
		};
	};
	MIS_RUKHAR_WETTKAMPF = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ORLAN_EINGEBROCKT(C_INFO)
{
	npc = bau_970_orlan;
	nr = 8;
	condition = dia_orlan_eingebrockt_condition;
	information = dia_orlan_eingebrockt_info;
	important = TRUE;
};


func int dia_orlan_eingebrockt_condition()
{
	if((DIA_RANDOLPH_ICHGEBEDIRGELD_NOPERM == TRUE) && (MIS_RUKHAR_WETTKAMPF == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_orlan_eingebrockt_info()
{
	AI_Output(self,other,"DIA_Orlan_EINGEBROCKT_05_00");	//NieŸleœ mnie urz¹dzi³. Bêdê musia³ dalej uwa¿aæ na Rukhara.
	AI_Output(other,self,"DIA_Orlan_EINGEBROCKT_15_01");	//Jak to?
	AI_Output(self,other,"DIA_Orlan_EINGEBROCKT_05_02");	//Lepiej, ¿eby nikt siê nie dowiedzia³ o jego ma³ym konkursie. To Ÿle wp³ywa na interesy.
};


instance DIA_ORLAN_PERM(C_INFO)
{
	npc = bau_970_orlan;
	nr = 99;
	condition = dia_orlan_perm_condition;
	information = dia_orlan_perm_info;
	permanent = TRUE;
	description = "Jak id¹ interesy?";
};


func int dia_orlan_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_orlan_werbistdu))
	{
		return TRUE;
	};
};

func void dia_orlan_perm_info()
{
	AI_Output(other,self,"DIA_Orlan_Perm_15_00");	//Jak id¹ interesy?
	if(KAPITEL <= 2)
	{
		AI_Output(self,other,"DIA_Orlan_Perm_05_01");	//Wiesz, bywa³o lepiej.
		AI_Output(self,other,"DIA_Orlan_Perm_05_02");	//Ludzie niezbyt ochoczo wydaj¹ teraz pieni¹dze.
	}
	else if(KAPITEL >= 3)
	{
		AI_Output(self,other,"DIA_Orlan_Perm_05_03");	//Mam nadziejê, ¿e czarni magowie wkrótce siê st¹d wynios¹, inaczej bêdê musia³ zamkn¹æ gospodê.
		AI_Output(self,other,"DIA_Orlan_Perm_05_04");	//Ludzie boj¹ siê tu przychodziæ.
	};
};


instance DIA_ORLAN_MINENANTEIL(C_INFO)
{
	npc = bau_970_orlan;
	nr = 3;
	condition = dia_orlan_minenanteil_condition;
	information = dia_orlan_minenanteil_info;
	description = "Sprzedajesz udzia³y w kopalni?";
};


func int dia_orlan_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_KnowsInfo(other,dia_orlan_werbistdu))
	{
		return TRUE;
	};
};

func void dia_orlan_minenanteil_info()
{
	AI_Output(other,self,"DIA_Orlan_Minenanteil_15_00");	//Sprzedajesz udzia³y w kopalni?
	AI_Output(self,other,"DIA_Orlan_Minenanteil_05_01");	//Jasne. U mnie dostaniesz wszystko, czego dusza zapragnie.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ORLAN_PICKPOCKET(C_INFO)
{
	npc = bau_970_orlan;
	nr = 900;
	condition = dia_orlan_pickpocket_condition;
	information = dia_orlan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_orlan_pickpocket_condition()
{
	return c_beklauen(89,260);
};

func void dia_orlan_pickpocket_info()
{
	Info_ClearChoices(dia_orlan_pickpocket);
	Info_AddChoice(dia_orlan_pickpocket,DIALOG_BACK,dia_orlan_pickpocket_back);
	Info_AddChoice(dia_orlan_pickpocket,DIALOG_PICKPOCKET,dia_orlan_pickpocket_doit);
};

func void dia_orlan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_orlan_pickpocket);
};

func void dia_orlan_pickpocket_back()
{
	Info_ClearChoices(dia_orlan_pickpocket);
};

