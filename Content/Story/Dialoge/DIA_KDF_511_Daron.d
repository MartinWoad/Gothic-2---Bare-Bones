
func void B_DaronSegen()
{
	var string concatText;
	var int Bonus_1;
	var int Bonus_2;
	var int Bonus_3;
	Daron_Segen = TRUE;
	if((Daron_Spende < 250) && (Bonus_1 == FALSE))
	{
		B_RaiseAttribute(other,ATR_HITPOINTS_MAX,5,TRUE,FALSE);
		Bonus_1 = TRUE;
	}
	else if((Daron_Spende < 500) && (Bonus_2 == FALSE))
	{
		B_RaiseAttribute(other,ATR_HITPOINTS_MAX,5,TRUE,FALSE);
		Bonus_2 = TRUE;
	}
	else if((Daron_Spende >= 750) && (Daron_Spende < 1000) && (Bonus_3 == FALSE))
	{
		other.lp = other.lp + 1;
		concatText = ConcatStrings(PRINT_LearnLP,IntToString(1));
		PrintScreen(concatText,-1,-1,FONT_Screen,1);
		Bonus_3 = TRUE;
	}
	else
	{
		if(other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
		{
			other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
			PrintScreen(PRINT_FullyHealed,-1,-1,FONT_Screen,2);
		};
		if(other.attribute[ATR_MANA] < other.attribute[ATR_MANA_MAX])
		{
			other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
		};
	};
};


instance DIA_Daron_EXIT(C_Info)
{
	npc = KDF_511_Daron;
	nr = 999;
	condition = DIA_Daron_EXIT_Condition;
	information = DIA_Daron_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Daron_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Daron_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Daron_Hallo(C_Info)
{
	npc = KDF_511_Daron;
	nr = 2;
	condition = DIA_Daron_Hallo_Condition;
	information = DIA_Daron_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Daron_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Daron_Hallo_Info()
{
	AI_Output(self,other,"DIA_Daron_Hallo_10_00");	//Co mog� dla ciebie zrobi�? Szukasz duchowego wsparcia?
	AI_Output(self,other,"DIA_Daron_Hallo_10_01");	//Pragniesz skierowa� modlitw� do Innosa, czy te� chcesz z�o�y� niewielk� ofiar� w z�ocie dla naszego ko�cio�a?
};


instance DIA_Daron_Paladine(C_Info)
{
	npc = KDF_511_Daron;
	nr = 2;
	condition = DIA_Daron_Paladine_Condition;
	information = DIA_Daron_Paladine_Info;
	permanent = FALSE;
	description = "Musz� porozmawia� z paladynami...";
};


func int DIA_Daron_Paladine_Condition()
{
	if((other.guild != GIL_KDF) && (Kapitel < 2))
	{
		return TRUE;
	};
};

func void DIA_Daron_Paladine_Info()
{
	AI_Output(other,self,"DIA_Daron_Paladine_15_00");	//Musz� porozmawia� z paladynami. Czy pomo�esz mi skontaktowa� si� z nimi?
	AI_Output(self,other,"DIA_Daron_Paladine_10_01");	//Musisz dosta� si� do g�rnego miasta. Jednak wst�p do niego zarezerwowany jest dla obywateli i stra�y miejskiej.
	AI_Output(self,other,"DIA_Daron_Paladine_10_02");	//No i oczywi�cie dla nas, Mag�w Ognia.
	AI_Output(other,self,"DIA_Daron_Paladine_15_03");	//Jak mog� zosta� Magiem Ognia?
	AI_Output(self,other,"DIA_Daron_Paladine_10_04");	//Musisz wst�pi� do naszego zakonu jako nowicjusz. Niewykluczone, �e po jakim� czasie zostaniesz przyj�ty do kr�gu mag�w.
	AI_Output(self,other,"DIA_Daron_Paladine_10_05");	//Jednak �cie�ka prowadz�ca do tego celu jest d�uga, kr�ta i pe�na wyboj�w.
};


instance DIA_Daron_AboutSegen(C_Info)
{
	npc = KDF_511_Daron;
	nr = 2;
	condition = DIA_Daron_AboutSegen_Condition;
	information = DIA_Daron_AboutSegen_Info;
	permanent = FALSE;
	description = "Przyszed�em po b�ogos�awie�stwo!";
};


func int DIA_Daron_AboutSegen_Condition()
{
	if((MIS_Thorben_GetBlessings == LOG_Running) && (Player_IsApprentice == APP_NONE) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Daron_AboutSegen_Info()
{
	AI_Output(other,self,"DIA_Daron_AboutSegen_15_00");	//Przyszed�em po b�ogos�awie�stwo!
	AI_Output(self,other,"DIA_Daron_AboutSegen_10_01");	//To dobrze, to bardzo dobrze - z pewno�ci� zechcesz zasili� �wi�ty ko�ci� Innosa jak�� skromn� sumk�?
	AI_Output(other,self,"DIA_Daron_AboutSegen_15_02");	//W�a�ciwie to potrzebuj� twojego b�ogos�awie�stwa, �eby zosta� czeladnikiem w dolnej cz�ci miasta...
	if(Daron_Segen == TRUE)
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


instance DIA_Daron_Spenden(C_Info)
{
	npc = KDF_511_Daron;
	nr = 3;
	condition = DIA_Daron_Spenden_Condition;
	information = DIA_Daron_Spenden_Info;
	permanent = FALSE;
	description = "Ile wynosi przeci�tna ofiara?";
};


func int DIA_Daron_Spenden_Condition()
{
	if(hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Daron_Spenden_Info()
{
	AI_Output(other,self,"DIA_Daron_Spenden_15_00");	//Ile wynosi przeci�tna ofiara?
	AI_Output(self,other,"DIA_Daron_Spenden_10_01");	//To zale�y od twojego stanu maj�tkowego. Zobaczmy, ile przynios�e�.
	AI_Output(self,other,"DIA_Daron_Spenden_10_02");	//Mmmm hmmm...
	if(Npc_HasItems(other,ItMi_Gold) < 10)
	{
		AI_Output(self,other,"DIA_Daron_Spenden_10_03");	//Nie nale�ysz do bogaczy, co? Zostaw sobie te par� monet.
		if(MIS_Thorben_GetBlessings == LOG_Running)
		{
			B_LogEntry(TOPIC_Thorben,"Daron, Mag Ognia, nie udzieli� mi b�ogos�awie�stwa. Chyba powinienem przekaza� troch� z�ota na potrzeby klasztoru.");
		};
	}
	else
	{
		if(Npc_HasItems(other,ItMi_Gold) < 50)
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_04");	//No c�, bogaczem to ty nie jeste�, ale nie nale�ysz te� do biedak�w. 10 sztuk z�ota w zupe�no�ci wystarczy - �yjemy skromnie.
			B_GiveInvItems(other,self,ItMi_Gold,10);
		}
		else if(Npc_HasItems(other,ItMi_Gold) < 100)
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_05");	//Masz ponad 50 monet. Oddaj 25 Innosowi, a otrzymasz jego b�ogos�awie�stwo.
			B_GiveInvItems(other,self,ItMi_Gold,25);
		}
		else
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_06");	//Masz ponad 100 sztuk z�ota - nasz Pan powiada: dzielcie si�, je�li macie czym.
			AI_Output(self,other,"DIA_Daron_Spenden_10_07");	//Ko�ci� przyjmuje twoj� jak�e hojn� ofiar�.
			B_GiveInvItems(other,self,ItMi_Gold,50);
		};
		AI_Output(self,other,"DIA_Daron_Spenden_10_08");	//B�ogos�awi� ci� w imieniu Innosa. Albowiem on jest �wiat�em i sprawiedliwo�ci�.
		Daron_Segen = TRUE;
		B_GivePlayerXP(XP_InnosSegen);
		if(MIS_Thorben_GetBlessings == LOG_Running)
		{
			B_LogEntry(TOPIC_Thorben,"Daron, Mag Ognia, udzieli� mi b�ogos�awie�stwa.");
		};
	};
};


instance DIA_Daron_Woher(C_Info)
{
	npc = KDF_511_Daron;
	nr = 9;
	condition = DIA_Daron_Woher_Condition;
	information = DIA_Daron_Woher_Info;
	permanent = FALSE;
	description = "Sk�d pochodzisz?";
};


func int DIA_Daron_Woher_Condition()
{
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Daron_Woher_Info()
{
	AI_Output(other,self,"DIA_Daron_Woher_15_00");	//Sk�d pochodzisz?
	AI_Output(self,other,"DIA_Daron_Woher_10_01");	//Pochodz� z klasztoru mag�w le��cego w g�rach.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Daron_Woher_10_02");	//Przyjmujemy w swoje szeregi ka�dego, kto ma czyste serce i jest got�w po�wi�ci� �ycie s�u�bie wszechpot�nemu Innosowi.
	};
};


instance DIA_Daron_Innos(C_Info)
{
	npc = KDF_511_Daron;
	nr = 9;
	condition = DIA_Daron_Innos_Condition;
	information = DIA_Daron_Innos_Info;
	permanent = FALSE;
	description = "Opowiedz mi o Innosie.";
};


func int DIA_Daron_Innos_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Daron_Woher) && (other.guild != GIL_KDF) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Daron_Innos_Info()
{
	AI_Output(other,self,"DIA_Daron_Innos_15_00");	//Opowiedz mi o Innosie.
	AI_Output(self,other,"DIA_Daron_Innos_10_01");	//Innos, nasz wszechpot�ny w�adca, jest �wiat�em i ogniem.
	AI_Output(self,other,"DIA_Daron_Innos_10_02");	//Da� ludziom magi� i prawo, aby byli jego narz�dziami.
	AI_Output(self,other,"DIA_Daron_Innos_10_03");	//Dzia�amy w jego imieniu. Wymierzamy sprawiedliwo�� zgodnie z jego wol� i g�osimy jego nauki.
};


instance DIA_Daron_Kloster(C_Info)
{
	npc = KDF_511_Daron;
	nr = 9;
	condition = DIA_Daron_Kloster_Condition;
	information = DIA_Daron_Kloster_Info;
	permanent = FALSE;
	description = "Powiedz mi co� wi�cej na temat klasztoru.";
};


func int DIA_Daron_Kloster_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Daron_Woher) || (Npc_KnowsInfo(other,DIA_Daron_Paladine) && (other.guild != GIL_NOV) && (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Daron_Kloster_Info()
{
	AI_Output(other,self,"DIA_Daron_Kloster_15_00");	//Powiedz mi co� wi�cej na temat klasztoru.
	AI_Output(self,other,"DIA_Daron_Kloster_10_01");	//Nauczamy wszystkich dziedzin magii. Jednak sztuka Mag�w Ognia to co� wi�cej.
	AI_Output(self,other,"DIA_Daron_Kloster_10_02");	//Znamy si� r�wnie� na alchemii, potrafimy tworzy� pot�ne runy.
	AI_Output(self,other,"DIA_Daron_Kloster_10_03");	//No i jeste�my producentami doskona�ego wina.
};


instance DIA_Daron_Stadt(C_Info)
{
	npc = KDF_511_Daron;
	nr = 99;
	condition = DIA_Daron_Stadt_Condition;
	information = DIA_Daron_Stadt_Info;
	permanent = TRUE;
	description = "Co robisz w mie�cie?";
};


func int DIA_Daron_Stadt_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Daron_Woher))
	{
		return TRUE;
	};
};

func void DIA_Daron_Stadt_Info()
{
	AI_Output(other,self,"DIA_Daron_Stadt_15_00");	//Co robisz w mie�cie?
	AI_Output(self,other,"DIA_Daron_Stadt_10_01");	//Prowadz� dyskusje z paladynami i wspieram obywateli rad� i dobrym s�owem.
	AI_Output(self,other,"DIA_Daron_Stadt_10_02");	//Szczeg�lnie w dzisiejszych czasach naszym obowi�zkiem jest pomaga� s�abszym.
};


instance DIA_Daron_arm(C_Info)
{
	npc = KDF_511_Daron;
	nr = 10;
	condition = DIA_Daron_arm_Condition;
	information = DIA_Daron_arm_Info;
	permanent = FALSE;
	description = "Jestem biedakiem!";
};


func int DIA_Daron_arm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Daron_Stadt) && (Npc_HasItems(other,ItMi_Gold) < 10) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Daron_arm_Info()
{
	AI_Output(other,self,"DIA_Daron_arm_15_00");	//Jestem biedakiem!
	AI_Output(self,other,"DIA_Daron_arm_10_01");	//A wi�c nie masz �adnych pieni�dzy. W dzisiejszych czasach cz�sto si� to zdarza. We� to z�oto, na pewno ci si� przyda.
	AI_Output(self,other,"DIA_Daron_arm_10_02");	//Rozejrzyj si� za prac�, zobaczysz, �e naprawd� nietrudno jest zarobi�. A kiedy ju� b�dziesz m�g�, z�� ofiar� ko�cio�owi Innosa, aby w ten spos�b mu si� odwdzi�czy�.
	B_GiveInvItems(self,other,ItMi_Gold,20);
};


instance DIA_Daron_Spende(C_Info)
{
	npc = KDF_511_Daron;
	nr = 990;
	condition = DIA_Daron_Spende_Condition;
	information = DIA_Daron_Spende_Info;
	permanent = TRUE;
	description = "Chcia�bym z�o�y� ofiar�";
};


var int DIA_Daron_Spende_permanent;

func int DIA_Daron_Spende_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DIA_Daron_Spende_permanent == FALSE) && Npc_KnowsInfo(other,DIA_Daron_Spenden) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Daron_Spende_Info()
{
	AI_Output(other,self,"DIA_Daron_Spende_15_00");	//Chcia�bym z�o�y� ofiar�...
	Info_ClearChoices(DIA_Daron_Spende);
	if(Daron_Spende < 1000)
	{
		Info_AddChoice(DIA_Daron_Spende,"Ale nie przynios�em do�� z�ota... (POWR�T)",DIA_Daron_Spende_BACK);
		Info_AddChoice(DIA_Daron_Spende,"(50 sztuk z�ota)",DIA_Daron_Spende_50);
		Info_AddChoice(DIA_Daron_Spende,"(100 sztuk z�ota)",DIA_Daron_Spende_100);
		Info_AddChoice(DIA_Daron_Spende,"(200 sztuk z�ota)",DIA_Daron_Spende_200);
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_10_01");	//W sumie otrzyma�em od ciebie ponad 1000 sztuk z�ota.
		AI_Output(self,other,"DIA_Daron_Spende_10_02");	//B�ogos�awie�stwo Innosa b�dzie ci zawsze towarzyszy�.
		DIA_Daron_Spende_permanent = TRUE;
		B_DaronSegen();
	};
};

func void DIA_Daron_Spende_BACK()
{
	AI_Output(other,self,"DIA_Daron_Spende_BACK_15_00");	//Nie mam przy sobie wystarczaj�co du�o z�ota...
	AI_Output(self,other,"DIA_Daron_Spende_BACK_10_01");	//To nie ma znaczenia, synu. Mo�esz z�o�y� ofiar� p�niej.
	Info_ClearChoices(DIA_Daron_Spende);
};


var int Daron_Spende;

func void DIA_Daron_Spende_50()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Daron_Spende_50_10_00");	//B�ogos�awi� ci� w imieniu Innosa. Albowiem on jest �wiat�em i sprawiedliwo�ci�.
		Daron_Spende = Daron_Spende + 50;
		B_DaronSegen();
		Daron_Segen = TRUE;
		if(MIS_Thorben_GetBlessings == LOG_Running)
		{
			B_LogEntry(TOPIC_Thorben,"Daron, Mag Ognia, udzieli� mi b�ogos�awie�stwa.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_50_10_01");	//Je�li masz przy sobie z�oto, mo�esz z�o�y� ofiar� w ka�dej chwili.
	};
	Info_ClearChoices(DIA_Daron_Spende);
};

func void DIA_Daron_Spende_100()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Daron_Spende_100_10_00");	//Innosie, jeste� blaskiem o�wietlaj�cym �cie�ki sprawiedliwych.
		AI_Output(self,other,"DIA_Daron_Spende_100_10_01");	//W twoim imieniu b�ogos�awi� tego cz�owieka. Niechaj twoje �wiat�o zawsze wskazuje mu w�a�ciw� drog�.
		Daron_Spende = Daron_Spende + 100;
		B_DaronSegen();
		Daron_Segen = TRUE;
		if(MIS_Thorben_GetBlessings == LOG_Running)
		{
			B_LogEntry(TOPIC_Thorben,"Daron, Mag Ognia, udzieli� mi b�ogos�awie�stwa.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_100_10_02");	//Nasz pan powiada: je�li chcesz si� modli�, otw�rz swego ducha i serce. Je�li chcesz z�o�y� ofiar�, otw�rz sakiewk�.
	};
	Info_ClearChoices(DIA_Daron_Spende);
};

func void DIA_Daron_Spende_200()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,200))
	{
		AI_Output(self,other,"DIA_Daron_Spende_200_10_00");	//Innosie, pob�ogos�aw tego m�czyzn�. Niechaj tw�j blask zawsze o�wietla mu drog�.
		AI_Output(self,other,"DIA_Daron_Spende_200_10_01");	//Daj mu si��, aby m�g� zawsze post�powa� m�drze i sprawiedliwie.
		Daron_Spende = Daron_Spende + 200;
		B_DaronSegen();
		Daron_Segen = TRUE;
		if(MIS_Thorben_GetBlessings == LOG_Running)
		{
			B_LogEntry(TOPIC_Thorben,"Daron, Mag Ognia, udzieli� mi b�ogos�awie�stwa.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_200_10_02");	//Je�li chcesz nam przekaza� tyle z�ota, powiniene� je ze sob� przynie��.
	};
	Info_ClearChoices(DIA_Daron_Spende);
};


instance DIA_Daron_PICKPOCKET(C_Info)
{
	npc = KDF_511_Daron;
	nr = 900;
	condition = DIA_Daron_PICKPOCKET_Condition;
	information = DIA_Daron_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Daron_PICKPOCKET_Condition()
{
	return C_Beklauen(47,80);
};

func void DIA_Daron_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Daron_PICKPOCKET);
	Info_AddChoice(DIA_Daron_PICKPOCKET,Dialog_Back,DIA_Daron_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Daron_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Daron_PICKPOCKET_DoIt);
};

func void DIA_Daron_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Daron_PICKPOCKET);
};

func void DIA_Daron_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Daron_PICKPOCKET);
};

