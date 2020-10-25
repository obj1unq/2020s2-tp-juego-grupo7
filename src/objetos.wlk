import wollok.game.*
import caballero.*
import enemigos.*


// MONEDAS

class Moneda {
	var property tipo = "Gold"
	var property position = game.at(10, 9)
	var indexImg = 0
	method action() {}	
	method image() = tipo + "_2" + indexImg + ".png" 
	method colisiono(personaje){ personaje.position(position); game.removeVisual(self) }
	method cambiarImagen() {
		indexImg = (indexImg+1) % 10
	}
	
	
}

object monedero {
	const monedas = #{}
	
	method crearMoneda (_tipo, _position){
		const monedaCreada = new Moneda(tipo = _tipo, position = _position)
		monedas.add(monedaCreada)
		return monedaCreada	
	}
	
	method cambiarImagenMonedas() {
		monedas.forEach({moneda => moneda.cambiarImagen()})
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

object llave{
	var property position=game.at(11,7)
	method image()="llaveprueba-2.png"
	
	method action(){
		game.removeVisual(self)
		caballero.gane()
	}
	method colisiono(personaje){ personaje.position(position) }
}



