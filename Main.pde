final int ACHTERGRONDKLEUR = (#4B4A4A);
final int WIT = (#FFFFFF);
final int KAARTKLEUR = (#F0F0F0);
final int Y_POSITIE_VAN_LIJN_STATUSSCHERM = 610;
final int STATUSSCHERM_LIJNDIKTE = 4;
final int GROOTTE_KAART = 200;
final int BLAUW = #3F42DE;
final int ROOD = #F70C0C;
final int EINDSPEL_INFO_KLEUR = #890F0F;
final int GROEN = #34CE35;
final int OFFSET = 2;
final int SELECTIEKLEUR = #426471;
final String[] AANTAL = {"1 ", "2 ", "3 "};
final String[] KLEUREN = {"r ", "g ", "b "};
final String[] FIGUREN = {"d", "r", "e"};

String[] kaarten = kaartGenerator(AANTAL, KLEUREN, FIGUREN);
String[] kaartenOpScherm = kaartenOpScherm(kaarten, 9);
String[] geklikteKaarten = new String [3];
int[] indexNummers = new int [3];

int teller = 0;
int score = 0;
int strafpunten = 0;

boolean spelKlaar =  false;

/* 
Dit programma zal bij het opstarten 9 kaarten tonen. Dit is een replica (simpelere vorm) van het kaartspel SET.
Een speler kan 3 kaarten kiezen. Is het een set, dan krijgt de speler een punt erbij. Is het geen set, dan krijgt de speler een strafpunt.
Uiteindelijk is de score - de strafpunten de definitieve score.
*/

void setup() {
  size(600, 800);
  background(ACHTERGRONDKLEUR);
  stroke(WIT);
  line(0, Y_POSITIE_VAN_LIJN_STATUSSCHERM, width, Y_POSITIE_VAN_LIJN_STATUSSCHERM);
  tekenKaartenOpScherm(kaartenOpScherm);
  tekenInfoVeld(score, strafpunten);
}

void draw() {

}
