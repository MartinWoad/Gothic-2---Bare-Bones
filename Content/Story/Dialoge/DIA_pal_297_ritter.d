
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
	description = "Co s³ychaæ?";
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
		AI_Output(self,other,"DIA_PAL_297_TRESPAS_04_01");	//Te tereny s¹ wyj¹tkowo niebezpieczne, musisz wiêc na siebie uwa¿aæ. Nie chcielibyœmy, by coœ ci siê sta³o.
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_297_TRESPAS_04_02");	//Wejœcie do doliny wymaga wiele odwagi i ca³kiem pokaŸnych zapasów eliksirów leczniczych.
	};
};

