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
	const property recolectado=[]
	const vidaImg=["corazonnull.png","corazonmedio.png"]
	var property image="corazon.png"
	const property position=game.at(0,13)

	
	method monedaRecolectada(unaMoneda){
		recolectado.add(unaMoneda)
		game.addVisualIn(unaMoneda, game.at(recolectado.size(),13))
	}
	method monedaPerdida(unaMoneda){
		recolectado.remove(unaMoneda)
		game.removeVisual(unaMoneda)}
		
	method vidaInicial(){game.addVisual(self)}
	
	method disminuirVida(personaje){
		game.removeVisual(self)
		if(personaje.nivelDeVida()>0)
		self.image(vidaImg.get(personaje.nivelDeVida()-1))
		self.vidaInicial()
	}
}


