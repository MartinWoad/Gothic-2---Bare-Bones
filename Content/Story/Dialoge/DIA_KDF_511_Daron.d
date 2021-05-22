
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
	AI_Output(self,other,"DIA_Daron_Hallo_10_00");	//Co mogê dla ciebie zrobiæ? Szukasz duchowego wsparcia?
	AI_Output(self,other,"DIA_Daron_Hallo_10_01");	//Pragniesz skierowaæ modlitwê do Innosa, czy te¿ chcesz z³o¿yæ niewielk¹ ofiarê w z³ocie dla naszego koœcio³a?
};


instance DIA_DARON_PALADINE(C_INFO)
{
	npc = kdf_511_daron;
	nr = 2;
	condition = dia_daron_paladine_condition;
	information = dia_daron_paladine_info;
	permanent = FALSE;
	description = "Muszê porozmawiaæ z paladynami...";
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
	AI_Output(other,self,"DIA_Daron_Paladine_15_00");	//Muszê porozmawiaæ z paladynami. Czy pomo¿esz mi skontaktowaæ siê z nimi?
	AI_Output(self,other,"DIA_Daron_Paladine_10_01");	//Musisz dostaæ siê do górnego miasta. Jednak wstêp do niego zarezerwowany jest dla obywateli i stra¿y miejskiej.
	AI_Output(self,other,"DIA_Daron_Paladine_10_02");	//No i oczywiœcie dla nas, Magów Ognia.
	AI_Output(other,self,"DIA_Daron_Paladine_15_03");	//Jak mogê zostaæ Magiem Ognia?
	AI_Output(self,other,"DIA_Daron_Paladine_10_04");	//Musisz wst¹piæ do naszego zakonu jako nowicjusz. Niewykluczone, ¿e po jakimœ czasie zostaniesz przyjêty do krêgu magów.
	AI_Output(self,other,"DIA_Daron_Paladine_10_05");	//Jednak œcie¿ka prowadz¹ca do tego celu jest d³uga, krêta i pe³na wybojów.
};


instance DIA_DARON_ABOUTSEGEN(C_INFO)
{
	npc = kdf_511_daron;
	nr = 2;
	condition = dia_daron_aboutsegen_condition;
	information = dia_daron_aboutsegen_info;
	permanent = FALSE;
	description = "Przyszed³em po b³ogos³awieñstwo!";
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
	AI_Output(other,self,"DIA_Daron_AboutSegen_15_00");	//Przyszed³em po b³ogos³awieñstwo!
	AI_Output(self,other,"DIA_Daron_AboutSegen_10_01");	//To dobrze, to bardzo dobrze - z pewnoœci¹ zechcesz zasiliæ œwiêty koœció³ Innosa jak¹œ skromn¹ sumk¹?
	AI_Output(other,self,"DIA_Daron_AboutSegen_15_02");	//W³aœciwie to potrzebujê twojego b³ogos³awieñstwa, ¿eby zostaæ czeladnikiem w dolnej czêœci miasta...
	if(DARON_SEGEN == TRUE)
	{
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_03");	//Ju¿ dosta³eœ moje b³ogos³awieñstwo, synu.
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_04");	//Niech ciê Innos prowadzi, synu!
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_05");	//Ale¿ synu! Bez skromnej ofiary nie bêdê ciê móg³ pob³ogos³awiæ!
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_06");	//Jak inaczej móg³bym siê upewniæ co do twoich dobrych intencji wobec najœwiêtszego koœcio³a Innosa?
	};
};


instance DIA_DARON_SPENDEN(C_INFO)
{
	npc = kdf_511_daron;
	nr = 3;
	condition = dia_daron_spenden_condition;
	information = dia_daron_spenden_info;
	permanent = FALSE;
	description = "Ile wynosi przeciêtna ofiara?";
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
	AI_Output(other,self,"DIA_Daron_Spenden_15_00");	//Ile wynosi przeciêtna ofiara?
	AI_Output(self,other,"DIA_Daron_Spenden_10_01");	//To zale¿y od twojego stanu maj¹tkowego. Zobaczmy, ile przynios³eœ.
	AI_Output(self,other,"DIA_Daron_Spenden_10_02");	//Mmmm hmmm...
	if(Npc_HasItems(other,itmi_gold) < 10)
	{
		AI_Output(self,other,"DIA_Daron_Spenden_10_03");	//Nie nale¿ysz do bogaczy, co? Zostaw sobie te parê monet.
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"Daron, Mag Ognia, nie udzieli³ mi b³ogos³awieñstwa. Chyba powinienem przekazaæ trochê z³ota na potrzeby klasztoru.");
		};
	}
	else
	{
		if(Npc_HasItems(other,itmi_gold) < 50)
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_04");	//No có¿, bogaczem to ty nie jesteœ, ale nie nale¿ysz te¿ do biedaków. 10 sztuk z³ota w zupe³noœci wystarczy - ¿yjemy skromnie.
			b_giveinvitems(other,self,5113,10);
		}
		else if(Npc_HasItems(other,itmi_gold) < 100)
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_05");	//Masz ponad 50 monet. Oddaj 25 Innosowi, a otrzymasz jego b³ogos³awieñstwo.
			b_giveinvitems(other,self,5113,25);
		}
		else
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_06");	//Masz ponad 100 sztuk z³ota - nasz Pan powiada: dzielcie siê, jeœli macie czym.
			AI_Output(self,other,"DIA_Daron_Spenden_10_07");	//Koœció³ przyjmuje twoj¹ jak¿e hojn¹ ofiarê.
			b_giveinvitems(other,self,5113,50);
		};
		AI_Output(self,other,"DIA_Daron_Spenden_10_08");	//B³ogos³awiê ciê w imieniu Innosa. Albowiem on jest œwiat³em i sprawiedliwoœci¹.
		DARON_SEGEN = TRUE;
		b_giveplayerxp(XP_INNOSSEGEN);
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"Daron, Mag Ognia, udzieli³ mi b³ogos³awieñstwa.");
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
	description = "Sk¹d pochodzisz?";
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
	AI_Output(other,self,"DIA_Daron_Woher_15_00");	//Sk¹d pochodzisz?
	AI_Output(self,other,"DIA_Daron_Woher_10_01");	//Pochodzê z klasztoru magów le¿¹cego w górach.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Daron_Woher_10_02");	//Przyjmujemy w swoje szeregi ka¿dego, kto ma czyste serce i jest gotów poœwiêciæ ¿ycie s³u¿bie wszechpotê¿nemu Innosowi.
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
	AI_Output(self,other,"DIA_Daron_Innos_10_01");	//Innos, nasz wszechpotê¿ny w³adca, jest œwiat³em i ogniem.
	AI_Output(self,other,"DIA_Daron_Innos_10_02");	//Da³ ludziom magiê i prawo, aby byli jego narzêdziami.
	AI_Output(self,other,"DIA_Daron_Innos_10_03");	//Dzia³amy w jego imieniu. Wymierzamy sprawiedliwoœæ zgodnie z jego wol¹ i g³osimy jego nauki.
};


instance DIA_DARON_KLOSTER(C_INFO)
{
	npc = kdf_511_daron;
	nr = 9;
	condition = dia_daron_kloster_condition;
	information = dia_daron_kloster_info;
	permanent = FALSE;
	description = "Powiedz mi coœ wiêcej na temat klasztoru.";
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
	AI_Output(other,self,"DIA_Daron_Kloster_15_00");	//Powiedz mi coœ wiêcej na temat klasztoru.
	AI_Output(self,other,"DIA_Daron_Kloster_10_01");	//Nauczamy wszystkich dziedzin magii. Jednak sztuka Magów Ognia to coœ wiêcej.
	AI_Output(self,other,"DIA_Daron_Kloster_10_02");	//Znamy siê równie¿ na alchemii, potrafimy tworzyæ potê¿ne runy.
	AI_Output(self,other,"DIA_Daron_Kloster_10_03");	//No i jesteœmy producentami doskona³ego wina.
};


instance DIA_DARON_STADT(C_INFO)
{
	npc = kdf_511_daron;
	nr = 99;
	condition = dia_daron_stadt_condition;
	information = dia_daron_stadt_info;
	permanent = TRUE;
	description = "Co robisz w mieœcie?";
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
	AI_Output(other,self,"DIA_Daron_Stadt_15_00");	//Co robisz w mieœcie?
	AI_Output(self,other,"DIA_Daron_Stadt_10_01");	//Prowadzê dyskusje z paladynami i wspieram obywateli rad¹ i dobrym s³owem.
	AI_Output(self,other,"DIA_Daron_Stadt_10_02");	//Szczególnie w dzisiejszych czasach naszym obowi¹zkiem jest pomagaæ s³abszym.
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
	AI_Output(self,other,"DIA_Daron_arm_10_01");	//A wiêc nie masz ¿adnych pieniêdzy. W dzisiejszych czasach czêsto siê to zdarza. WeŸ to z³oto, na pewno ci siê przyda.
	AI_Output(self,other,"DIA_Daron_arm_10_02");	//Rozejrzyj siê za prac¹, zobaczysz, ¿e naprawdê nietrudno jest zarobiæ. A kiedy ju¿ bêdziesz móg³, z³ó¿ ofiarê koœcio³owi Innosa, aby w ten sposób mu siê odwdziêczyæ.
	b_giveinvitems(self,other,5113,20);
};


instance DIA_DARON_SPENDE(C_INFO)
{
	npc = kdf_511_daron;
	nr = 990;
	condition = dia_daron_spende_condition;
	information = dia_daron_spende_info;
	permanent = TRUE;
	description = "Chcia³bym z³o¿yæ ofiarê…";
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
	AI_Output(other,self,"DIA_Daron_Spende_15_00");	//Chcia³bym z³o¿yæ ofiarê...
	Info_ClearChoices(dia_daron_spende);
	if(DARON_SPENDE < 1000)
	{
		Info_AddChoice(dia_daron_spende,"Ale nie przynios³em doœæ z³ota... (POWRÓT)",dia_daron_spende_back);
		Info_AddChoice(dia_daron_spende,"(50 sztuk z³ota)",dia_daron_spende_50);
		Info_AddChoice(dia_daron_spende,"(100 sztuk z³ota)",dia_daron_spende_100);
		Info_AddChoice(dia_daron_spende,"(200 sztuk z³ota)",dia_daron_spende_200);
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_10_01");	//W sumie otrzyma³em od ciebie ponad 1000 sztuk z³ota.
		AI_Output(self,other,"DIA_Daron_Spende_10_02");	//B³ogos³awieñstwo Innosa bêdzie ci zawsze towarzyszyæ.
		DIA_DARON_SPENDE_PERMANENT = TRUE;
		b_daronsegen();
	};
};

func void dia_daron_spende_back()
{
	AI_Output(other,self,"DIA_Daron_Spende_BACK_15_00");	//Nie mam przy sobie wystarczaj¹co du¿o z³ota...
	AI_Output(self,other,"DIA_Daron_Spende_BACK_10_01");	//To nie ma znaczenia, synu. Mo¿esz z³o¿yæ ofiarê póŸniej.
	Info_ClearChoices(dia_daron_spende);
};


var int daron_spende;

func void dia_daron_spende_50()
{
	if(b_giveinvitems(other,self,5113,50))
	{
		AI_Output(self,other,"DIA_Daron_Spende_50_10_00");	//B³ogos³awiê ciê w imieniu Innosa. Albowiem on jest œwiat³em i sprawiedliwoœci¹.
		DARON_SPENDE = DARON_SPENDE + 50;
		b_daronsegen();
		DARON_SEGEN = TRUE;
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"Daron, Mag Ognia, udzieli³ mi b³ogos³awieñstwa.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_50_10_01");	//Jeœli masz przy sobie z³oto, mo¿esz z³o¿yæ ofiarê w ka¿dej chwili.
	};
	Info_ClearChoices(dia_daron_spende);
};

func void dia_daron_spende_100()
{
	if(b_giveinvitems(other,self,5113,100))
	{
		AI_Output(self,other,"DIA_Daron_Spende_100_10_00");	//Innosie, jesteœ blaskiem oœwietlaj¹cym œcie¿ki sprawiedliwych.
		AI_Output(self,other,"DIA_Daron_Spende_100_10_01");	//W twoim imieniu b³ogos³awiê tego cz³owieka. Niechaj twoje œwiat³o zawsze wskazuje mu w³aœciw¹ drogê.
		DARON_SPENDE = DARON_SPENDE + 100;
		b_daronsegen();
		DARON_SEGEN = TRUE;
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"Daron, Mag Ognia, udzieli³ mi b³ogos³awieñstwa.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_100_10_02");	//Nasz pan powiada: jeœli chcesz siê modliæ, otwórz swego ducha i serce. Jeœli chcesz z³o¿yæ ofiarê, otwórz sakiewkê.
	};
	Info_ClearChoices(dia_daron_spende);
};

func void dia_daron_spende_200()
{
	if(b_giveinvitems(other,self,5113,200))
	{
		AI_Output(self,other,"DIA_Daron_Spende_200_10_00");	//Innosie, pob³ogos³aw tego mê¿czyznê. Niechaj twój blask zawsze oœwietla mu drogê.
		AI_Output(self,other,"DIA_Daron_Spende_200_10_01");	//Daj mu si³ê, aby móg³ zawsze postêpowaæ m¹drze i sprawiedliwie.
		DARON_SPENDE = DARON_SPENDE + 200;
		b_daronsegen();
		DARON_SEGEN = TRUE;
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"Daron, Mag Ognia, udzieli³ mi b³ogos³awieñstwa.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_200_10_02");	//Jeœli chcesz nam przekazaæ tyle z³ota, powinieneœ je ze sob¹ przynieœæ.
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

