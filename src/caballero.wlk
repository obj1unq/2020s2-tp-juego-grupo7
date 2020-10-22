import wollok.game.*

object caballero {
	var indexImg = 0
	var property position = game.at(0,0)
	const monedas =[]
	
	method image() {
		return "knight_"+ indexImg + ".png"
	}
	
	method cambiarImagen() {
		indexImg = (indexImg+1) % 4	
	}
	
	method perder() {
		game.say(self, "PERDI INSSSSTA")
		self.finalizarJuego()
	}
	
	method sacarVida() {
		self.perder()
	}
	
	method irASiEsPosible(nuevaPosicion) {
		const objetosNuevaPosicion = game.getObjectsIn(nuevaPosicion) 
		if (objetosNuevaPosicion.size()>0) 
			objetosNuevaPosicion.head().colisiono(self) 
			else self.irAConLimites(nuevaPosicion)
	}
	
	method irAConLimites(nuevaPosicion) {
		if (self.estaDentroDelTablero(nuevaPosicion))
		position = nuevaPosicion
	}
	
	method estaDentroDelTablero(posicion){
		return posicion.x().between(0,game.width()-1) and posicion.y().between(0,game.height()-1)
	}	
		
	method interactuarConObjetoDebajo() {
		const objetos = game.colliders(self)
		if (objetos.isEmpty()) {
			self.error("No hay nada acá")
		}
		return objetos.head().action()
	}
	
	method finalizarJuego() {
		game.schedule(1000, { game.stop() })
	}
	method gane(){
		game.say(self, "GANE PERRO")
		self.finalizarJuego()
	}


}