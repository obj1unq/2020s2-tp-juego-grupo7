import escenarios.*
import wollok.game.*
import config.*
import enemigos.*

object nivel1 {
	
	method iniciarEscenario(){	
	const babosa = new Enemigo(position = game.at(10,4),direccion = izquierda,movimientosRealizados = 0,movimientosALlegar = 10)
	const babosa2 = new Enemigo(position = game.at(12,5),direccion = derecha,movimientosRealizados = 0,movimientosALlegar= 7)
	const babosa3 = new Enemigo(position = game.at(6,6),direccion = arriba,movimientosRealizados = 0,movimientosALlegar=6)
	generadorDeHabitacion.factory(6,6,game.at(0,6))
	generadorDeHabitacion.factory(6,6,game.at(7,6))
	generadorDeHabitacion.factory(6,6,game.at(14,6))
	generadorDeHabitacion.factory(7,4,game.at(13,0))
	generadorDeHabitacion.armadoDeParedHorizontal(10, game.at(0,1))
	generadorDeHabitacion.armadoDeParedVertical(3, game.at(2,7))
	generadorDeHabitacion.generarAcceso(game.at(1,6))
	generadorDeHabitacion.generarAcceso(game.at(7,8))
	generadorDeHabitacion.generarAcceso(game.at(16,6))
	generadorDeHabitacion.generarAcceso(game.at(13,2))
	game.addVisual(babosa)
	game.addVisual(babosa2)
	game.addVisual(babosa3)
	
	game.onTick(100,"ANIMACION", {babosa.cambiarImagen()})
	game.onTick(500, "enemigo", { babosa.mover()})
	game.onTick(100,"ANIMACION", {babosa2.cambiarImagen()})
	game.onTick(1000, "enemigo", { babosa2.mover()})
	game.onTick(100,"ANIMACION", {babosa3.cambiarImagen()})
	game.onTick(700, "enemigo", { babosa3.mover()})
	config.configurarAnimaciones()
	}
	
}
