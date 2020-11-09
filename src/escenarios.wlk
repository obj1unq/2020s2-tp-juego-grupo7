import wollok.game.*
import caballero.*

class BloqueDePared{
	var property position
	var property tipo = "muro"
	
	method image()= tipo + ".png"
	method agregarBloqueAlEscenario(){
		game.addVisual(self)
	}
	method action(){}	
	method voyAColisionar(personaje) {}
	method coisiono(personaje) {} //posria no estar?

}


object habitacion {  
	var pared=[]
	method crear(largoDePared,altoDePared, posicionInicial){
	
		self.crearParedHorizontal(largoDePared,posicionInicial)
	
		self.crearParedVertical(altoDePared,posicionInicial)
	
		self.crearParedHorizontal(largoDePared,posicionInicial.up(altoDePared-1))				
	
		self.crearParedVertical(altoDePared,posicionInicial.right(largoDePared-1))
	}
	

  method paredEnGame(){pared.forEach({unbloque=>unbloque.agregarBloqueAlEscenario()})}
 
  
  method crearPared (largoDePared,posicionInicial,movimiento){
			var celdas=largoDePared 
			var pos=posicionInicial
			if (celdas>0){
			pared.add(new BloqueDePared(position=pos))
			pos= movimiento.apply(pos)
			celdas-=1
			self.crearPared (celdas,pos,movimiento)}
			else{self.paredEnGame()}
			pared=[]
}

  method crearParedHorizontal (largoDePared, posicionInicial){
  	
  			self.crearPared(largoDePared, posicionInicial, { pos => pos.right(1) })
  }
  
  method crearParedVertical (largoDePared, posicionInicial){
 	
  			self.crearPared(largoDePared, posicionInicial, { pos => pos.up(1) })
  }
	
}

object atributos{
	const vidaImg=["corazon0.png","corazon1.png","corazon2.png"]
	var property image="corazon3.png"
	const property position=game.at(2,13)
	var iniMonedas=game.at(20,13)
	
	method monedaRecolectada(unaMoneda){
		game.removeVisual(unaMoneda)
		unaMoneda.position(iniMonedas.left(1))
		iniMonedas=unaMoneda.position()	
		game.addVisual(unaMoneda)		
	}
	
	method monedaPerdida(unaMoneda){
		game.removeVisual(unaMoneda)}
		
	method vidaInicial(){game.addVisual(self)}
	
	method disminuirVida(personaje){
		game.removeVisual(self)
		const vidaPersonaje=personaje.nivelDeVida()
		self.image(vidaImg.get(vidaPersonaje))
		self.vidaInicial()
	}
}



object reloj {
	var property cronometro = 0

	method sumarSegundo(){
		cronometro = 0.max(cronometro - 1)
		segundo.descomponer(cronometro)
		minuto.descomponer(cronometro)
	}
}


class Tiempo {
	var property unidad = 0
	var property decena = 0
	
	method descomponer(cronometro) {
		const temp = self.convertirNumero(cronometro)
		unidad = temp % 10
		decena = (temp - unidad) / 10	
	}
	
	method convertirNumero(cronometro) 
	
}

object segundo inherits Tiempo {
	override method convertirNumero(cronometro){
		return cronometro % 60
	}
}

object minuto inherits Tiempo {
	override method convertirNumero(cronometro){
		return (cronometro - segundo.unidad() - segundo.decena()*10) / 60
	}
}



object segundosUnidad {
	
	method image() = segundo.unidad().toString() + ".png"
	method position() = game.at(11,13)
	
}

object segundosDecena {
	
	method image() = segundo.decena().toString() + ".png"
	method position() = game.at(10,13)
	
}

object minutosUnidad {
	
	method image() = minuto.unidad().toString() + ".png"
	method position() = game.at(9,13)
	
}

object minutosDecena {
	
	method image() = minuto.decena().toString() + ".png"
	method position() = game.at(8,13)
	
}


object setTimer {
	
	method configurar(tiempo) {
		reloj.cronometro(tiempo)
		game.schedule(tiempo*1000, {caballero.perder()})
	}
	
}

object separadorReloj {
	method image() = "separadorReloj.png"
	method position() = game.at(9,13)
}

object indicador {
	
	method image() = "Contador de Vidas.png"
	method position() = game.at(1,13)
}
