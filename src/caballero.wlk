import wollok.game.*
import enemigos.*


object caballero {
	var indexImg = 0
	var property position = game.at(0,12)
	var property direccion = derecha
	const monedas =[]
	var property nivelDeVida = 3
	
	method image() {
		return "caballero"+ direccion.nombre() + "_"+ indexImg + ".png"
	}
	
	method cambiarImagen() {
		indexImg = (indexImg+1) % 4	
	}
	
	method agregarMoneda(moneda){
		monedas.add(moneda)
	}
	
	method tengoMonedas() {
		return monedas.size() > 0
	}
	
	method perderMoneda(moneda){
		monedas.remove(moneda)	
	}
	
//	method sacarVida() {
//		if (self.tengoMonedas()){
//			monedas.forEach({moneda => moneda.sacarVida(self)})
//		}
//		else {self.sacarVidaOPerder()}
//	}
//	
	
	method sacarVida(){
		if (nivelDeVida > 1) { 
			nivelDeVida -= 1;
			game.say(self, "Te queda " + nivelDeVida.toString() + " vida") }
			else {self.perder()}
	}
	
	method caerEnAgujero(){
		if (self.tengoMonedas()){
			monedas.forEach({moneda => moneda.caerEnAgujero(self)})
		}
		else {game.removeVisual(self); self.finalizarJuego()}
	}
	
/* 	method perderVida(){
		if (not vida == 0){
			vida = vida - vida.max(0)
		}else{
			self.perder()
		}
	}
*/	
	method irASiEsPosible(nuevaPosicion) {
		self.cambiarDireccion(nuevaPosicion)
		const objetosNuevaPosicion = game.getObjectsIn(nuevaPosicion) 
		if (objetosNuevaPosicion.size()>0){
			objetosNuevaPosicion.head().colisiono(self)
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
		game.say(self, "PERDI INSSSSTA")
		self.finalizarJuego()
	}
		
	method gane(){
		game.say(self, "GANE PERRO")
		self.finalizarJuego()
	}

	method finalizarJuego() {
		game.schedule(3000, { game.stop() })
	}


}