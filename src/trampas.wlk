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
    
    method animacion(){
  	    game.onTick(1000,"ANIMACION", {self.cambiarImagen()})}
    	
 //  method detenerAnimacion(){
 //   	game.removeTickEvent("ANIMACION")
 //  }
    
    method cambiarImagen(){
    	indeximg = (indeximg + 1) % 2
    }
}

/*object fabricaDeTrampas {
	
	method generarTrampa() {
		return (new Trampa(position=randomizer.emptyPosition()))
	}
}*/

object generadorDeTrampas { 
	var cantDeTrampas=0
	method nuevaTrampa() {
		
		const trampita = new Trampa(position=randomizer.emptyPosition())
			game.addVisual(trampita)
			cantDeTrampas+=1
			
			//game.onTick(1000,"ANIMACION", {trampita.cambiarImagen()})
			trampita.animacion()
			if(cantDeTrampas==4)game.removeTickEvent("NUEVA TRAMPA")
	}
	
	method agregarTrampas(){ 
	game.onTick(5000, "NUEVA TRAMPA", { self.nuevaTrampa() })
	}
	
}   




class Agujero{
	
	const property position 
	
	method image(){
		return "agujero.png"
	}
	
	method colisiono(personaje){
		personaje.caerEnAgujero()
	}
}