import wollok.game.*

object caballero {

	var property position = game.at(0,0)

	method image() {
		return "pepita.png"
	}
	
	method perder() {
		game.say(self, "PERDI INSSSSTA")
		self.finalizarJuego()
	}
	
	method finalizarJuego() {
		game.schedule(3000, { game.stop() })
	}

}