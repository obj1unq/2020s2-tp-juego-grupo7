import wollok.game.*
import caballero.*
import enemigos.*
import escenarios.*
import sounds.*
// MONEDAS

class Moneda {

	var property position = game.at(10, 9)
	var indexImg = 0
	
	method action() {		
		atributos.monedaRecolectada(self)
		sonidos.play("moneda.wav")
		game.say(caballero, self.description())
		self.powerUp()
	}	
	method description()
	method powerUp() 	
	method image(){return self.nombre()+indexImg.toString() + ".png"} 
	method nombre()
	method colisiono(personaje){ }
	method voyAColisionar(personaje) {personaje.position(position)}
	method cambiarImagen() { indexImg = (indexImg+1) % 10 }
		
}

class MonedaDeOro inherits Moneda {
	override method nombre() = "Gold_2"
	override method description(){ 
		return "Ahora podre evitar los pozos"}
		
	override method powerUp(){
		const powerUp = new PowerUpAgujero(moneda = self)
		caballero.formaDeCaer(powerUp)

	}
	
	
}

class MonedaDePlata inherits Moneda {
	override method nombre() = "Silver_2"
	override method description(){ 
		return "Ahora podre evitar las trampas"}
	override method powerUp(){
		const powerUp = new PowerUpPinches(moneda = self)
		caballero.formaDePincharse(powerUp)
		}	

}

class MonedaDeBronze inherits Moneda {
	override method nombre() = "Bronze_2"
	override method description(){ 
		return "Ahora podre evitar las babosas"}
	override method powerUp(){
		const powerUp = new PowerUpDanio(moneda = self)
		caballero.formaDeRecibirDanio(powerUp)
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

//puertas

class Puerta {
	var property estado = cerrada
	var property position = game.at(1, 6)	
	method image() = estado.image() 
	method action() {}
	method colisiono(personaje) {
	}
	method voyAColisionar(personaje){ estado.voyAColisionar(personaje, position) }
	method cambiarEstado() { 
		sonidos.play("puerta.wav")
		estado.cambiar(self)
	}
}

class PuertaEscape inherits Puerta{
	override method action(){
		self.cambiarEstado()
	}
	override method cambiarEstado(){
		if(caballero.tieneLlave()){
		   super()
		   
		}
		else game.say(self,"Debes conseguir llave")
	}
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
	method action() {
		self.cambiarEstadoPuertas()
		
	}
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

//cofres
class Cofre{
	var property position
	var contenedor=[]
	var property estado= cofreCerrado
	var property image=estado.image()
	
	method cambiarImagen(){
		image=estado.image()
	}
	method action(){
		estado.action(self)
		self.cambiarImagen()
		if(self.contieneAlgo()){
			game.addVisualIn(contenedor.first(),self.position())
			contenedor=[]}
	}
	method contieneAlgo(){
		return contenedor.size()>0
	}
	method colisiono(personaje){
	}
	method voyAColisionar(personaje){  }
	method contener(algo){
		contenedor.add(algo)
	}
}

object cofreAbierto{ 
	const property image = "cofre_abierto.png"

	method action(cofre){
		cofre.estado(cofreCerrado)

	}
}
object cofreCerrado{
	const property image="cofre.png"
	
	method action(cofre){
		sonidos.play("cofre.mp3")
		cofre.estado(cofreAbierto)
		
	}
}


//llave
class Llave{
	var property position
	var indexImg=0

	method image(){
		return "llave"+ indexImg.toString() + ".png"
	}
	method cambiarImagen() {
		indexImg = (indexImg+1) % 4
	}
	method action(){
		sonidos.play("llave.mp3")
		game.say(caballero,"Si!, puedo escapar")
		game.removeVisual(self)
		caballero.tieneLlave(true)
	}
	method colisiono(personaje){ }

	method voyAColisionar(personaje){ personaje.position(position) }

}

object escalera{
	var property position=game.at(19,12)
	var property oculta=true
	method image()="escalera.png"
	method action(){}
	method colisiono(personaje){
		personaje.gane()
	}
	method voyAColisionar(personaje){ 
		personaje.position(position)
	}
}

class Antorcha{
	const property position
	var indexImg=0
	
	method image(){
		return "antorcha"+ indexImg.toString() + ".png"
	}
	method cambiarImagen() {
		indexImg = (indexImg+1) % 4
	}
	method colisiono(personaje){}
	method voyAColisionar(personaje){}
}




