import wollok.game.*

object sonidos {
	var property musicaFondo = game.sound("prueba1.mp3")
	
	method sonar(unSonido){
		self.musicaFondo().pause()
		unSonido.play()
//		game.schedule(3000, {unSonido.stop()})
		self.musicaFondo().resume()
	}
}
