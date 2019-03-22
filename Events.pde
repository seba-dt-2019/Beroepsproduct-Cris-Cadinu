void mouseClicked() {

  int kaartOpIndex =  selecteerKaartOpCoordinaat(mouseX, mouseY);
  String nieuweKaart = kaartenOpScherm[kaartOpIndex];
  
  if (kaarten.length != 0) {
    tekenKaart(nieuweKaart, kaartOpIndex, true);
  }
  
  if (teller == 0) {
    geklikteKaarten[0] = nieuweKaart;
    indexNummers[0] = kaartOpIndex;

  }
  else if (teller == 1) {
    geklikteKaarten[1] = nieuweKaart;
    indexNummers[1] = kaartOpIndex;
  }
  else {
    geklikteKaarten[2] = nieuweKaart;
    indexNummers[2] = kaartOpIndex;
  }
  teller++;
  
  if (geklikteKaarten[0] == geklikteKaarten[1]) {
    tekenKaart(nieuweKaart, kaartOpIndex, false);
    geklikteKaarten[0] = null;
    geklikteKaarten[1] = null;
    teller = 0;
  }
  
  if (teller >= 2) {
    if (geklikteKaarten[0] == geklikteKaarten[2]) {
      tekenKaart(nieuweKaart, kaartOpIndex, false);
      geklikteKaarten[2] = null;
      geklikteKaarten[0] = geklikteKaarten[1];
      geklikteKaarten[1] = null;
      teller = 1;
    }
  }
  
  if (teller >= 2) {
    if (geklikteKaarten[1] == geklikteKaarten[2]) {
    tekenKaart(nieuweKaart, kaartOpIndex, false);
    geklikteKaarten[1] = null;
    geklikteKaarten[2] = null;
    teller = 1;
    }
  }
  
  if (teller == 3) {
    if (geklikteKaarten[0] != geklikteKaarten[1]) {
    isSet(geklikteKaarten);
    }
  }
  
  if (spelKlaar) {
    if (isInJaBox()) {
      kaarten = kaartGenerator(AANTAL, KLEUREN, FIGUREN);
      kaartenOpScherm = kaartenOpScherm(kaarten, 9);
      tekenKaartenOpScherm(kaartenOpScherm);
      score = 0;
      teller = 0;
      strafpunten = 0;
      stroke(WIT);
      line(0, Y_POSITIE_VAN_LIJN_STATUSSCHERM, width, Y_POSITIE_VAN_LIJN_STATUSSCHERM);
      tekenInfoVeld(score, strafpunten);
      spelKlaar = false;
    }
    if (isInNeeBox()) {
      background(ACHTERGRONDKLEUR);
      textSize(30);
      fill(GROEN);
      text("BEDANKT VOOR HET SPELEN!", width / 4, height / 2);
    }
  }
}
