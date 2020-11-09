import wollok.game.*
import caballero.*
import objetos.*
import enemigos.*
import escenarios.*


object config {
	
	method configurarAnimaciones(){
		game.onTick(100, "ANIMACION", { animator.cambiarImagenes()})
		game.onTick(1000, "RELOJ", {reloj.sumarSegundo()})
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
		keyboard.e().onPressDo({ caballero.interactuarConObjeto() })
			
	}

	
	method configurarColisiones() {
		game.onCollideDo(caballero, { objeto => objeto.colisiono(caballero)
		})
	}

}
