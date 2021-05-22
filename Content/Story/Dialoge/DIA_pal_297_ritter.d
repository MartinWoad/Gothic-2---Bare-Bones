
instance DIA_PAL_297_EXIT(C_INFO)
{
	npc = pal_297_ritter;
	nr = 999;
	condition = dia_pal_297_exit_condition;
	information = dia_pal_297_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_297_exit_condition()
{
	return TRUE;
};

func void dia_pal_297_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_297_TRESPAS(C_INFO)
{
	npc = pal_297_ritter;
	nr = 2;
	condition = dia_pal_297_trespas_condition;
	information = dia_pal_297_trespas_info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int dia_pal_297_trespas_condition()
{
	return TRUE;
};

func void dia_pal_297_trespas_info()
{
	AI_Output(other,self,"DIA_PAL_297_TRESPAS_15_00");	//Jak leci?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_PAL_297_TRESPAS_04_01");	//Te tereny s� wyj�tkowo niebezpieczne, musisz wi�c na siebie uwa�a�. Nie chcieliby�my, by co� ci si� sta�o.
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_297_TRESPAS_04_02");	//Wej�cie do doliny wymaga wiele odwagi i ca�kiem poka�nych zapas�w eliksir�w leczniczych.
	};
};

