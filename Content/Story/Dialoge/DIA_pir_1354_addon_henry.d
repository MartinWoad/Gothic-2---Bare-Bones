
instance DIA_ADDON_HENRY_EXIT(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 999;
	condition = dia_addon_henry_exit_condition;
	information = dia_addon_henry_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_henry_exit_condition()
{
	return TRUE;
};

func void dia_addon_henry_exit_info()
{
	AI_StopProcessInfos(self);
};

func void b_henry_gold(var int gold)
{
	if(gold == 500)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold500_04_00");	//500 sztuk z這ta.
	}
	else if(gold == 400)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold400_04_00");	//400 sztuk z這ta.
	}
	else if(gold == 300)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold300_04_00");	//300 sztuk z這ta.
	}
	else if(gold == 200)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold200_04_00");	//200 sztuk z這ta.
	}
	else if(gold == 100)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold100_04_00");	//100 sztuk z這ta.
	}
	else
	{
		b_say_gold(self,other,gold);
	};
};


instance DIA_ADDON_HENRY_PICKPOCKET(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 900;
	condition = dia_addon_henry_pickpocket_condition;
	information = dia_addon_henry_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_henry_pickpocket_condition()
{
	return c_beklauen(40,60);
};

func void dia_addon_henry_pickpocket_info()
{
	Info_ClearChoices(dia_addon_henry_pickpocket);
	Info_AddChoice(dia_addon_henry_pickpocket,DIALOG_BACK,dia_addon_henry_pickpocket_back);
	Info_AddChoice(dia_addon_henry_pickpocket,DIALOG_PICKPOCKET,dia_addon_henry_pickpocket_doit);
};

func void dia_addon_henry_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_henry_pickpocket);
};

func void dia_addon_henry_pickpocket_back()
{
	Info_ClearChoices(dia_addon_henry_pickpocket);
};


const string PIR_1354_CHECKPOINT = "ADW_PIRATECAMP_WAY_02";

instance DIA_ADDON_HENRY_HELLO(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 5;
	condition = dia_addon_henry_hello_condition;
	information = dia_addon_henry_hello_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_henry_hello_condition()
{
	if(Npc_GetDistToWP(other,PIR_1354_CHECKPOINT) <= 700)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_henry_hello_info()
{
	AI_Output(self,other,"DIA_Addon_Henry_Hello_04_00");	//St鎩, kto idzie?
	AI_Output(self,other,"DIA_Addon_Henry_Hello_04_01");	//Sw鎩 czy wr鏬?
	Info_ClearChoices(dia_addon_henry_hello);
	Info_AddChoice(dia_addon_henry_hello,"Wr鏬!",dia_addon_henry_hello_feind);
	Info_AddChoice(dia_addon_henry_hello,"Sw鎩!",dia_addon_henry_hello_freund);
};


var int henry_sc_frech;

func void dia_addon_henry_hello_feind()
{
	AI_Output(other,self,"DIA_Addon_Henry_Hello_Feind_15_00");	//Wr鏬!
	AI_Output(self,other,"DIA_Addon_Henry_Hello_Feind_04_01");	//Spryciarz... Chcesz, 瞠bym ci porachowa? ko?ci?
	AI_Output(self,other,"DIA_Addon_Henry_Hello_Feind_04_02");	//M闚, co masz do powiedzenia, albo odejd?.
	HENRY_SC_FRECH = TRUE;
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,PIR_1354_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
	Info_ClearChoices(dia_addon_henry_hello);
};

func void dia_addon_henry_hello_freund()
{
	AI_Output(other,self,"DIA_Addon_Henry_Hello_Freund_15_00");	//Sw鎩!
	AI_Output(self,other,"DIA_Addon_Henry_Hello_Freund_04_01");	//Ka盥y tak mo瞠 powiedzie?. Nie znam ci?. Czego tutaj szukasz?
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,PIR_1354_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
	Info_ClearChoices(dia_addon_henry_hello);
};


instance DIA_ADDON_HENRY_SECONDWARN(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 2;
	condition = dia_addon_henry_secondwarn_condition;
	information = dia_addon_henry_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_henry_secondwarn_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PIR_1354_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_addon_henry_secondwarn_info()
{
	AI_Output(self,other,"DIA_Addon_Henry_SecondWarn_04_00");	//Jeszcze jeden krok i rzuc? ci? rekinom na po瘸rcie!
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,PIR_1354_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_HENRY_ATTACK(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 3;
	condition = dia_addon_henry_attack_condition;
	information = dia_addon_henry_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_henry_attack_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PIR_1354_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_addon_henry_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_Output(self,other,"DIA_Addon_Henry_Attack_04_00");	//Sam tego chcia貫?.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,0);
};


var int henry_zoll_whatfor;

instance DIA_ADDON_HENRY_WANTENTER(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 1;
	condition = dia_addon_henry_wantenter_condition;
	information = dia_addon_henry_wantenter_info;
	permanent = FALSE;
	description = "Chc? wej??!";
};


func int dia_addon_henry_wantenter_condition()
{
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_henry_wantenter_info()
{
	var C_ITEM itm;
	AI_Output(other,self,"DIA_Addon_Henry_WantEnter_15_00");	//Chc? wej??!
	AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_01");	//Naprawd?? To ci? b璠zie kosztowa?...
	b_henry_gold(500);
	if(HENRY_ZOLL_WHATFOR == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_WantEnter_15_02");	//Niby czemu?
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_03");	//Musisz wszystko komplikowa??
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_04");	//W tym obozie jest wiele rzeczy, kt鏎e mog? ci? zainteresowa?.
		HENRY_ZOLL_WHATFOR = TRUE;
	};
	itm = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(itm,itar_kdf_l) == TRUE) || (Hlp_IsItem(itm,itar_kdf_h) == TRUE) || (Hlp_IsItem(itm,itar_ranger_addon) == TRUE) || (Hlp_IsItem(itm,itar_mil_l) == TRUE) || (Hlp_IsItem(itm,itar_mil_m) == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_07");	//A ty wygl鉅asz na kogo?, kto ma pieni鉅ze.
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_08");	//Nie zedr? przecie? z ciebie ostatniej koszuli. Zobaczysz, op豉ci ci si?.
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_09");	//No, chyba 瞠 ten str鎩 ukrad貫?.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_10");	//Masz przy sobie pieni鉅ze, prawda?
	};
};

func void b_henry_nojoin()
{
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_00");	//Je?li chcesz do nas do章czy?, to mam dla ciebie z章 wiadomo??, ch這pcze.
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_01");	//Kapitan wyp造n像 w rejs, a tylko on decyduje, kogo przyjmie si? do za這gi.
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_02");	//Ale mo瞠sz tu zosta? do jego powrotu.
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_03");	//Je?li nie b璠ziesz sprawia? k這pot闚, rzecz jasna.
};


instance DIA_ADDON_HENRY_EINIGEN2(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 2;
	condition = dia_addon_henry_einigen2_condition;
	information = dia_addon_henry_einigen2_info;
	description = "Oto twoje 500 sztuk z這ta.";
};


func int dia_addon_henry_einigen2_condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,dia_addon_henry_wantenter) && !Npc_KnowsInfo(other,dia_addon_henry_einigen) && (Npc_HasItems(other,itmi_gold) >= 500))
	{
		return TRUE;
	};
};

func void dia_addon_henry_einigen2_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Einigen2_15_00");	//Oto twoje 500 sztuk z這ta.
	b_giveinvitems(other,self,itmi_gold,500);
	AI_Output(self,other,"DIA_Addon_Henry_Einigen2_04_01");	//Wspaniale. Witamy w naszym skromnym obozie.
	b_henry_nojoin();
	self.aivar[AIV_PASSGATE] = TRUE;
};


instance DIA_ADDON_HENRY_EINIGEN(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 3;
	condition = dia_addon_henry_einigen_condition;
	information = dia_addon_henry_einigen_info;
	description = "Mo瞠 si? potargujemy?";
};


func int dia_addon_henry_einigen_condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,dia_addon_henry_wantenter))
	{
		return TRUE;
	};
};

func void dia_addon_henry_einigen_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Einigen_15_00");	//Mo瞠 si? potargujemy?
	AI_Output(self,other,"DIA_Addon_Henry_Einigen_04_01");	//C騜, daj mi jaki? pow鏚, dla kt鏎ego mia豚ym opu?ci? cen?.
};


instance DIA_ADDON_HENRY_MEATFORMORGAN(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 4;
	condition = dia_addon_henry_meatformorgan_condition;
	information = dia_addon_henry_meatformorgan_info;
	permanent = FALSE;
	description = "Mam mi瘰o dla Morgana.";
};


func int dia_addon_henry_meatformorgan_condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,dia_addon_henry_einigen) && (MIS_ALLIGATORJACK_BRINGMEAT == LOG_RUNNING) && (Npc_HasItems(other,itfomuttonraw) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_henry_meatformorgan_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_MeatForMorgan_15_00");	//Mam mi瘰o dla Morgana.
	AI_Output(self,other,"DIA_Addon_Henry_MeatForMorgan_04_01");	//Aha. A kto ci? przysy豉?
	AI_Output(other,self,"DIA_Addon_Henry_MeatForMorgan_15_02");	//Jack Aligator. M闚i, 瞠 Morgan czeka na dostaw?.
	AI_Output(self,other,"DIA_Addon_Henry_MeatForMorgan_04_03");	//Tak, tak.. Jakby sam nie m鏬? si? ruszy?...
};


instance DIA_ADDON_HENRY_MALCOM(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 5;
	condition = dia_addon_henry_malcom_condition;
	information = dia_addon_henry_malcom_info;
	description = "Malcolm mnie przysy豉. ";
};


func int dia_addon_henry_malcom_condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,dia_addon_henry_einigen) && (MALCOMBOTSCHAFT == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_henry_malcom_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Malcom_15_00");	//Malcolm mnie przysy豉. M闚i?, 瞠 na drewno przyjdzie troch? poczeka?.
	AI_Output(self,other,"DIA_Addon_Henry_Malcom_04_01");	//Tak, tak... Powinienem by? wiedzie?. Jak zwykle, b璠ziemy czeka? ca貫 wieki.
	b_malcomexident();
};


instance DIA_ADDON_HENRY_BALTRAMPACK(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 6;
	condition = dia_addon_henry_baltrampack_condition;
	information = dia_addon_henry_baltrampack_info;
	description = "Mam przesy趾? dla Skipa.";
};


func int dia_addon_henry_baltrampack_condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,dia_addon_henry_einigen) && Npc_HasItems(other,itmi_packet_baltram4skip_addon))
	{
		return TRUE;
	};
};

func void dia_addon_henry_baltrampack_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_BaltramPack_15_00");	//Mam przesy趾? dla Skipa. Jest w ?rodku?
	AI_Output(self,other,"DIA_Addon_Henry_BaltramPack_04_01");	//Tak, jest w ?rodku. Co? jeszcze?
};


var int henry_amount;

instance DIA_ADDON_HENRY_TRIBUT(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 7;
	condition = dia_addon_henry_tribut_condition;
	information = dia_addon_henry_tribut_info;
	permanent = TRUE;
	description = "Wpu?? mnie.";
};


func int dia_addon_henry_tribut_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_henry_einigen) && (self.aivar[AIV_PASSGATE] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_henry_tribut_info()
{
	HENRY_AMOUNT = 500;
	AI_Output(other,self,"DIA_Addon_Henry_Tribut_15_00");	//Wpu?? mnie.
	AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_01");	//Hmm...
	if(Npc_KnowsInfo(other,dia_addon_henry_malcom))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_02");	//Przynios貫? mi wiadomo?? od drwali.
		HENRY_AMOUNT = HENRY_AMOUNT - 100;
	};
	if(Npc_KnowsInfo(other,dia_addon_henry_meatformorgan))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_03");	//Jeste? pomocnikiem Jacka Aligatora i masz mi瘰o dla Morgana.
		HENRY_AMOUNT = HENRY_AMOUNT - 100;
	};
	if(Npc_KnowsInfo(other,dia_addon_henry_baltrampack))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_04");	//Masz paczk? dla Skipa.
		HENRY_AMOUNT = HENRY_AMOUNT - 100;
	};
	if(MIS_HENRY_FREEBDTTOWER == LOG_SUCCESS)
	{
		if(HENRY_AMOUNT < 500)
		{
			AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_00");	//A co najciekawsze...
		};
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_01");	//Uda這 ci si? pokona? tych bandzior闚 z wie篡.
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_02");	//Nie my?la貫m, 瞠 uda ci si? tego dokona?!
		HENRY_AMOUNT = HENRY_AMOUNT - 200;
	};
	if(HENRY_AMOUNT <= 0)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_03");	//Wiesz, co ci powiem? Wchod? za darmo...
		self.aivar[AIV_PASSGATE] = TRUE;
		Info_ClearChoices(dia_addon_henry_tribut);
	}
	else
	{
		b_henry_gold(HENRY_AMOUNT);
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_05");	//...albo odejd?.
		Info_ClearChoices(dia_addon_henry_tribut);
		Info_AddChoice(dia_addon_henry_tribut,"To zbyt wiele.",dia_addon_henry_tribut_nein);
		if(Npc_HasItems(other,itmi_gold) >= HENRY_AMOUNT)
		{
			Info_AddChoice(dia_addon_henry_tribut,"Dobrze. Tu jest twoje z這to.",dia_addon_henry_tribut_ja);
		};
	};
};

func void dia_addon_henry_tribut_ja()
{
	AI_Output(other,self,"DIA_Addon_Henry_Tribut_ja_15_00");	//Dobrze. Tu jest twoje z這to.
	b_giveinvitems(other,self,itmi_gold,HENRY_AMOUNT);
	AI_Output(self,other,"DIA_Addon_Henry_Tribut_ja_04_01");	//Dzi瘯i. Witamy w naszych skromnych progach.
	b_henry_nojoin();
	Info_ClearChoices(dia_addon_henry_tribut);
	self.aivar[AIV_PASSGATE] = TRUE;
};

func void dia_addon_henry_tribut_nein()
{
	AI_Output(other,self,"DIA_Addon_Henry_Tribut_nein_15_00");	//To zbyt wiele.
	if(HENRY_AMOUNT < 500)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_nein_04_03");	//No co ty? I tak ju? spu?ci貫m z ceny.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_nein_04_04");	//Daj mi spok鎩, co?
	};
	Info_ClearChoices(dia_addon_henry_tribut);
};


instance DIA_ADDON_HENRY_PALISADE(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 11;
	condition = dia_addon_henry_palisade_condition;
	information = dia_addon_henry_palisade_info;
	permanent = FALSE;
	description = "Co robisz?";
};


func int dia_addon_henry_palisade_condition()
{
	if(GREGISBACK == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_henry_palisade_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_15_00");	//Co robisz?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_04_01");	//A na co to wygl鉅a? Nadzoruj? budow? palisady, 瞠by te lenie zrobi造 to na czas.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_04_02");	//Je?li tego nie doko鎍zymy, to kapitan Greg da nam popali?.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_04_03");	//Pilnuj? te?, aby nikt niepowo豉ny tu nie wszed?.
};


instance DIA_ADDON_HENRY_PALISADE_WHATFOR(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 12;
	condition = dia_addon_henry_palisade_whatfor_condition;
	information = dia_addon_henry_palisade_whatfor_info;
	permanent = FALSE;
	description = "Po co stawiacie t? palisad??";
};


func int dia_addon_henry_palisade_whatfor_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_henry_palisade))
	{
		return TRUE;
	};
};

func void dia_addon_henry_palisade_whatfor_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_WhatFor_15_00");	//Po co stawiacie t? palisad??
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_10");	//Cho熲y po to, 瞠by utrudni? 篡cie bandytom!
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_02");	//Te sukinkoty podchodz? coraz bli瞠j. Zupe軟ie jak rekiny okr嘀aj鉍e rozbitka na pe軟ym morzu.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_11");	//Kilku z nich zaszy這 si? w wie篡 na po逝dniu.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_12");	//Ale s鉅z?, 瞠 to tylko zwiad.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_03");	//Tak wi璚, je?li w ko鎍u zaatakuj?, b璠ziemy przygotowani.
	Log_CreateTopic(TOPIC_ADDON_BANDITSTOWER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BANDITSTOWER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BANDITSTOWER,"W wie篡 na po逝dniu od obozu pirat闚 siedzi grupa bandyt闚.");
};

func void b_henry_whereistower()
{
	AI_Output(other,self,"DIA_Addon_Francis_BanditsDead_15_08");	//Gdzie jest ta wie瘸?
	AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_07");	//Je?li wyruszysz st鉅 i b璠ziesz trzyma? si? prawej strony...
	AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_08");	//...to po pewnym czasie powiniene? zobaczy? wie輳 na ma造m klifie.
};


instance DIA_ADDON_HENRY_TURMBANDITEN(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 13;
	condition = dia_addon_henry_turmbanditen_whatfor_condition;
	information = dia_addon_henry_turmbanditen_whatfor_info;
	permanent = TRUE;
	description = "Je?li chodzi o tych bandyt闚 z wie篡...";
};


func int dia_addon_henry_turmbanditen_whatfor_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_henry_palisade_whatfor) && (MIS_HENRY_FREEBDTTOWER != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_henry_turmbanditen_whatfor_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Turmbanditen_15_00");	//Je?li chodzi o tych bandyt闚 z wie篡...
	if(c_towerbanditsdead() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_01");	//Tak?
		AI_Output(other,self,"DIA_Addon_Francis_BanditsDead_15_01");	//Ju? nie b璠? sprawia? k這pot闚.
		if(MIS_HENRY_FREEBDTTOWER == LOG_RUNNING)
		{
			AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_02");	//Wspaniale! Jeden problem z g這wy.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_03");	//Pokona貫? ich w pojedynk?? Panowie, czapki z g堯w!
			AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_04");	//Kto wie, mo瞠 kiedy? b璠ziesz prawdziwym piratem!
		};
		sawpirate.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(sawpirate,"START");
		hammerpirate.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(hammerpirate,"START");
		MIS_HENRY_FREEBDTTOWER = LOG_SUCCESS;
		b_logentry(TOPIC_ADDON_BANDITSTOWER,"Bandyci w wie篡 nie 篡j?.");
		b_giveplayerxp(XP_ADDON_HENRY_FREEBDTTOWER);
	}
	else if(MIS_HENRY_FREEBDTTOWER == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_07");	//Co teraz?
		b_henry_whereistower();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_05");	//Tylko nie my?l, 瞠by p鎩?? tam samemu!
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_06");	//P??niej wy?l? tam dw鏂h ch這pak闚 z mojej grupy aborda穎wej. Oni poradz? sobie z bandytami.
		KNOWS_HENRYSENTERTRUPP = TRUE;
	};
};


instance DIA_ADDON_HENRY_PALISADE_BANDITS(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 14;
	condition = dia_addon_henry_palisade_bandits_condition;
	information = dia_addon_henry_palisade_bandits_info;
	permanent = FALSE;
	description = "Dlaczego zostali?cie zaatakowani przez bandyt闚?";
};


func int dia_addon_henry_palisade_bandits_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_henry_palisade_whatfor))
	{
		return TRUE;
	};
};

func void dia_addon_henry_palisade_bandits_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_Bandits_15_00");	//Dlaczego zostali?cie zaatakowani przez bandyt闚?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_04");	//A jak s鉅zisz? Wojujemy z nimi od jakiego? czasu.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_05");	//Na pocz靖ku wszystko by這 w porz鉅ku. Przywie?li?my ich tutaj, a oni odeszli w g章b bagien i nie niepokoili nas wi璚ej.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_06");	//Niestety, p??niej zacz瘭i napada? na ka盥ego, kto nie nale瘸? do ich bandy.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_07");	//Nie mam poj璚ia, co za demony ich op皻a造!
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_08");	//My?l?, 瞠 chc? zabra? nasze 這dzie, bo to chyba jedyny spos鏏, by si? st鉅 wyrwa?.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_09");	//Porozmawiaj ze Skipem. By? w ich obozie i omal nie przyp豉ci? tego 篡ciem.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_10");	//To bardzo ciekawa historia!
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_11");	//Niestety, nie b璠ziesz m鏬? jej wys逝cha?, bo nie zap豉ci貫? myta.
		HENRY_ZOLL_WHATFOR = TRUE;
	};
};


var int henry_entercrewmember;

instance DIA_ADDON_HENRY_ENTERCREW(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 31;
	condition = dia_addon_henry_entercrew_condition;
	information = dia_addon_henry_entercrew_info;
	permanent = TRUE;
	description = "Chc? do章czy? do waszej grupy aborda穎wej.";
};


func int dia_addon_henry_entercrew_condition()
{
	if((KNOWS_HENRYSENTERTRUPP == TRUE) && (HENRY_ENTERCREWMEMBER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_henry_entercrew_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Entercrew_15_00");	//Chc? do章czy? do waszej grupy aborda穎wej.
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_00");	//Tym si? nie wykpisz, ch這pcze!
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_01");	//Najpierw musimy ustali?, czy w og鏊e zas逝gujesz na wpuszczenie ci? do obozu!
		HENRY_ZOLL_WHATFOR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_04_06");	//Witam w mojej grupie!
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_04_07");	//Przyda nam si? dodatkowe rami?, kiedy b璠ziemy walczy? z bandytami.
		if(MIS_HENRY_FREEBDTTOWER == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_02");	//Hmm... Jak powiedzia貫m, we? jednego z ch這pc闚 i wykurz bandzior闚 z wie篡.
			AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_03");	//Ale ju? to zrobi貫?.
		}
		else
		{
			if(Npc_IsDead(sawpirate) && Npc_IsDead(hammerpirate))
			{
				AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_04");	//Obaj moi ludzie nie 篡j?. Wygl鉅a na to, 瞠 b璠ziesz musia? p鎩?? tam sam.
				AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_05");	//Pozb鉅? si? bandyt闚 z wie篡!
				b_logentry(TOPIC_ADDON_BANDITSTOWER,"Henry chce, 瞠bym usun像 bandyt闚 z wie篡. Nie mo瞠 jednak da? mi 瘸dnego wsparcia.");
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_06");	//We? jednego z moich ch這pc闚 i pozb鉅? si? bandyt闚 z wie篡.
				HENRY_GETPARTYMEMBER = TRUE;
				b_logentry(TOPIC_ADDON_BANDITSTOWER,"Henry chce, 瞠bym usun像 bandyt闚 z wie篡. Mog? zabra? ze sob? jednego z jego ch這pak闚.");
			};
			b_henry_whereistower();
			AI_Output(other,self,"DIA_Addon_Henry_Entercrew_15_09");	//Tak jest!
			MIS_HENRY_FREEBDTTOWER = LOG_RUNNING;
		};
		HENRY_ENTERCREWMEMBER = TRUE;
	};
};


instance DIA_ADDON_HENRY_OWEN(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 32;
	condition = dia_addon_henry_owen_condition;
	information = dia_addon_henry_owen_info;
	description = "Mog? wam jeszcze jako? pom鏂?";
};


func int dia_addon_henry_owen_condition()
{
	if((MIS_HENRY_FREEBDTTOWER == LOG_SUCCESS) && (HENRY_ENTERCREWMEMBER == TRUE) && !Npc_IsDead(malcom))
	{
		return TRUE;
	};
};

func void dia_addon_henry_owen_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Owen_15_01");	//Mog? wam jeszcze jako? pom鏂?
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_01");	//Od wielu dni czekamy na drewno potrzebne do budowy palisady.
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_05");	//Malcolm i Owen powinni byli dostarczy? je ju? dawno temu.
	if(!Npc_KnowsInfo(other,dia_addon_henry_malcom))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Owen_04_06");	//Ob霩 drwali nie jest zbyt daleko - nad jeziorem le蕨cym w kotlinie na po逝dniowym wschodzie.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Owen_04_07");	//Malcolm powiedzia?, 瞠 dostawa si? op??ni, ale my ju? czekamy ca貫 wieki!
	};
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_08");	//Powiedz im, 瞠 czekamy na drewno!
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_09");	//Nie, czekaj... Powiedz to Owenowi. Malcolm jest ma這 wiarygodny.
	b_malcomexident();
	MIS_HENRY_HOLOWEN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_HOLOWEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_HOLOWEN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_HOLOWEN,"Henry czeka przy palisadzie na drewno. Mam powiadomi? o tym Owena, kt鏎y razem z Malcolmem przebywa w kotlinie.");
};

func void b_addon_henry_malcomsdead()
{
	AI_Output(self,other,"DIA_Addon_Henry_Owen2_Add_04_00");	//Co si? dzieje z Malcolmem?
	AI_Output(other,self,"DIA_Addon_Henry_Owen2_Add_15_01");	//Nie 篡je.
	AI_Output(self,other,"DIA_Addon_Henry_Owen2_Add_04_02");	//Mia? nielichego pecha, co?
};


instance DIA_ADDON_HENRY_OWEN2(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 33;
	condition = dia_addon_henry_owen2_condition;
	information = dia_addon_henry_owen2_info;
	permanent = TRUE;
	description = "Je?li chodzi o drwala Owena...";
};


func int dia_addon_henry_owen2_condition()
{
	if(MIS_HENRY_HOLOWEN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_henry_owen2_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_00");	//Je?li chodzi o drwala Owena...
	if(Npc_IsDead(pir_1367_addon_owen) == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_01");	//Nie 篡je...
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_02");	//Szlag by to trafi?! Teraz b璠? musia? wys豉? kogo? innego.
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_03");	//Chyba ju? pora, 瞠by Morgan ruszy? ty貫k i pozby? si? tych stwor闚.
		b_addon_henry_malcomsdead();
		MIS_HENRY_HOLOWEN = LOG_OBSOLETE;
		b_logentry(TOPIC_ADDON_HOLOWEN,"Owen i Malcom nie 篡j?.");
		Log_SetTopicStatus(TOPIC_ADDON_HOLOWEN,LOG_OBSOLETE);
	}
	else if(OWEN_COMESTOHENRY == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_03");	//Owen dostarczy drewno.
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_04");	//Doskonale. Czas ju? najwy窺zy.
		b_addon_henry_malcomsdead();
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_05");	//Oto twoja nagroda.
		b_giveinvitems(self,other,itmi_gold,200);
		b_startotherroutine(pir_1367_addon_owen,"PostStart");
		b_logentry(TOPIC_ADDON_HOLOWEN,"Owen dostarczy drewno Henry'emu.");
		MIS_HENRY_HOLOWEN = LOG_SUCCESS;
		b_giveplayerxp(XP_ADDON_OWEN_COMESTOHENRY);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_06");	//Gdzie jest ten ob霩?
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_07");	//Kawa貫k na po逝dniowy wsch鏚, nieopodal kotliny.
	};
};


var int henry_perm_once;

instance DIA_ADDON_HENRY_PALISADE_CANHELP(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 34;
	condition = dia_addon_henry_palisade_canhelp_condition;
	information = dia_addon_henry_palisade_canhelp_info;
	permanent = TRUE;
	description = "Potrzebujesz pomocy?";
};


func int dia_addon_henry_palisade_canhelp_condition()
{
	if((MIS_HENRY_HOLOWEN == LOG_SUCCESS) || (MIS_HENRY_HOLOWEN == LOG_OBSOLETE))
	{
		return TRUE;
	};
};

func void dia_addon_henry_palisade_canhelp_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_CanHelp_15_00");	//Potrzebujesz pomocy?
	if(HENRY_PERM_ONCE == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_CanHelp_04_01");	//Masz jakie? do?wiadczenie w stawianiu palisad?
		AI_Output(other,self,"DIA_Addon_Henry_Palisade_CanHelp_15_02");	//Niezbyt du瞠.
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_CanHelp_04_03");	//W takim razie nie mam dla ciebie 瘸dnej pracy. Poszukaj sobie innego zaj璚ia.
		HENRY_PERM_ONCE = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_CanHelp_04_04");	//R鏏, co chcesz, tylko nie przeszkadzaj mi w pracy, jasne?
};


instance DIA_ADDON_HENRY_WHATTEACH(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 21;
	condition = dia_addon_henry_whatteach_condition;
	information = dia_addon_henry_whatteach_info;
	permanent = TRUE;
	description = "Mo瞠sz mnie podszkoli? w walce?";
};


func int dia_addon_henry_whatteach_condition()
{
	if((KNOWS_HENRYSENTERTRUPP == TRUE) && (HENRY_ADDON_TEACHPLAYER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_henry_whatteach_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_WhatTeach_Add_15_00");	//Mo瞠sz mnie podszkoli? w walce?
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_WhatTeach_Add_04_01");	//Najpierw obowi頊ek, potem przyjemno??. Zr鏏 co? po篡tecznego, to ci? naucz? walczy?.
		AI_Output(self,other,"DIA_Addon_Henry_WhatTeach_Add_04_02");	//Wszystko jest wliczone w cen?.
		HENRY_ZOLL_WHATFOR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_WhatTeach_Add_04_03");	//Pewnie, czemu nie?
		HENRY_ADDON_TEACHPLAYER = TRUE;
		Log_CreateTopic(TOPIC_ADDON_PIR_TEACHER,LOG_NOTE);
		b_logentry(TOPIC_ADDON_PIR_TEACHER,LOG_TEXT_ADDON_HENRYTEACH);
	};
};


var int henry_merke2h;
var int henry_labercount;

func void b_henry_commentfightskill()
{
	if(HENRY_LABERCOUNT == 0)
	{
		AI_Output(self,other,"DIA_Addon_Henry_CommentFightSkill_04_01");	//Szybko si? uczysz, zupe軟ie jak prawdziwy pirat.
		HENRY_LABERCOUNT = 1;
	}
	else if(HENRY_LABERCOUNT == 1)
	{
		AI_Output(self,other,"DIA_Addon_Henry_CommentFightSkill_04_02");	//Je?li tak dalej p鎩dzie, to sam b璠ziesz si? rwa? do aborda篡.
		HENRY_LABERCOUNT = 2;
	}
	else if(HENRY_LABERCOUNT == 2)
	{
		AI_Output(self,other,"DIA_Addon_Henry_CommentFightSkill_04_03");	//Pami皻aj, 瞠 najd逝瞠j 篡j? ci, kt鏎zy opanowali sztuk? parowania.
		HENRY_LABERCOUNT = 0;
	};
};


instance DIA_ADDON_HENRY_TEACH(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 6;
	condition = dia_addon_henry_teach_condition;
	information = dia_addon_henry_teach_info;
	permanent = TRUE;
	description = "Ucz mnie.";
};


func int dia_addon_henry_teach_condition()
{
	if(HENRY_ADDON_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_henry_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Teach_15_00");	//Ucz mnie.
	HENRY_MERKE2H = other.hitchance[NPC_TALENT_2H];
	Info_ClearChoices(dia_addon_henry_teach);
	Info_AddChoice(dia_addon_henry_teach,DIALOG_BACK,dia_addon_henry_teach_back);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_addon_henry_teach_2h_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,1) * 5),dia_addon_henry_teach_2h_5);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_addon_henry_teach_cb_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_addon_henry_teach_cb_5);
};

func void dia_addon_henry_teach_back()
{
	if(other.hitchance[NPC_TALENT_2H] > HENRY_MERKE2H)
	{
		b_henry_commentfightskill();
	}
	else if(other.hitchance[NPC_TALENT_2H] >= 90)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Teach_Back_04_00");	//Masz przed sob? du穎 nauki.
	};
	Info_ClearChoices(dia_addon_henry_teach);
};

func void dia_addon_henry_teach_cb_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,1,75);
	Info_ClearChoices(dia_addon_henry_teach);
	Info_AddChoice(dia_addon_henry_teach,DIALOG_BACK,dia_addon_henry_teach_back);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_addon_henry_teach_2h_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,1) * 5),dia_addon_henry_teach_2h_5);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_addon_henry_teach_cb_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_addon_henry_teach_cb_5);
};

func void dia_addon_henry_teach_cb_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,5,75);
	Info_ClearChoices(dia_addon_henry_teach);
	Info_AddChoice(dia_addon_henry_teach,DIALOG_BACK,dia_addon_henry_teach_back);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_addon_henry_teach_2h_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,1) * 5),dia_addon_henry_teach_2h_5);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_addon_henry_teach_cb_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_addon_henry_teach_cb_5);
};

func void dia_addon_henry_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,90);
	Info_ClearChoices(dia_addon_henry_teach);
	Info_AddChoice(dia_addon_henry_teach,DIALOG_BACK,dia_addon_henry_teach_back);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_addon_henry_teach_2h_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,1) * 5),dia_addon_henry_teach_2h_5);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_addon_henry_teach_cb_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_addon_henry_teach_cb_5);
};

func void dia_addon_henry_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,90);
	Info_ClearChoices(dia_addon_henry_teach);
	Info_AddChoice(dia_addon_henry_teach,DIALOG_BACK,dia_addon_henry_teach_back);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_addon_henry_teach_2h_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,1) * 5),dia_addon_henry_teach_2h_5);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_addon_henry_teach_cb_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_addon_henry_teach_cb_5);
};


instance DIA_ADDON_HENRY_PALISADE_TRAIN(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 11;
	condition = dia_addon_henry_palisade_train_condition;
	information = dia_addon_henry_palisade_train_info;
	permanent = FALSE;
	description = "Greg jest twoim szefem?";
};


func int dia_addon_henry_palisade_train_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_henry_palisade) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_henry_palisade_train_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_Train_15_00");	//Greg jest twoim szefem?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_01");	//Zgadza si?. Ale dla ciebie to jest Kapitan Greg. Rozumiemy si??
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_02");	//To wielki cz這wiek. Kiedy go spotkasz, nawet nie my?l, by zrobi? co? g逝piego. Nie spodoba ci si? jego reakcja na takie zachowanie.
	if(pir_1300_addon_greg_nw.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_Palisade_Train_15_03");	//Ju? z nim rozmawia貫m.
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_04");	//W takim razie wiesz, o czym m闚i?.
	};
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_05");	//Niestety, nie ma go w tej chwili w obozie.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_06");	//Jego zast瘼c? jest Francis.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_07");	//Ca造mi dniami siedzi przed chat? Grega i gapi si? na nas jak sroka w gnat.
};


instance DIA_ADDON_HENRY_YOUROWNTRUPP(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 1;
	condition = dia_addon_henry_yourowntrupp_condition;
	information = dia_addon_henry_yourowntrupp_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_henry_yourowntrupp_condition()
{
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_henry_yourowntrupp_info()
{
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_04");	//Kapitan powierzy? ci dow鏚ztwo nad grup? uderzeniow??
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_05");	//Ch這pakom przyda si? troch? pracy!
	AI_StopProcessInfos(self);
};

