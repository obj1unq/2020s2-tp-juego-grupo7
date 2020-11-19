import caballero.*
import escenarios.*
import niveles.*
import wollok.game.*
import config.*
import sounds.*



class Enemigo{
	
	var property position = game.at(0,0)
	var indexImg = 0
	var property direccion = null
	var property movimientosRealizados = 0
	var property movimientosALlegar = null
	
	method reestablecer(){
		position = game.at(0,0)
	    indexImg = 0
		direccion = null
		movimientosRealizados = 0
		movimientosALlegar = null
	}
	method image() {
		return "demon" + direccion.nombre()   + "_" + indexImg + ".png"
	}
	
	method cambiarImagen(){
		indexImg = (indexImg + 1) % 4
	}


	
	method mover(){ //TODO: Cambiar Ifs
		const objetoAlLado = game.getObjectsIn(direccion.siguientePosicion(position))
		const imagenesObjetos = objetoAlLado.map{objeto => objeto.image()} 
		
		self.encontreObjetos(imagenesObjetos,objetoAlLado)
	}
	
	
	method encontreObjetos(imagenesObjetos,objetoAlLado){
		if (self.sonObjetos(imagenesObjetos)){
			direccion = direccion.direccionOpuesta()
			movimientosRealizados = 0
		}else{
			self.encontreCaballero(objetoAlLado)
		}
	}
	
	method sonObjetos(imagenesObjetos){
		return imagenesObjetos.contains("trampapinche_0.png") or imagenesObjetos.contains("trampapinche_1.png") or imagenesObjetos.contains("puertaAbierta.png")
	}
	
	method encontreCaballero(objetoAlLado){
		if (self.esCaballero(objetoAlLado)){
			position = direccion.siguientePosicion(position)
			movimientosRealizados +=1
		}else{
			self.encontreLimiteOFinalRecorrido(objetoAlLado)
		}
	}
	
	method esCaballero(objetoAlLado){
		return objetoAlLado.contains(caballero)
	}
	
	method encontreLimiteOFinalRecorrido(objetoAlLado){
		if (self.esFinalDelTableroOFinalRecorrido(objetoAlLado)){
			direccion = direccion.direccionOpuesta()
			movimientosRealizados = 0
		}else{
			position = direccion.siguientePosicion(position)
			movimientosRealizados +=1
		}
	}
	
	method esFinalDelTableroOFinalRecorrido(objetoAlLado){
		return not self.estoyDentroDelTablero(direccion.siguientePosicion(position)) or self.completeRecorrido()
	}
	
	
	
	
	method estoyDentroDelTablero(posicion){
		return posicion.x().between(0,game.width()-1) and posicion.y().between(0,game.height()-1)
	}
	
	
	method completeRecorrido(){
		return  movimientosRealizados == movimientosALlegar
	}
	
	method colisiono(personaje){
		personaje.hacerteDanio() 
		sonidos.play(game.sound("babosa.wav"))
	}
	
	method voyAColisionar(personaje){
		personaje.position(position)
	}
}	


	
	
object izquierda{
	
	method siguientePosicion(position){
		return position.left(1)
	}
	
	method direccionOpuesta(){
		return derecha
	}
	
	method nombre(){
		return "izquierda"
	}
	
}



object derecha{
	
	method siguientePosicion(position){
		return position.right(1)
	}
	
	method direccionOpuesta(){
		return izquierda
	}
	
	method nombre(){
		return "derecha"
	}
	
}


object arriba{
	
	method siguientePosicion(position){
		return position.up(1)
	}
	
	method direccionOpuesta(){
		return abajo
	}
	
	method nombre(){
		return "izquierda"
	}
}



object abajo{
	
	method siguientePosicion(position){
		return position.down(1)
	}
	
	method direccionOpuesta(){
		return arriba
	}
	
	method nombre(){
		return "derecha"
	}
	
}





