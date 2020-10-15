import wollok.game.*
import caballero.*
import objetos.*
import enemigos.*


object config {
	
	method configurarAnimaciones(){
		game.onTick(100, "ANIMACION", { monedaCobre.cambiarImagen()
										monedaOro.cambiarImagen()
										monedaPlata.cambiarImagen()
		})
		}
		
	method configurarTeclas() {
		keyboard.left().onPressDo({caballero.position(caballero.position().left(1)) })
	}
}
