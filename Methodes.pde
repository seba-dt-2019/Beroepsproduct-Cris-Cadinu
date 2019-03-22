
/**
 * Deze methode accepteert 3 arrays met eigenschappen en geeft 1 array met 27 kaarten terug.
 */
String[] kaartGenerator(String[] aantal, String[] kleuren, String[] figuren) {

  int totaleLengteArrays = aantal.length * kleuren.length *
    figuren.length;

  String[ ] kaarten = new String[totaleLengteArrays];

  int index = 0;

  for (int i = 0; i < aantal.length; i++) {
    for (int j = 0; j < kleuren.length; j++) {
      for (int k = 0; k < figuren.length; k++) {
        kaarten[index] = aantal[i] + kleuren[j] + figuren[k];
        index++;
      }
    }
  }
  return kaarten;
}


/**
 * De array met 27 kaarten wordt hier als argument geaccepteert.
 * Hieruit wordt er een nieuwe array met 9 willekeurige kaarten teruggegeven.
 */
String[] kaartenOpScherm(String[] kaartenArray, int n) {

  String[] teSpelenKaarten = new String[n];

  for (int i = 0; i < teSpelenKaarten.length; i++) {

    int randomKaart = int(random(kaartenArray.length));
    teSpelenKaarten[i] = kaartenArray[randomKaart];

    String laatsteKaart = kaartenArray[kaartenArray.length - 1];
    kaartenArray[randomKaart] = laatsteKaart;

    kaartenArray = shorten(kaartenArray);
  }


  kaarten = kaartenArray;

  return teSpelenKaarten;
}

int selecteerKaartOpCoordinaat(int xPos, int yPos) {

  int iX = xPos / GROOTTE_KAART;
  int iY = yPos / GROOTTE_KAART;
  int indexNummer = 0;

  int[] kaartCoordinaat = {iX, iY};

  if (kaartCoordinaat[0] == 0 && kaartCoordinaat[1] == 0) {
    indexNummer = 0;
  } else if (kaartCoordinaat[0] == 1 && kaartCoordinaat[1] == 0) {
    indexNummer = 1;
  } else if (kaartCoordinaat[0] == 2 && kaartCoordinaat[1] == 0) {
    indexNummer = 2;
  } else if (kaartCoordinaat[0] == 0 && kaartCoordinaat[1] == 1) {
    indexNummer = 3;
  } else if (kaartCoordinaat[0] == 1 && kaartCoordinaat[1] == 1) {
    indexNummer = 4;
  } else if (kaartCoordinaat[0] == 2 && kaartCoordinaat[1] == 1) {
    indexNummer = 5;
  } else if (kaartCoordinaat[0] == 0 && kaartCoordinaat[1] == 2) {
    indexNummer = 6;
  } else if (kaartCoordinaat[0] == 1 && kaartCoordinaat[1] == 2) {
    indexNummer = 7;
  } else if (kaartCoordinaat[0] == 2 && kaartCoordinaat[1] == 2) {
    indexNummer = 8;
  }

  return indexNummer;
}


boolean isSet(String[] geklikteKaarten) {

  boolean isSet = false;
  boolean aantalSet = false;
  boolean kleurSet = false;
  boolean vormSet = false;


  String kaart1 = geklikteKaarten[0];
  String kaart2 = geklikteKaarten[1];
  String kaart3 = geklikteKaarten[2];


  String aantal1 = kaart1.substring(0, 1);
  String aantal2 = kaart2.substring(0, 1);
  String aantal3 = kaart3.substring(0, 1);

  String kleur1 = kaart1.substring(2, 3);
  String kleur2 = kaart2.substring(2, 3);
  String kleur3 = kaart3.substring(2, 3);

  String vorm1 = kaart1.substring(4);
  String vorm2 = kaart2.substring(4);
  String vorm3 = kaart3.substring(4);


  if ((!aantal1.equals(aantal2) && !aantal2.equals(aantal3) && !aantal1.equals(aantal3)) || 
    (aantal1.equals(aantal2) && aantal2.equals(aantal3) && aantal1.equals(aantal3))) {
    aantalSet = true;
  }

  if ((!kleur1.equals(kleur2) && !kleur2.equals(kleur3) && !kleur1.equals(kleur3)) || 
    (kleur1.equals(kleur2) && kleur2.equals(kleur3) && kleur1.equals(kleur3))) {
    kleurSet = true;
  }

  if ((!vorm1.equals(vorm2) && !vorm2.equals(vorm3) && !vorm1.equals(vorm3)) || 
    (vorm1.equals(vorm2) && vorm2.equals(vorm3) && vorm1.equals(vorm3))) {
    vormSet = true;
  }

  if (aantalSet && kleurSet && vormSet) {
    score++;
    teller -= 3;
    isSet = true;
    fill(ACHTERGRONDKLEUR);
    noStroke();
    rect(30, GROOTTE_KAART * 3 + 15, 400, 200);
    tekenDrieKaartenOpnieuw((kaartenOpScherm(kaarten, 3)), indexNummers, false);
    tekenInfoVeld(score, strafpunten);
    if (score == 6) {
      fill(ACHTERGRONDKLEUR);
      noStroke();
      rect(0, GROOTTE_KAART * 3, width, 500);
    }
  } else {
    tekenDrieKaartenOpnieuw(geklikteKaarten, indexNummers, false);
    teller -=3;
    strafpunten++;
    fill(ACHTERGRONDKLEUR);
    noStroke();
    rect(30, GROOTTE_KAART * 3 + 15, 400, 200);
    tekenInfoVeld(score, strafpunten);
    geklikteKaarten[0] = null;
    geklikteKaarten[1] = null;
    geklikteKaarten[2] = null;
  }


  return isSet;
}

boolean isInJaBox() {
  
  boolean geklikt = false;
  if (mouseX > width / 2.5 && mouseX < width / 2.5 + 50 && mouseY > height / 2 + 60 && mouseY < height / 2 + 60 + 20) {
    geklikt = true;
  }
  return geklikt;
}

boolean isInNeeBox() {
  
  boolean geklikt = false;
  if (mouseX > width / 2 && mouseX < width / 2 + 50 && mouseY > height / 2 + 60 && mouseY < height / 2 + 60 + 20) {
    geklikt = true;
  }
  return geklikt;
}
  
int geeftOffset(int aantal) {
  
  if (aantal == 1) {
    return 40;
  }
  if (aantal == 2) {
    return 20;
  }
  if (aantal == 3) {
    return 0;
  }
  
  return 0;
}
  
