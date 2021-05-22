
instance DIA_DiegoOw_EXIT(C_Info)
{
	npc = PC_ThiefOW;
	nr = 999;
	condition = DIA_DiegoOw_EXIT_Condition;
	information = DIA_DiegoOw_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_DiegoOw_EXIT_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DiegoOw_Hallo(C_Info)
{
	npc = PC_ThiefOW;
	nr = 2;
	condition = DIA_DiegoOw_Hallo_Condition;
	information = DIA_DiegoOw_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_DiegoOw_Hallo_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_DiegoOw_Hallo_Info()
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
	if(Garond.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_12");	//Có¿, skoro nalegasz. Porozmawiaj z kapitanem Garondem.
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_13");	//Jeœli ktoœ mo¿e potwierdziæ obecnoœæ smoków, to w³aœnie ch³opcy z zamku.
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_14");	//Dobra, pomogê ci w miarê mo¿liwoœci. Ale nie zamierzam za nikogo nadstawiaæ karku, jasne?
	};
};


instance DIA_DIEGOOW_GAROND(C_Info)
{
	npc = PC_ThiefOW;
	nr = 3;
	condition = dia_diegoow_garond_condition;
	information = dia_diegoow_garond_info;
	permanent = FALSE;
	description = "Garond wys³a³ mnie z pewn¹ misj¹.";
};


func int dia_diegoow_garond_condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2))
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


instance DIA_DIEGOOW_SILVESTRO(C_Info)
{
	npc = PC_ThiefOW;
	nr = 3;
	condition = dia_diegoow_silvestro_condition;
	information = dia_diegoow_silvestro_info;
	permanent = FALSE;
	description = "Co wiesz o rudzie Silvestra?";
};


func int dia_diegoow_silvestro_condition()
{
	if(Npc_KnowsInfo(other,dia_diegoow_garond) && (Kapitel == 2))
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
	Silvestro_Ore = TRUE;
	B_LogEntry(TOPIC_ScoutMine,"Diego zabezpieczy³ CZTERY skrzynie rudy wydobytej przez górników Silvestra.");
};


instance DIA_DiegoOw_Mine(C_Info)
{
	npc = PC_ThiefOW;
	nr = 3;
	condition = DIA_DiegoOw_Mine_Condition;
	information = DIA_DiegoOw_Mine_Info;
	permanent = FALSE;
	description = "W jaki sposób zdoby³eœ tê rudê?";
};


func int DIA_DiegoOw_Mine_Condition()
{
	if(Npc_KnowsInfo(other,dia_diegoow_silvestro) && (Kapitel == 2) && (MIS_ScoutMine == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_DiegoOw_Mine_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Mine_15_00");	//W jaki sposób zdoby³eœ tê rudê?
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_01");	//By³em w oddziale Silvestra. Przez kilka dni prowadziliœmy wydobycie, a¿ Silvestro zrobi³ siê nagle strasznie nerwowy.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_02");	//Powiedzia³, ¿e musimy zabraæ urobek w bezpieczne miejsce.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_03");	//Jako ¿e od pewnego czasu planowa³em daæ nogê, zg³osi³em siê na ochotnika.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_04");	//I dobrze zrobi³em, bo górnicy wpadli wkrótce potem na stado pe³zaczy. Nikt nie prze¿y³.
};


instance DIA_DiegoOw_Ritter(C_Info)
{
	npc = PC_ThiefOW;
	nr = 9;
	condition = DIA_DiegoOw_Ritter_Condition;
	information = DIA_DiegoOw_Ritter_Info;
	permanent = FALSE;
	description = "Przed twoj¹ kryjówk¹ le¿¹ zw³oki dwóch rycerzy...";
};


func int DIA_DiegoOw_Ritter_Condition()
{
	if((Kapitel == 2) && ((Npc_HasItems(PAL_Leiche4,ItMi_OldCoin) == 0) || (Npc_HasItems(PAL_Leiche5,ItMi_OldCoin) == 0)))
	{
		return TRUE;
	};
};

func void DIA_DiegoOw_Ritter_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Ritter_15_00");	//Przed twoj¹ kryjówk¹ le¿¹ zw³oki dwóch rycerzy...
	AI_Output(self,other,"DIA_DiegoOw_Ritter_11_01");	//Polegli bohatersko w walce ze stadem zêbaczy.
	AI_Output(self,other,"DIA_DiegoOw_Ritter_11_02");	//Górnicza Dolina rz¹dzi siê w³asnymi prawami. Ostrzega³em ich, ale nie chcieli mnie s³uchaæ.
};


instance DIA_DiegoOw_Perm(C_Info)
{
	npc = PC_ThiefOW;
	nr = 11;
	condition = DIA_DiegoOw_Perm_Condition;
	information = DIA_DiegoOw_Perm_Info;
	permanent = TRUE;
	description = "Co powinienem wiedzieæ o dolinie?";
};


func int DIA_DiegoOw_Perm_Condition()
{
	if((Kapitel == 2) && Npc_KnowsInfo(other,DIA_DiegoOw_Ritter))
	{
		return TRUE;
	};
};

func void DIA_DiegoOw_Perm_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Perm_15_00");	//Co powinienem wiedzieæ o dolinie?
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_01");	//Od upadku Bariery sporo siê pozmienia³o. Teraz rz¹dz¹ tu orkowie.
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_02");	//A ludzie s¹ tylko ¿yw¹ karm¹ dla prawdziwych w³adców doliny: smoków.
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_03");	//Trzymaj siê z dala od wszystkiego, co jest silniejsze od ciebie, zw³aszcza jeœli przypomina z wygl¹du smoka.
};


instance DIA_DiegoOw_Gorn(C_Info)
{
	npc = PC_ThiefOW;
	nr = 9;
	condition = DIA_DiegoOw_Gorn_Condition;
	information = DIA_DiegoOw_Gorn_Info;
	permanent = FALSE;
	description = "Chcia³bym wykupiæ Gorna...";
};


func int DIA_DiegoOw_Gorn_Condition()
{
	if((Kapitel == 2) && (MIS_RescueGorn == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_DiegoOw_Gorn_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Gorn_15_00");	//Chcia³bym wykupiæ Gorna, ale Garond domaga siê za niego 1000 sztuk z³ota.
	AI_Output(self,other,"DIA_DiegoOw_Gorn_11_01");	//Niez³a sumka. Mam przy sobie 300 sztuk, mo¿esz je wzi¹æ, jeœli chcesz. Resztê musisz zdobyæ sam.
	B_GiveInvItems(self,other,ItMi_Gold,300);
	B_LogEntry(TOPIC_RescueGorn,"Diego przekaza³ 300 sztuk z³ota na uwolnienie Gorna.");
};


instance DIA_DiegoOw_Teach(C_Info)
{
	npc = PC_ThiefOW;
	nr = 10;
	condition = DIA_DiegoOw_Teach_Condition;
	information = DIA_DiegoOw_Teach_Info;
	permanent = FALSE;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};


func int DIA_DiegoOw_Teach_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_Teach_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Teach_15_00");	//Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"DIA_DiegoOw_Teach_11_01");	//Daj spokój, mam teraz wa¿niejsze rzeczy na g³owie.
};


instance DIA_ThiefOW_PICKPOCKET(C_Info)
{
	npc = PC_ThiefOW;
	nr = 900;
	condition = DIA_ThiefOW_PICKPOCKET_Condition;
	information = DIA_ThiefOW_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_120;
};


func int DIA_ThiefOW_PICKPOCKET_Condition()
{
	return C_Beklauen(120,600);
};

func void DIA_ThiefOW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_ThiefOW_PICKPOCKET);
	Info_AddChoice(DIA_ThiefOW_PICKPOCKET,Dialog_Back,DIA_ThiefOW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_ThiefOW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_ThiefOW_PICKPOCKET_DoIt);
};

func void DIA_ThiefOW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_ThiefOW_PICKPOCKET);
};

func void DIA_ThiefOW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_ThiefOW_PICKPOCKET);
};

