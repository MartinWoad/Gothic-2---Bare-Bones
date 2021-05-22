
instance DIA_BENGAR_EXIT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 999;
	condition = dia_bengar_exit_condition;
	information = dia_bengar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bengar_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_bengar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_HALLO(C_INFO)
{
	npc = bau_960_bengar;
	nr = 3;
	condition = dia_bengar_hallo_condition;
	information = dia_bengar_hallo_info;
	description = "Jesteœ tutaj farmerem?";
};


func int dia_bengar_hallo_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_bengar_hallo_info()
{
	AI_Output(other,self,"DIA_Bengar_HALLO_15_00");	//Jesteœ tutaj farmerem?
	AI_Output(self,other,"DIA_Bengar_HALLO_10_01");	//Mo¿na by tak powiedzieæ, ale w³aœciwie to jestem tylko najêtym pracownikiem.
	AI_Output(self,other,"DIA_Bengar_HALLO_10_02");	//Ca³a okoliczna ziemia nale¿y do jednego, bogatego cz³owieka.
};


instance DIA_BENGAR_WOVONLEBTIHR(C_INFO)
{
	npc = bau_960_bengar;
	nr = 5;
	condition = dia_bengar_wovonlebtihr_condition;
	information = dia_bengar_wovonlebtihr_info;
	description = "Z czego ¿yjecie?";
};


func int dia_bengar_wovonlebtihr_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_hallo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_bengar_wovonlebtihr_info()
{
	AI_Output(other,self,"DIA_Bengar_WOVONLEBTIHR_15_00");	//Z czego ¿yjecie?
	AI_Output(self,other,"DIA_Bengar_WOVONLEBTIHR_10_01");	//G³ównie z polowania i wyrêbu drzew. Oczywiœcie, hodujemy te¿ owce i uprawiamy ziemiê.
	AI_Output(self,other,"DIA_Bengar_WOVONLEBTIHR_10_02");	//Onar obarczy³ mnie tymi wszystkimi pracownikami i muszê im jakoœ wyznaczaæ zajêcia. Ale tylko kilku z nich potrafi dobrze polowaæ, wiesz?
};


instance DIA_BENGAR_TAGELOEHNER(C_INFO)
{
	npc = bau_960_bengar;
	nr = 6;
	condition = dia_bengar_tageloehner_condition;
	information = dia_bengar_tageloehner_info;
	description = "Zatrudniacie pracowników na dniówkê?";
};


func int dia_bengar_tageloehner_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_wovonlebtihr) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_bengar_tageloehner_info()
{
	AI_Output(other,self,"DIA_Bengar_TAGELOEHNER_15_00");	//Zatrudniacie pracowników na dniówkê?
	AI_Output(self,other,"DIA_Bengar_TAGELOEHNER_10_01");	//Onar odsy³a robotników, którzy nie przydaj¹ mu siê w gospodarstwie.
	AI_Output(self,other,"DIA_Bengar_TAGELOEHNER_10_02");	//Ci w³aœnie trafiaj¹ do mnie. Ja ich karmiê i dla mnie tutaj pracuj¹.
};


instance DIA_BENGAR_REBELLIEREN(C_INFO)
{
	npc = bau_960_bengar;
	nr = 8;
	condition = dia_bengar_rebellieren_condition;
	information = dia_bengar_rebellieren_info;
	description = "Co myœlisz o Onarze?";
};


func int dia_bengar_rebellieren_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_hallo))
	{
		return TRUE;
	};
};

func void dia_bengar_rebellieren_info()
{
	AI_Output(other,self,"DIA_Bengar_REBELLIEREN_15_00");	//Co myœlisz o Onarze?
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_01");	//Ach. To chciwy drañ, przez którego nas w koñcu wszystkich powiesz¹.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_02");	//Pewnego dnia paladyni wyjd¹ z miasta i my, farmerzy, zap³acimy krwi¹ za to, co on tu wyrabia.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_03");	//Ale nie mam wyboru. Stra¿ przychodzi tu tylko po to, ¿eby zbieraæ podatki. Nie chroni¹ gospodarstwa.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_04");	//Gdybym by³ lojalny w stosunku do miasta, to w zasadzie zosta³bym sam.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_05");	//Onar przynajmniej od czasu do czasu wysy³a najemników, ¿eby zobaczyæ, jak nam idzie.
};


instance DIA_BENGAR_PALADINE(C_INFO)
{
	npc = bau_960_bengar;
	nr = 9;
	condition = dia_bengar_paladine_condition;
	information = dia_bengar_paladine_info;
	description = "Co masz przeciwko królewskim ¿o³nierzom?";
};


func int dia_bengar_paladine_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_rebellieren) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void dia_bengar_paladine_info()
{
	AI_Output(other,self,"DIA_Bengar_PALADINE_15_00");	//Co masz przeciwko królewskim ¿o³nierzom?
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_01");	//Wszystko! Od czasu, kiedy paladyni pojawili siê w mieœcie, nic siê nie poprawi³o. Wprost przeciwnie.
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_02");	//Teraz ci przeklêci stra¿nicy coraz czêœciej zagl¹daj¹ na nasze ziemie i kradn¹, co im wpadnie w rêce. A paladyni nic z tym nie robi¹.
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_03");	//Jedyni paladyni, jakich widzia³em, to ci dwaj, którzy pilnuj¹ prze³êczy.
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_04");	//Nie rusz¹ siê o krok, nawet gdyby stra¿ nas wszystkich pozarzyna³a.
};


instance DIA_BENGAR_PASS(C_INFO)
{
	npc = bau_960_bengar;
	nr = 10;
	condition = dia_bengar_pass_condition;
	information = dia_bengar_pass_info;
	description = "Prze³êczy?";
};


func int dia_bengar_pass_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_paladine))
	{
		return TRUE;
	};
};

func void dia_bengar_pass_info()
{
	AI_Output(other,self,"DIA_Bengar_PASS_15_00");	//Prze³êczy?
	AI_Output(self,other,"DIA_Bengar_PASS_10_01");	//Ano. Prze³êczy do starej Górniczej Doliny, ko³o wodospadów po drugiej stronie pastwisk na p³askowy¿u.
	AI_Output(self,other,"DIA_Bengar_PASS_10_02");	//Spytaj o to Malaka. W zesz³ym tygodniu by³ tam kilka razy.
};


instance DIA_BENGAR_MILIZ(C_INFO)
{
	npc = bau_960_bengar;
	nr = 11;
	condition = dia_bengar_miliz_condition;
	information = dia_bengar_miliz_info;
	permanent = FALSE;
	description = "Mam rozwi¹zaæ wasze problemy ze stra¿¹.";
};


func int dia_bengar_miliz_condition()
{
	if((MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bengar_hallo))
	{
		return TRUE;
	};
};

func void dia_bengar_miliz_info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZ_15_00");	//Mam rozwi¹zaæ wasze problemy ze stra¿¹.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_01");	//Co? Mówi³em Onarowi, ¿e powinien mi przys³aæ kilku swoich najemników.
		AI_Output(other,self,"DIA_Bengar_MILIZ_15_02");	//To moja szansa na to, ¿eby siê wykazaæ.
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_03");	//Rewelacyjnie. Wiesz, co mi zrobi¹ stra¿nicy, jak schrzanisz sprawê?
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_04");	//Ju¿ myœla³em, ¿e nikt nie przyjdzie.
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_05");	//Mówi³em to Onarowi kilka dni temu. Za co mu p³acê czynsz?
	};
	AI_Output(self,other,"DIA_Bengar_MILIZ_10_06");	//Ci dranie przychodz¹ tu co tydzieñ i zbieraj¹ podatki dla miasta.
	AI_Output(self,other,"DIA_Bengar_MILIZ_10_07");	//Dobrze, ¿e przyszed³eœ w³aœnie teraz. Zazwyczaj zjawiaj¹ siê o tej porze.
	AI_Output(self,other,"DIA_Bengar_MILIZ_10_08");	//Powinni tu byæ za chwilê.
};


instance DIA_BENGAR_SELBER(C_INFO)
{
	npc = bau_960_bengar;
	nr = 11;
	condition = dia_bengar_selber_condition;
	information = dia_bengar_selber_info;
	permanent = FALSE;
	description = "Dlaczego sami nie staniecie przeciwko stra¿y?";
};


func int dia_bengar_selber_condition()
{
	if((MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_RUNNING) && (BENGAR_MILSUCCESS == FALSE) && Npc_KnowsInfo(other,dia_bengar_hallo))
	{
		return TRUE;
	};
};

func void dia_bengar_selber_info()
{
	AI_Output(other,self,"DIA_Bengar_Selber_15_00");	//Sporo was. Dlaczego sami nie staniecie przeciwko stra¿y?
	AI_Output(self,other,"DIA_Bengar_Selber_10_01");	//To prawda, jest nas wielu. Ale nie jesteœmy zawodowymi ¿o³nierzami jak stra¿nicy.
};


instance DIA_BENGAR_MILIZKLATSCHEN(C_INFO)
{
	npc = bau_960_bengar;
	nr = 12;
	condition = dia_bengar_milizklatschen_condition;
	information = dia_bengar_milizklatschen_info;
	permanent = FALSE;
	description = "Niech no stra¿nicy przyjd¹, zajmê siê nimi!";
};


func int dia_bengar_milizklatschen_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_miliz) && !Npc_IsDead(rick) && !Npc_IsDead(rumbold) && (RUMBOLD_BEZAHLT == FALSE))
	{
		return TRUE;
	};
};

func void dia_bengar_milizklatschen_info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZKLATSCHEN_15_00");	//Niech no stra¿nicy przyjd¹, zajmê siê nimi!
	AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_01");	//Nie mogê siê doczekaæ. Nadchodz¹! Widzisz, a nie mówi³em!
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_02");	//Tylko nie nawal!
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_03");	//No có¿, powodzenia! Poka¿ im.
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MilComing");
	if(Hlp_IsValidNpc(rick) && !Npc_IsDead(rick))
	{
		Npc_ExchangeRoutine(rick,"MilComing");
		AI_ContinueRoutine(rick);
	};
	if(Hlp_IsValidNpc(rumbold) && !Npc_IsDead(rumbold))
	{
		Npc_ExchangeRoutine(rumbold,"MilComing");
		AI_ContinueRoutine(rumbold);
	};
};


var int bengar_milsuccess;

instance DIA_BENGAR_MILIZWEG(C_INFO)
{
	npc = bau_960_bengar;
	nr = 12;
	condition = dia_bengar_milizweg_condition;
	information = dia_bengar_milizweg_info;
	permanent = TRUE;
	description = "Wasze problemy ze stra¿¹ nale¿¹ ju¿ do przesz³oœci.";
};


func int dia_bengar_milizweg_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_miliz) && (BENGAR_MILSUCCESS == FALSE))
	{
		if((Npc_IsDead(rick) && Npc_IsDead(rumbold)) || (RUMBOLD_BEZAHLT == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_bengar_milizweg_info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZWEG_15_00");	//Wasze problemy ze stra¿¹ nale¿¹ ju¿ do przesz³oœci.
	if((RUMBOLD_BEZAHLT == TRUE) && (Npc_IsDead(rumbold) == FALSE))
	{
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_01");	//Oszala³eœ? Wiesz, co mi zrobi¹, jeœli ciebie nie bêdzie?
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_02");	//Ci¹gle tam stoj¹. Powiedz im, ¿e powinni st¹d CA£KOWICIE znikn¹æ!
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_03");	//NieŸle. Teraz mo¿e zostan¹ nam jakieœ drobne na koniec miesi¹ca. Dziêki.
		if(RUMBOLD_BEZAHLT == TRUE)
		{
			AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_04");	//Chcia³eœ nawet za mnie zap³aciæ. To bardzo mi³e z twojej strony.
			b_giveplayerxp(XP_BENGAR_MILIZKLATSCHEN + 50);
		}
		else
		{
			b_giveplayerxp(XP_BENGAR_MILIZKLATSCHEN);
		};
		BENGAR_MILSUCCESS = TRUE;
	};
};


instance DIA_BENGAR_BALTHASAR(C_INFO)
{
	npc = bau_960_bengar;
	nr = 13;
	condition = dia_bengar_balthasar_condition;
	information = dia_bengar_balthasar_info;
	description = "Pasterz Balthasar nie mo¿e paœæ owiec na twoich pastwiskach?";
};


func int dia_bengar_balthasar_condition()
{
	if((MIS_BALTHASAR_BENGARSWEIDE == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bengar_wovonlebtihr))
	{
		return TRUE;
	};
};

func void dia_bengar_balthasar_info()
{
	AI_Output(other,self,"DIA_Bengar_BALTHASAR_15_00");	//Pasterz Balthasar nie mo¿e paœæ owiec na twoich pastwiskach?
	AI_Output(self,other,"DIA_Bengar_BALTHASAR_10_01");	//Ach, o to chodzi. Powiedzia³em mu, ¿e Sekob powinien mi p³aciæ, jeœli chce korzystaæ z moich pastwisk.
	AI_Output(self,other,"DIA_Bengar_BALTHASAR_10_02");	//Mówi¹c prawdê, to tylko dokuczanie. Po prostu nie cierpiê Balthasara.
	b_logentry(TOPIC_BALTHASARSSCHAFE,"Jeœli mam przekonaæ Bengara, aby wpuœci³ Balthasara z powrotem na swoje pastwiska, bêdê musia³ wyœwiadczyæ mu przys³ugê. Na pewno wkrótce nadarzy siê ku temu jakaœ okazja.");
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BENGAR_BALTHASARDARFAUFWEIDE(C_INFO)
{
	npc = bau_960_bengar;
	nr = 14;
	condition = dia_bengar_balthasardarfaufweide_condition;
	information = dia_bengar_balthasardarfaufweide_info;
	description = "Stra¿ników ju¿ nie ma, a Balthasar znowu mo¿e korzystaæ z twoich pastwisk.";
};


func int dia_bengar_balthasardarfaufweide_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_balthasar) && (MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_SUCCESS) && (BENGAR_MILSUCCESS == TRUE))
	{
		return TRUE;
	};
};

func void dia_bengar_balthasardarfaufweide_info()
{
	AI_Output(other,self,"DIA_Bengar_BALTHASARDARFAUFWEIDE_15_00");	//Stra¿ników ju¿ nie ma, a Balthasar znowu mo¿e korzystaæ z twoich pastwisk.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_01");	//Dlaczego?
	AI_Output(other,self,"DIA_Bengar_BALTHASARDARFAUFWEIDE_15_02");	//Bo ja tak powiedzia³em.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_03");	//Hmmm. W porz¹dku, jak sobie ¿yczysz.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_04");	//Niech wyprowadza swoje zwierzêta gdzieœ za pola uprawne.
	MIS_BALTHASAR_BENGARSWEIDE = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BENGAR_PERMKAP1(C_INFO)
{
	npc = bau_960_bengar;
	nr = 15;
	condition = dia_bengar_permkap1_condition;
	information = dia_bengar_permkap1_info;
	permanent = TRUE;
	description = "Trzymaj siê.";
};


func int dia_bengar_permkap1_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_balthasardarfaufweide) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_bengar_permkap1_info()
{
	AI_Output(other,self,"DIA_Bengar_PERMKAP1_15_00");	//Trzymaj siê.
	AI_Output(self,other,"DIA_Bengar_PERMKAP1_10_01");	//Ty te¿.
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_KAP3_EXIT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 999;
	condition = dia_bengar_kap3_exit_condition;
	information = dia_bengar_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bengar_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_bengar_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_ALLEIN(C_INFO)
{
	npc = bau_960_bengar;
	nr = 30;
	condition = dia_bengar_allein_condition;
	information = dia_bengar_allein_info;
	description = "Jak wygl¹da sytuacja?";
};


func int dia_bengar_allein_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_bengar_allein_info()
{
	AI_Output(other,self,"DIA_Bengar_ALLEIN_15_00");	//Jak wygl¹da sytuacja?
	if((MALAK_ISALIVE_KAP3 == TRUE) && ((Npc_GetDistToWP(malak,"FARM3") < 3000) == FALSE))
	{
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_01");	//Malak znikn¹³ i zabra³ ze sob¹ wszystko, i wszystkich, którzy mogli dla mnie pracowaæ. Mówi³, ¿e kieruje siê w góry.
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_02");	//Nie móg³ ju¿ tu wytrzymaæ.
		MIS_GETMALAKBACK = LOG_RUNNING;
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_03");	//Czasy s¹ ciê¿kie. Nie wiem, jak d³ugo jeszcze JA to wytrzymam.
	};
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_04");	//Codziennie z prze³êczy wypadaj¹ hordy potworów i grasuj¹ na p³askowy¿u. To mnie wykoñczy.
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_05");	//Gdybym tak mia³ przynajmniej kilku pomocników albo najemników.
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_06");	//By³ nawet taki jeden, co chcia³ dla mnie pracowaæ. Ale chyba zmieni³ zdanie. Zdaje siê, ¿e nazywa³ siê Wilk.
	MIS_BENGARSHELPINGSLD = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BENGARALLEIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BENGARALLEIN,LOG_RUNNING);
	b_logentry(TOPIC_BENGARALLEIN,"Bengar zosta³ na farmie sam. Jego przyjaciel Malak odszed³ i zabra³ ze sob¹ pozosta³ych. Bengar s¹dzi, ¿e schronili siê gdzieœ w górach.");
	b_logentry(TOPIC_BENGARALLEIN,"Jego farma zosta³a bez ¿adnej ochrony. Prosi³ mnie o pomoc, wspomnia³ te¿ coœ o najemniku imieniem Wilk. Czy ja przypadkiem nie znam tego cz³owieka?");
};


instance DIA_BENGAR_MALAKTOT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 32;
	condition = dia_bengar_malaktot_condition;
	information = dia_bengar_malaktot_info;
	description = "Malak nie ¿yje.";
};


func int dia_bengar_malaktot_condition()
{
	if(Npc_IsDead(malak) && (MALAK_ISALIVE_KAP3 == TRUE))
	{
		return TRUE;
	};
};

func void dia_bengar_malaktot_info()
{
	AI_Output(other,self,"DIA_Bengar_MALAKTOT_15_00");	//Malak nie ¿yje.
	AI_Output(self,other,"DIA_Bengar_MALAKTOT_10_01");	//A wiêc sytuacja jeszcze bardziej siê pogorszy.
};


instance DIA_BENGAR_SLDDA(C_INFO)
{
	npc = bau_960_bengar;
	nr = 32;
	condition = dia_bengar_sldda_condition;
	information = dia_bengar_sldda_info;
	description = "Znalaz³em ci najemnika.";
};


func int dia_bengar_sldda_condition()
{
	if((Npc_GetDistToWP(sld_wolf,"FARM3") < 3000) && (MIS_BENGARSHELPINGSLD == LOG_SUCCESS) && (Npc_IsDead(sld_wolf) == FALSE))
	{
		return TRUE;
	};
};

func void dia_bengar_sldda_info()
{
	AI_Output(other,self,"DIA_Bengar_SLDDA_15_00");	//Znalaz³em ci najemnika.
	AI_Output(self,other,"DIA_Bengar_SLDDA_10_01");	//Nie mia³em u siebie jeszcze nigdy kogoœ takiego. Mam nadziejê, ¿e to siê uda.
	AI_Output(self,other,"DIA_Bengar_SLDDA_10_02");	//Proszê, weŸ to. S¹dzê, ¿e ci siê przyda.
	CreateInvItems(self,itmi_gold,400);
	b_giveinvitems(self,other,5113,400);
	b_giveplayerxp(XP_BENGARSHELPINGSLDARRIVED);
};


instance DIA_BENGAR_MALAKWIEDERDA(C_INFO)
{
	npc = bau_960_bengar;
	nr = 35;
	condition = dia_bengar_malakwiederda_condition;
	information = dia_bengar_malakwiederda_info;
	description = "Malak wróci³.";
};


func int dia_bengar_malakwiederda_condition()
{
	if((Npc_GetDistToWP(malak,"FARM3") < 3000) && ((MIS_GETMALAKBACK == LOG_SUCCESS) || (NPCOBSESSEDBYDMT_MALAK == TRUE)) && (Npc_IsDead(malak) == FALSE))
	{
		return TRUE;
	};
};

func void dia_bengar_malakwiederda_info()
{
	AI_Output(other,self,"DIA_Bengar_MALAKWIEDERDA_15_00");	//Malak wróci³.
	AI_Output(self,other,"DIA_Bengar_MALAKWIEDERDA_10_01");	//Najwy¿sza pora. Myœla³em, ¿e ju¿ nigdy go nie zobaczê.
	b_giveplayerxp(XP_GETMALAKBACK);
};


instance DIA_BENGAR_PERM(C_INFO)
{
	npc = bau_960_bengar;
	nr = 80;
	condition = dia_bengar_perm_condition;
	information = dia_bengar_perm_info;
	permanent = TRUE;
	description = "Wszystko bêdzie dobrze.";
};


func int dia_bengar_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_allein) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_bengar_perm_info()
{
	AI_Output(other,self,"DIA_Bengar_PERM_15_00");	//Wszystko bêdzie dobrze.
	if((Npc_GetDistToWP(malak,"FARM3") < 3000) && (Npc_IsDead(malak) == FALSE))
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_01");	//Malak wróci³, ale sytuacja niewiele siê zmieni³a.
		AI_Output(self,other,"DIA_Bengar_PERM_10_02");	//Jeœli nie zdarzy siê jakiœ cud, wszyscy tu zginiemy.
	}
	else if(Npc_KnowsInfo(other,dia_bengar_sldda) && (Npc_IsDead(sld_wolf) == FALSE) && (Npc_GetDistToWP(sld_wolf,"FARM3") < 3000))
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_03");	//Wilk to dziwny facet, ale chyba sobie poradzi.
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_04");	//Bez Malaka nic tu nie zostanie zrobione. Jeœli wkrótce coœ siê nie wydarzy, bêdê musia³ opuœciæ swoje gospodarstwo.
		if((MALAK_ISALIVE_KAP3 == TRUE) && (Npc_IsDead(malak) == FALSE))
		{
			AI_Output(self,other,"DIA_Bengar_PERM_10_05");	//Mam nadziejê, ¿e nied³ugo wróci.
		};
	};
	AI_StopProcessInfos(self);
	if(Npc_IsDead(sld_wolf) && (MIS_BENGARSHELPINGSLD == LOG_SUCCESS))
	{
		b_startotherroutine(sld_815_soeldner,"Start");
		b_startotherroutine(sld_817_soeldner,"Start");
	};
};


instance DIA_BENGAR_KAP4_EXIT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 999;
	condition = dia_bengar_kap4_exit_condition;
	information = dia_bengar_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bengar_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_bengar_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_KAP5_EXIT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 999;
	condition = dia_bengar_kap5_exit_condition;
	information = dia_bengar_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bengar_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_bengar_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_KAP6_EXIT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 999;
	condition = dia_bengar_kap6_exit_condition;
	information = dia_bengar_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bengar_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_bengar_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_PICKPOCKET(C_INFO)
{
	npc = bau_960_bengar;
	nr = 900;
	condition = dia_bengar_pickpocket_condition;
	information = dia_bengar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_bengar_pickpocket_condition()
{
	return c_beklauen(28,50);
};

func void dia_bengar_pickpocket_info()
{
	Info_ClearChoices(dia_bengar_pickpocket);
	Info_AddChoice(dia_bengar_pickpocket,DIALOG_BACK,dia_bengar_pickpocket_back);
	Info_AddChoice(dia_bengar_pickpocket,DIALOG_PICKPOCKET,dia_bengar_pickpocket_doit);
};

func void dia_bengar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bengar_pickpocket);
};

func void dia_bengar_pickpocket_back()
{
	Info_ClearChoices(dia_bengar_pickpocket);
};

