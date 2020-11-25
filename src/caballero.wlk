import wollok.game.*
import enemigos.*
import trampas.*
import escenarios.*
import sounds.*
import config.*
import niveles.*
import menu.*

object caballero {
	var indexImg = 0
	var property position = game.at(0,0)
	var property direccion = derecha
	var property nivelDeVida = 3
	var property formaDePincharse = perderVida
	var property formaDeRecibirDanio = perderVida
	var property formaDeCaer = caer
	var property tieneLlave=false
	
	method reestablecer(){
		indexImg = 0
		position = game.at(0,0)
		direccion = derecha
		nivelDeVida = 3
		formaDePincharse = perderVida
		formaDeRecibirDanio = perderVida
		formaDeCaer = caer
		tieneLlave=false	
	}
	
	method image(){
		return "caballero"+ direccion.nombre() + "_"+ indexImg + ".png"
	}
	
	method cambiarImagen() {
		indexImg = (indexImg+1) % 4	
	}
	
	method pinchate(){
		sonidos.play("danio.mp3")
		formaDePincharse.sacarVida(self)
	}
	
	method hacerteDanio(){
		formaDeRecibirDanio.sacarVida(self)
	}
	
	method caerAgujero(){
		formaDeCaer.sacarVida(self)
	}
	
	
	
	method sacarVida(){	
		nivelDeVida = (nivelDeVida - 1).max(0)	
		atributos.disminuirVida(self)	
		self.validacionDeVida()
	}
	method validacionDeVida(){
		if (nivelDeVida == 0){ 
		game.removeVisual(self)
 		game.addVisual(new Skull(position= self.position()))
		self.perder()}}
	
	method caerEnAgujero(){		
		game.removeVisual(self);
		self.perder()
		
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
		game.addVisual(perdedor)
		sonidos.play("perder.mp3")
		self.finalizarJuego()
	}
		
	method gane(){
		game.addVisual(ganador)
		sonidos.stopMusic()
		sonidos.playMusic("ganar.mp3")
		game.removeVisual(self)
		self.finalizarJuego()
	}

	method finalizarJuego() {
		game.schedule(5000, { menu.restart() })
	}
	
}


object perderVida {
	
	
	var property moneda
	method sacarVida(personaje){
		personaje.sacarVida()
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

class Skull{
	const property image="skull.png"
	const property position
}