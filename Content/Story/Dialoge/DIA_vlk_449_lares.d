
instance DIA_Lares_Kap1_EXIT(C_Info)
{
	npc = VLK_449_Lares;
	nr = 999;
	condition = DIA_Lares_Kap1_EXIT_Condition;
	information = DIA_Lares_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lares_Kap1_EXIT_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lares_PICKPOCKET(C_Info)
{
	npc = VLK_449_Lares;
	nr = 900;
	condition = DIA_Lares_PICKPOCKET_Condition;
	information = DIA_Lares_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Lares_PICKPOCKET_Condition()
{
	return C_Beklauen(95,350);
};

func void DIA_Lares_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lares_PICKPOCKET);
	Info_AddChoice(DIA_Lares_PICKPOCKET,Dialog_Back,DIA_Lares_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lares_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Lares_PICKPOCKET_DoIt);
};

func void DIA_Lares_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Lares_PICKPOCKET);
};

func void DIA_Lares_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lares_PICKPOCKET);
};


instance DIA_Lares_HALLO(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Lares_HALLO_Condition;
	information = DIA_Lares_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lares_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Lares_HALLO_Info()
{
	AI_Output(self,other,"DIA_Lares_HALLO_09_00");	//Chyba oszala�em. Co ty tutaj robisz?
	if((Mil_310_schonmalreingelassen == FALSE) && (Mil_333_schonmalreingelassen == FALSE))
	{
		AI_Output(self,other,"DIA_Lares_HALLO_09_01");	//PRZYP�YN��E� tu?
		AI_Output(self,other,"DIA_Lares_HALLO_09_02");	//To niez�y spos�b na omini�cie stra�nik�w przy bramie.
	};
	Info_ClearChoices(DIA_Lares_HALLO);
	Info_AddChoice(DIA_Lares_HALLO,"Czy my si� znamy?",DIA_Lares_HALLO_NO);
	Info_AddChoice(DIA_Lares_HALLO,"Hej! Lares, ty stary draniu...",DIA_Lares_HALLO_YES);
};

func void DIA_Lares_HALLO_NO()
{
	AI_Output(other,self,"DIA_Lares_HALLO_NO_15_00");	//Czy my si� znamy?
	AI_Output(self,other,"DIA_Lares_HALLO_NO_09_01");	//Ch�opie, nie pami�tasz mnie? Trzyma�em si� w pobli�u Nowego Obozu.
	AI_Output(self,other,"DIA_Lares_HALLO_NO_09_02");	//Cz�owieku, ale by�o fajowo. Pami�tasz Lee?
	Info_ClearChoices(DIA_Lares_HALLO);
	Info_AddChoice(DIA_Lares_HALLO,"Oczywi�cie, �e pami�tam Lee!",DIA_Lares_HALLO_LEE);
	Info_AddChoice(DIA_Lares_HALLO,"Lee...?",DIA_Lares_HALLO_NOIDEA);
};

func void DIA_Lares_HALLO_YES()
{
	AI_Output(other,self,"DIA_Lares_HALLO_YES_15_00");	//Hej! Lares, ty stary draniu, jak si� tu dosta�e�?
	AI_Output(self,other,"DIA_Lares_HALLO_YES_09_01");	//Uda�o mi si� w sam� por� uciec z doliny, razem z Lee i paroma innymi ch�opakami.
	AI_Output(self,other,"DIA_Lares_HALLO_YES_09_02");	//Pami�tasz Lee, prawda?
	Info_ClearChoices(DIA_Lares_HALLO);
	Info_AddChoice(DIA_Lares_HALLO,"Oczywi�cie, �e pami�tam Lee!",DIA_Lares_HALLO_LEE);
	Info_AddChoice(DIA_Lares_HALLO,"Lee...?",DIA_Lares_HALLO_NOIDEA);
};

func void B_Lares_AboutLee()
{
	AI_Output(self,other,"B_Lares_AboutLee_09_00");	//Wi�c wydosta�em si� z nim z Kolonii zaraz po tym, jak Bariera zosta�a zniszczona.
	AI_Output(self,other,"B_Lares_AboutLee_09_01");	//Teraz on i jego ch�opcy s� w gospodarstwie Onara.
	AI_Output(self,other,"B_Lares_AboutLee_09_02");	//Zawar� uk�ad z w�a�cicielem. Lee i jego ch�opaki broni� gospodarstwa, a Onar ich karmi.
};

func void DIA_Lares_HALLO_LEE()
{
	AI_Output(other,self,"DIA_Lares_HALLO_LEE_15_00");	//Oczywi�cie, �e pami�tam Lee!
	B_Lares_AboutLee();
	Info_ClearChoices(DIA_Lares_HALLO);
};

func void DIA_Lares_HALLO_NOIDEA()
{
	AI_Output(other,self,"DIA_Lares_HALLO_NOIDEA_15_00");	//Lee...?
	AI_Output(self,other,"DIA_Lares_HALLO_NOIDEA_09_01");	//Wiele przeszed�e�, co? Lee by� przyw�dc� najemnik�w w Nowym Obozie.
	B_Lares_AboutLee();
	Info_ClearChoices(DIA_Lares_HALLO);
};


instance DIA_LARES_WHYINCITY(C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = dia_lares_whyincity_condition;
	information = dia_lares_whyincity_info;
	permanent = FALSE;
	description = "A dlaczego TY nie jeste� razem z Lee i jego najemnikami?";
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
	AI_Output(other,self,"DIA_Lares_WhyInCity_15_00");	//A dlaczego TY nie jeste� razem z Lee i jego najemnikami?
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_01");	//Ale� jestem! Tylko �e nie na farmie.
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_02");	//Mo�na powiedzie�, �e zosta�em tu wys�any na posterunek. Nie chcemy, aby statek odp�yn�� bez nas.
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_03");	//Dlaczego przyby�e� do miasta?
};


instance DIA_Lares_Paladine(C_Info)
{
	npc = VLK_449_Lares;
	nr = 3;
	condition = DIA_Lares_Paladine_Condition;
	information = DIA_Lares_Paladine_Info;
	permanent = FALSE;
	description = "Za wszelk� cen� musz� si� skontaktowa� z paladynami!";
};


func int DIA_Lares_Paladine_Condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lares_whyincity))
	{
		return TRUE;
	};
};

func void DIA_Lares_Paladine_Info()
{
	AI_Output(other,self,"DIA_Lares_Paladine_15_00");	//Musz� koniecznie porozmawia� z paladynami!
	AI_Output(self,other,"DIA_Lares_Paladine_09_01");	//A czego od NICH chcesz?
	AI_Output(other,self,"DIA_Lares_Paladine_15_02");	//Posiadaj� pot�ny amulet zwany Okiem Innosa. Musz� go mie�.
	AI_Output(self,other,"DIA_Lares_Paladine_09_03");	//I my�lisz, �e po prostu ci go oddadz�? Nigdy nie dostaniesz si� do g�rnego miasta.
	AI_Output(other,self,"DIA_Lares_Paladine_15_04");	//Znajd� jaki� spos�b.
	AI_Output(self,other,"DIA_Lares_Paladine_09_05");	//Jasne, je�li chcesz si� przymila� mieszka�com, albo zostaniesz ch�opcem na posy�ki w stra�y.
};


instance DIA_LARES_ALTERNATIVE(C_Info)
{
	npc = VLK_449_Lares;
	nr = 4;
	condition = dia_lares_alternative_condition;
	information = dia_lares_alternative_info;
	permanent = FALSE;
	description = "Mam jaki� wyb�r?";
};


func int dia_lares_alternative_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,DIA_Lares_Paladine))
	{
		return TRUE;
	};
};

func void dia_lares_alternative_info()
{
	AI_Output(other,self,"DIA_Lares_Alternative_15_00");	//Mam jaki� wyb�r?
	AI_Output(self,other,"DIA_Lares_Alternative_09_01");	//Na twoim miejscu uda�bym si� na farm� Onara i pogada� z Lee.
	AI_Output(self,other,"DIA_Lares_Alternative_09_02");	//Na pewno znajdziemy jaki� spos�b, �eby dosta� si� do g�rnego miasta.
};


instance DIA_Lares_AboutSld(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Lares_AboutSld_Condition;
	information = DIA_Lares_AboutSld_Info;
	permanent = FALSE;
	description = "Powiedz mi co� wi�cej o najemnikach.";
};


func int DIA_Lares_AboutSld_Condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lares_whyincity))
	{
		return TRUE;
	};
};

func void DIA_Lares_AboutSld_Info()
{
	AI_Output(other,self,"DIA_Lares_AboutSld_15_00");	//Powiedz mi co� wi�cej o najemnikach.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_01");	//C�, je�li jeste� takim twardzielem jak kiedy�, nie powinni sprawi� ci k�opotu.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_02");	//Wi�kszo�� z nich to bandyci, a je�li sobie z nimi nie poradzisz, to daleko nie zajdziesz.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_03");	//Je�li jeste� delikatny, to na pewno z nimi nie wygrasz....
};


instance DIA_LARES_SCHIFF(C_Info)
{
	npc = VLK_449_Lares;
	nr = 6;
	condition = dia_lares_schiff_condition;
	information = dia_lares_schiff_info;
	permanent = FALSE;
	description = "O jakim statku m�wi�e�?";
};


func int dia_lares_schiff_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lares_whyincity) && (Schiffswache_213.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_schiff_info()
{
	AI_Output(other,self,"DIA_Lares_Schiff_15_00");	//O jakim statku m�wi�e�?
	AI_Output(self,other,"DIA_Lares_Schiff_09_01");	//Stoi w porcie, za klifami. Lee i paru jego ludzi bardzo chce si� st�d wydosta�.
	AI_Output(self,other,"DIA_Lares_Schiff_09_02");	//Ale to mo�e troch� potrwa�...
	AI_Output(other,self,"DIA_Lares_Schiff_15_03");	//Dlaczego?
	AI_Output(self,other,"DIA_Lares_Schiff_09_04");	//Lepiej zapytaj o to Lee, je�li go spotkasz... Ma jakie� plany.
};


instance DIA_LARES_WEGZUMHOF(C_Info)
{
	npc = VLK_449_Lares;
	nr = 7;
	condition = dia_lares_wegzumhof_condition;
	information = dia_lares_wegzumhof_info;
	permanent = FALSE;
	description = "Jak dostan� si� do gospodarstwa tego w�a�ciciela ziemskiego?";
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
	AI_Output(other,self,"DIA_Lares_WegZumHof_15_00");	//Jak dostan� si� do gospodarstwa tego w�a�ciciela ziemskiego?
	AI_Output(self,other,"DIA_Lares_WegZumHof_09_01");	//Mog� ci� tam zabra�, je�li chcesz. I tak za d�ugo si� tu kr�c�.
	AI_Output(self,other,"DIA_Lares_WegZumHof_09_02");	//W porcie zwykle nie ma stra�y, ale nie mog� zaryzykowa� wzbudzenia ich podejrze�.
};


instance DIA_Lares_WhyPalHere(C_Info)
{
	npc = VLK_449_Lares;
	nr = 8;
	condition = DIA_Lares_WhyPalHere_Condition;
	information = DIA_Lares_WhyPalHere_Info;
	permanent = FALSE;
	description = "Czy wiesz, dlaczego s� tu paladyni?";
};


func int DIA_Lares_WhyPalHere_Condition()
{
	if(Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Lares_WhyPalHere_Info()
{
	AI_Output(other,self,"DIA_Lares_WhyPalHere_15_00");	//Czy wiesz, dlaczego tu s� paladyni?
	AI_Output(self,other,"DIA_Lares_WhyPalHere_09_01");	//Nikt nie wie na pewno... Wi�kszo�� ludzi uwa�a, �e to z powodu ork�w, ale ja mam inne zdanie na ten temat.
	AI_Output(self,other,"DIA_Lares_WhyPalHere_09_02");	//To ma pewnie co� wsp�lnego ze star� koloni� karn�.
};


instance DIA_Lares_GuildOfThieves(C_Info)
{
	npc = VLK_449_Lares;
	nr = 9;
	condition = DIA_Lares_GuildOfThieves_Condition;
	information = DIA_Lares_GuildOfThieves_Info;
	permanent = FALSE;
	description = "Wiesz co� o gildii z�odziei w mie�cie?";
};


func int DIA_Lares_GuildOfThieves_Condition()
{
	if(MIS_Andre_GuildOfThieves == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Lares_GuildOfThieves_Info()
{
	AI_Output(other,self,"DIA_Lares_GuildOfThieves_15_00");	//Wiesz co� o gildii z�odziei w mie�cie?
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_01");	//Te twoje pytania...
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_02");	//Oczywi�cie, �e jest tu taka gildia. Jak w ka�dym wi�kszym mie�cie.
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_03");	//Ka�dy paser czy kieszonkowiec ma z ni� pewnie jakie� powi�zania.
};


instance DIA_Lares_WhereGuildOfThieves(C_Info)
{
	npc = VLK_449_Lares;
	nr = 9;
	condition = DIA_Lares_WhereGuildOfThieves_Condition;
	information = DIA_Lares_WhereGuildOfThieves_Info;
	permanent = FALSE;
	description = "Wiesz, gdzie mog� znale�� gildi� z�odziei?";
};


func int DIA_Lares_WhereGuildOfThieves_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lares_GuildOfThieves) && (DG_gefunden == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_WhereGuildOfThieves_Info()
{
	AI_Output(other,self,"DIA_Lares_WhereGuildOfThieves_15_00");	//Wiesz, gdzie mog� znale�� gildi� z�odziei?
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_01");	//Bez obrazy, ale nawet gdybym wiedzia�, to nie powiedzia�bym ci ani s�owa.
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_02");	//Ci ludzie s� zwykle BARDZO dra�liwi, je�li chodzi o te sprawy.
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_03");	//Powiniene� by� bardzo ostro�ny, je�li chcesz si� z nimi zadawa�.
};


instance DIA_Lares_GotKey(C_Info)
{
	npc = VLK_449_Lares;
	nr = 9;
	condition = DIA_Lares_GotKey_Condition;
	information = DIA_Lares_GotKey_Info;
	permanent = FALSE;
	description = "Mam tutaj klucz. Zardzewia� od morskiej wody...";
};


func int DIA_Lares_GotKey_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lares_WhereGuildOfThieves) && Npc_HasItems(other,ItKe_ThiefGuildKey_MIS) && (DG_gefunden == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_GotKey_Info()
{
	AI_Output(other,self,"DIA_Lares_GotKey_15_00");	//Mam tutaj klucz. Zardzewia� od morskiej wody...
	AI_Output(self,other,"DIA_Lares_GotKey_09_01");	//No i?
	AI_Output(other,self,"DIA_Lares_GotKey_15_02");	//Wydaje mi si�, �e pozwoli mi dosta� si� do kryj�wki gildii z�odziei...
	AI_Output(self,other,"DIA_Lares_GotKey_09_03");	//C�, mo�liwe, �e to klucz do kana��w.
};


instance DIA_Lares_Kanalisation(C_Info)
{
	npc = VLK_449_Lares;
	nr = 9;
	condition = DIA_Lares_Kanalisation_Condition;
	information = DIA_Lares_Kanalisation_Info;
	permanent = FALSE;
	description = "Gdzie znajd� kana�y?";
};


func int DIA_Lares_Kanalisation_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lares_GotKey) && (DG_gefunden == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_Kanalisation_Info()
{
	AI_Output(other,self,"DIA_Lares_Kanalisation_15_00");	//Gdzie znajd� kana�y?
	AI_Output(self,other,"DIA_Lares_Kanalisation_09_01");	//A co ja mog� wiedzie�... Zwykle maj� uj�cie na brzegu morza.
};


instance DIA_Lares_OtherGuild(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Lares_OtherGuild_Condition;
	information = DIA_Lares_OtherGuild_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lares_OtherGuild_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lares_OtherGuild_Info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		if(other.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_00");	//Jeste� teraz w stra�y!
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_01");	//Normalnie umr� ze �miechu - by�y skazaniec w stra�y miejskiej...
		}
		else
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_02");	//Wi�c teraz jeste� jednym z paladyn�w Kr�la!
		};
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_03");	//Tylko ty mog�e� wyci�� taki numer...
		if(Npc_KnowsInfo(other,dia_lares_whyincity))
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_04");	//Nie b�dziesz robi� mi problem�w z powodu pracy u Lee, prawda?
			AI_Output(other,self,"DIA_Lares_OtherGuild_15_05");	//Ale znasz mnie...
		};
	};
	if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_06");	//Nie �api�. By�e� w klasztorze. Jak tam jest?
		AI_Output(other,self,"DIA_Lares_OtherGuild_15_07");	//Inaczej.
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_08");	//Domy�lam si�.
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_09");	//S�ysza�em, �e ci� przyj�li.
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_10");	//Gratulacje.
	};
};


instance DIA_Lares_GoNow(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Lares_GoNow_Condition;
	information = DIA_Lares_GoNow_Info;
	permanent = FALSE;
	description = "Dobra, chod�my.";
};


func int DIA_Lares_GoNow_Condition()
{
	if(Npc_KnowsInfo(other,dia_lares_wegzumhof) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lares_GoNow_Info()
{
	AI_Output(other,self,"DIA_Lares_GoNow_15_00");	//Dobra, chod�my.
	AI_Output(self,other,"DIA_Lares_GoNow_09_01");	//A wi�c ruszajmy... Chod� za mn�.
	AI_StopProcessInfos(self);
	Lares_Guide = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GUIDE");
	if(Npc_KnowsInfo(other,DIA_Moe_Hallo) == FALSE)
	{
		Npc_SetRefuseTalk(Moe,30);
	};
};


instance DIA_Lares_GUIDE(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Lares_GUIDE_Condition;
	information = DIA_Lares_GUIDE_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lares_GUIDE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lares_GoNow) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TAVERNE_04"))
	{
		self.flags = 0;
		return TRUE;
	};
};

func void DIA_Lares_GUIDE_Info()
{
	if(Lares_Guide > (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_Lares_GUIDE_09_00");	//A wi�c jeste�my.
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_GUIDE_09_01");	//A wi�c tutaj jeste�. Ju� zaczyna�em my�le�, �e ze�ar�y ci� wilki.
	};
	AI_Output(self,other,"DIA_Lares_GUIDE_09_02");	//C�, przez reszt� drogi poradzisz sobie sam. Musz� wraca� do miasta. Mam tam kilka spraw do za�atwienia.
	AI_Output(self,other,"DIA_Lares_GUIDE_09_03");	//Id� po prostu t� drog� i pami�taj - b�d� twardy i nie daj sobie wcisn�� kitu, a wszystko p�jdzie jak po ma�le.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Lares_DEX(C_Info)
{
	npc = VLK_449_Lares;
	nr = 10;
	condition = DIA_Lares_DEX_Condition;
	information = DIA_Lares_DEX_Info;
	permanent = FALSE;
	description = "Mo�esz mnie czego� nauczy�?";
};


func int DIA_Lares_DEX_Condition()
{
	return TRUE;
};

func void DIA_Lares_DEX_Info()
{
	AI_Output(other,self,"DIA_Lares_DEX_15_00");	//Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"DIA_Lares_DEX_09_01");	//Jasne, je�li chcesz, pomog� ci popracowa� nad twoj� zr�czno�ci�.
	Lares_TeachDEX = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"Lares mo�e mi pokaza�, jak sta� si� zr�czniejszym.");
};


var int Lares_MerkeDEX;

instance DIA_Lares_TEACH(C_Info)
{
	npc = VLK_449_Lares;
	nr = 10;
	condition = DIA_Lares_TEACH_Condition;
	information = DIA_Lares_TEACH_Info;
	permanent = TRUE;
	description = "Chc� by� bardziej zr�czny!";
};


func int DIA_Lares_TEACH_Condition()
{
	if(Lares_TeachDEX == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lares_TEACH_Info()
{
	AI_Output(other,self,"DIA_Lares_TEACH_15_00");	//Chc� by� bardziej zr�czny!
	Lares_MerkeDEX = other.attribute[ATR_DEXTERITY];
	Info_ClearChoices(DIA_Lares_TEACH);
	Info_AddChoice(DIA_Lares_TEACH,Dialog_Back,DIA_Lares_TEACH_BACK);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_TEACH_5);
};

func void DIA_Lares_TEACH_BACK()
{
	if(other.attribute[ATR_DEXTERITY] > Lares_MerkeDEX)
	{
		AI_Output(self,other,"DIA_Lares_TEACH_BACK_09_00");	//Ju� sta�e� si� bardziej zr�czny.
	};
	Info_ClearChoices(DIA_Lares_TEACH);
};

func void DIA_Lares_TEACH_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,20);
	Info_ClearChoices(DIA_Lares_TEACH);
	Info_AddChoice(DIA_Lares_TEACH,Dialog_Back,DIA_Lares_TEACH_BACK);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_TEACH_5);
};

func void DIA_Lares_TEACH_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,20);
	Info_ClearChoices(DIA_Lares_TEACH);
	Info_AddChoice(DIA_Lares_TEACH,Dialog_Back,DIA_Lares_TEACH_BACK);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_TEACH_5);
};


instance DIA_Lares_Kap2_EXIT(C_Info)
{
	npc = VLK_449_Lares;
	nr = 999;
	condition = DIA_Lares_Kap2_EXIT_Condition;
	information = DIA_Lares_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lares_Kap2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lares_Kap3_EXIT(C_Info)
{
	npc = VLK_449_Lares;
	nr = 999;
	condition = DIA_Lares_Kap3_EXIT_Condition;
	information = DIA_Lares_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lares_Kap3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lares_AnyNews(C_Info)
{
	npc = VLK_449_Lares;
	nr = 39;
	condition = DIA_Lares_AnyNews_Condition;
	information = DIA_Lares_AnyNews_Info;
	permanent = TRUE;
	description = "Jakie� wie�ci?";
};


func int DIA_Lares_AnyNews_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Lares_AnyNews_Info()
{
	AI_Output(other,self,"DIA_Lares_AnyNews_15_00");	//Jakie� wie�ci?
	if(MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lares_AnyNews_09_01");	//Dzi�ki tobie wie�ci s� naprawd� wspania�e. Wypu�cili Benneta. Wr�ci� ju� na farm�.
		AI_Output(self,other,"DIA_Lares_AnyNews_09_02");	//Id� do niego. My�l�, �e chcia�by ci sam podzi�kowa�.
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_AnyNews_09_03");	//Mo�na tak powiedzie�. Paladyni aresztowali Benneta, naszego kowala.
		if(MIS_RescueBennet == LOG_Running)
		{
			AI_Output(other,self,"DIA_Lares_AnyNews_15_04");	//S�ysza�em. To z�a wiadomo��.
			AI_Output(self,other,"DIA_Lares_AnyNews_09_05");	//Taa, to za ma�o powiedziane.
		}
		else
		{
			AI_Output(other,self,"DIA_Lares_AnyNews_15_06");	//Jak to si� sta�o?
			AI_Output(self,other,"DIA_Lares_AnyNews_09_07");	//Bennet poszed� do miasta po zapasy. No i ju� nie wr�ci�.
			AI_Output(self,other,"DIA_Lares_AnyNews_09_08");	//Je�li chcesz wiedzie� wi�cej, pogadaj z Hodgesem. By� w mie�cie razem z Bennetem.
			MIS_RescueBennet = LOG_Running;
		};
	};
};


instance DIA_Lares_NewsAboutBennet(C_Info)
{
	npc = VLK_449_Lares;
	nr = 38;
	condition = DIA_Lares_NewsAboutBennet_Condition;
	information = DIA_Lares_NewsAboutBennet_Info;
	permanent = FALSE;
	description = "Jakie� wie�ci o Bennecie?";
};


func int DIA_Lares_NewsAboutBennet_Condition()
{
	if(MIS_RescueBennet == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Lares_NewsAboutBennet_Info()
{
	AI_Output(other,self,"DIA_Lares_NewsAboutBennet_15_00");	//Jakie� wie�ci o Bennecie?
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_01");	//Wygl�da na to, �e zabrali go do koszar i wrzucili do lochu.
	AI_Output(other,self,"DIA_Lares_NewsAboutBennet_15_02");	//Jak mo�emy go stamt�d wydosta�?
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_03");	//Nie mam na razie �adnych pomys��w. Nie mog� dosta� si� do celi, �eby z nim porozmawia�.
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_04");	//Mog� tylko nadstawia� ucha, ale tutaj niewiele mo�na si� dowiedzie�.
};


instance DIA_Lares_Kap4_EXIT(C_Info)
{
	npc = VLK_449_Lares;
	nr = 999;
	condition = DIA_Lares_Kap4_EXIT_Condition;
	information = DIA_Lares_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lares_Kap4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lares_Kap4_PERM(C_Info)
{
	npc = VLK_449_Lares;
	nr = 49;
	condition = DIA_Lares_Kap4_PERM_Condition;
	information = DIA_Lares_Kap4_PERM_Info;
	permanent = TRUE;
	description = "Dlaczego nie polujesz na smoki?";
};


func int DIA_Lares_Kap4_PERM_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap4_PERM_Info()
{
	AI_Output(other,self,"DIA_Lares_Kap4_PERM_15_00");	//Dlaczego nie polujesz na smoki?
	AI_Output(self,other,"DIA_Lares_Kap4_PERM_09_01");	//To nie moja dzia�ka. Takie rzeczy zostawiam innym.
	AI_Output(self,other,"DIA_Lares_Kap4_PERM_09_02");	//Nie, nie. �wie�e morskie powietrze - tego mi teraz trzeba.
};


instance DIA_Lares_Kap5_EXIT(C_Info)
{
	npc = VLK_449_Lares;
	nr = 999;
	condition = DIA_Lares_Kap5_EXIT_Condition;
	information = DIA_Lares_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lares_Kap5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lares_KnowWhereEnemy(C_Info)
{
	npc = VLK_449_Lares;
	nr = 51;
	condition = DIA_Lares_KnowWhereEnemy_Condition;
	information = DIA_Lares_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Masz mo�e ochot� na opuszczenie wyspy?";
};


func int DIA_Lares_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Lares_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_00");	//Chcia�by� mo�e opu�ci� t� wysp�?
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_01");	//Najbardziej na �wiecie. A co chodzi ci po g�owie?
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_02");	//Dowiedzia�em si�, gdzie ukrywa si� przyw�dca smok�w. Jest na wyspie, niedaleko st�d.
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_03");	//Zamierzam si� go pozby� raz na zawsze.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_04");	//Brzmi �wietnie. Wchodz� w to, je�li mog� si� do czego� przyda�.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_05");	//Nie chcia�by� si� nauczy�, jak poprawi� swoj� zr�czno��, albo jak lepiej pos�ugiwa� si� broniami jednor�cznymi?
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_06");	//Statek jest ju� pe�en, ale dam ci zna�, je�li co� si� zmieni.
	}
	else
	{
		Info_ClearChoices(DIA_Lares_KnowWhereEnemy);
		Info_AddChoice(DIA_Lares_KnowWhereEnemy,"Do niczego mi si� nie przydasz.",DIA_Lares_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Lares_KnowWhereEnemy,"Wiedzia�em, �e mog� na tobie polega�.",DIA_Lares_KnowWhereEnemy_Yes);
	};
};

func void DIA_Lares_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_Yes_15_00");	//Wiedzia�em, �e mog� na tobie polega�.
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_Yes_15_01");	//Wszyscy spotkamy si� na statku.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_Yes_09_02");	//Cz�owiek czynu - to mi si� podoba. Do zobaczenia.
	Lares_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_Lares_KnowWhereEnemy);
};

func void DIA_Lares_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_No_15_00");	//Doceniam twoj� propozycj�, ale do niczego mi si� nie przydasz.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_No_09_01");	//Musisz si� zdecydowa�. Wiesz, gdzie mnie szuka�, je�li zechcesz o tym pogada�.
	if(hero.guild == GIL_DJG)
	{
		Lares_IsOnBoard = LOG_OBSOLETE;
	}
	else
	{
		Lares_IsOnBoard = LOG_FAILED;
	};
	Info_ClearChoices(DIA_Lares_KnowWhereEnemy);
};


instance DIA_Lares_LeaveMyShip(C_Info)
{
	npc = VLK_449_Lares;
	nr = 51;
	condition = DIA_Lares_LeaveMyShip_Condition;
	information = DIA_Lares_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Jednak wol�, �eby� zosta�.";
};


func int DIA_Lares_LeaveMyShip_Condition()
{
	if((Lares_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Lares_LeaveMyShip_15_00");	//Jednak wol�, �eby� zosta�.
	AI_Output(self,other,"DIA_Lares_LeaveMyShip_09_01");	//Jak sobie chcesz, ale nast�pnym razem zastan�w si�, co komu obiecujesz.
	if(hero.guild == GIL_DJG)
	{
		Lares_IsOnBoard = LOG_OBSOLETE;
	}
	else
	{
		Lares_IsOnBoard = LOG_FAILED;
	};
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_Lares_StillNeedYou(C_Info)
{
	npc = VLK_449_Lares;
	nr = 51;
	condition = DIA_Lares_StillNeedYou_Condition;
	information = DIA_Lares_StillNeedYou_Info;
	permanent = TRUE;
	description = "Wci�� jeste� zainteresowany podr�?";
};


func int DIA_Lares_StillNeedYou_Condition()
{
	if(((Lares_IsOnBoard == LOG_OBSOLETE) || (Lares_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_Lares_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Lares_StillNeedYou_15_00");	//Wci�� jeste� zainteresowany podr�?
	if(Lares_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_01");	//Zwykle nie pozwalam si� tak traktowa�, ale poniewa� jeste� jednym z nas, to tym razem puszcz� ci to p�azem.
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_02");	//Spotkamy si� na statku.
		Lares_IsOnBoard = LOG_SUCCESS;
		Crewmember_Count = Crewmember_Count + 1;
		if(MIS_ReadyforChapter6 == TRUE)
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
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_03");	//Nie bierz tego do siebie, ale wydaje mi si�, �e mia�e� racj�.
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_04");	//Lepiej je�li zostan� tutaj.
		AI_StopProcessInfos(self);
	};
};

