import caballero.*
import escenarios.*
import niveles.*
import wollok.game.*
import config.*




class Enemigo{
	
	var property position = game.at(0,0)
	var indexImg = 0
	var property direccion = null
	var property movimientosRealizados = 0
	var property movimientosALlegar = null
	
	method image() {
		return "demon" + direccion.nombre()   + "_" + indexImg + ".png"
	}
	
	method cambiarImagen(){
		indexImg = (indexImg + 1) % 4
	}
	
	method mover(){
		const objetoAlLado = game.getObjectsIn(direccion.siguientePosicion(position)) 
		
		if (objetoAlLado.contains(caballero)){
			position = direccion.siguientePosicion(position)
			movimientosRealizados +=1
		}
		else if (not objetoAlLado.isEmpty() or not self.estoyDentroDelTablero(direccion.siguientePosicion(position)) or self.completeRecorrido()){
			direccion = direccion.direccionOpuesta()
			movimientosRealizados = 0
		}
		else{
			position = direccion.siguientePosicion(position)
			movimientosRealizados +=1
			
		}
	}
	
	
	method estoyDentroDelTablero(posicion){
		return posicion.x().between(0,game.width()-1) and posicion.y().between(0,game.height()-1)
	}
	
	
	method completeRecorrido(){
		return  movimientosRealizados == movimientosALlegar
	}
	
	method colisiono(personaje){
		personaje.hacerteDanio() 
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





