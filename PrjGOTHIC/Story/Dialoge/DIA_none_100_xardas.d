
instance DIA_XARDAS_FIRSTEXIT(C_INFO)
{
	npc = none_100_xardas;
	nr = 999;
	condition = dia_xardas_firstexit_condition;
	information = dia_xardas_firstexit_info;
	permanent = FALSE;
	description = "Wyrusz� w drog� najszybciej, jak si� tylko da!";
};


func int dia_xardas_firstexit_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_todo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_firstexit_info()
{
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_15_00");	//Wyrusz� w drog� najszybciej, jak si� da!
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_14_01");	//�wietnie! I jeszcze co�: nie zdrad� nikomu, �e ze mn� rozmawia�e�. A ju� w �adnym wypadku nie m�w o tym �adnemu magowi.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_14_02");	//Odk�d obra�em w�asn� �cie�k�, Kr�g Ognia ma mnie za zmar�ego, i niech tak pozostanie.
	AI_StopProcessInfos(self);
	b_kapitelwechsel(1,NEWWORLD_ZEN);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_XARDAS_EXIT(C_INFO)
{
	npc = none_100_xardas;
	nr = 999;
	condition = dia_xardas_exit_condition;
	information = dia_xardas_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_xardas_exit_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_firstexit) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_HELLO(C_INFO)
{
	npc = none_100_xardas;
	nr = 1;
	condition = dia_xardas_hello_condition;
	information = dia_xardas_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_xardas_hello_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_xardas_hello_info()
{
	AI_Output(self,other,"DIA_Xardas_Hello_14_00");	//Nareszcie! Pr�buj� ci� tu sprowadzi� od wielu dni.
	AI_Output(other,self,"DIA_Xardas_Hello_15_01");	//Czuj� si�, jakbym przez trzy tygodnie le�a� przygnieciony ci�kimi g�azami.
	AI_Output(self,other,"DIA_Xardas_Hello_14_02");	//Bo tak w�a�nie by�o. Tylko magiczna aura twojego pancerza utrzyma�a ci� przy �yciu. Ale do�� tej rozmowy. Wkr�tce odzyskasz si�y.
	AI_Output(other,self,"DIA_Xardas_Hello_15_03");	//Mam na to wystarczaj�co du�o czasu. W ko�cu zwyci�y�em! �ni�cy zosta�...
	AI_Output(self,other,"DIA_Xardas_Hello_14_04");	//... wygnany z naszego �wiata. Przep�dzi�e� go, to prawda, ale powstrzymanie nadci�gaj�cej wojny nie le�y ju� w naszej mocy.
	AI_Output(other,self,"DIA_Xardas_Hello_15_05");	//M�wisz o wojnie z orkami?
	AI_Output(self,other,"DIA_Xardas_Hello_14_06");	//M�wi� o istotach znacznie pot�niejszych od ork�w.
	AI_Output(self,other,"DIA_Xardas_Hello_14_07");	//Swym ostatnim krzykiem rozpaczy �ni�cy przywo�a� pot�n� armi� z�a.
	AI_Output(self,other,"DIA_Xardas_Hello_14_08");	//By� to wyra�ny rozkaz dla wszystkich istot ciemno�ci. Pot�ne s�owo magii, kt�remu nie mog�y odm�wi�.
	AI_Output(self,other,"DIA_Xardas_Hello_14_09");	//Jego ostatni rozkaz brzmia� 'PRZYBYWAJCIE'. I przyby�y wszystkie... nawet smoki.
	AI_Output(other,self,"DIA_Xardas_Hello_15_10");	//Smoki!
	AI_Output(self,other,"DIA_Xardas_Hello_14_11");	//Tak, nawet te pot�ne, prastare istoty. Wyczuwam ich obecno�� tak�e tutaj.
	AI_Output(self,other,"DIA_Xardas_Hello_14_12");	//Smoki zebra�y wok� siebie liczn� armi� s�u��cych im istot.
	AI_Output(other,self,"DIA_Xardas_Hello_15_13");	//Gdzie jest teraz ta armia?
	AI_Output(self,other,"DIA_Xardas_Hello_14_14");	//Zaleg�a obozem ca�kiem blisko st�d, w G�rniczej Dolinie, niedaleko Khorinis. Teraz przygotowuje si� do ostatecznego ataku.
	AI_Output(self,other,"DIA_Xardas_Hello_14_15");	//Zosta�o nam niewiele czasu.
};


instance DIA_XARDAS_AWAY(C_INFO)
{
	npc = none_100_xardas;
	nr = 1;
	condition = dia_xardas_away_condition;
	information = dia_xardas_away_info;
	permanent = FALSE;
	description = "Zatem wyno�my si� st�d czym pr�dzej!";
};


func int dia_xardas_away_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_hello) && !Npc_KnowsInfo(other,dia_xardas_todo) && !Npc_KnowsInfo(other,dia_xardas_firstexit) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_away_info()
{
	AI_Output(other,self,"DIA_Xardas_AWAY_15_00");	//Zatem wyno�my si� st�d czym pr�dzej!
	AI_Output(self,other,"DIA_Xardas_AWAY_14_01");	//Je�li nawet zdo�amy teraz uciec, smoki w ko�cu nas odnajd�.
	AI_Output(self,other,"DIA_Xardas_AWAY_14_02");	//Ale z pomoc� tutejszych �o�nierzy i mag�w, mo�emy je jeszcze powstrzyma�, nim zbytnio urosn� w si��.
	AI_Output(self,other,"DIA_Xardas_AWAY_14_03");	//Lepszej szansy chyba ju� nie dostaniemy.
};


instance DIA_XARDAS_TODO(C_INFO)
{
	npc = none_100_xardas;
	nr = 2;
	condition = dia_xardas_todo_condition;
	information = dia_xardas_todo_info;
	permanent = FALSE;
	description = "Co mo�emy zrobi�?";
};


func int dia_xardas_todo_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_hello) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_todo_info()
{
	AI_Output(other,self,"DIA_Xardas_TODO_15_00");	//Co mo�emy zrobi�?
	AI_Output(self,other,"DIA_Xardas_TODO_14_01");	//Tym razem sami sobie nie poradzimy. W walce ze smokami mo�e nam pom�c tylko moc Innosa.
	AI_Output(self,other,"DIA_Xardas_TODO_14_02");	//W pobliskim mie�cie Khorinis stacjonuje oddzia� paladyn�w.
	AI_Output(self,other,"DIA_Xardas_TODO_14_03");	//W ich posiadaniu znajduje si� pewien pot�ny artefakt, dzi�ki kt�remu mo�emy pokona� paskudne gady.
	AI_Output(self,other,"DIA_Xardas_TODO_14_04");	//Nazywaj� go 'Okiem Innosa'. Musisz koniecznie zdoby� to Oko.
	AI_Output(self,other,"DIA_Xardas_TODO_14_05");	//Ostrze� paladyn�w o smokach i za wszelk� cen� przekonaj ich dow�dc�, by nam pom�g�.
	Log_CreateTopic(TOPIC_INNOSEYE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_INNOSEYE,LOG_RUNNING);
	b_logentry(TOPIC_INNOSEYE,"W mie�cie Khorinis przebywa grupa paladyn�w. Maj� ze sob� pot�ny artefakt, Oko Innosa, kt�rego moc pomo�e nam pokona� smoki. Musz� tylko przekona� paladyn�w, aby wsparli nasz� spraw�.");
};


instance DIA_XARDAS_WEAPON(C_INFO)
{
	npc = none_100_xardas;
	nr = 5;
	condition = dia_xardas_weapon_condition;
	information = dia_xardas_weapon_info;
	permanent = FALSE;
	description = "Potrzebuj� broni.";
};


func int dia_xardas_weapon_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_hello) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_weapon_info()
{
	AI_Output(other,self,"DIA_Xardas_WEAPON_15_00");	//Potrzebuj� broni.
	AI_Output(self,other,"DIA_Xardas_WEAPON_14_01");	//Mog� ci da� tylko to, co znajdziesz w mojej wie�y.
	AI_Output(self,other,"DIA_Xardas_WEAPON_14_02");	//Rozejrzyj si� tu troch�. Cokolwiek uznasz za przydatne, nale�y do ciebie.
};


instance DIA_XARDAS_ARTEFAKT(C_INFO)
{
	npc = none_100_xardas;
	nr = 2;
	condition = dia_xardas_artefakt_condition;
	information = dia_xardas_artefakt_info;
	permanent = FALSE;
	description = "Czym dok�adnie jest 'Oko Innosa'?";
};


func int dia_xardas_artefakt_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_todo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_artefakt_info()
{
	AI_Output(other,self,"DIA_Xardas_ARTEFAKT_15_00");	//Czym dok�adnie jest 'Oko Innosa'?
	AI_Output(self,other,"DIA_Xardas_ARTEFAKT_14_01");	//To magiczny amulet. Legenda g�osi, �e sam Innos wla� we� cz�� swojej boskiej mocy.
	AI_Output(self,other,"DIA_Xardas_ARTEFAKT_14_02");	//Dzi�ki niemu odzyskasz cz�� dawnych si� i b�dziesz m�g� stawi� czo�a smokom.
	AI_Output(self,other,"DIA_Xardas_ARTEFAKT_14_03");	//Oko ma te� inne, tajemnicze w�a�ciwo�ci, ale o nich opowiem ci, gdy ju� zdob�dziesz amulet.
};


instance DIA_XARDAS_PALADIN(C_INFO)
{
	npc = none_100_xardas;
	nr = 3;
	condition = dia_xardas_paladin_condition;
	information = dia_xardas_paladin_info;
	permanent = FALSE;
	description = "Dlaczego paladyni mieliby mi da� Oko Innosa?";
};


func int dia_xardas_paladin_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_todo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_paladin_info()
{
	AI_Output(other,self,"DIA_Xardas_PALADIN_15_00");	//Dlaczego paladyni mieliby mi da� Oko Innosa?
	AI_Output(self,other,"DIA_Xardas_PALADIN_14_01");	//Bo twoim przeznaczeniem jest nosi� ten amulet.
	AI_Output(other,self,"DIA_Xardas_PALADIN_15_02");	//Sk�d ta pewno��?
	AI_Output(self,other,"DIA_Xardas_PALADIN_14_03");	//Jest kilka przes�anek. Najwa�niejsz� z nich jest fakt, �e pokona�e� �ni�cego. Gdyby� nie by� ulubie�cem bog�w, ju� dawno by� nie �y�.
	AI_Output(other,self,"DIA_Xardas_PALADIN_15_04");	//Za��my, �e masz racj� i rzeczywi�cie pisane mi jest posiadanie Oka Innosa. Jak mam o tym przekona� paladyn�w?
	AI_Output(self,other,"DIA_Xardas_PALADIN_14_05");	//Oko Innosa samo wybiera swojego posiadacza. Je�li uda ci si� je zdoby� i za�o�y�, paladyni b�d� musieli uzna� prawdziwo�� twoich s��w.
};


instance DIA_XARDAS_KHORINIS(C_INFO)
{
	npc = none_100_xardas;
	nr = 4;
	condition = dia_xardas_khorinis_condition;
	information = dia_xardas_khorinis_info;
	permanent = FALSE;
	description = "Jak si� dosta� do miasta?";
};


func int dia_xardas_khorinis_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_todo) && (lothar.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_khorinis_info()
{
	AI_Output(other,self,"DIA_Xardas_Khorinis_15_00");	//Jak si� dosta� do miasta?
	AI_Output(self,other,"DIA_Xardas_Khorinis_14_01");	//Id� po prostu w d� �cie�ki prowadz�cej od drzwi mojej wie�y. Miasto jest du�e, z pewno�ci� je zauwa�ysz.
	AI_Output(self,other,"DIA_Xardas_Khorinis_14_02");	//Tylko uwa�aj! Droga do miasta naje�ona jest niebezpiecze�stwami, a ty nie jeste� tak silny jak kiedy�.
};


instance DIA_XARDAS_WHEREEX(C_INFO)
{
	npc = none_100_xardas;
	nr = 6;
	condition = dia_xardas_whereex_condition;
	information = dia_xardas_whereex_info;
	permanent = FALSE;
	description = "Gdzie my w og�le jeste�my?";
};


func int dia_xardas_whereex_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_firstexit) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_whereex_info()
{
	AI_Output(other,self,"DIA_Xardas_Add_15_00");	//Gdzie my w og�le jeste�my?
	AI_Output(self,other,"DIA_Xardas_Add_14_01");	//M�wi�em ci ju� - niedaleko miasta Khorinis.
	AI_Output(self,other,"DIA_Xardas_Add_14_02");	//Odbudowa�em tutaj moj� wie��.
	AI_Output(other,self,"DIA_Xardas_Add_15_03");	//Przecie� nie min�� miesi�c, odk�d widzieli�my si� w G�rniczej Dolinie!
	AI_Output(self,other,"DIA_Xardas_Add_14_04");	//S�udzy, kt�rych wezwa�em do budowy mojej wie�y, uwin�li si� bardzo sprawnie...
	AI_Output(other,self,"DIA_Xardas_Add_15_05");	//Trudno zaprzeczy�.
};


instance DIA_XARDAS_EQUIPMENT(C_INFO)
{
	npc = none_100_xardas;
	nr = 7;
	condition = dia_xardas_equipment_condition;
	information = dia_xardas_equipment_info;
	permanent = FALSE;
	description = "Gdzie mog� znale�� lepsze wyposa�enie?";
};


func int dia_xardas_equipment_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_weapon) && Npc_KnowsInfo(other,dia_xardas_firstexit) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_equipment_info()
{
	AI_Output(other,self,"DIA_Xardas_EQUIPMENT_15_00");	//Gdzie mog� znale�� lepsze wyposa�enie?
	AI_Output(self,other,"DIA_Xardas_EQUIPMENT_14_01");	//Je�li chcesz kupi� bro� i pancerz, musisz pewnie uda� si� do Khorinis.
	AI_Output(self,other,"DIA_Xardas_EQUIPMENT_14_02");	//Ale w dolinie znajdziesz lecznicze zio�a, kt�re przywr�c� ci si�y utracone w walce.
	AI_Output(self,other,"DIA_Xardas_EQUIPMENT_14_03");	//Wybierz si� te� nad jezioro, tu� przed moj� wie��. Znajdziesz tam ukryte przej�cie do doliny.
};


instance DIA_XARDAS_ABOUTLESTER(C_INFO)
{
	npc = none_100_xardas;
	nr = 5;
	condition = dia_xardas_aboutlester_condition;
	information = dia_xardas_aboutlester_info;
	permanent = FALSE;
	description = "Rozmawia�e� ju� z Lesterem?";
};


func int dia_xardas_aboutlester_condition()
{
	if(Npc_KnowsInfo(other,dia_lester_send_xardas) && (Npc_GetDistToWP(lester,"NW_XARDAS_TOWER_IN1_31") <= 500) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_aboutlester_info()
{
	AI_Output(other,self,"DIA_Xardas_ABOUTLESTER_15_00");	//Rozmawia�e� ju� z Lesterem?
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_01");	//Tak, zasypa�em go pytaniami. Du�o si� od niego dowiedzia�em. Jest teraz kompletnie wyczerpany.
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_02");	//To prawdziwy cud, �e w og�le prze�y� t� ucieczk�. Kaza�em mu troch� odpocz��.
	AI_Output(other,self,"DIA_Xardas_ABOUTLESTER_15_03");	//Czego si� od niego dowiedzia�e�?
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_04");	//Niestety, niczego dobrego. Nie do��, �e widzia� smoka, to spotka� te� ludzi w czarnych kapturach.
	AI_Output(other,self,"DIA_Xardas_ABOUTLESTER_15_05");	//To takie wa�ne?
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_06");	//Je�li ci ludzie rzeczywi�cie istniej�, b�d� dla nas powa�nym zagro�eniem.
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_07");	//Niepokoi mnie to. Prosz�, we� m�j pier�cie�. B�dzie ci� chroni� przed magi�.
	b_giveinvitems(self,other,5353,1);
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_XARDAS_FIRSTPAL(C_INFO)
{
	npc = none_100_xardas;
	nr = 10;
	condition = dia_xardas_firstpal_condition;
	information = dia_xardas_firstpal_info;
	permanent = FALSE;
	description = "By�em w mie�cie...";
};


func int dia_xardas_firstpal_condition()
{
	if((lothar.aivar[AIV_TALKEDTOPLAYER] == TRUE) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_xardas_firstpal_info()
{
	AI_Output(other,self,"DIA_Xardas_FirstPal_15_00");	//By�em w mie�cie...
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_01");	//Uda�o ci si� porozmawia� z przyw�dc� paladyn�w?
	AI_Output(other,self,"DIA_Xardas_FirstPal_15_02");	//Nie. Nie chc� mnie dopu�ci� przed jego oblicze...
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_03");	//G�upcy! Musi by� jaki� spos�b, by� do niego dotar�.
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_04");	//Gdyby nie by�o innego wyj�cia, dosta� si� do klasztoru i zosta� magiem.
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_05");	//Mo�e to troch� moralnie dwuznaczne, ale przynajmniej osi�gniesz sw�j cel.
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_06");	//Gdyby� by� magiem, przyw�dca paladyn�w musia�by si� z tob� spotka�.
};


instance DIA_XARDAS_WEITER(C_INFO)
{
	npc = none_100_xardas;
	nr = 99;
	condition = dia_xardas_weiter_condition;
	information = dia_xardas_weiter_info;
	permanent = TRUE;
	description = "Wi�c co mam teraz robi�?";
};


func int dia_xardas_weiter_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_firstexit) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_weiter_info()
{
	AI_Output(other,self,"DIA_Xardas_Weiter_15_00");	//Wi�c co mam teraz robi�?
	AI_Output(self,other,"DIA_Xardas_Weiter_14_01");	//Post�pujmy dalej zgodnie z planem. Chwilowo nie widz� innej drogi.
	AI_Output(self,other,"DIA_Xardas_Weiter_14_02");	//Postaraj si� zdoby� Oko Innosa. Ja w tym czasie poszukam odpowiedzi na moje pytania.
};


instance DIA_XARDAS_KDFSECRET(C_INFO)
{
	npc = none_100_xardas;
	nr = 9;
	condition = dia_xardas_kdfsecret_condition;
	information = dia_xardas_kdfsecret_info;
	permanent = FALSE;
	description = "Dlaczego Kr�g Ognia nie mo�e si� o tobie dowiedzie�?";
};


func int dia_xardas_kdfsecret_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_firstexit))
	{
		return TRUE;
	};
};

func void dia_xardas_kdfsecret_info()
{
	AI_Output(other,self,"DIA_Xardas_KdfSecret_15_00");	//Dlaczego Kr�g Ognia nie mo�e si� o tobie dowiedzie�?
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_01");	//Kiedy� by�em wysoko w hierarchii kr�gu. Jednak ju� wtedy podejrzewa�em, �e kluczem do Bariery jest magia demon�w.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_02");	//Oczywi�cie nigdy nie uda�o mi si� przekona� o tym pozosta�ych mag�w.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_03");	//Dlatego opu�ci�em Kr�g i odda�em si� badaniu tajemnic mrocznych sztuk.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_04");	//To zbrodnia, kt�rej 'Bogobojni Wyznawcy Innosa', 'Dobrzy' i 'Cnotliwi' Magowie Ognia nigdy mi nie wybacz�.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_05");	//Zapewne wiedz�, �e wci�� �yj�, ale nie maj� poj�cia, gdzie mnie szuka�. I niech tak pozostanie.
};


instance DIA_XARDAS_KAP3_EXIT(C_INFO)
{
	npc = none_100_xardas;
	nr = 999;
	condition = dia_xardas_kap3_exit_condition;
	information = dia_xardas_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_xardas_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_xardas_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_BACKFROMOW(C_INFO)
{
	npc = none_100_xardas;
	nr = 31;
	condition = dia_xardas_backfromow_condition;
	information = dia_xardas_backfromow_info;
	description = "Wracam z G�rniczej Doliny.";
};


func int dia_xardas_backfromow_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_xardas_backfromow_info()
{
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_00");	//Wracam z G�rniczej Doliny.
	AI_Output(self,other,"DIA_Xardas_BACKFROMOW_14_01");	//Najwy�szy czas. Co tam widzia�e�?
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_02");	//Mia�e� racj�. W dolinie stacjonuje pot�na armia nieprzyjaciela.
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_03");	//Orkowie oblegaj� zamek, a smoki pustosz� okoliczne tereny.
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_04");	//Je�li si� nie myl�, wkr�tce ca�a armia ruszy na Khorinis.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_XARDAS_DMTSINDDA(C_INFO)
{
	npc = none_100_xardas;
	nr = 32;
	condition = dia_xardas_dmtsindda_condition;
	information = dia_xardas_dmtsindda_info;
	description = "Co si� tu do diab�a dzia�o pod moj� nieobecno��?";
};


func int dia_xardas_dmtsindda_condition()
{
	if((KAPITEL == 3) && Npc_KnowsInfo(other,dia_xardas_backfromow))
	{
		return TRUE;
	};
};

func void dia_xardas_dmtsindda_info()
{
	if(Npc_KnowsInfo(other,dia_lester_backintown))
	{
		AI_Output(other,self,"DIA_Xardas_DMTSINDDA_15_00");	//Lester powiedzia�, �e chcesz si� ze mn� widzie�.
	};
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_15_01");	//Co si� tu do diab�a dzia�o pod moj� nieobecno��?
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_14_02");	//Nasz przeciwnik dowiedzia� si�, kim jeste� naprawd�, i �e zamierzasz zdoby� Oko Innosa.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_14_03");	//Zda� sobie spraw� z zagro�enia, wi�c postanowi� wyj�� z ukrycia i zaatakowa� otwarcie.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_14_04");	//Zabawa w chowanego ju� si� sko�czy�a. Jeszcze wczoraj nikt nie wiedzia�, z kt�rej strony nadejdzie cios. Dzi� nie ma co do tego �adnych w�tpliwo�ci.
	b_logentry(TOPIC_INNOSEYE,"Wr�g dowiedzia� si�, �e szukam Oka Innosa. Musz� je jak najszybciej znale��, zanim b�dzie za p�no.");
	Info_ClearChoices(dia_xardas_dmtsindda);
	Info_AddChoice(dia_xardas_dmtsindda,"Zaatakowali mnie magowie w czarnych szatach.",dia_xardas_dmtsindda_dmt);
	Info_AddChoice(dia_xardas_dmtsindda,"Wreszcie uda�o mi si� zdoby� dow�d dla Lorda Hagena.",dia_xardas_dmtsindda_beweis);
};

func void dia_xardas_dmtsindda_dmt()
{
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_DMT_15_00");	//Zaatakowali mnie magowie w czarnych szatach.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_14_01");	//Wr�g ma wiele twarzy. Poszukiwacze to w�a�nie jedna z nich. Ale oni tylko przygotowuj� teren na przybycie prawdziwego przeciwnika.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_14_02");	//Zaj�li ju� pozycje w strategicznych miejscach. Teraz czekaj� tylko na dogodn� okazj�, by zacisn�� p�tl� side�.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_14_03");	//Trzymaj si� od nich z dala. To pot�ne, magiczne istoty, kt�re za wszelk� cen� spr�buj� ci� powstrzyma�.
	if(hero.guild == GIL_KDF)
	{
		Log_CreateTopic(TOPIC_DEMENTOREN,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DEMENTOREN,LOG_RUNNING);
		b_logentry(TOPIC_DEMENTOREN,"Xardas wie o odzianych na czarno m�czyznach. Wygl�da na to, �e tak naprawd� to Poszukiwacze poci�gaj� za sznurki, i s� bardzo niebezpiecznymi przeciwnikami.");
	};
};

func void dia_xardas_dmtsindda_beweis()
{
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_Beweis_15_00");	//Znalaz�em wreszcie dow�d, kt�rego domaga� si� Lord Hagen.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_Beweis_14_01");	//Co to za dow�d?
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_Beweis_15_02");	//Otrzyma�em list od Garonda, dow�dcy paladyn�w w G�rniczej Dolinie. Prosi w nim o posi�ki.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_Beweis_14_03");	//To powinno wystarczy�, by przekona� Hagena. Dobra robota.
	Info_AddChoice(dia_xardas_dmtsindda,"Co mam teraz robi�?",dia_xardas_dmtsindda_dmt_whattodo);
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_xardas_dmtsindda_dmt_whattodo()
{
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_15_00");	//Co mam teraz robi�?
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_01");	//Zanie� Hagenowi list od Garonda. Z takim dowodem w r�ku zostaniesz dopuszczony do Oka Innosa.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_02");	//Potem udaj si� do Pyrokara. To on da ci Oko.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_03");	//Musisz koniecznie zabra� ten artefakt w bezpieczne miejsce.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_04");	//Id� ju�, zanim b�dzie za p�no. Wr�g te� spr�buje zdoby� amulet dla siebie.
	b_logentry(TOPIC_INNOSEYE,"Oko znajduje si� w klasztorze Mag�w Ognia. Mam nadziej�, �e Lord Hagen pozwoli mi si� do niego dosta�, kiedy dostarcz� mu wiadomo�� od Lorda Garonda. Mag Ognia Pyrokar nie dopu�ci mnie w pobli�e amuletu, je�li nie b�d� mia� poparcia Hagena.");
};


instance DIA_XARDAS_INNOSEYEBROKEN(C_INFO)
{
	npc = none_100_xardas;
	nr = 33;
	condition = dia_xardas_innoseyebroken_condition;
	information = dia_xardas_innoseyebroken_info;
	description = "Oko Innosa zosta�o zniszczone.";
};


func int dia_xardas_innoseyebroken_condition()
{
	if((KAPITEL == 3) && Npc_KnowsInfo(other,dia_xardas_dmtsindda) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)))
	{
		return TRUE;
	};
};

func void dia_xardas_innoseyebroken_info()
{
	AI_Output(other,self,"DIA_Xardas_INNOSEYEBROKEN_15_00");	//Oko Innosa zosta�o zniszczone.
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_14_01");	//Jak to mo�liwe? Zniszczone?!
	AI_Output(other,self,"DIA_Xardas_INNOSEYEBROKEN_15_02");	//Znalaz�em je w p�nocnych lasach. Niestety, uda�o mi si� odzyska� tylko kawa�ki.
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_14_03");	//To by�a nasza jedyna szansa na pokonanie tych smok�w! Wszystko stracone.
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_xardas_innoseyebroken);
	Info_AddChoice(dia_xardas_innoseyebroken,"Co teraz?",dia_xardas_innoseyebroken_wasnun);
};

func void dia_xardas_innoseyebroken_wasnun()
{
	AI_Output(other,self,"DIA_Xardas_INNOSEYEBROKEN_wasnun_15_00");	//Co teraz?
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_wasnun_14_01");	//To straszliwy cios. Niepr�dko si� po nim podniesiemy. Musz� przemy�le� ca�� spraw� w spokoju.
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_wasnun_14_02");	//W mi�dzyczasie powiniene� uda� si� do miasta i porozmawia� z Magiem Wody imieniem Vatras. Mo�e on b�dzie wiedzia�, co wypada czyni� dalej.
	b_logentry(TOPIC_INNOSEYE,"Xardas nie by� zachwycony, kiedy dowiedzia� si�, �e Oko Innosa zosta�o zniszczone. Jedyn� nasz� nadziej� jest Vatras, Mag Wody z miasta Khorinis.");
	MIS_XARDAS_GOTOVATRASINNOSEYE = LOG_RUNNING;
};


instance DIA_XARDAS_RITUALREQUEST(C_INFO)
{
	npc = none_100_xardas;
	nr = 34;
	condition = dia_xardas_ritualrequest_condition;
	information = dia_xardas_ritualrequest_info;
	description = "Vatras przys�a� mnie do ciebie.";
};


func int dia_xardas_ritualrequest_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && Npc_KnowsInfo(other,dia_xardas_innoseyebroken) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_xardas_ritualrequest_info()
{
	AI_Output(other,self,"DIA_Xardas_RITUALREQUEST_15_00");	//Vatras przys�a� mnie do ciebie.
	AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_01");	//To dobrze. Co ci powiedzia�?
	AI_Output(other,self,"DIA_Xardas_RITUALREQUEST_15_02");	//Wspomnia� co� o rytuale odwr�cenia, kt�ry nale�y odprawi� w S�onecznym Kr�gu.
	AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_03");	//Ten stary wyga! Chyba wiem, co planuje. Przybywasz, by przekaza� mi jego zaproszenie?
	AI_Output(other,self,"DIA_Xardas_RITUALREQUEST_15_04");	//Na to wygl�da. Kiedy wyruszysz?
	AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_05");	//Bezzw�ocznie. Ty musisz jeszcze wype�ni� swoje zadania. Potem zn�w si� spotkamy.
	AI_StopProcessInfos(self);
	b_logentry(TOPIC_INNOSEYE,"Xardas zgodzi� si� przyj�� do Kr�gu Ognia na rytua�.");
	b_giveplayerxp(XP_AMBIENT);
	Npc_ExchangeRoutine(self,"RitualInnosEyeRepair");
	XARDAS_GOESTORITUALINNOSEYE = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_XARDAS_BINGESPANNT(C_INFO)
{
	npc = none_100_xardas;
	nr = 35;
	condition = dia_xardas_bingespannt_condition;
	information = dia_xardas_bingespannt_info;
	permanent = TRUE;
	description = "Czy ten rytua� odwr�cenia ma szans� si� powie��?";
};


func int dia_xardas_bingespannt_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && (KAPITEL == 3) && (XARDAS_GOESTORITUALINNOSEYE == TRUE))
	{
		return TRUE;
	};
};

func void dia_xardas_bingespannt_info()
{
	AI_Output(other,self,"DIA_Xardas_BINGESPANNT_15_00");	//Czy ten rytua� odwr�cenia ma szans� si� powie��?
	AI_Output(self,other,"DIA_Xardas_BINGESPANNT_14_01");	//Nie mo�emy mie� pewno�ci. Wszystko zale�y od szczeg��w planu Vatrasa.
};


instance DIA_XARDAS_PYROWILLNICHT(C_INFO)
{
	npc = none_100_xardas;
	nr = 37;
	condition = dia_xardas_pyrowillnicht_condition;
	information = dia_xardas_pyrowillnicht_info;
	description = "Pyrokar nie chce si� stawi� na spotkanie.";
};


func int dia_xardas_pyrowillnicht_condition()
{
	if((PYROKAR_DENIESINNOSEYERITUAL == TRUE) && Npc_KnowsInfo(other,dia_xardas_ritualrequest) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_xardas_pyrowillnicht_info()
{
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_00");	//Pyrokar nie chce si� stawi� na spotkanie.
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_01");	//Domaga si� dowodu, �e mo�na ci zaufa�.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_02");	//Czy�by? Pyrokar, tak? To ciekawe.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_03");	//Ten stary cap zaczyna mnie irytowa�. Ale chyba mam tu co�, co mo�e go przekona�.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_04");	//Opuszczaj�c Zakon Mag�w Ognia, zabra�em ze sob� kilka drobiazg�w.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_06");	//Nie chc�, by oddzia� paladyn�w i mag�w przetrz�sn�� moj� wie�� i znalaz� te rzeczy.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_07");	//Dlatego ukry�em je w bezpiecznym miejscu, w kt�rym magowie nigdy nie b�d� ich szuka�.
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_08");	//Gdzie dok�adnie?
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_09");	//Cz�� z nich le�y zamkni�ta w skrzyni na farmie Sekoba.
	SEKOB_ROOMFREE = TRUE;
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_10");	//Ufasz temu Sekobowi?
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_11");	//Nie, ale mo�na go kupi�, a wtedy nie zadaje niewygodnych pyta�. Poza tym - skrzynia jest zamkni�ta. Oto klucz.
	CreateInvItems(self,itke_chest_sekob_xardasbook_mis,1);
	b_giveinvitems(self,other,5780,1);
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_12");	//Znajdziesz tam mi�dzy innymi pewn� star� ksi�g�. Gdy Pyrokar j� zobaczy, b�dzie wiedzia�, �e to prezent ode mnie.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_13");	//Ja ju� nie b�d� mia� z niej po�ytku, wi�c przynajmniej tobie na co� si� przyda.
	b_logentry(TOPIC_INNOSEYE,"Xardas da� mi klucz do kufra na farmie Sekoba. W �rodku znajd� ksi��k�, kt�r� mam wr�czy� Pyrokarowi.");
};


instance DIA_XARDAS_RITUALINNOSEYEREPAIRIMPORTANT(C_INFO)
{
	npc = none_100_xardas;
	nr = 36;
	condition = dia_xardas_ritualinnoseyerepairimportant_condition;
	information = dia_xardas_ritualinnoseyerepairimportant_info;
	important = TRUE;
};


func int dia_xardas_ritualinnoseyerepairimportant_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_SUCCESS) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_xardas_ritualinnoseyerepairimportant_info()
{
	AI_Output(self,other,"DIA_Xardas_Add_14_06");	//Teraz, gdy Oko Innosa zosta�o naprawione, musisz stawi� czo�a smokom.
	AI_Output(self,other,"DIA_Xardas_Add_14_07");	//Wszystkie one s� s�ugami Beliara, boga ciemno�ci.
	AI_Output(self,other,"DIA_Xardas_Add_14_08");	//Ale bezpo�rednie rozkazy musz� otrzymywa� z tego �wiata. Tyle uda�o mi si� do tej pory ustali�.
	AI_Output(self,other,"DIA_Xardas_Add_14_09");	//Dowiedz si�, co jest �r�d�em ich pot�gi.
	AI_Output(self,other,"DIA_Xardas_Add_14_10");	//Potem wracaj czym pr�dzej do mnie.
	Info_ClearChoices(dia_xardas_ritualinnoseyerepairimportant);
	Info_AddChoice(dia_xardas_ritualinnoseyerepairimportant,DIALOG_ENDE,dia_xardas_ritualinnoseyerepairimportant_weiter);
};

func void dia_xardas_ritualinnoseyerepairimportant_weiter()
{
	AI_StopProcessInfos(self);
	b_startotherroutine(xardas,"Start");
	b_startotherroutine(vatras,"Start");
};


instance DIA_XARDAS_WASNUN(C_INFO)
{
	npc = none_100_xardas;
	nr = 36;
	condition = dia_xardas_wasnun_condition;
	information = dia_xardas_wasnun_info;
	permanent = TRUE;
	description = "Oko Innosa zosta�o naprawione. Co teraz?";
};


func int dia_xardas_wasnun_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_SUCCESS) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_xardas_wasnun_info()
{
	AI_Output(other,self,"DIA_Xardas_WASNUN_15_00");	//Oko Innosa zosta�o naprawione. Co teraz?
	AI_Output(self,other,"DIA_Xardas_WASNUN_14_01");	//Pami�taj, by zak�ada� je za ka�dym razem, gdy przyjdzie ci walczy� ze smokiem.
	if(MIS_READYFORCHAPTER4 == TRUE)
	{
		AI_Output(self,other,"DIA_Xardas_WASNUN_14_02");	//Nie tra� czasu. Zejd� teraz do G�rniczej Doliny i rozpraw si� ze smokami.
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_WASNUN_14_03");	//Id� do Pyrokara. Niech ci wyja�ni, jak pos�ugiwa� si� Okiem.
	};
};


instance DIA_XARDAS_KAP4_EXIT(C_INFO)
{
	npc = none_100_xardas;
	nr = 999;
	condition = dia_xardas_kap4_exit_condition;
	information = dia_xardas_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_xardas_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_xardas_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_PERM4(C_INFO)
{
	npc = none_100_xardas;
	nr = 40;
	condition = dia_xardas_perm4_condition;
	information = dia_xardas_perm4_info;
	permanent = TRUE;
	description = "Co nowego?";
};


func int dia_xardas_perm4_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_xardas_perm4_info()
{
	AI_Output(other,self,"DIA_Xardas_PERM4_15_00");	//Co nowego?
	AI_Output(self,other,"DIA_Xardas_PERM4_14_01");	//Poszukiwacze nadal kr�c� si� w pobli�u. Nie spoczn�, p�ki nie przeci�gn� ci� na swoj� stron�.
	AI_Output(self,other,"DIA_Xardas_PERM4_14_02");	//Zabij smoki z G�rniczej Doliny i dowiedz si�, kto stoi za tymi atakami. W przeciwnym wypadku ich si�a jeszcze wzro�nie!
};


instance DIA_XARDAS_KAP5_EXIT(C_INFO)
{
	npc = none_100_xardas;
	nr = 999;
	condition = dia_xardas_kap5_exit_condition;
	information = dia_xardas_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_xardas_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_xardas_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_KAP6_EXIT(C_INFO)
{
	npc = none_100_xardas;
	nr = 999;
	condition = dia_xardas_kap6_exit_condition;
	information = dia_xardas_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_xardas_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_xardas_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

