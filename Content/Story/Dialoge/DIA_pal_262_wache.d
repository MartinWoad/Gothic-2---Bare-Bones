
instance DIA_PAL_262_EXIT(C_Info)
{
	npc = PAL_262_Wache;
	nr = 999;
	condition = DIA_PAL_262_EXIT_Condition;
	information = DIA_PAL_262_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_262_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_262_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_262_GREET(C_Info)
{
	npc = PAL_262_Wache;
	nr = 2;
	condition = DIA_PAL_262_GREET_Condition;
	information = DIA_PAL_262_GREET_Info;
	important = TRUE;
};


func int DIA_PAL_262_GREET_Condition()
{
	return TRUE;
};

func void DIA_PAL_262_GREET_Info()
{
	AI_Output(self,other,"DIA_PAL_262_GREET_10_00");	//Zatrzymaj siê - kim jesteœ?
	AI_Output(other,self,"DIA_PAL_262_GREET_15_01");	//Niewa¿ne kim, wa¿ne sk¹d przychodzê. Niedawno przekroczy³em prze³êcz.
	AI_Output(other,self,"DIA_PAL_262_GREET_15_02");	//Bêdziesz sprawia³ problemy, czy po prostu pozwolisz mi wejœæ?
	AI_Output(self,other,"DIA_PAL_262_GREET_10_03");	//Sk¹d mia³em wiedzieæ? Oczywiœcie, ¿e ciê wpuszczê, wchodŸ.
	AI_StopProcessInfos(self);
};


instance DIA_Wache_PERM(C_Info)
{
	npc = PAL_262_Wache;
	nr = 3;
	condition = DIA_Wache_PERM_Condition;
	information = DIA_Wache_PERM_Info;
	permanent = TRUE;
	description = "Kto tu dowodzi?";
};


func int DIA_Wache_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_262_greet))
	{
		return TRUE;
	};
};

func void DIA_Wache_PERM_Info()
{
	AI_Output(other,self,"DIA_Wache_PERM_15_00");	//Kto tu dowodzi?
	AI_Output(self,other,"DIA_Wache_PERM_10_01");	//Kapitan Garond i jego dwóch doradców, paladyni Orik i Parcival.
	AI_Output(self,other,"DIA_Wache_PERM_10_02");	//WchodŸ do œrodka. W ci¹gu dnia znajdziesz ich w sali tronowej na parterze.
};

