void controlEvent(ControlEvent theEvent) {
  if (theEvent.isController()) {   
    println("controlP5 event: "+theEvent.name());

    if (theEvent.name().equals("btnPlay")) {      
      gameState = PLAY;
      cp5Menu.setVisible(false);
      cp5Config.setVisible(false);
    }     
    if (theEvent.name().equals("btnSettings")) {
      gameState = CONFIG;
      cp5Menu.setVisible(false);
    }    
    if (theEvent.name().equals("btnExit")) {
      gameState = END;
      cp5Menu.setVisible(false);
      cp5Config.setVisible(false);
    }    
    if (theEvent.name().equals("btnBack")) {      
      gameState = MENU;
      cp5Config.setVisible(false);
    }
    if (theEvent.name().equals("btnVinylOne")) {      
      if (songVinylTwo.isPlaying()) {
        songVinylTwo.pause();
        songVinylTwo.rewind();
      }
      songVinylOne.play(1);
      buttonVinylOne.setImage(vinylOneAnimated);
      buttonVinylTwo.setImage(vinylTwoOff);
    }
    if (theEvent.name().equals("btnVinylTwo")) {      
      if (songVinylOne.isPlaying()) {
        songVinylOne.pause();
        songVinylOne.rewind();
      }
      songVinylTwo.play(1);
      buttonVinylTwo.setImage(vinylTwoAnimated);
      buttonVinylOne.setImage(vinylOneOff);
    }
    if (theEvent.name().equals("btnBgOne")) {
      bgAnimated = bgOneAnimated;
      buttonBgOne.setImage(bgOnePreview);
      buttonBgTwo.setImage(bgTwoPreviewOff);
    }    
    if (theEvent.name().equals("btnBgTwo")) {      
      bgAnimated = bgTwoAnimated;
      buttonBgOne.setImage(bgOnePreviewOff);
      buttonBgTwo.setImage(bgTwoPreview);
    }
  }
}
