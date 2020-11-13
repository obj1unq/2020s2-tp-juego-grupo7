import wollok.game.*
import enemigos.*
import trampas.*
import escenarios.*
import sounds.*
import config.*
import niveles.*

object caballero {
	var indexImg = 0
	var property position = game.at(0,0)
	var property direccion = derecha
	var property nivelDeVida = 3
	var property formaDePincharse = perderVida
	var property formaDeRecibirDanio = perderVida
	var property formaDeCaer = caer
	
	method image(){
		return "caballero"+ direccion.nombre() + "_"+ indexImg + ".png"
	}
	
	method cambiarImagen() {
		indexImg = (indexImg+1) % 4	
	}
	
	method pinchate(){
		sonidos.danio()
		formaDePincharse.sacarVida(self)
	}
	
	method hacerteDanio(){
		formaDeRecibirDanio.sacarVida(self)
	}
	
	method caerAgujero(){
		formaDeCaer.sacarVida(self)
	}
	
	
	
	method estoyEnPinche(){
		const objeto = game.colliders(self)
		if (not objeto.isEmpty() and objeto.first().image() == activados.image()) {
			activados.colisiono(self)
		}
		else if (nivelDeVida == 0){
		game.removeTickEvent("verificar si estoy en pinche")
		}
	}
			

	
	method sacarVida(){	
		nivelDeVida = (nivelDeVida - 1).max(0)	
		atributos.disminuirVida(self)	
		if (nivelDeVida == 0) 
		self.perder() 
	}
	
	method caerEnAgujero(){
		
		
		if (formaDeCaer == caer){
		self.validarCantidadTrampas()
		game.removeTickEvent("verificar si estoy en pinche")
		 
		game.removeVisual(self);

		self.perder()
		}
	}
	
	
	method validarCantidadTrampas(){
		if ( generadorDeTrampas.cantDeTrampas() != 7){
			game.removeTickEvent("NUEVA TRAMPA")
		}
	}
	
	method irASiEsPosible(nuevaPosicion) {
		self.cambiarDireccion(nuevaPosicion)
		const objetosNuevaPosicion = game.getObjectsIn(nuevaPosicion) 
		if (objetosNuevaPosicion.size()>0){
			objetosNuevaPosicion.head().voyAColisionar(self)
		}
		else{
			self.irAConLimites(nuevaPosicion)
		} 
	}
	
	method irAConLimites(nuevaPosicion) {
		if (self.estaDentroDelTablero(nuevaPosicion))
		position = nuevaPosicion
	}
	
	
	method cambiarDireccion(nuevaPosicion){
		if ( nuevaPosicion == position.left(1)){
			direccion = izquierda
		}
		else if ( nuevaPosicion == position.right(1)){
			direccion = derecha
		}
	}
	
	method estaDentroDelTablero(posicion){
		return posicion.x().between(0,game.width()-1) and posicion.y().between(0,game.height()-1)
	}	
		
	method interactuarConObjeto() {

		var objetos = game.colliders(self)
			objetos+=game.getObjectsIn(direccion.siguientePosicion(self.position()))

			
		if (objetos.isEmpty()) {
			self.error("No hay nada acá")
		}
		 objetos.forEach({objeto=>objeto.action()})
		 
	}
	
	
	method perder() {
		sonidos.perder()
		if(game.hasVisual(self)){game.say(self, "PERDI INSSSSTA")}
		self.finalizarJuego()
	}
		
	method gane(){
		game.say(self, "GANE PERRO")
		self.finalizarJuego()
	}

	method finalizarJuego() {
		game.schedule(5000, { game.stop() })
	}

}


object perderVida {
	
	
	var property moneda
	method sacarVida(personaje){
		personaje.sacarVida()
		game.say(caballero,"Ouch! me quedan "+caballero.nivelDeVida().toString()+" vidas")
	}
	
}

object caer {
	method sacarVida(personaje){
		personaje.caerEnAgujero()
	}
}

object powerUpPinches {
	var property moneda
	method sacarVida(personaje){
		atributos.monedaPerdida(moneda)
		personaje.formaDePincharse(perderVida)
	}
}

object powerUpDanio {
	var property moneda
	method sacarVida(personaje){
		atributos.monedaPerdida(moneda)
		personaje.formaDeRecibirDanio(perderVida)
	}
}

object powerUpAgujero {
	var property moneda
	method sacarVida(personaje){
		atributos.monedaPerdida(moneda)
		personaje.formaDeCaer(caer)
	}
}