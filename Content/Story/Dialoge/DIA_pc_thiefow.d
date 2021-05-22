
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
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_00");	//Hej, my�la�em, �e nie �yjesz.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_01");	//Taa... te� tak my�la�em.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_02");	//Ale wr�ci�em i szukam dowodu na pojawienie si� smok�w.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_03");	//Czy�by? A dla kogo pracujesz?
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_04");	//Dla Lorda Hagena. Tylko paladyni mog� powstrzyma� smoki.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_05");	//Paladyni?! Co� ci powiem. Kiedy uda�o mi si� st�d uciec, poszed�em do Khorinis.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_06");	//Zamierza�em uprzedzi� paladyn�w o smokach. Nie wiem, po co w og�le pr�bowa�em.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_07");	//Ten nad�ty g�upiec, Lothar, nie chcia� mnie nawet wys�ucha�, a ju� na pewno nie zamierza� dopu�ci� mnie przed oblicze Hagena.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_08");	//Wys�ali mnie tylko ze swoj� ekspedycj�. Wi�c nie m�w mi, jakim to wybawieniem s� paladyni...
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_09");	//Tak czy inaczej - smoki trzeba powstrzyma�, p�ki jeszcze jest czas. Niewa�ne, kto tego dokona.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_10");	//Powstrzyma�? Chyba �artujesz? Musimy si� wynosi� z tej doliny, ot co!
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_11");	//Potrzebuj� dowodu na ich istnienie.
	if(Garond.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_12");	//C�, skoro nalegasz. Porozmawiaj z kapitanem Garondem.
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_13");	//Je�li kto� mo�e potwierdzi� obecno�� smok�w, to w�a�nie ch�opcy z zamku.
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_14");	//Dobra, pomog� ci w miar� mo�liwo�ci. Ale nie zamierzam za nikogo nadstawia� karku, jasne?
	};
};


instance DIA_DIEGOOW_GAROND(C_Info)
{
	npc = PC_ThiefOW;
	nr = 3;
	condition = dia_diegoow_garond_condition;
	information = dia_diegoow_garond_info;
	permanent = FALSE;
	description = "Garond wys�a� mnie z pewn� misj�.";
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
	AI_Output(other,self,"DIA_DiegoOw_Garond_15_00");	//Garond wys�a� mnie z pewn� misj�. Chce wiedzie�, ile rudy wydobyto do tej pory.
	AI_Output(self,other,"DIA_DiegoOw_Garond_11_01");	//A potem da ci dow�d, kt�rego tak potrzebujesz?
	AI_Output(other,self,"DIA_DiegoOw_Garond_15_02");	//W�a�nie. Wi�c jak, mo�esz mi co� powiedzie�?
	AI_Output(self,other,"DIA_DiegoOw_Garond_11_03");	//To zale�y, co chcesz wiedzie�.
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
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_01");	//Na dnie tej jaskini s� CZTERY skrzynie rudy. Wydobyli j� ludzie Silvestra.
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_02");	//Je�li Garond zechce, mo�e tu przyj�� i je sobie wzi��, ale mnie tu ju� wtedy nie b�dzie.
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_03");	//Powiedz, jak uda�o ci si� przej�� przez prze��cz? My�la�em, �e a� roi si� od ork�w.
	AI_Output(other,self,"DIA_DiegoOw_Silvestro_15_04");	//Przez opuszczon� kopalni� prowadzi �cie�ka, na kt�rej nie ma ork�w.
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_05");	//Dobrze wiedzie�. Zatem nied�ugo wyrusz� do Khorinis. Mam tam par� rachunk�w do wyr�wnania.
	Silvestro_Ore = TRUE;
	B_LogEntry(TOPIC_ScoutMine,"Diego zabezpieczy� CZTERY skrzynie rudy wydobytej przez g�rnik�w Silvestra.");
};


instance DIA_DiegoOw_Mine(C_Info)
{
	npc = PC_ThiefOW;
	nr = 3;
	condition = DIA_DiegoOw_Mine_Condition;
	information = DIA_DiegoOw_Mine_Info;
	permanent = FALSE;
	description = "W jaki spos�b zdoby�e� t� rud�?";
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
	AI_Output(other,self,"DIA_DiegoOw_Mine_15_00");	//W jaki spos�b zdoby�e� t� rud�?
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_01");	//By�em w oddziale Silvestra. Przez kilka dni prowadzili�my wydobycie, a� Silvestro zrobi� si� nagle strasznie nerwowy.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_02");	//Powiedzia�, �e musimy zabra� urobek w bezpieczne miejsce.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_03");	//Jako �e od pewnego czasu planowa�em da� nog�, zg�osi�em si� na ochotnika.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_04");	//I dobrze zrobi�em, bo g�rnicy wpadli wkr�tce potem na stado pe�zaczy. Nikt nie prze�y�.
};


instance DIA_DiegoOw_Ritter(C_Info)
{
	npc = PC_ThiefOW;
	nr = 9;
	condition = DIA_DiegoOw_Ritter_Condition;
	information = DIA_DiegoOw_Ritter_Info;
	permanent = FALSE;
	description = "Przed twoj� kryj�wk� le�� zw�oki dw�ch rycerzy...";
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
	AI_Output(other,self,"DIA_DiegoOw_Ritter_15_00");	//Przed twoj� kryj�wk� le�� zw�oki dw�ch rycerzy...
	AI_Output(self,other,"DIA_DiegoOw_Ritter_11_01");	//Polegli bohatersko w walce ze stadem z�baczy.
	AI_Output(self,other,"DIA_DiegoOw_Ritter_11_02");	//G�rnicza Dolina rz�dzi si� w�asnymi prawami. Ostrzega�em ich, ale nie chcieli mnie s�ucha�.
};


instance DIA_DiegoOw_Perm(C_Info)
{
	npc = PC_ThiefOW;
	nr = 11;
	condition = DIA_DiegoOw_Perm_Condition;
	information = DIA_DiegoOw_Perm_Info;
	permanent = TRUE;
	description = "Co powinienem wiedzie� o dolinie?";
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
	AI_Output(other,self,"DIA_DiegoOw_Perm_15_00");	//Co powinienem wiedzie� o dolinie?
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_01");	//Od upadku Bariery sporo si� pozmienia�o. Teraz rz�dz� tu orkowie.
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_02");	//A ludzie s� tylko �yw� karm� dla prawdziwych w�adc�w doliny: smok�w.
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_03");	//Trzymaj si� z dala od wszystkiego, co jest silniejsze od ciebie, zw�aszcza je�li przypomina z wygl�du smoka.
};


instance DIA_DiegoOw_Gorn(C_Info)
{
	npc = PC_ThiefOW;
	nr = 9;
	condition = DIA_DiegoOw_Gorn_Condition;
	information = DIA_DiegoOw_Gorn_Info;
	permanent = FALSE;
	description = "Chcia�bym wykupi� Gorna...";
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
	AI_Output(other,self,"DIA_DiegoOw_Gorn_15_00");	//Chcia�bym wykupi� Gorna, ale Garond domaga si� za niego 1000 sztuk z�ota.
	AI_Output(self,other,"DIA_DiegoOw_Gorn_11_01");	//Niez�a sumka. Mam przy sobie 300 sztuk, mo�esz je wzi��, je�li chcesz. Reszt� musisz zdoby� sam.
	B_GiveInvItems(self,other,ItMi_Gold,300);
	B_LogEntry(TOPIC_RescueGorn,"Diego przekaza� 300 sztuk z�ota na uwolnienie Gorna.");
};


instance DIA_DiegoOw_Teach(C_Info)
{
	npc = PC_ThiefOW;
	nr = 10;
	condition = DIA_DiegoOw_Teach_Condition;
	information = DIA_DiegoOw_Teach_Info;
	permanent = FALSE;
	description = "Mo�esz mnie czego� nauczy�?";
};


func int DIA_DiegoOw_Teach_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_Teach_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Teach_15_00");	//Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"DIA_DiegoOw_Teach_11_01");	//Daj spok�j, mam teraz wa�niejsze rzeczy na g�owie.
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

