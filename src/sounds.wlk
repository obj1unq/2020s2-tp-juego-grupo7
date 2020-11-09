import wollok.game.*

object sonidos {
	var property musicaFondo = game.sound("prueba1.mp3")
	var property cofre=game.sound("cofre.mp3")
	var property puerta=game.sound("puerta.wav")
	var property moneda=game.sound("moneda.wav")
	
	method sonar(unSonido){
		self.musicaFondo().pause()
		unSonido.play()
		game.schedule(1000, {unSonido.stop()})
		self.musicaFondo().resume()
	}
}