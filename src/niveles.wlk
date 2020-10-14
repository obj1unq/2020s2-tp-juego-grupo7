import escenarios.*
import wollok.game.*

object nivel1 {
	
	method iniciarEscenario(){	
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
	}
}
