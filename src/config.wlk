import wollok.game.*
import caballero.*
import objetos.*
import enemigos.*


object config {
	
	method configurarAnimaciones(){

		game.onTick(100, "ANIMACION", { monedero.cambiarImagenMonedas()
										caballero.cambiarImagen()
		})
		
	}
		
	method configurarTeclas() {
		keyboard.a().onPressDo({ caballero.irASiEsPosible(caballero.position().left(1)) })
		keyboard.d().onPressDo({ caballero.irASiEsPosible(caballero.position().right(1)) })
		keyboard.s().onPressDo({ caballero.irASiEsPosible(caballero.position().down(1)) })
		keyboard.w().onPressDo({ caballero.irASiEsPosible(caballero.position().up(1)) })
		keyboard.left().onPressDo({ caballero.irASiEsPosible(caballero.position().left(1)) })
		keyboard.right().onPressDo({ caballero.irASiEsPosible(caballero.position().right(1)) })
		keyboard.down().onPressDo({ caballero.irASiEsPosible(caballero.position().down(1)) })
		keyboard.up().onPressDo({ caballero.irASiEsPosible(caballero.position().up(1)) })
		keyboard.e().onPressDo({ caballero.interactuarConObjetoDebajo() })
			
	}

	
//	method configurarColisiones() {
//		game.onCollideDo(caballero, { objeto => objeto.colisiono(caballero)
//		})
//	}

}
