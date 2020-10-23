import wollok.game.*
import random.*
import caballero.*


class Trampa {
	
    const property position = game.at(5,5)
    var property indeximg = 0
    method image() = "trampapinche_" + indeximg +".png"
    
    method action() {}
    
    method colisiono(personaje) {
    	personaje.position(position)
    	personaje.sacarVida()
    }
    
    method cambiarImagen(){
    	indeximg = (indeximg + 1) % 2
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
			game.onTick(500,"ANIMACION", {trampita.cambiarImagen()})
	}
}   




class Agujero{
	
	const property position 
	
	method image(){
		return "agujero.png"
	}
	
	method colisiono(personaje){
		game.removeVisual(personaje)
		personaje.finalizarJuego()
	}
}