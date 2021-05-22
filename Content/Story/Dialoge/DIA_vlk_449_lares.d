
instance DIA_LARES_KAP1_EXIT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 999;
	condition = dia_lares_kap1_exit_condition;
	information = dia_lares_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lares_kap1_exit_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_lares_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARES_PICKPOCKET(C_INFO)
{
	npc = vlk_449_lares;
	nr = 900;
	condition = dia_lares_pickpocket_condition;
	information = dia_lares_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_lares_pickpocket_condition()
{
	return c_beklauen(95,350);
};

func void dia_lares_pickpocket_info()
{
	Info_ClearChoices(dia_lares_pickpocket);
	Info_AddChoice(dia_lares_pickpocket,DIALOG_BACK,dia_lares_pickpocket_back);
	Info_AddChoice(dia_lares_pickpocket,DIALOG_PICKPOCKET,dia_lares_pickpocket_doit);
};

func void dia_lares_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_lares_pickpocket);
};

func void dia_lares_pickpocket_back()
{
	Info_ClearChoices(dia_lares_pickpocket);
};


instance DIA_LARES_HALLO(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_lares_hallo_condition;
	information = dia_lares_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lares_hallo_condition()
{
	return TRUE;
};

func void dia_lares_hallo_info()
{
	AI_Output(self,other,"DIA_Lares_HALLO_09_00");	//Chyba oszala³em. Co ty tutaj robisz?
	if((MIL_310_SCHONMALREINGELASSEN == FALSE) && (MIL_333_SCHONMALREINGELASSEN == FALSE))
	{
		AI_Output(self,other,"DIA_Lares_HALLO_09_01");	//PRZYP£YN¥£EŒ tu?
		AI_Output(self,other,"DIA_Lares_HALLO_09_02");	//To niez³y sposób na ominiêcie stra¿ników przy bramie.
	};
	Info_ClearChoices(dia_lares_hallo);
	Info_AddChoice(dia_lares_hallo,"Czy my siê znamy?",dia_lares_hallo_no);
	Info_AddChoice(dia_lares_hallo,"Hej! Lares, ty stary draniu...",dia_lares_hallo_yes);
};

func void dia_lares_hallo_no()
{
	AI_Output(other,self,"DIA_Lares_HALLO_NO_15_00");	//Czy my siê znamy?
	AI_Output(self,other,"DIA_Lares_HALLO_NO_09_01");	//Ch³opie, nie pamiêtasz mnie? Trzyma³em siê w pobli¿u Nowego Obozu.
	AI_Output(self,other,"DIA_Lares_HALLO_NO_09_02");	//Cz³owieku, ale by³o fajowo. Pamiêtasz Lee?
	Info_ClearChoices(dia_lares_hallo);
	Info_AddChoice(dia_lares_hallo,"Oczywiœcie, ¿e pamiêtam Lee!",dia_lares_hallo_lee);
	Info_AddChoice(dia_lares_hallo,"Lee...?",dia_lares_hallo_noidea);
};

func void dia_lares_hallo_yes()
{
	AI_Output(other,self,"DIA_Lares_HALLO_YES_15_00");	//Hej! Lares, ty stary draniu, jak siê tu dosta³eœ?
	AI_Output(self,other,"DIA_Lares_HALLO_YES_09_01");	//Uda³o mi siê w sam¹ porê uciec z doliny, razem z Lee i paroma innymi ch³opakami.
	AI_Output(self,other,"DIA_Lares_HALLO_YES_09_02");	//Pamiêtasz Lee, prawda?
	Info_ClearChoices(dia_lares_hallo);
	Info_AddChoice(dia_lares_hallo,"Oczywiœcie, ¿e pamiêtam Lee!",dia_lares_hallo_lee);
	Info_AddChoice(dia_lares_hallo,"Lee...?",dia_lares_hallo_noidea);
};

func void b_lares_aboutlee()
{
	AI_Output(self,other,"B_Lares_AboutLee_09_00");	//Wiêc wydosta³em siê z nim z Kolonii zaraz po tym, jak Bariera zosta³a zniszczona.
	AI_Output(self,other,"B_Lares_AboutLee_09_01");	//Teraz on i jego ch³opcy s¹ w gospodarstwie Onara.
	AI_Output(self,other,"B_Lares_AboutLee_09_02");	//Zawar³ uk³ad z w³aœcicielem. Lee i jego ch³opaki broni¹ gospodarstwa, a Onar ich karmi.
};

func void dia_lares_hallo_lee()
{
	AI_Output(other,self,"DIA_Lares_HALLO_LEE_15_00");	//Oczywiœcie, ¿e pamiêtam Lee!
	b_lares_aboutlee();
	Info_ClearChoices(dia_lares_hallo);
};

func void dia_lares_hallo_noidea()
{
	AI_Output(other,self,"DIA_Lares_HALLO_NOIDEA_15_00");	//Lee...?
	AI_Output(self,other,"DIA_Lares_HALLO_NOIDEA_09_01");	//Wiele przeszed³eœ, co? Lee by³ przywódc¹ najemników w Nowym Obozie.
	b_lares_aboutlee();
	Info_ClearChoices(dia_lares_hallo);
};


instance DIA_LARES_WHYINCITY(C_INFO)
{
	npc = vlk_449_lares;
	nr = 2;
	condition = dia_lares_whyincity_condition;
	information = dia_lares_whyincity_info;
	permanent = FALSE;
	description = "A dlaczego TY nie jesteœ razem z Lee i jego najemnikami?";
};


func int dia_lares_whyincity_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_lares_whyincity_info()
{
	AI_Output(other,self,"DIA_Lares_WhyInCity_15_00");	//A dlaczego TY nie jesteœ razem z Lee i jego najemnikami?
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_01");	//Ale¿ jestem! Tylko ¿e nie na farmie.
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_02");	//Mo¿na powiedzieæ, ¿e zosta³em tu wys³any na posterunek. Nie chcemy, aby statek odp³yn¹³ bez nas.
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_03");	//Dlaczego przyby³eœ do miasta?
};


instance DIA_LARES_PALADINE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 3;
	condition = dia_lares_paladine_condition;
	information = dia_lares_paladine_info;
	permanent = FALSE;
	description = "Za wszelk¹ cenê muszê siê skontaktowaæ z paladynami!";
};


func int dia_lares_paladine_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lares_whyincity))
	{
		return TRUE;
	};
};

func void dia_lares_paladine_info()
{
	AI_Output(other,self,"DIA_Lares_Paladine_15_00");	//Muszê koniecznie porozmawiaæ z paladynami!
	AI_Output(self,other,"DIA_Lares_Paladine_09_01");	//A czego od NICH chcesz?
	AI_Output(other,self,"DIA_Lares_Paladine_15_02");	//Posiadaj¹ potê¿ny amulet zwany Okiem Innosa. Muszê go mieæ.
	AI_Output(self,other,"DIA_Lares_Paladine_09_03");	//I myœlisz, ¿e po prostu ci go oddadz¹? Nigdy nie dostaniesz siê do górnego miasta.
	AI_Output(other,self,"DIA_Lares_Paladine_15_04");	//Znajdê jakiœ sposób.
	AI_Output(self,other,"DIA_Lares_Paladine_09_05");	//Jasne, jeœli chcesz siê przymilaæ mieszkañcom, albo zostaniesz ch³opcem na posy³ki w stra¿y.
};


instance DIA_LARES_ALTERNATIVE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 4;
	condition = dia_lares_alternative_condition;
	information = dia_lares_alternative_info;
	permanent = FALSE;
	description = "Mam jakiœ wybór?";
};


func int dia_lares_alternative_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lares_paladine))
	{
		return TRUE;
	};
};

func void dia_lares_alternative_info()
{
	AI_Output(other,self,"DIA_Lares_Alternative_15_00");	//Mam jakiœ wybór?
	AI_Output(self,other,"DIA_Lares_Alternative_09_01");	//Na twoim miejscu uda³bym siê na farmê Onara i pogada³ z Lee.
	AI_Output(self,other,"DIA_Lares_Alternative_09_02");	//Na pewno znajdziemy jakiœ sposób, ¿eby dostaæ siê do górnego miasta.
};


instance DIA_LARES_ABOUTSLD(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_lares_aboutsld_condition;
	information = dia_lares_aboutsld_info;
	permanent = FALSE;
	description = "Powiedz mi coœ wiêcej o najemnikach.";
};


func int dia_lares_aboutsld_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lares_whyincity))
	{
		return TRUE;
	};
};

func void dia_lares_aboutsld_info()
{
	AI_Output(other,self,"DIA_Lares_AboutSld_15_00");	//Powiedz mi coœ wiêcej o najemnikach.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_01");	//Có¿, jeœli jesteœ takim twardzielem jak kiedyœ, nie powinni sprawiæ ci k³opotu.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_02");	//Wiêkszoœæ z nich to bandyci, a jeœli sobie z nimi nie poradzisz, to daleko nie zajdziesz.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_03");	//Jeœli jesteœ delikatny, to na pewno z nimi nie wygrasz....
};


instance DIA_LARES_SCHIFF(C_INFO)
{
	npc = vlk_449_lares;
	nr = 6;
	condition = dia_lares_schiff_condition;
	information = dia_lares_schiff_info;
	permanent = FALSE;
	description = "O jakim statku mówi³eœ?";
};


func int dia_lares_schiff_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lares_whyincity) && (schiffswache_213.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_schiff_info()
{
	AI_Output(other,self,"DIA_Lares_Schiff_15_00");	//O jakim statku mówi³eœ?
	AI_Output(self,other,"DIA_Lares_Schiff_09_01");	//Stoi w porcie, za klifami. Lee i paru jego ludzi bardzo chce siê st¹d wydostaæ.
	AI_Output(self,other,"DIA_Lares_Schiff_09_02");	//Ale to mo¿e trochê potrwaæ...
	AI_Output(other,self,"DIA_Lares_Schiff_15_03");	//Dlaczego?
	AI_Output(self,other,"DIA_Lares_Schiff_09_04");	//Lepiej zapytaj o to Lee, jeœli go spotkasz... Ma jakieœ plany.
};


instance DIA_LARES_WEGZUMHOF(C_INFO)
{
	npc = vlk_449_lares;
	nr = 7;
	condition = dia_lares_wegzumhof_condition;
	information = dia_lares_wegzumhof_info;
	permanent = FALSE;
	description = "Jak dostanê siê do gospodarstwa tego w³aœciciela ziemskiego?";
};


func int dia_lares_wegzumhof_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lares_whyincity))
	{
		return TRUE;
	};
};

func void dia_lares_wegzumhof_info()
{
	AI_Output(other,self,"DIA_Lares_WegZumHof_15_00");	//Jak dostanê siê do gospodarstwa tego w³aœciciela ziemskiego?
	AI_Output(self,other,"DIA_Lares_WegZumHof_09_01");	//Mogê ciê tam zabraæ, jeœli chcesz. I tak za d³ugo siê tu krêcê.
	AI_Output(self,other,"DIA_Lares_WegZumHof_09_02");	//W porcie zwykle nie ma stra¿y, ale nie mogê zaryzykowaæ wzbudzenia ich podejrzeñ.
};


instance DIA_LARES_WHYPALHERE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 8;
	condition = dia_lares_whypalhere_condition;
	information = dia_lares_whypalhere_info;
	permanent = FALSE;
	description = "Czy wiesz, dlaczego s¹ tu paladyni?";
};


func int dia_lares_whypalhere_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_lares_whypalhere_info()
{
	AI_Output(other,self,"DIA_Lares_WhyPalHere_15_00");	//Czy wiesz, dlaczego tu s¹ paladyni?
	AI_Output(self,other,"DIA_Lares_WhyPalHere_09_01");	//Nikt nie wie na pewno... Wiêkszoœæ ludzi uwa¿a, ¿e to z powodu orków, ale ja mam inne zdanie na ten temat.
	AI_Output(self,other,"DIA_Lares_WhyPalHere_09_02");	//To ma pewnie coœ wspólnego ze star¹ koloni¹ karn¹.
};


instance DIA_LARES_GUILDOFTHIEVES(C_INFO)
{
	npc = vlk_449_lares;
	nr = 9;
	condition = dia_lares_guildofthieves_condition;
	information = dia_lares_guildofthieves_info;
	permanent = FALSE;
	description = "Wiesz coœ o gildii z³odziei w mieœcie?";
};


func int dia_lares_guildofthieves_condition()
{
	if(MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_lares_guildofthieves_info()
{
	AI_Output(other,self,"DIA_Lares_GuildOfThieves_15_00");	//Wiesz coœ o gildii z³odziei w mieœcie?
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_01");	//Te twoje pytania...
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_02");	//Oczywiœcie, ¿e jest tu taka gildia. Jak w ka¿dym wiêkszym mieœcie.
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_03");	//Ka¿dy paser czy kieszonkowiec ma z ni¹ pewnie jakieœ powi¹zania.
};


instance DIA_LARES_WHEREGUILDOFTHIEVES(C_INFO)
{
	npc = vlk_449_lares;
	nr = 9;
	condition = dia_lares_whereguildofthieves_condition;
	information = dia_lares_whereguildofthieves_info;
	permanent = FALSE;
	description = "Wiesz, gdzie mogê znaleŸæ gildiê z³odziei?";
};


func int dia_lares_whereguildofthieves_condition()
{
	if(Npc_KnowsInfo(other,dia_lares_guildofthieves) && (DG_GEFUNDEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_whereguildofthieves_info()
{
	AI_Output(other,self,"DIA_Lares_WhereGuildOfThieves_15_00");	//Wiesz, gdzie mogê znaleŸæ gildiê z³odziei?
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_01");	//Bez obrazy, ale nawet gdybym wiedzia³, to nie powiedzia³bym ci ani s³owa.
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_02");	//Ci ludzie s¹ zwykle BARDZO dra¿liwi, jeœli chodzi o te sprawy.
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_03");	//Powinieneœ byæ bardzo ostro¿ny, jeœli chcesz siê z nimi zadawaæ.
};


instance DIA_LARES_GOTKEY(C_INFO)
{
	npc = vlk_449_lares;
	nr = 9;
	condition = dia_lares_gotkey_condition;
	information = dia_lares_gotkey_info;
	permanent = FALSE;
	description = "Mam tutaj klucz. Zardzewia³ od morskiej wody...";
};


func int dia_lares_gotkey_condition()
{
	if(Npc_KnowsInfo(other,dia_lares_whereguildofthieves) && Npc_HasItems(other,itke_thiefguildkey_mis) && (DG_GEFUNDEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_gotkey_info()
{
	AI_Output(other,self,"DIA_Lares_GotKey_15_00");	//Mam tutaj klucz. Zardzewia³ od morskiej wody...
	AI_Output(self,other,"DIA_Lares_GotKey_09_01");	//No i?
	AI_Output(other,self,"DIA_Lares_GotKey_15_02");	//Wydaje mi siê, ¿e pozwoli mi dostaæ siê do kryjówki gildii z³odziei...
	AI_Output(self,other,"DIA_Lares_GotKey_09_03");	//Có¿, mo¿liwe, ¿e to klucz do kana³ów.
};


instance DIA_LARES_KANALISATION(C_INFO)
{
	npc = vlk_449_lares;
	nr = 9;
	condition = dia_lares_kanalisation_condition;
	information = dia_lares_kanalisation_info;
	permanent = FALSE;
	description = "Gdzie znajdê kana³y?";
};


func int dia_lares_kanalisation_condition()
{
	if(Npc_KnowsInfo(other,dia_lares_gotkey) && (DG_GEFUNDEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_kanalisation_info()
{
	AI_Output(other,self,"DIA_Lares_Kanalisation_15_00");	//Gdzie znajdê kana³y?
	AI_Output(self,other,"DIA_Lares_Kanalisation_09_01");	//A co ja mogê wiedzieæ... Zwykle maj¹ ujœcie na brzegu morza.
};


instance DIA_LARES_OTHERGUILD(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_lares_otherguild_condition;
	information = dia_lares_otherguild_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lares_otherguild_condition()
{
	if(Npc_IsInState(self,zs_talk) && (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lares_otherguild_info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		if(other.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_00");	//Jesteœ teraz w stra¿y!
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_01");	//Normalnie umrê ze œmiechu - by³y skazaniec w stra¿y miejskiej...
		}
		else
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_02");	//Wiêc teraz jesteœ jednym z paladynów Króla!
		};
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_03");	//Tylko ty mog³eœ wyci¹æ taki numer...
		if(Npc_KnowsInfo(other,dia_lares_whyincity))
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_04");	//Nie bêdziesz robiæ mi problemów z powodu pracy u Lee, prawda?
			AI_Output(other,self,"DIA_Lares_OtherGuild_15_05");	//Ale znasz mnie...
		};
	};
	if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_06");	//Nie ³apiê. By³eœ w klasztorze. Jak tam jest?
		AI_Output(other,self,"DIA_Lares_OtherGuild_15_07");	//Inaczej.
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_08");	//Domyœlam siê.
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_09");	//S³ysza³em, ¿e ciê przyjêli.
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_10");	//Gratulacje.
	};
};


instance DIA_LARES_GONOW(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_lares_gonow_condition;
	information = dia_lares_gonow_info;
	permanent = FALSE;
	description = "Dobra, chodŸmy.";
};


func int dia_lares_gonow_condition()
{
	if(Npc_KnowsInfo(other,dia_lares_wegzumhof) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lares_gonow_info()
{
	AI_Output(other,self,"DIA_Lares_GoNow_15_00");	//Dobra, chodŸmy.
	AI_Output(self,other,"DIA_Lares_GoNow_09_01");	//A wiêc ruszajmy... ChodŸ za mn¹.
	AI_StopProcessInfos(self);
	LARES_GUIDE = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GUIDE");
	if(Npc_KnowsInfo(other,dia_moe_hallo) == FALSE)
	{
		Npc_SetRefuseTalk(moe,30);
	};
};


instance DIA_LARES_GUIDE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_lares_guide_condition;
	information = dia_lares_guide_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lares_guide_condition()
{
	if(Npc_KnowsInfo(other,dia_lares_gonow) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TAVERNE_04"))
	{
		self.flags = 0;
		return TRUE;
	};
};

func void dia_lares_guide_info()
{
	if(LARES_GUIDE > (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_Lares_GUIDE_09_00");	//A wiêc jesteœmy.
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_GUIDE_09_01");	//A wiêc tutaj jesteœ. Ju¿ zaczyna³em myœleæ, ¿e ze¿ar³y ciê wilki.
	};
	AI_Output(self,other,"DIA_Lares_GUIDE_09_02");	//Có¿, przez resztê drogi poradzisz sobie sam. Muszê wracaæ do miasta. Mam tam kilka spraw do za³atwienia.
	AI_Output(self,other,"DIA_Lares_GUIDE_09_03");	//IdŸ po prostu t¹ drog¹ i pamiêtaj - b¹dŸ twardy i nie daj sobie wcisn¹æ kitu, a wszystko pójdzie jak po maœle.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_LARES_DEX(C_INFO)
{
	npc = vlk_449_lares;
	nr = 10;
	condition = dia_lares_dex_condition;
	information = dia_lares_dex_info;
	permanent = FALSE;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};


func int dia_lares_dex_condition()
{
	return TRUE;
};

func void dia_lares_dex_info()
{
	AI_Output(other,self,"DIA_Lares_DEX_15_00");	//Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"DIA_Lares_DEX_09_01");	//Jasne, jeœli chcesz, pomogê ci popracowaæ nad twoj¹ zrêcznoœci¹.
	LARES_TEACHDEX = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Lares mo¿e mi pokazaæ, jak staæ siê zrêczniejszym.");
};


var int lares_merkedex;

instance DIA_LARES_TEACH(C_INFO)
{
	npc = vlk_449_lares;
	nr = 10;
	condition = dia_lares_teach_condition;
	information = dia_lares_teach_info;
	permanent = TRUE;
	description = "Chcê byæ bardziej zrêczny!";
};


func int dia_lares_teach_condition()
{
	if(LARES_TEACHDEX == TRUE)
	{
		return TRUE;
	};
};

func void dia_lares_teach_info()
{
	AI_Output(other,self,"DIA_Lares_TEACH_15_00");	//Chcê byæ bardziej zrêczny!
	LARES_MERKEDEX = other.attribute[ATR_DEXTERITY];
	Info_ClearChoices(dia_lares_teach);
	Info_AddChoice(dia_lares_teach,DIALOG_BACK,dia_lares_teach_back);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_lares_teach_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_lares_teach_5);
};

func void dia_lares_teach_back()
{
	if(other.attribute[ATR_DEXTERITY] > LARES_MERKEDEX)
	{
		AI_Output(self,other,"DIA_Lares_TEACH_BACK_09_00");	//Ju¿ sta³eœ siê bardziej zrêczny.
	};
	Info_ClearChoices(dia_lares_teach);
};

func void dia_lares_teach_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,20);
	Info_ClearChoices(dia_lares_teach);
	Info_AddChoice(dia_lares_teach,DIALOG_BACK,dia_lares_teach_back);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_lares_teach_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_lares_teach_5);
};

func void dia_lares_teach_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,20);
	Info_ClearChoices(dia_lares_teach);
	Info_AddChoice(dia_lares_teach,DIALOG_BACK,dia_lares_teach_back);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_lares_teach_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_lares_teach_5);
};


instance DIA_LARES_KAP2_EXIT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 999;
	condition = dia_lares_kap2_exit_condition;
	information = dia_lares_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lares_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_lares_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARES_KAP3_EXIT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 999;
	condition = dia_lares_kap3_exit_condition;
	information = dia_lares_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lares_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lares_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARES_ANYNEWS(C_INFO)
{
	npc = vlk_449_lares;
	nr = 39;
	condition = dia_lares_anynews_condition;
	information = dia_lares_anynews_info;
	permanent = TRUE;
	description = "Jakieœ wieœci?";
};


func int dia_lares_anynews_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lares_anynews_info()
{
	AI_Output(other,self,"DIA_Lares_AnyNews_15_00");	//Jakieœ wieœci?
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lares_AnyNews_09_01");	//Dziêki tobie wieœci s¹ naprawdê wspania³e. Wypuœcili Benneta. Wróci³ ju¿ na farmê.
		AI_Output(self,other,"DIA_Lares_AnyNews_09_02");	//IdŸ do niego. Myœlê, ¿e chcia³by ci sam podziêkowaæ.
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_AnyNews_09_03");	//Mo¿na tak powiedzieæ. Paladyni aresztowali Benneta, naszego kowala.
		if(MIS_RESCUEBENNET == LOG_RUNNING)
		{
			AI_Output(other,self,"DIA_Lares_AnyNews_15_04");	//S³ysza³em. To z³a wiadomoœæ.
			AI_Output(self,other,"DIA_Lares_AnyNews_09_05");	//Taa, to za ma³o powiedziane.
		}
		else
		{
			AI_Output(other,self,"DIA_Lares_AnyNews_15_06");	//Jak to siê sta³o?
			AI_Output(self,other,"DIA_Lares_AnyNews_09_07");	//Bennet poszed³ do miasta po zapasy. No i ju¿ nie wróci³.
			AI_Output(self,other,"DIA_Lares_AnyNews_09_08");	//Jeœli chcesz wiedzieæ wiêcej, pogadaj z Hodgesem. By³ w mieœcie razem z Bennetem.
			MIS_RESCUEBENNET = LOG_RUNNING;
		};
	};
};


instance DIA_LARES_NEWSABOUTBENNET(C_INFO)
{
	npc = vlk_449_lares;
	nr = 38;
	condition = dia_lares_newsaboutbennet_condition;
	information = dia_lares_newsaboutbennet_info;
	permanent = FALSE;
	description = "Jakieœ wieœci o Bennecie?";
};


func int dia_lares_newsaboutbennet_condition()
{
	if(MIS_RESCUEBENNET == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_lares_newsaboutbennet_info()
{
	AI_Output(other,self,"DIA_Lares_NewsAboutBennet_15_00");	//Jakieœ wieœci o Bennecie?
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_01");	//Wygl¹da na to, ¿e zabrali go do koszar i wrzucili do lochu.
	AI_Output(other,self,"DIA_Lares_NewsAboutBennet_15_02");	//Jak mo¿emy go stamt¹d wydostaæ?
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_03");	//Nie mam na razie ¿adnych pomys³ów. Nie mogê dostaæ siê do celi, ¿eby z nim porozmawiaæ.
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_04");	//Mogê tylko nadstawiaæ ucha, ale tutaj niewiele mo¿na siê dowiedzieæ.
};


instance DIA_LARES_KAP4_EXIT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 999;
	condition = dia_lares_kap4_exit_condition;
	information = dia_lares_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lares_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lares_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARES_KAP4_PERM(C_INFO)
{
	npc = vlk_449_lares;
	nr = 49;
	condition = dia_lares_kap4_perm_condition;
	information = dia_lares_kap4_perm_info;
	permanent = TRUE;
	description = "Dlaczego nie polujesz na smoki?";
};


func int dia_lares_kap4_perm_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lares_kap4_perm_info()
{
	AI_Output(other,self,"DIA_Lares_Kap4_PERM_15_00");	//Dlaczego nie polujesz na smoki?
	AI_Output(self,other,"DIA_Lares_Kap4_PERM_09_01");	//To nie moja dzia³ka. Takie rzeczy zostawiam innym.
	AI_Output(self,other,"DIA_Lares_Kap4_PERM_09_02");	//Nie, nie. Œwie¿e morskie powietrze - tego mi teraz trzeba.
};


instance DIA_LARES_KAP5_EXIT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 999;
	condition = dia_lares_kap5_exit_condition;
	information = dia_lares_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lares_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lares_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARES_KNOWWHEREENEMY(C_INFO)
{
	npc = vlk_449_lares;
	nr = 51;
	condition = dia_lares_knowwhereenemy_condition;
	information = dia_lares_knowwhereenemy_info;
	permanent = TRUE;
	description = "Masz mo¿e ochotê na opuszczenie wyspy?";
};


func int dia_lares_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (LARES_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_00");	//Chcia³byœ mo¿e opuœciæ tê wyspê?
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_01");	//Najbardziej na œwiecie. A co chodzi ci po g³owie?
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_02");	//Dowiedzia³em siê, gdzie ukrywa siê przywódca smoków. Jest na wyspie, niedaleko st¹d.
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_03");	//Zamierzam siê go pozbyæ raz na zawsze.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_04");	//Brzmi œwietnie. Wchodzê w to, jeœli mogê siê do czegoœ przydaæ.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_05");	//Nie chcia³byœ siê nauczyæ, jak poprawiæ swoj¹ zrêcznoœæ, albo jak lepiej pos³ugiwaæ siê broniami jednorêcznymi?
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_06");	//Statek jest ju¿ pe³en, ale dam ci znaæ, jeœli coœ siê zmieni.
	}
	else
	{
		Info_ClearChoices(dia_lares_knowwhereenemy);
		Info_AddChoice(dia_lares_knowwhereenemy,"Do niczego mi siê nie przydasz.",dia_lares_knowwhereenemy_no);
		Info_AddChoice(dia_lares_knowwhereenemy,"Wiedzia³em, ¿e mogê na tobie polegaæ.",dia_lares_knowwhereenemy_yes);
	};
};

func void dia_lares_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_Yes_15_00");	//Wiedzia³em, ¿e mogê na tobie polegaæ.
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_Yes_15_01");	//Wszyscy spotkamy siê na statku.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_Yes_09_02");	//Cz³owiek czynu - to mi siê podoba. Do zobaczenia.
	LARES_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_lares_knowwhereenemy);
};

func void dia_lares_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_No_15_00");	//Doceniam twoj¹ propozycjê, ale do niczego mi siê nie przydasz.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_No_09_01");	//Musisz siê zdecydowaæ. Wiesz, gdzie mnie szukaæ, jeœli zechcesz o tym pogadaæ.
	if(hero.guild == GIL_DJG)
	{
		LARES_ISONBOARD = LOG_OBSOLETE;
	}
	else
	{
		LARES_ISONBOARD = LOG_FAILED;
	};
	Info_ClearChoices(dia_lares_knowwhereenemy);
};


instance DIA_LARES_LEAVEMYSHIP(C_INFO)
{
	npc = vlk_449_lares;
	nr = 51;
	condition = dia_lares_leavemyship_condition;
	information = dia_lares_leavemyship_info;
	permanent = TRUE;
	description = "Jednak wolê, ¿ebyœ zosta³.";
};


func int dia_lares_leavemyship_condition()
{
	if((LARES_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_leavemyship_info()
{
	AI_Output(other,self,"DIA_Lares_LeaveMyShip_15_00");	//Jednak wolê, ¿ebyœ zosta³.
	AI_Output(self,other,"DIA_Lares_LeaveMyShip_09_01");	//Jak sobie chcesz, ale nastêpnym razem zastanów siê, co komu obiecujesz.
	if(hero.guild == GIL_DJG)
	{
		LARES_ISONBOARD = LOG_OBSOLETE;
	}
	else
	{
		LARES_ISONBOARD = LOG_FAILED;
	};
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_LARES_STILLNEEDYOU(C_INFO)
{
	npc = vlk_449_lares;
	nr = 51;
	condition = dia_lares_stillneedyou_condition;
	information = dia_lares_stillneedyou_info;
	permanent = TRUE;
	description = "Wci¹¿ jesteœ zainteresowany podró¿¹?";
};


func int dia_lares_stillneedyou_condition()
{
	if(((LARES_ISONBOARD == LOG_OBSOLETE) || (LARES_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_lares_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Lares_StillNeedYou_15_00");	//Wci¹¿ jesteœ zainteresowany podró¿¹?
	if(LARES_ISONBOARD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_01");	//Zwykle nie pozwalam siê tak traktowaæ, ale poniewa¿ jesteœ jednym z nas, to tym razem puszczê ci to p³azem.
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_02");	//Spotkamy siê na statku.
		LARES_ISONBOARD = LOG_SUCCESS;
		CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
		if(MIS_READYFORCHAPTER6 == TRUE)
		{
			Npc_ExchangeRoutine(self,"SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self,"WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_03");	//Nie bierz tego do siebie, ale wydaje mi siê, ¿e mia³eœ racjê.
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_04");	//Lepiej jeœli zostanê tutaj.
		AI_StopProcessInfos(self);
	};
};

