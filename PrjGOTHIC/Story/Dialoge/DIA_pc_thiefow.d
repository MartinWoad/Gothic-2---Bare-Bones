
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
	if(garond.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_12");	//C�, skoro nalegasz. Porozmawiaj z kapitanem Garondem.
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_13");	//Je�li kto� mo�e potwierdzi� obecno�� smok�w, to w�a�nie ch�opcy z zamku.
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_14");	//Dobra, pomog� ci w miar� mo�liwo�ci. Ale nie zamierzam za nikogo nadstawia� karku, jasne?
	};
};


instance DIA_DIEGOOW_GAROND(C_INFO)
{
	npc = pc_thiefow;
	nr = 3;
	condition = dia_diegoow_garond_condition;
	information = dia_diegoow_garond_info;
	permanent = FALSE;
	description = "Garond wys�a� mnie z pewn� misj�.";
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
	AI_Output(other,self,"DIA_DiegoOw_Garond_15_00");	//Garond wys�a� mnie z pewn� misj�. Chce wiedzie�, ile rudy wydobyto do tej pory.
	AI_Output(self,other,"DIA_DiegoOw_Garond_11_01");	//A potem da ci dow�d, kt�rego tak potrzebujesz?
	AI_Output(other,self,"DIA_DiegoOw_Garond_15_02");	//W�a�nie. Wi�c jak, mo�esz mi co� powiedzie�?
	AI_Output(self,other,"DIA_DiegoOw_Garond_11_03");	//To zale�y, co chcesz wiedzie�.
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
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_01");	//Na dnie tej jaskini s� CZTERY skrzynie rudy. Wydobyli j� ludzie Silvestra.
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_02");	//Je�li Garond zechce, mo�e tu przyj�� i je sobie wzi��, ale mnie tu ju� wtedy nie b�dzie.
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_03");	//Powiedz, jak uda�o ci si� przej�� przez prze��cz? My�la�em, �e a� roi si� od ork�w.
	AI_Output(other,self,"DIA_DiegoOw_Silvestro_15_04");	//Przez opuszczon� kopalni� prowadzi �cie�ka, na kt�rej nie ma ork�w.
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_05");	//Dobrze wiedzie�. Zatem nied�ugo wyrusz� do Khorinis. Mam tam par� rachunk�w do wyr�wnania.
	SILVESTRO_ORE = TRUE;
	b_logentry(TOPIC_SCOUTMINE,"Diego zabezpieczy� CZTERY skrzynie rudy wydobytej przez g�rnik�w Silvestra.");
};


instance DIA_DIEGOOW_MINE(C_INFO)
{
	npc = pc_thiefow;
	nr = 3;
	condition = dia_diegoow_mine_condition;
	information = dia_diegoow_mine_info;
	permanent = FALSE;
	description = "W jaki spos�b zdoby�e� t� rud�?";
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
	AI_Output(other,self,"DIA_DiegoOw_Mine_15_00");	//W jaki spos�b zdoby�e� t� rud�?
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_01");	//By�em w oddziale Silvestra. Przez kilka dni prowadzili�my wydobycie, a� Silvestro zrobi� si� nagle strasznie nerwowy.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_02");	//Powiedzia�, �e musimy zabra� urobek w bezpieczne miejsce.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_03");	//Jako �e od pewnego czasu planowa�em da� nog�, zg�osi�em si� na ochotnika.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_04");	//I dobrze zrobi�em, bo g�rnicy wpadli wkr�tce potem na stado pe�zaczy. Nikt nie prze�y�.
};


instance DIA_DIEGOOW_RITTER(C_INFO)
{
	npc = pc_thiefow;
	nr = 9;
	condition = dia_diegoow_ritter_condition;
	information = dia_diegoow_ritter_info;
	permanent = FALSE;
	description = "Przed twoj� kryj�wk� le�� zw�oki dw�ch rycerzy...";
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
	AI_Output(other,self,"DIA_DiegoOw_Ritter_15_00");	//Przed twoj� kryj�wk� le�� zw�oki dw�ch rycerzy...
	AI_Output(self,other,"DIA_DiegoOw_Ritter_11_01");	//Polegli bohatersko w walce ze stadem z�baczy.
	AI_Output(self,other,"DIA_DiegoOw_Ritter_11_02");	//G�rnicza Dolina rz�dzi si� w�asnymi prawami. Ostrzega�em ich, ale nie chcieli mnie s�ucha�.
};


instance DIA_DIEGOOW_PERM(C_INFO)
{
	npc = pc_thiefow;
	nr = 11;
	condition = dia_diegoow_perm_condition;
	information = dia_diegoow_perm_info;
	permanent = TRUE;
	description = "Co powinienem wiedzie� o dolinie?";
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
	AI_Output(other,self,"DIA_DiegoOw_Perm_15_00");	//Co powinienem wiedzie� o dolinie?
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_01");	//Od upadku Bariery sporo si� pozmienia�o. Teraz rz�dz� tu orkowie.
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_02");	//A ludzie s� tylko �yw� karm� dla prawdziwych w�adc�w doliny: smok�w.
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_03");	//Trzymaj si� z dala od wszystkiego, co jest silniejsze od ciebie, zw�aszcza je�li przypomina z wygl�du smoka.
};


instance DIA_DIEGOOW_GORN(C_INFO)
{
	npc = pc_thiefow;
	nr = 9;
	condition = dia_diegoow_gorn_condition;
	information = dia_diegoow_gorn_info;
	permanent = FALSE;
	description = "Chcia�bym wykupi� Gorna...";
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
	AI_Output(other,self,"DIA_DiegoOw_Gorn_15_00");	//Chcia�bym wykupi� Gorna, ale Garond domaga si� za niego 1000 sztuk z�ota.
	AI_Output(self,other,"DIA_DiegoOw_Gorn_11_01");	//Niez�a sumka. Mam przy sobie 300 sztuk, mo�esz je wzi��, je�li chcesz. Reszt� musisz zdoby� sam.
	b_giveinvitems(self,other,5113,300);
	b_logentry(TOPIC_RESCUEGORN,"Diego przekaza� 300 sztuk z�ota na uwolnienie Gorna.");
};


instance DIA_DIEGOOW_TEACH(C_INFO)
{
	npc = pc_thiefow;
	nr = 10;
	condition = dia_diegoow_teach_condition;
	information = dia_diegoow_teach_info;
	permanent = FALSE;
	description = "Mo�esz mnie czego� nauczy�?";
};


func int dia_diegoow_teach_condition()
{
	return TRUE;
};

func void dia_diegoow_teach_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Teach_15_00");	//Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"DIA_DiegoOw_Teach_11_01");	//Daj spok�j, mam teraz wa�niejsze rzeczy na g�owie.
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

