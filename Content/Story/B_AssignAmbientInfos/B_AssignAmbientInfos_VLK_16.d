
instance DIA_VLK_16_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_VLK_16_EXIT_Condition;
	information = DIA_VLK_16_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_VLK_16_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_16_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_16_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_VLK_16_JOIN_Condition;
	information = DIA_VLK_16_JOIN_Info;
	permanent = TRUE;
	description = "Chcia�bym zosta� obywatelem tego miasta!";
};


func int DIA_VLK_16_JOIN_Condition()
{
	if((hero.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_VLK_16_JOIN_Info()
{
	AI_Output(other,self,"DIA_VLK_16_JOIN_15_00");	//Chcia�bym zosta� obywatelem miasta!
	AI_Output(self,other,"DIA_VLK_16_JOIN_16_01");	//Czy pomo�esz nam w obronie miasta przed atakami ork�w?
	AI_Output(self,other,"DIA_VLK_16_JOIN_16_02");	//Je�li jeste� obywatelem Khorinis, mo�esz przy��czy� si� do oddzia��w stra�y - w tej sprawie porozmawiaj z kt�rym� ze stra�nik�w.
};


instance DIA_VLK_16_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_VLK_16_PEOPLE_Condition;
	information = DIA_VLK_16_PEOPLE_Info;
	permanent = TRUE;
	description = "Kto jest najwa�niejszy w mie�cie?";
};


func int DIA_VLK_16_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_VLK_16_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_VLK_16_PEOPLE_15_00");	//Kto jest najwa�niejszy w mie�cie?
	AI_Output(self,other,"DIA_VLK_16_PEOPLE_16_01");	//Paladyni, ich siedziba znajduje si� w g�rnym mie�cie.
};


instance DIA_VLK_16_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_VLK_16_LOCATION_Condition;
	information = DIA_VLK_16_LOCATION_Info;
	permanent = TRUE;
	description = "Czy s� tutaj jakie� interesuj�ce rzeczy?";
};


func int DIA_VLK_16_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_VLK_16_LOCATION_Info()
{
	AI_Output(other,self,"DIA_VLK_16_LOCATION_15_00");	//Kt�re miejsca warto tutaj odwiedzi�?
	AI_Output(self,other,"DIA_VLK_16_LOCATION_16_01");	//Na targowisku odnajdziesz wszelkie mo�liwe towary.
};


instance DIA_VLK_16_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_VLK_16_STANDARD_Condition;
	information = DIA_VLK_16_STANDARD_Info;
	permanent = TRUE;
	description = "Co nowego?";
};


func int DIA_VLK_16_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_VLK_16_STANDARD_Info()
{
	AI_Output(other,self,"DIA_VLK_16_STANDARD_15_00");	//Co nowego?
	if((Kapitel == 1) || (Kapitel == 2))
	{
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_01");	//Nie s�ysza�e�, �e pono� na obrze�ach miasta dostrze�ono ork�w? Miejmy nadziej�, �e paladyni sobie z nimi poradz�.
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_02");	//Zastanawiam si�, czy w�a�nie to jest powodem, dla kt�rego farmerzy nie zjawiaj� si� na targu.
	};
	if(Kapitel == 3)
	{
		if(MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_03");	//Najemnik, kt�rego oskar�ono o zab�jstwo Lothara, jest niewinny. Znaleziono dow�d na to, �e biedaka wrobiono! S�ysza�am o tym na targowisku...
		}
		else
		{
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_04");	//To oburzaj�ce. Najemnicy zarz�dcy bez �adnych skrupu��w zamordowali czcigodnego paladyna Lothara!
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_05");	//Jednak sprawiedliwa r�ka Innosa dosi�gnie tych grzesznik�w. Nikt nie ma prawa podnosi� miecza na wojownik�w naszego Pana.
		};
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_06");	//Pono� przest�pcy opuszczaj� farm� Onara. M�wi�, �e boj� si� ludzi Lorda Hagena, i dlatego wracaj� do G�rniczej Doliny.
	};
	if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_07");	//Dosz�y mnie s�uchy, �e straszliwe smoki w G�rniczej Dolinie zosta�y pokonane przez oddzia�y paladyn�w.
	};
};

func void B_AssignAmbientInfos_VLK_16(var C_Npc slf)
{
	dia_vlk_16_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_standard.npc = Hlp_GetInstanceID(slf);
};

