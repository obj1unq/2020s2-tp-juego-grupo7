import escenarios.*
import wollok.game.*
import config.*
import niveles.*
import sounds.*
import objetos.*

object menu {
	const property optionMenu=[start,setup,exit]
	const property optionSetup=[on,off,back]
	const antorcha=new Antorcha(position=game.at(19,12))
 	const antorcha1=new Antorcha(position=game.at(19,1))
 	const antorcha2=new Antorcha(position=game.at(0,1))
 	const antorcha3=new Antorcha(position=game.at(0,12))
 	
	method iniciarMenu(){
		game.height(14)
		game.width(20)
		game.ground("suelo.png")
		config.configurarTeclasMenu()

		sonidos.playMusic(game.sound("musicamenu.mp3"))
	
		habitacion.crearParedVertical(game.height(), game.origin())
 		habitacion.crearParedHorizontal(game.width()-1,game.origin().right(1))
 		habitacion.crearParedVertical(game.height()-1, game.at(19,1))
 		habitacion.crearParedHorizontal(game.width()-1,game.at(0,13))
		
		game.addVisual(cursor)
		
		self.setMenu()
		self.visualesAntorchas()
		
		game.onTick(100, "ANIMACION", { animator.cambiarImagenes()})
	}
	
	method visualesAntorchas(){
		game.addVisual(animator.crearObjetoAnimado(antorcha))
		game.addVisual(animator.crearObjetoAnimado(antorcha1))
		game.addVisual(animator.crearObjetoAnimado(antorcha2))
		game.addVisual(animator.crearObjetoAnimado(antorcha3))
	}
	
	method restart(){
		sonidos.stopMusic()
		game.clear()
		nivel1.restart()
		self.iniciarMenu()
	}
	
	method cleanMenu(){
		optionMenu.forEach({option=>game.removeVisual(option)})
	}
	
	method setMenu(){
		optionMenu.forEach({option=>game.addVisual(option)})
	}
	method cleanSetup(){
		optionSetup.forEach({option=>game.removeVisual(option)})
	}
	
	method setSetup(){
		optionSetup.forEach({option=>game.addVisual(option)})
	}
}

object cursor{
	const property image="cursor.png"
	var property position=game.at(7,9)
	
	method mover(unaPosicion){
		if(self.validacionDeMovimiento(unaPosicion)){
		self.position(unaPosicion)}
	}
	method action(){
		self.option().forEach({option=>option.action()})
	}
	method option(){
		return game.getObjectsIn(self.position().right(2))
	}
	
	method validacionDeMovimiento(unaPosicion){
		return unaPosicion.x()==7 and unaPosicion.y().between(5,9)
	}	
}	
//opciones	
object start{
	var property image="start.png"
	var property position=game.at(9,9)
	method action(){
		sonidos.stopMusic()
		game.clear()
		nivel1.iniciarEscenario()
	}
}

object setup{
	var property image="setup.png"
	var property position=game.at(9,7)
	method action(){
		menu.cleanMenu()
		menu.setSetup()
	}
}

object exit{
	var property image="exit.png"
	var property position=game.at(9,5)
	method action(){
		game.stop()
	}
	
}

object on{
	var property image="on.png"
	var property position=game.at(9,9)
	method action(){
		sonidos.soundOff(false)
		game.say(self,"Sonido activado")
		sonidos.playMusic(game.sound("musicamenu.mp3"))
	}
}
object off{
	var property image="off.png"
	var property position=game.at(9,7)
	method action(){
		sonidos.soundOff(true)
		sonidos.stopMusic()
		game.say(self,"Sonido desactivado")
	}
}

object back{
	var property image="back.png"
	var property position=game.at(9,5)
	
	method action(){
		menu.cleanSetup()
		menu.setMenu()	
	}	
}
