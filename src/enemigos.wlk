import caballero.*
import escenarios.*
import niveles.*
import wollok.game.*
import config.*
import sounds.*



class Enemigo{
	
	var property position
	var indexImg =0
	var property direccion 
	var property movimientosRealizados=0 
	var property movimientosALlegar

	method image() {
		return "demon" + direccion.nombre()   + "_" + indexImg + ".png"
	}
	
	method cambiarImagen(){
		indexImg = (indexImg + 1) % 4
	}


	
	method mover(){ 
		const proxPosicion = direccion.siguientePosicion(position)
		const objetosAlLado = game.getObjectsIn(proxPosicion)
	//	const imagenesObjetos = objetoAlLado.map{objeto => objeto.image()} 
		self.esFinalDeRecorrido()
		self.movimiento(objetosAlLado,proxPosicion)
	//	self.encontreObjetos(imagenesObjetos,objetoAlLado)
	}
	method esFinalDeRecorrido(){
		if(movimientosALlegar==movimientosRealizados){
			direccion=direccion.direccionOpuesta()
			movimientosRealizados=0
		}
	}
	method movimiento(objetos,posicion){
		if(self.estoyDentroDelTablero(posicion))
			if (self.hayCaballero(objetos) or objetos.isEmpty()){
				position=posicion
				movimientosRealizados+=1
			}
			else direccion=direccion.direccionOpuesta()
		
	}
	method hayCaballero(lista)=lista.contains(caballero)
//	method encontreObjetos(imagenesObjetos,objetoAlLado){
//		if (self.sonObjetos(imagenesObjetos)){
//			direccion = direccion.direccionOpuesta()
//			movimientosRealizados = 0
//		}else{
//			self.encontreCaballero(objetoAlLado)
//		}
//	}
//	
//	method sonObjetos(imagenesObjetos){
//		return imagenesObjetos.contains("trampapinche_0.png") or imagenesObjetos.contains("trampapinche_1.png") or imagenesObjetos.contains("puertaAbierta.png")
//	}
	
//	method encontreCaballero(objetoAlLado){
//		if (self.esCaballero(objetoAlLado)){
//			position = direccion.siguientePosicion(position)
//			movimientosRealizados +=1
//		}else{
//			self.encontreLimiteOFinalRecorrido(objetoAlLado)
//		}
//	}
//	
//	method esCaballero(objetoAlLado){
//		return objetoAlLado.contains(caballero)
//	}
	
//	method encontreLimiteOFinalRecorrido(objetoAlLado){
//		if (self.esFinalDelTableroOFinalRecorrido(objetoAlLado)){
//			direccion = direccion.direccionOpuesta()
//			movimientosRealizados = 0
//		}else{
//			position = direccion.siguientePosicion(position)
//			movimientosRealizados +=1
//		}
//	}
	
//	method esFinalDelTableroOFinalRecorrido(objetoAlLado){
//		return not self.estoyDentroDelTablero(direccion.siguientePosicion(position)) or self.completeRecorrido()
//	}
//	
//	
//	
	
	method estoyDentroDelTablero(posicion){
		return posicion.x().between(0,game.width()-1) and posicion.y().between(0,game.height()-1)
	}
	
	
//	method completeRecorrido(){
//		return  movimientosRealizados == movimientosALlegar
//	}
//	
	method colisiono(personaje){
		personaje.hacerteDanio() 
		sonidos.play("babosa.wav")
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





