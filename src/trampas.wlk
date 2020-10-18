import wollok.game.*
import random.*


class Trampa {
	
    const property position = game.at(5,5)
    method image() = "trap1.png"
    
    method colisiono(personaje) {
    	personaje.perder()
    }
}

object fabricaDeTrampas {
	
	method generarTrampa() {
		return (new Trampa(position=randomizer.emptyPosition()))
	}
}


object generadorDeTrampas { 
	

	method nuevaTrampa() {
		const trampita = fabricaDeTrampas.generarTrampa()
			game.addVisual(trampita)
	}
}   