export function setVozDaniel(fala){
  const vozes = window.speechSynthesis.getVoices();
  const vozDaniel = vozes.find(voz => voz.name === "Microsoft Daniel - Portuguese (Brazil)");

  if (vozDaniel) {
    fala.voice = vozDaniel;
  }
}