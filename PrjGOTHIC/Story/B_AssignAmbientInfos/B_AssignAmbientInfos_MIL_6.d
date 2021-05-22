
instance DIA_MIL_6_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_mil_6_exit_condition;
	information = dia_mil_6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_6_exit_condition()
{
	return TRUE;
};

func void dia_mil_6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_6_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_mil_6_join_condition;
	information = dia_mil_6_join_info;
	permanent = TRUE;
	description = "Co powinienem zrobi�, aby wst�pi� do stra�y?";
};


func int dia_mil_6_join_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_mil_6_join_info()
{
	AI_Output(other,self,"DIA_MIL_6_JOIN_15_00");	//Co powinienem zrobi�, �eby si� zaci�gn�� do stra�y?
	AI_Output(self,other,"DIA_MIL_6_JOIN_06_01");	//Porozmawiaj z Lordem Andre. Od kiedy paladyni przybyli do miasta, to w�a�nie on nadzoruje dzia�ania stra�y.
	if(c_npcisinquarter(self) != Q_KASERNE)
	{
		AI_Output(self,other,"DIA_MIL_6_JOIN_06_02");	//Znajdziesz go w koszarach. Praktycznie z nich nie wychodzi.
	};
};


instance DIA_MIL_6_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_mil_6_people_condition;
	information = dia_mil_6_people_info;
	permanent = TRUE;
	description = "Opowiedz mi o tych paladynach.";
};


func int dia_mil_6_people_condition()
{
	if(hero.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_mil_6_people_info()
{
	AI_Output(other,self,"DIA_MIL_6_PEOPLE_15_00");	//Opowiedz mi o tych paladynach.
	AI_Output(self,other,"DIA_MIL_6_PEOPLE_06_01");	//Zaraz po przybyciu do Khorinis udali si� do g�rnego miasta.
	AI_Output(self,other,"DIA_MIL_6_PEOPLE_06_02");	//Od tego czasu nikt poza obywatelami miasta, i oczywi�cie stra��, nie ma tam wst�pu.
	AI_Output(self,other,"DIA_MIL_6_PEOPLE_06_03");	//Kilku paladyn�w stacjonuje przy statku, w porcie. Ale nie nale�� do specjalnie rozmownych.
};


instance DIA_MIL_6_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_mil_6_location_condition;
	information = dia_mil_6_location_info;
	permanent = TRUE;
	description = "Co powinienem wiedzie� o tym mie�cie?";
};


func int dia_mil_6_location_condition()
{
	return TRUE;
};

func void dia_mil_6_location_info()
{
	AI_Output(other,self,"DIA_MIL_6_LOCATION_15_00");	//Co powinienem wiedzie� o tym mie�cie?
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_01");	//Kontrol� nad miastem przej�li paladyni. Stra� bezpo�rednio im podlega.
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_02");	//Lord Andre, dow�dca stra�y, pe�ni tak�e funkcj� s�dziego.
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_03");	//Je�li zdarzy ci si� z�ama� prawo, b�dziesz si� musia� przed nim wyt�umaczy�.
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_04");	//Jednak nie martw si�, jest cz�owiekiem ugodowym. Przewa�nie nak�ada jedynie grzywn�.
};


instance DIA_MIL_6_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_mil_6_standard_condition;
	information = dia_mil_6_standard_info;
	permanent = TRUE;
	description = "Co nowego?";
};


func int dia_mil_6_standard_condition()
{
	return TRUE;
};

func void dia_mil_6_standard_info()
{
	AI_Output(other,self,"DIA_MIL_6_STANDARD_15_00");	//Co s�ycha�?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_01");	//W mie�cie coraz wi�cej szumowin.
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_02");	//Wsz�dzie coraz wi�cej z�odziei. Lord Andre podejrzewa nawet, �e ca�e to zamieszanie jest sprawk� gangu.
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_03");	//Niedawno przetrz�sn�li�my dok�adnie ca�� dzielnic� portow�, ale niczego nie znale�li�my.
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_04");	//Wygl�da na to, �e problem bandyt�w mamy ju� z g�owy. Ataki sta�y si� ostatnimi czasy rzadko�ci�.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_05");	//Z dnia na dzie� jest coraz gorzej, wszystko przez te szumowiny wr�cz zalewaj�ce miasto. Ostatniej nocy �ledzi�em pewnego typka w czarnych szatach, zd��aj�cego ku g�rnemu miastu.
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_06");	//Od pocz�tku wyda� mi si� podejrzany. �ledzi�em go a� pod dom gubernatora. Tam znikn��. M�wi� ci, dziwna to by�a posta�.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_07");	//S�ysza�em, �e Lord Hagen zatrudni� najemnik�w, by zaj�li si� smokami. Mnie to odpowiada, nie chcia�bym sam zmierzy� si� z tymi bestiami.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_08");	//M�wi si�, �e smoki zosta�y pokonane. Pono� Lord Hagen zbiera si�y, by ostatecznie wygna� je tak�e z G�rniczej Doliny.
	};
};

func void b_assignambientinfos_mil_6(var C_NPC slf)
{
	dia_mil_6_exit.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_join.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_people.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_location.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_standard.npc = Hlp_GetInstanceID(slf);
};

