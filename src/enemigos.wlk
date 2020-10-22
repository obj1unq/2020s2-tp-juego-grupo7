import caballero.*
import escenarios.*
import niveles.*
import wollok.game.*
import config.*




class Enemigo{
	
	var property position = game.at(0,0)
	var indexImg = 0
	var property direccion = null
	var property movimientosRealizados = null
	var property movimientosALlegar = null
	
	method image() {
		return "demon" + direccion.nombre()   + "_" + indexImg + ".png"
	}
	
	method cambiarImagen(){
		indexImg = (indexImg + 1) % 4
	}
	
	method mover(){
		if (movimientosRealizados == movimientosALlegar ){
			direccion = direccion.direccionOpuesta()
			movimientosRealizados = 0
		}
		else{
			position = direccion.siguientePosicion(position)
			movimientosRealizados +=1
		}
	}
	
	method colisiono(personaje){
		personaje.position(position)
		personaje.sacarVida() 
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
		return "Derecha"
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





