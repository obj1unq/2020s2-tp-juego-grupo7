import wollok.game.*
import caballero.*
import enemigos.*


// MONEDAS

class Moneda {
//	var property tipo = oro
	var property position = game.at(10, 9)
	var indexImg = 0
	method action() {}	
	method image() 
	method colisiono(personaje){ 
		personaje.position(position)
		personaje.agregarMoneda(self)
		game.removeVisual(self)
	}
	method cambiarImagen() { indexImg = (indexImg+1) % 10 }
	method sacarVida(personaje)
	method caerEnAgujero(personaje)
	
}

class MonedaDeOro inherits Moneda {
	override method image() = "Gold_2"+ indexImg.toString() + ".png"
	override method sacarVida(personaje) { personaje.sacarVidaOPerder() }
	override method caerEnAgujero(personaje){ personaje.perderMoneda(self) }	
}

class MonedaDePlata inherits Moneda {
	override method image() = "Silver_2"+ indexImg.toString() + ".png"
	override method sacarVida(personaje) { personaje.sacarVidaOPerder() }
	override method caerEnAgujero(personaje){ personaje.caerEnAgujero() }	
}

class MonedaDeBronze inherits Moneda {
	override method image() = "Bronze_2"+ indexImg.toString() + ".png"
	override method sacarVida(personaje) { personaje.perderMoneda(self) }
	override method caerEnAgujero(personaje){ personaje.caerEnAgujero() }
	
}


object animator {
	const visuales = #{} 
	
//	method crearMoneda (_tipo, _position){
//		const monedaCreada = new Moneda(tipo = _tipo, position = _position)
//		monedas.add(monedaCreada)
//		return monedaCreada	
//	}

	method crearObjetoAnimado(objeto){
		visuales.add(objeto)
		return objeto
	}
	
	method cambiarImagenes() {
		visuales.forEach({objeto => objeto.cambiarImagen()})
	}
	
}

// MONEDAS FIN

class Puerta {
	var property estado = cerrada
	var property position = game.at(1, 6)	
	method image() = estado.image() 
	method action() {}
	method colisiono(personaje){ estado.colisiono(personaje, position) }
	method cambiarEstado() { estado.cambiar(self) }
}

object cerrada {
	method cambiar(puerta){	puerta.estado(abierta) }
	method image() = "puertaCerrada.png"
	method colisiono(personaje, position){  }
}

object abierta {
	method cambiar(puerta){	puerta.estado(cerrada) }
	method image() = "puertaAbierta.png"
	method colisiono(personaje, position){ personaje.position(position) }
}



class Palanca {
	var property estado = 0
	var property position	
	method image() = "palanca_" + estado + ".png" 
	method action() {self.cambiarEstadoPuertas()}
	method colisiono(personaje){ personaje.position(position) }
	
	method cambiarEstadoPuertas() {
		aberturas.cambiarEstadoPuertas()
		estado = (estado+1) % 2
	}

}

object aberturas {
	const puertas = []
	
	method crearPuerta (_estado, _position){
		const bloque=game.getObjectsIn(_position).get(0)
 			  game.removeVisual(bloque)
		const puertaCreada = new Puerta(estado = _estado, position = _position)
		puertas.add(puertaCreada)
		return 	puertaCreada	
	}
	
	method cambiarEstadoPuertas() {
		puertas.forEach({puerta => puerta.cambiarEstado()})
	}
	
}

class Cofre{
	var property position
	var property imagenes=["cofre.png","cofre_abierto.png"]
	var property image=imagenes.first()
	const contenedor=[]
	
	method cambiarImagen(){
		image=imagenes.last()
	}
	method action(){
		self.cambiarImagen()
		if(self.contieneLlave())
			game.addVisualIn(contenedor.first(),caballero.position())
	}
	method contieneLlave(){
		return contenedor.size()>0
	}
	method colisiono(personaje){
	}
	method contenerLLave(unaLlave){
		contenedor.add(unaLlave)
	}
}

class Llave{
	var property position=game.at(11,7)
	method image()="llaveprueba-2.png"
	
	method action(){
		game.removeVisual(self)
		caballero.gane()
	}
	method colisiono(personaje){ personaje.position(position) }
}



