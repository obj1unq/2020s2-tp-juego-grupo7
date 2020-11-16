import wollok.game.*
import random.*
import caballero.*


class Trampa {
	
    const property position = game.at(5,5)
    var property indeximg = 0
    var property pinches = desactivados
    method image() = pinches.image()
    method action() {}
    
    
    method colisiono(personaje) {
    	
    	}
    
    
    	 
    method voyAColisionar(personaje) {
    	personaje.position(position)
    	//pinches.voyAColisionar(personaje)
    }
    
    method animacion(){
  	    game.onTick(1000,"ANIMACION", {self.cambiarImagen()})}
    	
    
    method cambiarImagen(){
    	pinches.cambiarEstado(self)
    	game.onCollideDo(self, {pinche => pinches.colisiono(caballero)})
    }
}




object desactivados{
	
	method image(){
		return "trampapinche_0.png"
	}
	
	method cambiarEstado(trampa){
		trampa.pinches(activados)
	}
	
	//method voyAColisionar(personaje){}
	
	method colisiono(personaje){}
}





object activados{
	
	method image(){
		return "trampapinche_1.png"
	}
	
	method cambiarEstado(trampa){
		trampa.pinches(desactivados)
	}
	
//	method voyAColisionar(personaje){
//		//personaje.pinchate()	
//	}
	
	method colisiono(personaje){
		personaje.pinchate()
		
	}
}



object generadorDeTrampas { 
	var property cantDeTrampas=0
	method nuevaTrampa() {
		
		const trampita = new Trampa(position=randomizer.emptyPosition())
			game.addVisual(trampita)
			cantDeTrampas+=1
			self.validarCaballero()
			trampita.animacion()
			if(cantDeTrampas==9)game.removeTickEvent("NUEVA TRAMPA")
	}
	
	method agregarTrampas(){ 
	game.onTick(5000, "NUEVA TRAMPA", { self.nuevaTrampa() })
	}
	
	method validarCaballero(){
		if (game.hasVisual(caballero)){
			game.removeVisual(caballero)
			game.addVisual(caballero)
		}
	}

}


class Agujero{
	
	const property position 
	
	method image(){
		return "agujero.png"
	}
	
	method colisiono(personaje){
		personaje.caerAgujero()
	}
	
	method voyAColisionar(personaje){ personaje.position(position) }
}