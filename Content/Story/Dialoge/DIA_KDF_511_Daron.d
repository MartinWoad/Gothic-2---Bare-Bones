
func void b_daronsegen()
{
	var string concattext;
	var int bonus_1;
	var int bonus_2;
	var int bonus_3;
	DARON_SEGEN = TRUE;
	if((DARON_SPENDE < 250) && (bonus_1 == FALSE))
	{
		b_raiseattribute(other,ATR_HITPOINTS_MAX,5,TRUE,FALSE);
		bonus_1 = TRUE;
	}
	else if((DARON_SPENDE < 500) && (bonus_2 == FALSE))
	{
		b_raiseattribute(other,ATR_HITPOINTS_MAX,5,TRUE,FALSE);
		bonus_2 = TRUE;
	}
	else if((DARON_SPENDE >= 750) && (DARON_SPENDE < 1000) && (bonus_3 == FALSE))
	{
		other.lp = other.lp + 1;
		concattext = ConcatStrings(PRINT_LEARNLP,IntToString(1));
		PrintScreen(concattext,-1,-1,FONT_SCREEN,1);
		bonus_3 = TRUE;
	}
	else
	{
		if(other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
		{
			other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
			PrintScreen(PRINT_FULLYHEALED,-1,-1,FONT_SCREEN,2);
		};
		if(other.attribute[ATR_MANA] < other.attribute[ATR_MANA_MAX])
		{
			other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
		};
	};
};


instance DIA_DARON_EXIT(C_INFO)
{
	npc = kdf_511_daron;
	nr = 999;
	condition = dia_daron_exit_condition;
	information = dia_daron_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_daron_exit_condition()
{
	return TRUE;
};

func void dia_daron_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DARON_HALLO(C_INFO)
{
	npc = kdf_511_daron;
	nr = 2;
	condition = dia_daron_hallo_condition;
	information = dia_daron_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_daron_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_daron_hallo_info()
{
	AI_Output(self,other,"DIA_Daron_Hallo_10_00");	//Co mog� dla ciebie zrobi�? Szukasz duchowego wsparcia?
	AI_Output(self,other,"DIA_Daron_Hallo_10_01");	//Pragniesz skierowa� modlitw� do Innosa, czy te� chcesz z�o�y� niewielk� ofiar� w z�ocie dla naszego ko�cio�a?
};


instance DIA_DARON_PALADINE(C_INFO)
{
	npc = kdf_511_daron;
	nr = 2;
	condition = dia_daron_paladine_condition;
	information = dia_daron_paladine_info;
	permanent = FALSE;
	description = "Musz� porozmawia� z paladynami...";
};


func int dia_daron_paladine_condition()
{
	if((other.guild != GIL_KDF) && (KAPITEL < 2))
	{
		return TRUE;
	};
};

func void dia_daron_paladine_info()
{
	AI_Output(other,self,"DIA_Daron_Paladine_15_00");	//Musz� porozmawia� z paladynami. Czy pomo�esz mi skontaktowa� si� z nimi?
	AI_Output(self,other,"DIA_Daron_Paladine_10_01");	//Musisz dosta� si� do g�rnego miasta. Jednak wst�p do niego zarezerwowany jest dla obywateli i stra�y miejskiej.
	AI_Output(self,other,"DIA_Daron_Paladine_10_02");	//No i oczywi�cie dla nas, Mag�w Ognia.
	AI_Output(other,self,"DIA_Daron_Paladine_15_03");	//Jak mog� zosta� Magiem Ognia?
	AI_Output(self,other,"DIA_Daron_Paladine_10_04");	//Musisz wst�pi� do naszego zakonu jako nowicjusz. Niewykluczone, �e po jakim� czasie zostaniesz przyj�ty do kr�gu mag�w.
	AI_Output(self,other,"DIA_Daron_Paladine_10_05");	//Jednak �cie�ka prowadz�ca do tego celu jest d�uga, kr�ta i pe�na wyboj�w.
};


instance DIA_DARON_ABOUTSEGEN(C_INFO)
{
	npc = kdf_511_daron;
	nr = 2;
	condition = dia_daron_aboutsegen_condition;
	information = dia_daron_aboutsegen_info;
	permanent = FALSE;
	description = "Przyszed�em po b�ogos�awie�stwo!";
};


func int dia_daron_aboutsegen_condition()
{
	if((MIS_THORBEN_GETBLESSINGS == LOG_RUNNING) && (PLAYER_ISAPPRENTICE == APP_NONE) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_daron_aboutsegen_info()
{
	AI_Output(other,self,"DIA_Daron_AboutSegen_15_00");	//Przyszed�em po b�ogos�awie�stwo!
	AI_Output(self,other,"DIA_Daron_AboutSegen_10_01");	//To dobrze, to bardzo dobrze - z pewno�ci� zechcesz zasili� �wi�ty ko�ci� Innosa jak�� skromn� sumk�?
	AI_Output(other,self,"DIA_Daron_AboutSegen_15_02");	//W�a�ciwie to potrzebuj� twojego b�ogos�awie�stwa, �eby zosta� czeladnikiem w dolnej cz�ci miasta...
	if(DARON_SEGEN == TRUE)
	{
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_03");	//Ju� dosta�e� moje b�ogos�awie�stwo, synu.
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_04");	//Niech ci� Innos prowadzi, synu!
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_05");	//Ale� synu! Bez skromnej ofiary nie b�d� ci� m�g� pob�ogos�awi�!
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_06");	//Jak inaczej m�g�bym si� upewni� co do twoich dobrych intencji wobec naj�wi�tszego ko�cio�a Innosa?
	};
};


instance DIA_DARON_SPENDEN(C_INFO)
{
	npc = kdf_511_daron;
	nr = 3;
	condition = dia_daron_spenden_condition;
	information = dia_daron_spenden_info;
	permanent = FALSE;
	description = "Ile wynosi przeci�tna ofiara?";
};


func int dia_daron_spenden_condition()
{
	if(hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_daron_spenden_info()
{
	AI_Output(other,self,"DIA_Daron_Spenden_15_00");	//Ile wynosi przeci�tna ofiara?
	AI_Output(self,other,"DIA_Daron_Spenden_10_01");	//To zale�y od twojego stanu maj�tkowego. Zobaczmy, ile przynios�e�.
	AI_Output(self,other,"DIA_Daron_Spenden_10_02");	//Mmmm hmmm...
	if(Npc_HasItems(other,itmi_gold) < 10)
	{
		AI_Output(self,other,"DIA_Daron_Spenden_10_03");	//Nie nale�ysz do bogaczy, co? Zostaw sobie te par� monet.
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"Daron, Mag Ognia, nie udzieli� mi b�ogos�awie�stwa. Chyba powinienem przekaza� troch� z�ota na potrzeby klasztoru.");
		};
	}
	else
	{
		if(Npc_HasItems(other,itmi_gold) < 50)
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_04");	//No c�, bogaczem to ty nie jeste�, ale nie nale�ysz te� do biedak�w. 10 sztuk z�ota w zupe�no�ci wystarczy - �yjemy skromnie.
			b_giveinvitems(other,self,5113,10);
		}
		else if(Npc_HasItems(other,itmi_gold) < 100)
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_05");	//Masz ponad 50 monet. Oddaj 25 Innosowi, a otrzymasz jego b�ogos�awie�stwo.
			b_giveinvitems(other,self,5113,25);
		}
		else
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_06");	//Masz ponad 100 sztuk z�ota - nasz Pan powiada: dzielcie si�, je�li macie czym.
			AI_Output(self,other,"DIA_Daron_Spenden_10_07");	//Ko�ci� przyjmuje twoj� jak�e hojn� ofiar�.
			b_giveinvitems(other,self,5113,50);
		};
		AI_Output(self,other,"DIA_Daron_Spenden_10_08");	//B�ogos�awi� ci� w imieniu Innosa. Albowiem on jest �wiat�em i sprawiedliwo�ci�.
		DARON_SEGEN = TRUE;
		b_giveplayerxp(XP_INNOSSEGEN);
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"Daron, Mag Ognia, udzieli� mi b�ogos�awie�stwa.");
		};
	};
};


instance DIA_DARON_WOHER(C_INFO)
{
	npc = kdf_511_daron;
	nr = 9;
	condition = dia_daron_woher_condition;
	information = dia_daron_woher_info;
	permanent = FALSE;
	description = "Sk�d pochodzisz?";
};


func int dia_daron_woher_condition()
{
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_daron_woher_info()
{
	AI_Output(other,self,"DIA_Daron_Woher_15_00");	//Sk�d pochodzisz?
	AI_Output(self,other,"DIA_Daron_Woher_10_01");	//Pochodz� z klasztoru mag�w le��cego w g�rach.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Daron_Woher_10_02");	//Przyjmujemy w swoje szeregi ka�dego, kto ma czyste serce i jest got�w po�wi�ci� �ycie s�u�bie wszechpot�nemu Innosowi.
	};
};


instance DIA_DARON_INNOS(C_INFO)
{
	npc = kdf_511_daron;
	nr = 9;
	condition = dia_daron_innos_condition;
	information = dia_daron_innos_info;
	permanent = FALSE;
	description = "Opowiedz mi o Innosie.";
};


func int dia_daron_innos_condition()
{
	if(Npc_KnowsInfo(other,dia_daron_woher) && (other.guild != GIL_KDF) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_daron_innos_info()
{
	AI_Output(other,self,"DIA_Daron_Innos_15_00");	//Opowiedz mi o Innosie.
	AI_Output(self,other,"DIA_Daron_Innos_10_01");	//Innos, nasz wszechpot�ny w�adca, jest �wiat�em i ogniem.
	AI_Output(self,other,"DIA_Daron_Innos_10_02");	//Da� ludziom magi� i prawo, aby byli jego narz�dziami.
	AI_Output(self,other,"DIA_Daron_Innos_10_03");	//Dzia�amy w jego imieniu. Wymierzamy sprawiedliwo�� zgodnie z jego wol� i g�osimy jego nauki.
};


instance DIA_DARON_KLOSTER(C_INFO)
{
	npc = kdf_511_daron;
	nr = 9;
	condition = dia_daron_kloster_condition;
	information = dia_daron_kloster_info;
	permanent = FALSE;
	description = "Powiedz mi co� wi�cej na temat klasztoru.";
};


func int dia_daron_kloster_condition()
{
	if(Npc_KnowsInfo(other,dia_daron_woher) || (Npc_KnowsInfo(other,dia_daron_paladine) && (other.guild != GIL_NOV) && (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_daron_kloster_info()
{
	AI_Output(other,self,"DIA_Daron_Kloster_15_00");	//Powiedz mi co� wi�cej na temat klasztoru.
	AI_Output(self,other,"DIA_Daron_Kloster_10_01");	//Nauczamy wszystkich dziedzin magii. Jednak sztuka Mag�w Ognia to co� wi�cej.
	AI_Output(self,other,"DIA_Daron_Kloster_10_02");	//Znamy si� r�wnie� na alchemii, potrafimy tworzy� pot�ne runy.
	AI_Output(self,other,"DIA_Daron_Kloster_10_03");	//No i jeste�my producentami doskona�ego wina.
};


instance DIA_DARON_STADT(C_INFO)
{
	npc = kdf_511_daron;
	nr = 99;
	condition = dia_daron_stadt_condition;
	information = dia_daron_stadt_info;
	permanent = TRUE;
	description = "Co robisz w mie�cie?";
};


func int dia_daron_stadt_condition()
{
	if(Npc_KnowsInfo(other,dia_daron_woher))
	{
		return TRUE;
	};
};

func void dia_daron_stadt_info()
{
	AI_Output(other,self,"DIA_Daron_Stadt_15_00");	//Co robisz w mie�cie?
	AI_Output(self,other,"DIA_Daron_Stadt_10_01");	//Prowadz� dyskusje z paladynami i wspieram obywateli rad� i dobrym s�owem.
	AI_Output(self,other,"DIA_Daron_Stadt_10_02");	//Szczeg�lnie w dzisiejszych czasach naszym obowi�zkiem jest pomaga� s�abszym.
};


instance DIA_DARON_ARM(C_INFO)
{
	npc = kdf_511_daron;
	nr = 10;
	condition = dia_daron_arm_condition;
	information = dia_daron_arm_info;
	permanent = FALSE;
	description = "Jestem biedakiem!";
};


func int dia_daron_arm_condition()
{
	if(Npc_KnowsInfo(other,dia_daron_stadt) && (Npc_HasItems(other,itmi_gold) < 10) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_daron_arm_info()
{
	AI_Output(other,self,"DIA_Daron_arm_15_00");	//Jestem biedakiem!
	AI_Output(self,other,"DIA_Daron_arm_10_01");	//A wi�c nie masz �adnych pieni�dzy. W dzisiejszych czasach cz�sto si� to zdarza. We� to z�oto, na pewno ci si� przyda.
	AI_Output(self,other,"DIA_Daron_arm_10_02");	//Rozejrzyj si� za prac�, zobaczysz, �e naprawd� nietrudno jest zarobi�. A kiedy ju� b�dziesz m�g�, z�� ofiar� ko�cio�owi Innosa, aby w ten spos�b mu si� odwdzi�czy�.
	b_giveinvitems(self,other,5113,20);
};


instance DIA_DARON_SPENDE(C_INFO)
{
	npc = kdf_511_daron;
	nr = 990;
	condition = dia_daron_spende_condition;
	information = dia_daron_spende_info;
	permanent = TRUE;
	description = "Chcia�bym z�o�y� ofiar�";
};


var int dia_daron_spende_permanent;

func int dia_daron_spende_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_DARON_SPENDE_PERMANENT == FALSE) && Npc_KnowsInfo(other,dia_daron_spenden) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_daron_spende_info()
{
	AI_Output(other,self,"DIA_Daron_Spende_15_00");	//Chcia�bym z�o�y� ofiar�...
	Info_ClearChoices(dia_daron_spende);
	if(DARON_SPENDE < 1000)
	{
		Info_AddChoice(dia_daron_spende,"Ale nie przynios�em do�� z�ota... (POWR�T)",dia_daron_spende_back);
		Info_AddChoice(dia_daron_spende,"(50 sztuk z�ota)",dia_daron_spende_50);
		Info_AddChoice(dia_daron_spende,"(100 sztuk z�ota)",dia_daron_spende_100);
		Info_AddChoice(dia_daron_spende,"(200 sztuk z�ota)",dia_daron_spende_200);
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_10_01");	//W sumie otrzyma�em od ciebie ponad 1000 sztuk z�ota.
		AI_Output(self,other,"DIA_Daron_Spende_10_02");	//B�ogos�awie�stwo Innosa b�dzie ci zawsze towarzyszy�.
		DIA_DARON_SPENDE_PERMANENT = TRUE;
		b_daronsegen();
	};
};

func void dia_daron_spende_back()
{
	AI_Output(other,self,"DIA_Daron_Spende_BACK_15_00");	//Nie mam przy sobie wystarczaj�co du�o z�ota...
	AI_Output(self,other,"DIA_Daron_Spende_BACK_10_01");	//To nie ma znaczenia, synu. Mo�esz z�o�y� ofiar� p�niej.
	Info_ClearChoices(dia_daron_spende);
};


var int daron_spende;

func void dia_daron_spende_50()
{
	if(b_giveinvitems(other,self,5113,50))
	{
		AI_Output(self,other,"DIA_Daron_Spende_50_10_00");	//B�ogos�awi� ci� w imieniu Innosa. Albowiem on jest �wiat�em i sprawiedliwo�ci�.
		DARON_SPENDE = DARON_SPENDE + 50;
		b_daronsegen();
		DARON_SEGEN = TRUE;
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"Daron, Mag Ognia, udzieli� mi b�ogos�awie�stwa.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_50_10_01");	//Je�li masz przy sobie z�oto, mo�esz z�o�y� ofiar� w ka�dej chwili.
	};
	Info_ClearChoices(dia_daron_spende);
};

func void dia_daron_spende_100()
{
	if(b_giveinvitems(other,self,5113,100))
	{
		AI_Output(self,other,"DIA_Daron_Spende_100_10_00");	//Innosie, jeste� blaskiem o�wietlaj�cym �cie�ki sprawiedliwych.
		AI_Output(self,other,"DIA_Daron_Spende_100_10_01");	//W twoim imieniu b�ogos�awi� tego cz�owieka. Niechaj twoje �wiat�o zawsze wskazuje mu w�a�ciw� drog�.
		DARON_SPENDE = DARON_SPENDE + 100;
		b_daronsegen();
		DARON_SEGEN = TRUE;
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"Daron, Mag Ognia, udzieli� mi b�ogos�awie�stwa.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_100_10_02");	//Nasz pan powiada: je�li chcesz si� modli�, otw�rz swego ducha i serce. Je�li chcesz z�o�y� ofiar�, otw�rz sakiewk�.
	};
	Info_ClearChoices(dia_daron_spende);
};

func void dia_daron_spende_200()
{
	if(b_giveinvitems(other,self,5113,200))
	{
		AI_Output(self,other,"DIA_Daron_Spende_200_10_00");	//Innosie, pob�ogos�aw tego m�czyzn�. Niechaj tw�j blask zawsze o�wietla mu drog�.
		AI_Output(self,other,"DIA_Daron_Spende_200_10_01");	//Daj mu si��, aby m�g� zawsze post�powa� m�drze i sprawiedliwie.
		DARON_SPENDE = DARON_SPENDE + 200;
		b_daronsegen();
		DARON_SEGEN = TRUE;
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"Daron, Mag Ognia, udzieli� mi b�ogos�awie�stwa.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_200_10_02");	//Je�li chcesz nam przekaza� tyle z�ota, powiniene� je ze sob� przynie��.
	};
	Info_ClearChoices(dia_daron_spende);
};


instance DIA_DARON_PICKPOCKET(C_INFO)
{
	npc = kdf_511_daron;
	nr = 900;
	condition = dia_daron_pickpocket_condition;
	information = dia_daron_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_daron_pickpocket_condition()
{
	return c_beklauen(47,80);
};

func void dia_daron_pickpocket_info()
{
	Info_ClearChoices(dia_daron_pickpocket);
	Info_AddChoice(dia_daron_pickpocket,DIALOG_BACK,dia_daron_pickpocket_back);
	Info_AddChoice(dia_daron_pickpocket,DIALOG_PICKPOCKET,dia_daron_pickpocket_doit);
};

func void dia_daron_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_daron_pickpocket);
};

func void dia_daron_pickpocket_back()
{
	Info_ClearChoices(dia_daron_pickpocket);
};

