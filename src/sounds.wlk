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
	var property soundWinner=game.sound("ganar.mp3")
	var property soundLlave=game.sound("llave.mp3")
	var property soundOff=false
	
	method play(unSonido){
		if(not soundOff){
		musicaFondo.pause()
		unSonido.play()
		musicaFondo.resume()}
	}
	method musicaMenu(){
		if(not soundOff){
		musicaMenu.shouldLoop(true)
		game.schedule(1000, {musicaMenu.play()})	
		}
	}
	method musicaFondo(){
		if(not soundOff){
		musicaFondo.shouldLoop(true)
		game.schedule(1000, {musicaFondo.play()})	
		}
	}
	method danio(){
		self.play(soundDanio)
		soundDanio=game.sound("danio.mp3")
	}
	method perder(){
		self.play(soundPerder)
		soundPerder=game.sound("perder.mp3")
	}
	method moneda(){
		self.play(soundMoneda)
		soundMoneda=game.sound("moneda.wav")
	}
	method puerta(){
		self.play(soundPuerta)
		soundPuerta=game.sound("puerta.wav")
	}
	method cofre(){
		self.play(soundCofre)
		soundCofre=game.sound("cofre.mp3")
	}
	method babosa(){
		self.play(soundBabosa)
		soundBabosa=game.sound("babosa.wav")
	}
	method llave(){
		self.play(soundLlave)
	}
	method nivelSuperado(){
		if(not soundOff){
			musicaFondo.stop()
			soundWinner.play()
			game.schedule(4000, {soundWinner.stop()})
		}
	}
	
	method soundOff(booleano){
		soundOff=booleano
	}
	method stopMenu(){
		musicaMenu.stop()
	}

}
