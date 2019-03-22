void tekenRechthoekKaart(int aantal, int kleur, int xPositie, int yPositie, boolean isGeselecteerd) {

  int breedteRechthoek = GROOTTE_KAART / 2;
  int hoogteRechthoek = GROOTTE_KAART / 5;
  int tussenRuimteRechthoeken = 5;
  int achtergrondKaart = WIT;

  if (isGeselecteerd) {
    achtergrondKaart = SELECTIEKLEUR;
  }
  

  tekenAchtergrond(xPositie + OFFSET, yPositie + OFFSET, GROOTTE_KAART - OFFSET * 2, GROOTTE_KAART - OFFSET * 2, achtergrondKaart);

  for (int i = 0; i < aantal; i++) {
    fill(kleur);
    rect(xPositie + GROOTTE_KAART / 4, yPositie + GROOTTE_KAART / 5 + geeftOffset(aantal), breedteRechthoek, hoogteRechthoek);
    yPositie += hoogteRechthoek + tussenRuimteRechthoeken;
  }
}


void tekenDriehoekKaart(int aantal, int kleur, int xPositie, int yPositie, boolean isGeselecteerd) {
  int zijdeAbAc = 40;
  int zijdeBc = 30;
  int tussenRuimteDriehoeken = 10;
  int achtergrondKaart = WIT;

  if (isGeselecteerd) {
    achtergrondKaart = SELECTIEKLEUR;
  }
  int offSet = 50;
  
  if (aantal == 2) {
    offSet = 25;
  }
  else if (aantal == 3) {
    offSet = 0;
  }
  
  tekenAchtergrond(xPositie + OFFSET, yPositie + OFFSET, GROOTTE_KAART - OFFSET * 2, GROOTTE_KAART - OFFSET * 2, achtergrondKaart);

  for (int i = 0; i < aantal; i++) {
    fill(kleur);
    triangle(xPositie + GROOTTE_KAART / 2, yPositie + GROOTTE_KAART / 10 + geeftOffset(aantal), xPositie + GROOTTE_KAART / 2 + zijdeAbAc, yPositie + GROOTTE_KAART / 5 + zijdeBc + geeftOffset(aantal), 
              xPositie + GROOTTE_KAART / 2 - zijdeAbAc, yPositie + GROOTTE_KAART / 5 + zijdeBc + geeftOffset(aantal));
    yPositie += zijdeAbAc + tussenRuimteDriehoeken;
  }
}



void tekenEllipsKaart(int aantal, int kleur, int xPositie, int yPositie, boolean isGeselecteerd) {

  int breedteEllips = GROOTTE_KAART / 2;
  int hoogteEllips = GROOTTE_KAART / 4;
  int tussenRuimteEllips = 5;
  int achtergrondKaart = WIT;

  if (isGeselecteerd) {
    achtergrondKaart = SELECTIEKLEUR;
  }


  tekenAchtergrond(xPositie + OFFSET, yPositie + OFFSET, GROOTTE_KAART - OFFSET * 2, GROOTTE_KAART - OFFSET * 2, achtergrondKaart);

  for (int i = 0; i < aantal; i++) {
    fill(kleur);
    ellipse(xPositie + GROOTTE_KAART / 2, yPositie + GROOTTE_KAART / 5 + geeftOffset(aantal), breedteEllips, hoogteEllips);
    yPositie += hoogteEllips + tussenRuimteEllips;
  }
}

void tekenAchtergrond(int xPositie, int yPositie, int breedte, int hoogte, int achtergrondKleur) {

  fill(achtergrondKleur);
  rect(xPositie + OFFSET, yPositie + OFFSET, GROOTTE_KAART - OFFSET * 2, GROOTTE_KAART - OFFSET * 2);
}


void tekenKaartenOpScherm(String[] kaarten) {

  for (int i = 0; i < kaarten.length; i++) {
    tekenKaart(kaarten[i], i, false);
  }
}

void tekenKaart(String kaart, int index, boolean conditie) {
  int aantal = 0;
  int kleur = 0;
  int row = index / 3;
  int col = index % 3;
  String[] kaartGesplit = splitTokens(kaart);

  if (kaartGesplit[0].equals("1")) {
    aantal = 1;
  } else if (kaartGesplit[0].equals("2")) {
    aantal = 2;
  } else {
    aantal = 3;
  }

  if (kaartGesplit[1].equals("r")) {
    kleur = ROOD;
  } else if (kaartGesplit[1].equals("b")) {
    kleur = BLAUW;
  } else {
    kleur = GROEN;
  }

  if (kaartGesplit[2].equals("r")) {
    tekenRechthoekKaart(aantal, kleur, col * GROOTTE_KAART, row * GROOTTE_KAART, conditie);
  } else if (kaartGesplit[2].equals("d")) {
    tekenDriehoekKaart(aantal, kleur, col * GROOTTE_KAART, row * GROOTTE_KAART, conditie);
  } else {
    tekenEllipsKaart(aantal, kleur, col * GROOTTE_KAART, row * GROOTTE_KAART, conditie);
  }
}

void tekenDrieKaartenOpnieuw(String[] kaart, int[] index, boolean conditie) {

  kaartenOpScherm[index[0]] = kaart[0];
  kaartenOpScherm[index[1]] = kaart[1];
  kaartenOpScherm[index[2]] = kaart[2];

  if (kaarten.length != 0) {
    for (int i = 0; i < 3; i++) {
      tekenKaart(kaart[i], index[i], false);
    }
  } else {
    tekenEindscherm();
  }
}


void tekenInfoVeld(int score, int strafpunten) {

  fill(255);
  textSize(20);
  text("Aantal gevonden sets: " + score, 30, GROOTTE_KAART * 3 + 30);
  text("Jouw strafpunten zijn: " + strafpunten, 30, GROOTTE_KAART * 3 + 180);
}

void tekenEindscherm() {

  background(#4B4A4A);
  fill(EINDSPEL_INFO_KLEUR);
  textSize(20);
  text("HET SPEL IS AFGELOPEN", width / 2.5, height / 2);
  text("Uw score is: " + (score - strafpunten), width / 2.5, height / 2 + 20);
  text("Nog een keer spelen?", width / 2.5, height / 2 + 50);
  fill(ACHTERGRONDKLEUR);
  noStroke();
  rect(30, GROOTTE_KAART * 3 + 15, 400, 200);
  fill(GROEN);
  rect( width / 2.5, height / 2 + 60, 50, 20);
  fill(ROOD);
  rect( width / 2, height / 2 + 60, 50, 20);
  fill(WIT);
  textSize(15);
  text("JA", width / 2.5 + 5, height / 2 + 60 + 15);
  text("NEE", width / 2 + 5, height / 2 + 60 + 15);
  spelKlaar = true;
} 
