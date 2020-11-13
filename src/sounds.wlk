import wollok.game.*

object sonidos {
	const property musicaFondo = game.sound("prueba1.mp3")
	const property musicaMenu= game.sound("musicamenu.mp3")
	var property soundDanio=game.sound("danio.mp3")	
	var property soundPerder=game.sound("perder.mp3")
	var property soundMoneda=game.sound("moneda.wav")
	var property soundPuerta=game.sound("puerta.wav")
	var property soundCofre=game.sound("cofre.mp3")
	var property soundBabosa=game.sound("babosa.wav")
	var property soundOff=false
	
	method play(unSonido){
		musicaFondo.pause()
		unSonido.play()
		musicaFondo.resume()
	}
	method musicaMenu(){
		if(not soundOff){
		musicaMenu.shouldLoop(true)
		game.schedule(3000, {musicaMenu.play()})	
		}
	}
	method musicaFondo(){
		if(not soundOff){
		musicaFondo.shouldLoop(true)
		game.schedule(3000, {musicaFondo.play()})	
		}
	}
	method danio(){
		if(not soundOff){
		self.play(soundDanio)
		soundDanio=game.sound("danio.mp3")}	
	}
	method perder(){
		if(not soundOff){
		self.play(soundPerder)
		soundPerder=game.sound("perder.mp3")}
	}
	method moneda(){
		if(not soundOff){
		self.play(soundMoneda)
		soundMoneda=game.sound("moneda.wav")}
	}
	method puerta(){
		if(not soundOff){
		self.play(soundPuerta)
		soundPuerta=game.sound("puerta.wav")}
	}
	method cofre(){
		if(not soundOff){
		self.play(soundCofre)
		soundCofre=game.sound("cofre.mp3")}
	}
	method babosa(){
		if(not soundOff){
		self.play(soundBabosa)
		soundBabosa=game.sound("babosa.wav")}
	}
	
	method soundOff(booleano){
		soundOff=booleano
	}
	method stopMenu(){
		musicaMenu.stop()
	}

}
