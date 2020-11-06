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


