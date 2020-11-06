import wollok.game.*
import caballero.*
import enemigos.*
import escenarios.*

// MONEDAS

class Moneda {

	var property position = game.at(10, 9)
	var indexImg = 0
	method action() {		
		game.removeVisual(self)
		atributos.monedaRecolectada(self)
	}	
	method image() 
	method colisiono(personaje){ }
	method voyAColisionar(personaje) {personaje.position(position)}
	method cambiarImagen() { indexImg = (indexImg+1) % 10 }
		
}

class MonedaDeOro inherits Moneda {
	override method image() = "Gold_2"+ indexImg.toString() + ".png"
	override method action(){ 
		super()
		caballero.formaDeCaer(powerUpAgujero)
		powerUpAgujero.moneda(self)
	}
	
	method ubicar(){
		game.addVisualIn(self,game.at(15,13))
	}
	
}

class MonedaDePlata inherits Moneda {
	override method image() = "Silver_2"+ indexImg.toString() + ".png"
	override method action(){ 
		super()
		caballero.formaDePincharse(powerUpPinches)
		powerUpPinches.moneda(self)
			}
	
	method ubicar(){
		game.addVisualIn(self,game.at(17,13))
	}		

}

class MonedaDeBronze inherits Moneda {
	override method image() = "Bronze_2"+ indexImg.toString() + ".png"
	override method action(){ 
		super()
		caballero.formaDeRecibirDanio(powerUpDanio)
		powerUpDanio.moneda(self)
	}
	
	method ubicar(){
		game.addVisualIn(self,game.at(19,13))
	}
	
}


object animator {
	const visuales = #{} 
	
	method crearObjetoAnimado(objeto){
		visuales.add(objeto)
		return objeto
	}
	
	method cambiarImagenes() {
		visuales.forEach({objeto => objeto.cambiarImagen()})
	}
	
}



class Puerta {
	var property estado = cerrada
	var property position = game.at(1, 6)	
	method image() = estado.image() 
	method action() {}
	method colisiono(personaje) {}
	method voyAColisionar(personaje){ estado.voyAColisionar(personaje, position) }
	method cambiarEstado() { estado.cambiar(self) }
}

object cerrada {
	method cambiar(puerta){	puerta.estado(abierta) }
	method image() = "puertaCerrada.png"
	method voyAColisionar(personaje, position){  }
}

object abierta {
	method cambiar(puerta){	puerta.estado(cerrada) }
	method image() = "puertaAbierta.png"
	method voyAColisionar(personaje, position){ personaje.position(position) }
}



class Palanca {
	var property estado = 0
	var property position	
	method image() = "palanca_" + estado + ".png" 
	method action() {self.cambiarEstadoPuertas()}
	method voyAColisionar(personaje){ personaje.position(position) }
	method colisiono(personaje){  }
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
	method voyAColisionar(personaje){  }
	method contener(unaLlave){
		contenedor.add(unaLlave)
	}
}

class Llave{
	var property position
	method image()="llaveprueba-2.png"
	
	method action(){
		game.removeVisual(self)
		caballero.gane()
	}
	method colisiono(personaje){ }

	method voyAColisionar(personaje){ personaje.position(position) }

}



