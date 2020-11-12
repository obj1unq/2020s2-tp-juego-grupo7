import escenarios.*
import wollok.game.*
import caballero.*
import config.*
import niveles.*
import sounds.*

object menu {

	method iniciarMenu(){
	game.height(14)
	game.width(20)
	game.ground("suelo.png")
	config.configurarTeclasMenu()

	
	habitacion.crearParedVertical(game.height(), game.origin())
 	habitacion.crearParedHorizontal(game.width()-1,game.origin().right(1))
 	habitacion.crearParedVertical(game.height()-1, game.at(19,1))
 	habitacion.crearParedHorizontal(game.width()-1,game.at(0,13))
	game.addVisual(start)
	game.addVisual(setup)
	game.addVisual(exit)
	game.addVisual(cursor)
	game.addVisual(new Banderin(position=game.at(0,12)))
	game.addVisual(new Banderin(position=game.at(19,12)))
	game.addVisual(new Banderin(position=game.at(0,2)))
	game.addVisual(new Banderin(position=game.at(19,2)))
	game.schedule(2000, {sonidos.musicaMenu().play()})
	
		
	}
	}
	
	
object start{
	var property image="start.png"
	var property position=game.at(9,9)
	method action(){
		game.clear()
		sonidos.musicaMenu().stop()
		nivel1.iniciarEscenario()
	}
	}

object setup{
	var property image="setup.png"
	var property position=game.at(9,7)
	method action(){}
}

object exit{
	var property image="exit.png"
	var property position=game.at(9,5)
	method action(){
		game.stop()
	}
	
}

object cursor{
	const property image="cursor.png"
	var property position=game.at(7,9)
	
	method mover(unaPosicion){
		if(self.validacionDeMovimiento(unaPosicion)){
		self.position(unaPosicion)}
	}
	method start(){
		self.option().forEach({option=>option.action()})
	}
	method option(){
		return game.getObjectsIn(self.position().right(2))
	}
	
	method validacionDeMovimiento(unaPosicion){
		return unaPosicion.x()==7 and unaPosicion.y().between(5,9)
	}	
}

class Banderin{
	const property image="banderin.png"
	const property position
}