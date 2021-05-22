
instance DIA_DIEGOOW_EXIT(C_INFO)
{
	npc = pc_thiefow;
	nr = 999;
	condition = dia_diegoow_exit_condition;
	information = dia_diegoow_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_diegoow_exit_condition()
{
	return TRUE;
};

func void dia_diegoow_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DIEGOOW_HALLO(C_INFO)
{
	npc = pc_thiefow;
	nr = 2;
	condition = dia_diegoow_hallo_condition;
	information = dia_diegoow_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_diegoow_hallo_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_diegoow_hallo_info()
{
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_00");	//Hej, myœla³em, ¿e nie ¿yjesz.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_01");	//Taa... te¿ tak myœla³em.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_02");	//Ale wróci³em i szukam dowodu na pojawienie siê smoków.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_03");	//Czy¿by? A dla kogo pracujesz?
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_04");	//Dla Lorda Hagena. Tylko paladyni mog¹ powstrzymaæ smoki.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_05");	//Paladyni?! Coœ ci powiem. Kiedy uda³o mi siê st¹d uciec, poszed³em do Khorinis.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_06");	//Zamierza³em uprzedziæ paladynów o smokach. Nie wiem, po co w ogóle próbowa³em.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_07");	//Ten nadêty g³upiec, Lothar, nie chcia³ mnie nawet wys³uchaæ, a ju¿ na pewno nie zamierza³ dopuœciæ mnie przed oblicze Hagena.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_08");	//Wys³ali mnie tylko ze swoj¹ ekspedycj¹. Wiêc nie mów mi, jakim to wybawieniem s¹ paladyni...
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_09");	//Tak czy inaczej - smoki trzeba powstrzymaæ, póki jeszcze jest czas. Niewa¿ne, kto tego dokona.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_10");	//Powstrzymaæ? Chyba ¿artujesz? Musimy siê wynosiæ z tej doliny, ot co!
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_11");	//Potrzebujê dowodu na ich istnienie.
	if(garond.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_12");	//Có¿, skoro nalegasz. Porozmawiaj z kapitanem Garondem.
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_13");	//Jeœli ktoœ mo¿e potwierdziæ obecnoœæ smoków, to w³aœnie ch³opcy z zamku.
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_14");	//Dobra, pomogê ci w miarê mo¿liwoœci. Ale nie zamierzam za nikogo nadstawiaæ karku, jasne?
	};
};


instance DIA_DIEGOOW_GAROND(C_INFO)
{
	npc = pc_thiefow;
	nr = 3;
	condition = dia_diegoow_garond_condition;
	information = dia_diegoow_garond_info;
	permanent = FALSE;
	description = "Garond wys³a³ mnie z pewn¹ misj¹.";
};


func int dia_diegoow_garond_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_diegoow_garond_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Garond_15_00");	//Garond wys³a³ mnie z pewn¹ misj¹. Chce wiedzieæ, ile rudy wydobyto do tej pory.
	AI_Output(self,other,"DIA_DiegoOw_Garond_11_01");	//A potem da ci dowód, którego tak potrzebujesz?
	AI_Output(other,self,"DIA_DiegoOw_Garond_15_02");	//W³aœnie. Wiêc jak, mo¿esz mi coœ powiedzieæ?
	AI_Output(self,other,"DIA_DiegoOw_Garond_11_03");	//To zale¿y, co chcesz wiedzieæ.
};


instance DIA_DIEGOOW_SILVESTRO(C_INFO)
{
	npc = pc_thiefow;
	nr = 3;
	condition = dia_diegoow_silvestro_condition;
	information = dia_diegoow_silvestro_info;
	permanent = FALSE;
	description = "Co wiesz o rudzie Silvestra?";
};


func int dia_diegoow_silvestro_condition()
{
	if(Npc_KnowsInfo(other,dia_diegoow_garond) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_diegoow_silvestro_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Silvestro_15_00");	//Co wiesz o rudzie Silvestra?
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_01");	//Na dnie tej jaskini s¹ CZTERY skrzynie rudy. Wydobyli j¹ ludzie Silvestra.
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_02");	//Jeœli Garond zechce, mo¿e tu przyjœæ i je sobie wzi¹æ, ale mnie tu ju¿ wtedy nie bêdzie.
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_03");	//Powiedz, jak uda³o ci siê przejœæ przez prze³êcz? Myœla³em, ¿e a¿ roi siê od orków.
	AI_Output(other,self,"DIA_DiegoOw_Silvestro_15_04");	//Przez opuszczon¹ kopalniê prowadzi œcie¿ka, na której nie ma orków.
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_05");	//Dobrze wiedzieæ. Zatem nied³ugo wyruszê do Khorinis. Mam tam parê rachunków do wyrównania.
	SILVESTRO_ORE = TRUE;
	b_logentry(TOPIC_SCOUTMINE,"Diego zabezpieczy³ CZTERY skrzynie rudy wydobytej przez górników Silvestra.");
};


instance DIA_DIEGOOW_MINE(C_INFO)
{
	npc = pc_thiefow;
	nr = 3;
	condition = dia_diegoow_mine_condition;
	information = dia_diegoow_mine_info;
	permanent = FALSE;
	description = "W jaki sposób zdoby³eœ tê rudê?";
};


func int dia_diegoow_mine_condition()
{
	if(Npc_KnowsInfo(other,dia_diegoow_silvestro) && (KAPITEL == 2) && (MIS_SCOUTMINE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_diegoow_mine_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Mine_15_00");	//W jaki sposób zdoby³eœ tê rudê?
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_01");	//By³em w oddziale Silvestra. Przez kilka dni prowadziliœmy wydobycie, a¿ Silvestro zrobi³ siê nagle strasznie nerwowy.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_02");	//Powiedzia³, ¿e musimy zabraæ urobek w bezpieczne miejsce.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_03");	//Jako ¿e od pewnego czasu planowa³em daæ nogê, zg³osi³em siê na ochotnika.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_04");	//I dobrze zrobi³em, bo górnicy wpadli wkrótce potem na stado pe³zaczy. Nikt nie prze¿y³.
};


instance DIA_DIEGOOW_RITTER(C_INFO)
{
	npc = pc_thiefow;
	nr = 9;
	condition = dia_diegoow_ritter_condition;
	information = dia_diegoow_ritter_info;
	permanent = FALSE;
	description = "Przed twoj¹ kryjówk¹ le¿¹ zw³oki dwóch rycerzy...";
};


func int dia_diegoow_ritter_condition()
{
	if((KAPITEL == 2) && ((Npc_HasItems(pal_leiche4,itmi_oldcoin) == 0) || (Npc_HasItems(pal_leiche5,itmi_oldcoin) == 0)))
	{
		return TRUE;
	};
};

func void dia_diegoow_ritter_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Ritter_15_00");	//Przed twoj¹ kryjówk¹ le¿¹ zw³oki dwóch rycerzy...
	AI_Output(self,other,"DIA_DiegoOw_Ritter_11_01");	//Polegli bohatersko w walce ze stadem zêbaczy.
	AI_Output(self,other,"DIA_DiegoOw_Ritter_11_02");	//Górnicza Dolina rz¹dzi siê w³asnymi prawami. Ostrzega³em ich, ale nie chcieli mnie s³uchaæ.
};


instance DIA_DIEGOOW_PERM(C_INFO)
{
	npc = pc_thiefow;
	nr = 11;
	condition = dia_diegoow_perm_condition;
	information = dia_diegoow_perm_info;
	permanent = TRUE;
	description = "Co powinienem wiedzieæ o dolinie?";
};


func int dia_diegoow_perm_condition()
{
	if((KAPITEL == 2) && Npc_KnowsInfo(other,dia_diegoow_ritter))
	{
		return TRUE;
	};
};

func void dia_diegoow_perm_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Perm_15_00");	//Co powinienem wiedzieæ o dolinie?
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_01");	//Od upadku Bariery sporo siê pozmienia³o. Teraz rz¹dz¹ tu orkowie.
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_02");	//A ludzie s¹ tylko ¿yw¹ karm¹ dla prawdziwych w³adców doliny: smoków.
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_03");	//Trzymaj siê z dala od wszystkiego, co jest silniejsze od ciebie, zw³aszcza jeœli przypomina z wygl¹du smoka.
};


instance DIA_DIEGOOW_GORN(C_INFO)
{
	npc = pc_thiefow;
	nr = 9;
	condition = dia_diegoow_gorn_condition;
	information = dia_diegoow_gorn_info;
	permanent = FALSE;
	description = "Chcia³bym wykupiæ Gorna...";
};


func int dia_diegoow_gorn_condition()
{
	if((KAPITEL == 2) && (MIS_RESCUEGORN == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_diegoow_gorn_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Gorn_15_00");	//Chcia³bym wykupiæ Gorna, ale Garond domaga siê za niego 1000 sztuk z³ota.
	AI_Output(self,other,"DIA_DiegoOw_Gorn_11_01");	//Niez³a sumka. Mam przy sobie 300 sztuk, mo¿esz je wzi¹æ, jeœli chcesz. Resztê musisz zdobyæ sam.
	b_giveinvitems(self,other,5113,300);
	b_logentry(TOPIC_RESCUEGORN,"Diego przekaza³ 300 sztuk z³ota na uwolnienie Gorna.");
};


instance DIA_DIEGOOW_TEACH(C_INFO)
{
	npc = pc_thiefow;
	nr = 10;
	condition = dia_diegoow_teach_condition;
	information = dia_diegoow_teach_info;
	permanent = FALSE;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};


func int dia_diegoow_teach_condition()
{
	return TRUE;
};

func void dia_diegoow_teach_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Teach_15_00");	//Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"DIA_DiegoOw_Teach_11_01");	//Daj spokój, mam teraz wa¿niejsze rzeczy na g³owie.
};


instance DIA_THIEFOW_PICKPOCKET(C_INFO)
{
	npc = pc_thiefow;
	nr = 900;
	condition = dia_thiefow_pickpocket_condition;
	information = dia_thiefow_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_thiefow_pickpocket_condition()
{
	return c_beklauen(120,600);
};

func void dia_thiefow_pickpocket_info()
{
	Info_ClearChoices(dia_thiefow_pickpocket);
	Info_AddChoice(dia_thiefow_pickpocket,DIALOG_BACK,dia_thiefow_pickpocket_back);
	Info_AddChoice(dia_thiefow_pickpocket,DIALOG_PICKPOCKET,dia_thiefow_pickpocket_doit);
};

func void dia_thiefow_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_thiefow_pickpocket);
};

func void dia_thiefow_pickpocket_back()
{
	Info_ClearChoices(dia_thiefow_pickpocket);
};

