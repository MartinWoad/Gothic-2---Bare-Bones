//#################################################################
//
//  32 bit IEEE 754 floats (kurz: Gleitkommazahlen) f�r Daedalus:
//      Urspr�ngliches Skript vom 26.11.2008:
//        http://forum.worldofplayers.de/forum/threads/500080-Instrumentarium-Floats
//
//  Diese Version beh�lt das urspr�ngliche Interface bei,
//  nutzt aber tats�chliche Floating-Point Instruktionen.
//  Diese Version ist daher schneller und genauer.
//
//  Ben�tigt wird Ikarus.
//
//  Fertigstellung am 6.4.2012:
//      - Umstellung auf Ikarus
//      - Erg�nzung von castFromIntf und castToIntf
//
//#################################################################

/*####################################
//      Kurzdokumentation
//####################################

//*********************
//  Grunds�tzliches
//*********************

Die Funktionen in diesem Skript sind in der Lage Floating Point Operationen auszuf�hren. Als Beh�ltnis f�r die Gleitkommadaten dient hierbei ein gew�hnlicher 32-bit Integer.
Hintergrund ein syntaktische Unterscheidung zwischen Integern und Floats nicht mehr vorzunehmen ist, dass syntaktische Floats wesentlichen Einschr�nkung seitens des Gothic Parsers unterworfen sind.
Es ist daher von Nutzerseite darauf zu achten, Floats und integer trotz des formal gleichen Datentyps penibel zu unterscheiden. Wenn eine Zahl in Floatdarstellung mit einer Zahl in Integerdarstellung verrechnet wird, oder Funktionen auf integer angewendet werden, die eigentlich f�r floats gedacht sind oder umgekehrt kommt Bl�dsinn heraus.

//************************************
//  Das Instrumentarium
//************************************

Um mit floats rechnen zu k�nnen, m�ssen diese zun�chst erzeugt werden. Dazu gibt es die Funktionen mkf und fracf, die eine Integer Ganzzahl bzw. einen Bruch mit ganzzahligem Z�hler und Nenner in einen float umwandeln.
Floats k�nnen untereinander addiert, subtrahiert, multipliziert und dividiert werden. Eine Wurzelfunktion ist ebenfalls definiert.
Um den Wert der floats intepretieren zu k�nnen, sind die Ordnungsrelationen >=, >, <, <= mit den Funktionen ge, g, l, le gegeben.
Ferner k�nnen Floats mit der truncf und roundf Funktion zur�ck in einen Integer konvertiert werden.

//************************************
//  Die Funktionen im �berblick:
//************************************

"func float" und "var float" wie hier angegeben gibt es nicht wirklich (f�r Gothic sind alles integer). Diese Notation soll hier nur zur Veranschaulichung dienen.
Um sich die Funktionsnamen merken zu k�nnen hilft vielleicht folgende Liste, die die Abk�rzungen erkl�rt:

mkf    = make float
truncf = truncate float
roundf = round float
addf   = add floats
subf   = subtract floats
negf   = negate float
mulf   = multiply floats
divf   = divide floats
invf   = inverse float
gf     = greater
gef    = greater or equal
lf     = lower
lef    = lower or equal
sqrf   = squre float
sqrtf  = square root of float
printf = print float

**************** Umwandlung *******************
func float mkf (var int x) //Erzeugt die Floatdarstellung aus einer Ganzzahl.
func int truncf (var float x) //reduziert einen float auf seinen Ganzzahlanteil, wobei alle Nachkommastellen verworfen werden. Der Ergebnistyp ist Integer. (-1.5 w�rde zu -1.0, nicht zu -2)
func int roundf (var float x) //reduziert einen float auf die n�chstgelegende Ganzzahl. Der Ergebnistyp ist Integer.

**************** Addition *********************
func float addf (var float x, var float y) //addiert x und y und gibt das Ergebnis zur�ck.
func float subf (var float x, var float y) //subtrahiert y von x und gibt das Ergebnis zur�ck.
func float negf (var float x) //Gibt das additive Inverse von x (also -x) zur�ck.

**************** Multiplikation ***************
func float mulf (var float x, var float y) //multipliziert x und y miteinander und gibt das Ergebnis zur�ck.
func float divf (var float x, var float y) //dividiert x durch y und gibt das Ergebnis zur�ck.
func float invf (var float x) //Gibt das multiplikative Inverse des floats x, also 1/x zur�ck.
func float fracf (var int p, var int p) //Gibt den Bruch p/q als float zur�ck. �quivalent zu divf(mkf(p), mkf(q))

**************** Ordnungsrelationen ***********
func int gf  (var float x, var float y) //gibt f�r x >  y TRUE zur�ck, sonst FALSE
func int gef (var float x, var float y) //gibt f�r x >= y TRUE zur�ck, sonst FALSE
func int lef (var float x, var float y) //gibt f�r x <= y TRUE zur�ck, sonst FALSE
func int lf  (var float x, var float y) //gibt f�r x <  y TRUE zur�ck, sonst FALSE

**************** Verschiedene *****************
func float sqrf  (var float x) //gibt das Quadrat des floats x zur�ck.
func float sqrtf (var float x) //gibt die Wurzel des floats x zur�ck.
func string toStringf(var float x) //Erzeugt eine Stringdarstellung von x, z.B. "12.345"

**************** Casts ************************
Daedalus kennt seine eigenen, sehr eingeschr�nkten "var float".
Um floats im Sinne dieses Skripts in Floats im Sinne von Daedalus umzuwandeln und umgekehrt gibt es folgende zwei Funktionen.

func float castFromIntf(var int   f) //Wandle Float im Sinne dieses Pakets in Daedalus Float um.
func int   castToIntf  (var float f) //Wandle Daedalus Float in einen Float im Sinne dieses Pakets um.

Beide Funktionen machen letzendlich �berhaupt nichts. Sie "schummeln" lediglich eine �nderung des Datentyps am Parser vorbei.
Parameter und R�ckgabewert von beiden Funktionen sind in Wirklichkeit in beiden F�llen vom Typ float.

//************************************
//  Sonstiges
//************************************

Es sind f�nf float Konstanten definiert, die genutzt werden k�nnen, ohne dass sie erst berechnet/erzeugt werden m�ssen:

FLOATNULL = 0.0
FLOATEINS = 1.0
FLOATHALB = 0.5
PI = 3.1415...
E = 2.7182...

//************************************
//  Beispiele
//************************************

Folgende Funktion soll das Volumen eines Zylinders in cm� berechnen und gerundet zur�ckgeben.
Hierbei sind die Parameter als Ganzzahlen gegeben (Einheit cm).

func int Zylindervolumen (var int radius, var int hoehe) {
    var int radiusf, var int hoehef;
    radiusf = mkf (radius);
    hoehef = mkf (hoehe);

    //Volumen = r� * PI * h

    var int ergebnisf;
    ergebnisf = mulf (radiusf, radiusf);
    ergebnisf = mulf (ergebnisf, PI);
    ergebnisf = mulf (ergebnisf, h);

    return roundf (ergebnisf);
};

Folgende Funktion berechnet eine Zahl und gibt sie auf dem Bildschirm aus. Sie schachtelt dabei manche Funktionen

func void antwort () {
    var int foo;

    foo = mulf (mkf (1337), PI);
    printf (divf (foo, mkf (100)));

    //(1337*PI)/100 ist verbl�ffend genau 42. ;-)
};

Folgende Funktion macht ein paar Vergleiche. Es wird in keinem Fall "FEHLER" ausgegeben.

func void floattest()
{
    var int halb; var int eins; var int zwei;
    var int null;
    var int minuseins; var int minuszwei;

    halb = invf (mkf (2));
    eins = mkf (1);
    zwei = mkf (2);
    null = mkf (0);
    minuseins = mkf (-1);
    minuszwei = mkf (-2);

    if (gf (zwei,eins))           {} else { print ("FEHLER!"); };
    if (gf (eins,null))           {} else { print ("FEHLER!"); };
    if (lf (minuseins,null))      {} else { print ("FEHLER!"); };
    if (lf (minuszwei,minuseins)) {} else { print ("FEHLER!"); };
    if (gf (halb,minuseins))      {} else { print ("FEHLER!"); };
    if (lf (halb,zwei))           {} else { print ("FEHLER!"); };
    if (lef (null,null))          {} else { print ("FEHLER!"); };
    if (gef (null,null))          {} else { print ("FEHLER!"); };
};

//************************************
//  Beschr�nkungen und Fallen
//************************************

***********  Nutzerfehler ************
Es sollten unter keinen Umst�nden die Operatoren +, -, * oder / auf floats angewendet werden. Sie haben dort keine sinnvolle Anwendung. Bestensfalls kommt einfach nur Bl�dsinn heraus. Wie oben beschrieben sind addf, subf, mulf und divf anzuwenden.
Wer versteht wie ein float intern aufgebaut ist, kann zum Beispiel innerhalb der positiven Zahlen die Ordnungsrealtionen (>, <, <= >=) benutzen. Wer sich nicht sicher ist, sollte auf die gegebenen Funktionen zur�ckgreifen.
Nat�rlich sind umgekehrt die Floatfunktionen f�r Integer unbrauchbar. Der Ausdruck sqrtf(4) ist nicht 2 sondern einfach nur falsch, da 4 ein Integer ist! Wer die Wurzel von 4 ziehen will und als Integer haben m�chte kann das so tun: roundf(sqrtf(mkf(4))). Hier kommt 2 heraus.

*********** Float-Fehler *************
Die Genauigkeit der floats ist begrenzt, ab etwa 7 Dezimalstellen ist mit Rundungsfehlern zu rechnen. Daf�r k�nnen sehr gro�e und sehr kleine Zahlen dargestellt werden.
Es gelten die gew�hnlichen Einschr�nkungen und Empfehlungen f�r floats. Zum Beispiel ist es selten sinnvoll floats auf Gleichheit zu �berpr�fen, da es durch Rundungsfehler wahrscheinlich ist, dass auch zwei floats, die eigentlich gleich sein m�ssten kleine Abweichungen zueinander aufweisen. Es sollte in einem solchen Fall besser gepr�ft werden, ob die Differenz der beiden floats einen (im Verh�ltnis zur Problemstellung) kleinen Wert unterschreitet.

*/

//#################################################################
//
//  DIE FUNKTIONEN
//
//#################################################################

const int FLOAT_SIGN_MASK = 1 << 31;

const int FLOATNULL = 0;
const int FLOATEINS = 1065353216; //vz 0, exp 0 (also char 127), mt 1.0
const int FLOATONE  = FLOATEINS;  //EN
const int FLOATHALB = 1056964608; //vz 0, exp -1 (also char 126), mt 1.0
const int FLOATHALF = FLOATHALB;  //EN

const int PI = 1078530011;
const int E =  1076754516;

/* Die folgenden Arrays enthalten Assemblercode. */
const int FLTINT_trunc_code[9] = { -2082109099, 2111375596, 1166763774, 1712108798, -637778551, 1842939973, -128066564, -1946260007, -1010173883 };
const int FLTINT_mul_code  [3] = { -639268523, 1306004549, 12830984 };
const int FLTINT_div_code  [3] = { -639268523, 2111310917, 12830984 };
const int FLTINT_add_code  [3] = { -639268523, 1171786821, 12830984 };
const int FLTINT_mk_code   [2] = { -605714091, -1010235323 };

/* Helper Function: */
func int _FLT_Build_Func(var int codePtr, var int param1Ptr, var int param2Ptr, var int retValIsFloat, var int resultPtr) {
    CALL_Open();
    if (param2Ptr) {
        CALL_IntParam(param2Ptr);
    };
    if (param1Ptr) {
        CALL_IntParam(param1Ptr);
    };
    if (retValIsFloat) {
        CALL_RetValIsFloat();
    };
    CALL_PutRetValTo(resultPtr);
    CALL__cdecl(codePtr);
    return CALL_Close();
};

//************************************
//      Wrapper:
//************************************

func int mkf (var int x) {
    const int code = 0;
    if (!code) {
        code = _FLT_Build_Func(_@(FLTINT_mk_code), _@(x), 0, 1, _@(result));
    };
    ASM_Run(code);
    var int result;
    return +result;
};

func int truncf (var int x) {
    const int code = 0;
    if (!code) {
        code = _FLT_Build_Func(_@(FLTINT_trunc_code), _@(x), 0, 0, _@(result));
    };
    ASM_Run(code);
    var int result;
    return +result;
};

func int addf (var int x, var int y) {
    const int code = 0;
    if (!code) {
        code = _FLT_Build_Func(_@(FLTINT_add_code), _@(x), _@(y), 1, _@(result));
    };
    ASM_Run(code);
    var int result;
    return +result;
};

func int mulf (var int x, var int y) {
    const int code = 0;
    if (!code) {
        code = _FLT_Build_Func(_@(FLTINT_mul_code), _@(x), _@(y), 1, _@(result));
    };
    ASM_Run(code);
    var int result;
    return +result;
};

func int divf (var int x, var int y) {
    const int code = 0;
    if (!code) {
        code = _FLT_Build_Func(_@(FLTINT_div_code), _@(x), _@(y), 1, _@(result));
    };
    ASM_Run(code);
    var int result;
    return +result;
};

//************************************
//  Quadrieren und Wurzelziehen
//************************************

func int sqrf(var int f) {
    return mulf(f,f);
};

func int sqrtf(var int f) {
    const int sqrtf_G1 = 7757593; //0x765F19
    const int sqrtf_G2 = 8123917; //0x7BF60D

    const int code = 0;
    if (!code) {
        code = _FLT_Build_Func(MEMINT_SwitchG1G2(sqrtf_G1, sqrtf_G2),
                               _@(f), 0, 1, _@(result));
    };
    ASM_Run(code);
    var int result;
    return +result;
};

//************************************
//  Es lassen sich vier kleine
//  n�tzliche Hilfsfunktionen
//  definieren:
//************************************

func int negf (var int x) {
    if (x < 0) { return x & (~FLOAT_SIGN_MASK); }
    else       { return x |   FLOAT_SIGN_MASK ; };
};

func int absf (var int x) {
    return x & (~FLOAT_SIGN_MASK);
};

func int subf (var int x, var int y) {
    return addf(x, negf(y));
};

func int roundf (var int x) {
    if (x < 0) {
        return truncf(subf(x, FLOATHALB));
    } else {
        return truncf(addf(x, FLOATHALB));
    };
};

func int invf (var int x) {
    return divf(FLOATEINS, x);
};

/* thanks to orcwarriorPL for the idea! */
func int fracf (var int p, var int q) {
    if (!q) {
        MEM_Error("fracf: Denominator is 0.");
    };
    return divf(mkf(p), mkf(q));
};

 /* deprecated */
func int sqrtf_approx(var int f) { return sqrtf(f); };

//************************************
//  Ordnungsrelationen
//************************************

func int gf (var int x, var int y) {
    var int isnegX; isnegX = x & FLOAT_SIGN_MASK;
    var int isnegY; isnegY = y & FLOAT_SIGN_MASK;

    if (isNegX && isNegY) { //beide negativ
        if (x < y) {
            return TRUE;
        };
    }
    else {
        if (x > y) {
            return TRUE;
        };
    };

    return FALSE;
};

func int gef (var int x, var int y) {
    if (x == y) { return true; };
    return gf (x,y);
};

func int lef (var int x, var int y) {
    return !gf(x,y);
};

func int lf (var int x, var int y) {
    return !gef (x,y);
};

//*****************************************
//  Ausgabefunktionen, danke an Gottfried!
//*****************************************

func float castFromIntf(var int   f) { f; };
func int   castToIntf  (var float f) { return MEM_ReadInt(_@f(f)); };

func string toStringf(var int x) {
    var float f; f = castFromIntf(x);
    return FloatToString(f);
};

/* schlechter Name, aus Kompatibilit�tsgr�nden trotzdem drin. */
func void printf(var int x) {
    Print(toStringf(x));
};
