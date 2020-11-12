import wollok.game.*

object sonidos {
	var property musicaFondo = game.sound("prueba1.mp3")
	const property musicaMenu= game.sound("musicamenu.mp3")
	var property sonidoGanar=game.sound("ganar.mp3")	
	method sonar(unSonido){
		musicaFondo.pause()
		unSonido.play()
		musicaFondo.resume()
	}
	
	method nivelSuperado(){
	 	musicaFondo.stop()
	 	sonidoGanar.play()
	 	game.schedule(4000, sonidoGanar.stop())
	}
}
