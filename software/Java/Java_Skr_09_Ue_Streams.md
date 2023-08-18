# 9 Datei Zugriff / I/O-Streams - Übungen

## OpenData (152)

- Laden Sie die Datei *parkscheinautomaten.csv* von https://www.data.gv.at/katalog/dataset/c3d494f6-ad43-4225-b3ec-3b2c86b11a01/resource/b78ab487-f7dc-485d-899b-2140517df042/download/cusers15960desktopparkscheinautomatenaz20161212.csv:

  ```java
  String sUrl= "https://www.data.gv.at/katalog/dataset/c3d494f6-ad43-4225-b3ec-3b2c86b11a01/resource/b78ab487-f7dc-485d-899b-2140517df042/download/cusers15960desktopparkscheinautomatenaz20161212.csv";
  	
  // Verbindung aufbauen
  // -------------------------------------------------------------------------------------------
  URL url = new URL(sUrl);
  HttpURLConnection con = (HttpURLConnection) url.openConnection();

  // opendata lesen und auf console ausgeben
  Reader is = new InputStreamReader( con.getInputStream() );
  BufferedReader in = new BufferedReader( is );

  for ( String s; ( s = in.readLine() ) != null; ){
    System.out.println( s );
  }
  ```

  In diesem Beispiel werden die Daten direkt in der Konsole ausgegeben.

- Schreiben Sie die Daten in der Methode *writeCsvFile(...)* statt in die Konsole in die Datei *parkscheinautomaten.csv*.

- Lesen Sie die Daten aus der Datei *parkscheinautomaten.csv* in der Methode *writeTxtFile(...)* und schreiben Sie die Daten in die Datei  *textfile.txt*. Dabei muss auf folgendes Format geachtet werden:

  ```
  lat	lon	title	description	icon	iconSize	iconOffset
  48.9459301	9.6075669	Title One	Hotspot one	Ol_icon_blue_example.png	24,24	0,-24
  48.9899851	9.5382032	Title Two	Description two	Ol_icon_red_example.png	16,16	-8,-8
  ```

  Wichtig: die Spalten sind mit Tabulatoren \t zu trennen.

- Laden Sie mit Ihrem Webbrowser die Datei *index.html* und testen Sie die Funktionalität. Die Datei *textfile.txt* muss sich dabei im gleichen Ordner befinden.

#### HINWEIS: textfile.txt, index.html, parkscheinautomaten.csv

- Studieren Sie: http://wiki.openstreetmap.org/wiki/Openlayers_POI_layer_example
- Laden Sie die Dateien in einen eigenen Unterordner: 
  index.html
  textfile.txt
  Ol_icon_blue_example.png
  Ol_icon_red_example.png
- Laden Sie mit Ihrem Webbrowser die Datei *index.html* und testen Sie die Funktionalität.
  Tipp: Achten Sie auf den richtigen Aufbau (Tabulator) der Datei *textfile.txt*.

Häufig sperrt das Betriebssystem den Aufruf von den Skripten. Um dieses Problem zu umgehen *XAMPP* installieren und die Dateien gemeinsam unter [c:\xampp\opendata]() ablegen.

#### HINWEIS: (falls kein Netz vorhanden) parkautomaten.csv

```
Nr.;Parkscheinautomaten - Standorte;GPS Koordinaten;;GK Koordinaten;;Bemerkungen bzw. Korrekturen (Stand 12/16)
;;Längengrad;Breitengrad;Rechtswert;Hochwert;
;;;;;;
001;Schwarzstraße 49 - Musikum;13,038234;47,808318;-22046,650;296679,900;
002;Ernest-Thunstr. - Elisabethkai (Kreuzung);13,037725;47,808025;-22084,900;296647,400;Ernest-Thun-Str. - Elisabethkai (Kreuzung)
003;Markus-Sittikus-Straße - Elisabethkai (Kreuzung);13,037962;47,807115;-22067,500;296546,200;
004;Elisabethkai b. Kirche - Schulschwestern;13,038253;47,806269;-22046,100;296452,100;
005;Elisabethkai - Gehmacherstr. (Kreuzung);13,038684;47,805324;-22014,200;296346,900;
006;Schwarzstraße 29;13,039641;47,804881;-21942,700;296297,300;
007;Schwarzstraße 35 neben Garteneinfahrt links;13,039166;47,805881;-21977,900;296408,700;
008;Schwarzstraße 27 gegenüber;13,039978;47,804802;-21917,500;296288,400;
009;Auerspergstr. 9 neben Einfahrt rechts;13,039940;47,807003;-21919,400;296533,200;
011;Markus-Sittikus-Straße 4;13,039503;47,807427;-21952,000;296580,500;
012;Max-Ott-Platz 6 links v. Eingang;13,041037;47,808056;-21836,800;296649,900;
013;Ernest-Thunstr. 12 neben Trafostation;13,040548;47,808338;-21873,300;296681,400;Ernest-Thun-Str. 12 neben Trafostation
014;Ernest-Thunstr. 9 links v. Einfahrt;13,039394;47,808274;-21959,800;296674,700;Ernest-Thun-Str. 9 links v. Einfahrt
015;Faberstr. Humboldtstr.;13,042663;47,809037;-21714,600;296758,600;
016;Markus-Sittikus-Straße 19;13,042489;47,808427;-21727,900;296690,800;
017;Faberstr. 18 Ecke Auersbergstr.;13,043607;47,807914;-21644,400;296633,400;
018;Auersbergstr. 12;13,042725;47,807688;-21710,500;296608,600;
019;Weiserstraße 4 - Einfahrt Handelskammer;13,044828;47,808506;-21552,700;296698,900;
020;Lasserstraße - Weiserstraße;13,045355;47,809420;-21512,800;296800,400;
021;Lasserstraße 35;13,046695;47,808799;-21412,700;296730,900;
023;Auerspergstraße 35 neben Einfahrt links;13,046275;47,807986;-21444,500;296640,700;
024;Haydnstr. gegenüber Nr. 22;13,045532;47,808539;-21499,900;296702,400;
025;Auerspergstr. 20 bei Trafostation;13,044458;47,807972;-21580,600;296639,600;
026;Wartelsteinstr. 16 bei Einfahrt rechts;13,029248;47,803583;-22721,800;296156,000;
027;Rupertgasse 23;13,054709;47,808013;-20812,800;296641,400;lt. GIS Rupertgasse 25
028;Franz-Josef-Str. 14 neben  Eingang rechts;13,044726;47,807137;-21560,900;296546,700;
029;Auerspergstr. 48 - 50;13,050199;47,806069;-21151,400;296426,400;
031;Franz-Josef-Str. - P. Lodronstr. ( Kreuzung );13,048805;47,805965;-21255,800;296415,300;
032;Paris-Lodrostr. 26;13,049376;47,806195;-21213,000;296440,700;Paris-Lodron-Str. 26
033;Franz-Josef-Str. 23;13,047406;47,806975;-21360,200;296527,900;
034;Franz-Josef-Str. 13;13,044768;47,807418;-21557,600;296577,900;
035;Schrannengasse 2 ;13,044234;47,805359;-21598,500;296349,200;
036;Schrannengasse 6 ;13,045288;47,805724;-21519,400;296389,500;
037;Julius-Haagn-Straße zwischen 30 und 32;13,041382;47,816906;-21807,200;297633,900;
038;Julius-Haagn-Straße 12;13,038919;47,817079;-21991,600;297653,800;
039;Schrannengasse 7a Ecke Haydnstraße;13,045932;47,806055;-21471,000;296426,100;
040;Paracelsusstr. 4 ( Bundesforste );13,047079;47,807662;-21384,400;296604,400;
041;Stelzhammerstraße 3 Ecke Auerspergstraße;13,048562;47,807090;-21273,600;296540,400;
042;Lasserstraße 14;13,049240;47,807869;-21222,500;296626,800;
043;Lasserstraße 6;13,050226;47,807474;-21148,800;296582,600;
044;Bayerhammerstr. 11;13,051257;47,806883;-21071,800;296516,700;
045;Gabelsbergstr. 32;13,050310;47,808220;-21142,200;296665,600;
046;Arnogasse 5;13,053019;47,806843;-20939,800;296511,700;lt. GIS Arnogasse 7
047;Schallmooser Hauptstraße 19;13,052764;47,805907;-20959,300;296407,700;
048;Virgilgasse neben Eingang Trafostation;13,052172;47,806719;-21003,300;296498,200;
049;Bayerhammerstr. 2;13,052147;47,805714;-21005,600;296386,400;
050;Auerspergstr. 71;13,050841;47,805528;-21103,500;296366,100;
051;Glockengasse neben Trafostation;13,051117;47,804906;-21083,100;296296,900;
052;Vierthalerstraße 16;13,049830;47,805551;-21179,200;296368,900;lt. GIS Vierthalerstraße 14
053;Auerspergstr. 61 Ecke Rupertgasse;13,049921;47,806747;-21171,900;296501,900;
054;Bayerhamerstr. 15;13,051045;47,807595;-21087,400;296595,900;
055;Hildmannplatz 5 ;13,037972;47,797472;-22070,900;295474,000;
056;Reichenhallerstraße 3;13,036828;47,798215;-22156,300;295557,000;
057;Neutorstraße 16/Untersbergsr. 9;13,035428;47,797646;-22261,400;295494,100;
058;Untersbergstraße 2;13,035332;47,798612;-22268,200;295601,500;
059;Neutorstraße Ecke Fürstenbrunnstr. 8;13,034027;47,797723;-22366,400;295503,100;
060;Fürstenbrunnstr. 2 Ecke Reichenhallerstr. 15;13,034048;47,798678;-22364,400;295609,200;
061;Reichenhallerstraße 19;13,032959;47,799019;-22445,800;295647,500;
062;Reichenhallerstraße 14 ;13,032343;47,800135;-22491,500;295771,700;lt. GIS Reichenhallerstraße 16
063;Rainbergstr.14;13,033847;47,796969;-22380,150;295419,300;
064;Johann-Wolf-Str. Ecke Untersbergstr. 12;13,035212;47,796781;-22278,000;295398,000;
065;Steinbruchstraße 3;13,036646;47,796053;-22170,900;295316,600;
066;Fürstenalle 3;13,048558;47,792251;-21280,000;294890,500;lt. GIS zwischen Fürstenalle 3 und5
067;Nonntaler Hauptstr. 38;13,048939;47,792438;-21251,400;294911,200;
068;Nonntaler Hauptstr. 31a;13,049650;47,793370;-21197,700;295014,600;
069;Zugallistraße 7 gegenüber;13,051301;47,794209;-21073,700;295107,500;
070;Petersbrunnstr. 10;13,052011;47,794743;-21020,300;295166,600;zwischen Petersbrunnstr. 10 und Erhardplatz
071;Nonntaler Hauptstr. 9;13,052057;47,795468;-20955,600;295280,600;
072;Nonntaler Hauptstr. 11;13,052869;47,795770;-21016,500;295247,200;
073;Nonntaler Hauptstr. 16 Gehsteig;13,051207;47,794963;-21080,400;295191,300;
075;Schwarzstraße - Landestheater;13,042405;47,803038;-21736,500;296091,600;lt. GIS Schwarzstraße 24
076;Imbergstr. 10;13,050296;47,800282;-21146,500;295783,000;
077;Imbergstr. 14;13,051400;47,799995;-21063,900;295750,700;
078;Äusserer Stein - Neuhauser;13,053322;47,800236;-20919,800;295777,000;
079;Dr.-Varnschein-Gasse;13,052559;47,799626;-20977,200;295709,400;
080;Dr.-Franz-Rehrplatz 2 ;13,054194;47,799448;-20854,800;295689,200;
081;Rainerstraße 15 Ecke Hans-Prodinger-Straße;13,041329;47,809400;-21814,400;296799,300;
083;Staatsbrücke gegenüber Rathauswache;13,044941;47,800471;-21547,600;295805,500;
084;Franz-Josef-Kai 9;13,040575;47,801475;-21874,200;295918,400;
085;Ursulinenplatz 8;13,038045;47,802897;-22063,100;296077,200;
086;Hubert-Sattler-Gasse 5;13,043572;47,806427;-21647,600;296468,100;
087;Auerspergstr. 13;13,040793;47,807240;-21855,400;296559,300;
089;Hubert-Sattler-Gasse 11;13,044763;47,806770;-21558,300;296505,900;
090;Hubert-Sattler-Gasse  Ecke Haydnstr.;13,045450;47,806815;-21506,800;296510,700;
091;Faberstr. 11;13,043955;47,807006;-21618,700;296532,400;
092;Esshaverstr. 5;13,027284;47,810920;-22865,700;296972,400;
093;Sparkassenstraße Ecke Esshaverstraße;13,028272;47,810828;-22791,700;296961,900;
094;Leonhard v. Keutschachstr. 37;13,027288;47,810211;-22865,700;296893,600;
095;Schwarzstraße Ecke Markus-Sittikus-Straße;13,038721;47,807147;-22010,700;296549,500;
096;Franz-Josef-Str. 17;13,045770;47,807385;-21482,600;296574,000;
097;Haydnstr. 9;13,045418;47,807716;-21508,800;296610,900;Adresse gibt es im GIS nicht
098;Imbergstraße - Robert-Jungk-Platz;13,048459;47,800515;-21284,000;295809,400;Robert-Junk-Platz wurde verlegt!
101;Zillnerstraße 18 gegenüber;13,030821;47,804045;-22603,800;296206,900;
102;Franz-Neumeister-Str.4 vor der Einfahrt rechts;13,040962;47,810268;-21841,500;296895,900;
104;Lessingstr. 3, vor der Einfahrt links;13,040990;47,809805;-21839,600;296844,400;
106;Plainstr. 2 Ecke Hans Prodingerstr.;13,040548;47,809244;-21872,900;296782,200;
107;Schwarzstraße 50 Ecke Viktor-Kaplan-Straße;13,038854;47,809270;-21999,800;296785,500;
109;Gebirgsjägerplatz / Alois Schmiedbauerstraße;13,038787;47,810183;-22004,400;296887,100;
110;Elisabethkai / Alois Schmiedbauerstraße;13,037510;47,810181;-22100,100;296887,200;Elisabethkai / Alois-Schmiedbauer-Straße
111;Hans-Sachs-Gasse 25;13,029852;47,812153;-22672,800;297108,700;
112;Hans-Sachs-Gasse gegenüber 15;13,031939;47,811920;-22516,600;297082,200;
114;Paris-Lodrostr. 8a vormals Gebirgsjägerplatz;13,046874;47,805362;-21400,700;296348,700;lt. GIS Paris-Lodron-Str. 10
115;Plainstr. 10 links beim Eingang;13,040504;47,810026;-21875,900;296869,100;
116;Hans-Prodingerstr.7;13,039262;47,808956;-21969,400;296750,500;Hans-Prodinger-Str.7
117;Sylvester Oberbergerstraße / Bergheimerstraße;13,038332;47,815343;-22036,300;297460,900;Sylvester-Oberberger-Straße / Bergheimerstraße
120;Müllner Hauptstr. 3;13,036962;47,804261;-22143,700;296229,200;
121;Müllner Hauptstr. 11;13,035868;47,805675;-22225,000;296386,700;
122;Augustinergasse beim Kircheneingang;13,034663;47,805377;-22315,400;296353,900;
123;Ferdinand-Porschestr. 9;13,043411;47,812505;-21657,100;297143,900;Adresse gibt es im GIS nicht
124;Gaswerkgasse 3 beim Hauseck;13,033088;47,808494;-22432,000;296700,900;
125;Strubergasse / Wallnergasse;13,030962;47,808921;-22591,060;296749,010;
126;Strubergasse 4b;13,034800;47,809222;-22303,500;296781,400;lt. GIS Strubergasse 4A
127;Nikolaus Lenaustr. 1 vorm Haus rechts;13,034123;47,810106;-22353,800;296879,900;Nikolaus-Lenau-Str. 1 vorm Haus rechts
128;Rainerstraße 25;13,043231;47,811036;-21671,200;296980,700;
129;Johann-Haspinger-Str. 5;13,034189;47,810521;-22348,700;296926,000;lt. GIS Joachim-Haspinger-Straße 1
130;Emil Koflergasse 7;13,053973;47,807033;-20868,300;296532,600;Emil-Kofler-Gasse 7
131;Schießstattstraße 6 gegenüber;13,034335;47,811825;-22337,200;297070,900;lt. GIS Schießstattstraße 9
132;Weiserstraße 22 vor Hauseinfahrt rechts;13,046583;47,810786;-21420,250;296951,950;
133;Hübnergasse Nähe 5;13,032387;47,798255;-22489,000;295562,700;
134;Hübnergasse Nähe 6;13,048036;47,809907;;;kein PAUT (1.12.16)
138;Makartplatz 1 (in der Insel);;;;;kein PAUT vorhanden
140;Paracelsusstr. 21 vor Hauseingang rechts;13,048036;47,809907;-21311,800;296853,800;
141;Ignaz-Harrer-Str. 44c (Hotel Wienerwald);13,028090;47,811608;-22805,000;297048,700;
142;Paracelsusstr. 31;13,047685;47,811100;-21337,600;296986,500;
143;Merianstr. / Weiserhofstr.;13,047952;47,811640;-21317,400;297046,500;
144;Leonhard v. Keutschachstr. 25;13,028803;47,810215;-22752,200;296893,600;Leonhard-v.-Keutschach-Str. 25
145;Haunspergstr. 44;13,039147;47,815444;-21975,200;297471,900;lt. GIS Kreuzung Haunspergstraße - Sylvester-Oberberger-Str. 7
148;Alois Stockingerstr. gegenüber 9;13,031598;47,812408;-22541,900;297136,600;Alois-Stockinger-Str. gegenüber 9
149;Schuhmacherstraße Ecke Hüttenbergstraße;13,026568;47,812464;-22918,600;297144,300;
152;Roseggerstraße 8;13,029757;47,811271;-22680,300;297010,700;lt. GIS Roseggerstraße 12
153;Bayerhamerstr. 35 vor Einfahrt rechts;13,050528;47,810218;-21125,000;296887,700;lt. GIS Bayerhamerstraße 33
154;Bayerhamerstr. 31 Einfahrt inks;13,050609;47,809621;-21119,200;296821,300;
155;Bayerhamerstr. 25 gegenüber;13,050904;47,809189;-21097,300;296773,100;
157;Elisabethstr. Ecke Mertenstr.;13,041736;47,811772;-21782,900;297062,900;(demontiert Baustelle)
158;Ferdinand-Porschestr. 2 ;13,042381;47,812253;-21734,400;297116,200;Ferdinand-Porsche-Str. 2 
159;Elisabethstr. Ecke Stauffenstr. 19 od. 18;13,041855;47,813049;-21773,400;297204,900;lt. GIS Nr.19
160;Elisabethstr. bei Ausfahrt Schule rechts;13,042227;47,814875;-21744,800;297407,800;lt. GIS Nr.18
161;Karl-Wurmb-Str. bei Ausfahrt ÖBB rechts;13,042904;47,815114;-21694,000;297434,200;
162;Elisabethstr. 22 Automat gegenüber Einfahrt;13,042942;47,815872;-21690,800;297518,400;
163;Elisabethstr. zwischen 47 und 49;13,043665;47,816624;-21636,400;297601,800;
164;August Gruberstr vor Batimat;13,043813;47,817276;-21625,000;297674,300;August-Gruber-Str vor Batimat
165;Erzherzog - Eugenstr. 22;13,040082;47,818557;-21903,900;297817,800;Erzherzog-Eugen-Straße 22
167;Erzherzog - Eugenstr. Ecke Bergheimerstr.;13,037487;47,818410;-22098,300;297802,200;Erzherzog-Eugen-Straße Ecke Bergheimer Straße
168;Bergheimerstr. 50;13,037625;47,817754;-22088,200;297729,200;Bergheimer Straße
169;Haunspergstr. Ecke Bayrisch - Platzl. - Str.;13,038853;47,817788;-21996,200;297732,600;
170;Bayrisch - Platzl - Str. 21;13,039887;47,818030;-21918,700;297759,200;
171;Plainstraße 73;13,040543;47,817082;-21870,000;297653,700;
172;Julius-Haagn-Str. 16;13,039793;47,816962;-21926,200;297640,500;
173;Wolf-Dietrich-Straße 31 gegenüber;13,047034;47,806439;-21388,300;296468,500;
174;Haunspergstr. 43 Ecke V. M. Süßstr.;13,038934;47,816134;-21990,900;297548,700;
175;Bergheimerstr. 55;13,037937;47,816391;-22065,400;297577,600;
176;Lasserstraße - Paracelsusstraße;13,047672;47,808385;-21339,700;296684,600;
177;Plainstraße zwischen 50 und 52;13,040603;47,816305;-21865,800;297567,200;
178;Plainstraße 57a;13,040329;47,815708;-21886,600;297501,000;Adresse? lt. GIS gegenüber 42
180;Julius-Haagn-Str. 24 gegenüber Lichtmast;13,041699;47,816163;-21783,800;297551,100;
181;Wolf-Dietrich-Straße 21 - Paris-Lodron-Straße 11;13,047404;47,805661;-21360,900;296381,800;
183;Rudolf-Spängler-Straße 16 gegenüber;13,040135;47,814756;-21901,500;297395,200;
184;Bergheimerstr. 31;13,038482;47,814474;-22025,400;297364,300;lt. GIS gegenüber 31
185;Bergheimerstr. 17 Ecke Stauffenstr. 3;13,038378;47,813133;-22033,800;297215,200;
187;Elmokino Parkplatz ;13,037923;47,811197;-22068,700;297000,100;
188;Bergheimerstr. 3;13,038015;47,811727;-22061,600;297059,000;
189;Mertenstr. 12;13,039544;47,811829;-21947,000;297069,900;
190;Ignaz-Heffter-Str. 6 neben Einfahrt;13,039981;47,811338;-21914,500;297015,200;
191;Plainstraße zwischen 18 und 18a;13,040489;47,811268;-21876,500;297007,200;
192;Mertenstr. 18 neben KAK, gegenüber;13,040577;47,811898;-21869,600;297077,300;
193;Purtschellergasse 15 / Plainstraße;13,040432;47,812500;-21880,200;297144,200;
195;Stauffenstraße 9 neben KAK;13,039757;47,813106;-21930,500;297211,800;
196;Stauffenstraße 15 neben KAK;13,041317;47,813058;-21813,700;297206,000;
197;Plainstr. 41 neben Trafostation, gegenüber;13,040662;47,813473;-21862,600;297252,400;
198;Schallmooser Hauptstraße 30b;13,054519;47,806308;-20827,700;296451,800;
199;Schallmooser Hauptstraße 35;13,054606;47,806568;-20821,100;296480,700;
201;Hans-Sachs-Gasse 7;13,033521;47,811741;-22398,200;297061,900;
202;Emil Koflergasse 14 gegenüber;13,054692;47,807316;-20814,300;296563,900;demontiert Baustelle
203;Franz-Josef-Str. 8 neben Eingang links;13,043387;47,807000;-21661,200;296531,900;
205;Rupertgasse 16 links von der Einfahrt;13,053198;47,807415;-20926,200;296575,300;
206;Kaiserschützenstr. 8;13,043296;47,813948;-21665,100;297304,400;
207;Wartelsteinstraße 3 gegenüber;13,030131;47,803865;-22655,500;296187,100;
208;Eduard Baumgartnerstr. 12 neben KAK;13,030879;47,799071;-22601,600;295653,900;Eduard-Baumgartner-Str. 12 neben KAK
209;Augustinergasse zwischen 11 und 13;13,032035;47,802114;-22513,700;295991,900;
210;Augustinergasse 19;13,032105;47,800994;-22508,900;295867,300;
211;Zillernerstraße 4;13,030914;47,801722;-22597,800;295948,600;
213;Willibald-Hauthaler-Straße 3 gegenüber;13,031099;47,803392;-22583,200;296134,300;
214;Anton Behackerstr. vor KAK;13,029866;47,803122;-22675,700;296104,600;Anton-Behacker-Str. 7 vor KAK
216;Adolf Bekkstr. 7;13,029559;47,802096;-22699,200;295990,600;Adolf-Beck-Straße 7
217;Eduard Baumgartnerstr. 22 ;13,030742;47,800216;-22611,400;295781,200;Eduard-Baumgartner-Str. 22
218;Augustinergasse 9a rechts n. Schutzweg;13,031901;47,802996;-22523,300;296090,000;
224;Viktor-Kehldorfer-Straße 3 gegenüber;13,053623;47,792569;-20900,400;294924,500;
225;Mühlbacherhofweg 6/Viktor-Kehldorfer-Straße;13,054128;47,793168;-20862,300;294990,900;
226;Ulrike-Gschwandtner-Straße 6 gegenüber;13,055915;47,793895;-20728,100;295071,300;
227;Akademiestr. 19 - 21;13,057279;47,792062;-20626,700;294867,100;
228;Akademiestr. 9 ;13,058554;47,792834;-20530,800;294952,600;Akademiestr. 9 gegenüber
233;Hans-Sachs-Gasse 29, gegenüber;13,028842;47,812013;-22748,500;297093,500;
244;Hellbrunnerstr. 16b;13,059780;47,792706;-20439,000;294938,000;
245;Hellbrunnerstr. 26, gegenüber;13,059651;47,791871;-20449,000;294845,200;
246;Hellbrunnerstr. beim Altersheim;13,060249;47,790814;-20404,600;294727,500;
250;Kaiserschützenstr. 12;13,043428;47,813612;-21655,400;297267,000;
251;Alois Stockingerstr. 3;13,031042;47,811542;-22583,900;297040,400;
252;Neutorstraße bei der Riedenburgapotheke;13,031469;47,797736;-22558,000;295505,300;Neutorstraße 32F bei der Riedenburgapotheke
253;Erzabt Klotzstr. 10;13,052976;47,793646;-20948,400;295044,400;Erzabt-Klotz-Str. 10

```

#### Erweiterung:

- Verändern Sie die Datei *index.html* dahingehend, dass beim Öffnen der Datei die Anzeige auf den Mittelwert der erstellten Längen-/Breitengrade zentriert wird. Dazu müssen die Koordinaten in der folgenden Zeile angepasst werden:

  ```
  var lonLat = new OpenLayers.LonLat( 9.5788, 48.9773 )
  ```

- Erstellen Sie einen zweiten Layer mit den öffentlichen WLAN-Hotspots der Stadt-Salzburg. Die Vorgangsweise ist wieder:

  - Die csv-Daten müssen von der Seite data.gv.at in eine lokale csv-Datei gespeichert werden
  - Schreiben der Koordinaten, Title und Description in eine Datei *wlanTextfile.txt* (Formatierung wie oben). Suchen und Verlinken Sie ein passendes P-Logo (24x24).
  - Einfügen eines neuen Layers in der Datei *index.html*.
  - Starten der Datei *index.html* im Browser.

#### HINWEIS: (falls kein Netz vorhanden) wlanhotspot.csv

```
FID,GEOMETRIE,STANDORTNAME,HOMEPAGE,BEMERKUNG
wlanhotspot.gisdb.21108,POINT (47.80208666428231 13.044696183497496),Salzburg surft Hotspot - BRICKS Music-Bar,http://www.salzburg-surft.at/hotspot-locations/bricks-music-bar/,Aufstelljahr: 2011
wlanhotspot.gisdb.21109,POINT (47.78330855822309 13.080045699456964),Salzburg surft Hotspot - BWS Aigen,http://www.salzburg-surft.at/hotspot-locations/bws-aigen/ ,Aufstelljahr: 2013
wlanhotspot.gisdb.21110,POINT (47.80891311800401 13.061969610720691),Salzburg surft Hotspot - BWS Gnigl,http://www.salzburg-surft.at/hotspot-locations/bws-gnig/,Aufstelljahr: 2013
wlanhotspot.gisdb.21111,POINT (47.82475165387156 13.045492617811695),Salzburg surft Hotspot - BWS Itzling,http://www.salzburg-surft.at/hotspot-locations/bws-itzling/,Aufstelljahr: 2013
wlanhotspot.gisdb.21112,POINT (47.788189707412734 13.07633640575754),Salzburg surft Hotspot - Cafe Dialog,http://www.salzburg-surft.at/hotspot-locations/cafe-dialog/,Aufstelljahr: 2013
wlanhotspot.gisdb.21114,POINT (47.78956567199874 13.035478347359131),Salzburg surft Hotspot - Freibad Leopoldskron,http://www.salzburg-surft.at/hotspot-locations/freibad-leopoldskron/,Aufstelljahr: 2012
wlanhotspot.gisdb.21115,POINT (47.77606246966332 13.071751307716475),Salzburg surft Hotspot - Gesundheitszentrum Sued,http://www.salzburg-surft.at/hotspot-locations/gsz-sued/,Aufstelljahr: 2013
wlanhotspot.gisdb.21116,POINT (47.81017702593366 13.030521686296531),Salzburg surft Hotspot - Inge-Morath-Platz,http://www.salzburg-surft.at/hotspot-locations/inge-morath-platz/,Aufstelljahr: 2013
wlanhotspot.gisdb.21117,POINT (47.80712622357241 13.066010187997676),Salzburg surft Hotspot - Jugendzentrum get2gether,http://www.salzburg-surft.at/hotspot-locations/juz-get2gether/,Aufstelljahr: 2012
wlanhotspot.gisdb.21118,POINT (47.80632504270535 13.046060483983911),Salzburg surft Hotspot - Jugendzentrum IGLU,http://www.salzburg-surft.at/hotspot-locations/juz-iglu/,Aufstelljahr: 2012
wlanhotspot.gisdb.21119,POINT (47.78790875216644 13.019630581864392),Salzburg surft Hotspot - Jugendzentrum KOMM,http://www.salzburg-surft.at/hotspot-locations/juz-komm/,Aufstelljahr: 2012
wlanhotspot.gisdb.21120,POINT (47.81463693761094 13.026230174761325),Salzburg surft Hotspot - Jugendzentrum Lehen,http://www.salzburg-surft.at/hotspot-locations/juz-lehen/,Aufstelljahr: 2012
wlanhotspot.gisdb.21121,POINT (47.81106329021125 13.006274636108788),Salzburg surft Hotspot - Jugendzentrum Taxham,http://www.salzburg-surft.at/hotspot-locations/juz-taxham/,Aufstelljahr: 2012
wlanhotspot.gisdb.21122,POINT (47.79704378324846 13.051839540152114),Salzburg surft Hotspot - Kajetanerplatz,http://www.salzburg-surft.at/hotspot-locations/kajetanerplatz/,Aufstelljahr: 2013
wlanhotspot.gisdb.21123,POINT (47.79691158787558 13.046628065352198),Salzburg surft Hotspot - Kapitelplatz,http://www.salzburg-surft.at/hotspot-locations/kapitelplatz/,Aufstelljahr: 2013
wlanhotspot.gisdb.21124,POINT (47.801704568083714 13.04214719528929),Salzburg surft Hotspot - Makartsteg,http://www.salzburg-surft.at/hotspot-locations/makartsteg/,Aufstelljahr: 2011
wlanhotspot.gisdb.21125,POINT (47.804564853462836 13.043145395240149),Salzburg surft Hotspot - Mirabellgarten,http://www.salzburg-surft.at/hotspot-locations/mirabellgarten/,Aufstelljahr: 2011
wlanhotspot.gisdb.21126,POINT (47.798688278267 13.047936761961587),Salzburg surft Hotspot - Mozartplatz,http://www.salzburg-surft.at/hotspot-locations/mozartplatz/,Aufstelljahr: 2012
wlanhotspot.gisdb.21127,POINT (47.80040727226709 13.044893879702833),Salzburg surft Hotspot - Rathaus,http://www.salzburg-surft.at/hotspot-locations/rathaus-salzburg/,Aufstelljahr: 2012
wlanhotspot.gisdb.21128,POINT (47.813591021619935 13.027612786249824),Salzburg surft Hotspot - Stadt:Bibliothek Salzburg,http://www.salzburg-surft.at/hotspot-locations/stadtbibliothek-salzburg/,Aufstelljahr: 2012
wlanhotspot.gisdb.21129,POINT (47.79643460980809 13.060197478354686),Salzburg surft Hotspot - Volksgarten,http://www.salzburg-surft.at/hotspot-locations/volksgarten/,Aufstelljahr: 2012
wlanhotspot.gisdb.21130,POINT (47.76281638251832 13.060395900792235),Salzburg surft Hotspot - Hellbrunn Wasserspiele Kassa,,Aufstelljahr: 2013
wlanhotspot.gisdb.21131,POINT (47.76284883856024 13.065363326629926),Salzburg surft Hotspot - Hellbrunn Spielplatz/Park,,Aufstelljahr: 2013
wlanhotspot.gisdb.21132,POINT (47.82262505699751 13.04107044930563),Salzburg surft Hotspot - CoWorkingSpace Salzburg,http://www.salzburg-surft.at/hotspot-locations/coworking-space-salzburg/,Aufstelljahr: 2012
```

## Hangman (090)

Realisieren Sie das bekannte Wortratespiel auf dem Computer.

Zeigen Sie zunächst von einem zu ratenden Wort für die einzelnen Zeichen jeweils nur Striche an.

Anschließend fragen Sie nach Buchstaben. Sollten die Buchstaben im zu ratenden Wort vorkommen, so werden die entsprechenden Positionen aufgedeckt, d.h. an dieser Stelle werden die tatsächlichen Zeichen angezeigt. Durch Eingabe eines Zeichens (z.B. '#' – welches dann in keinem Wort vorkommen darf) kann das Raten abgebrochen werden und die Eingabe des vollständigen Worts ist nun möglich. Stimmt das eingegebene Wort mit dem verdeckten Wort überein, ist das Spiel zu Ende, ansonsten wird wieder in den obigen Buchstabenratemodus zurückgekehrt.

 Beispiel: Zu ratendes Wort:"Hangman" (verdeckt)

\- - - - - - -     Eingabe (a)

\- a - - - a -    Eingabe (g)

\- a - g - a -    Eingabe (e)

\- a - g - a -    Eingabe (n)

\- a n g - a n   Eingabe (#) ~ Ende Buchstabenraten

Eingabe: Hangman →  richtig geraten / bzw. Zurückkehren zum Buchstabenraten

Hinweis:
Sie können das Spiel abwechslungsreicher gestalten, wenn Sie sich eine Tabelle von zu ratenden Wörtern im Programm anlegen und aus dieser Tabelle zufällig einen Eintrag auswählen, anstatt diesen vorher einzugeben.