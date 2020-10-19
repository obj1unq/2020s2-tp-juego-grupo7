import wollok.game.*

object caballero {
	var indexImg = 0
	var property position = game.at(0,0)
	var lista =[]
	
	
	method image() {
		return "knight_"+ indexImg + ".png"
	}
	
	method cambiarImagen() {
		indexImg = (indexImg+1) % 4
	}
	
	method irASiEsPosible(nuevaPosicion) {
		if (!self.esMuroOPuertaCerrada(nuevaPosicion)) {
			self.irA(nuevaPosicion)
		}
	}	
	method esMuroOPuertaCerrada(nuevaPosicion) {
		const objetosNuevaPosicion = game.getObjectsIn(nuevaPosicion)
		return objetosNuevaPosicion.any({cosa => cosa.image() == "muro.png" or cosa.image() == "puertaCerrada.png"})
	}
	
	method irA(nuevaPosicion) {
		position = nuevaPosicion
	}
	
	method interactuarConObjetoDebajo() {
		const objetos = game.colliders(self)
		if (objetos.isEmpty()) {
			self.error("No hay nada acá")
		}
		return objetos.head().action()
	}
	
}

