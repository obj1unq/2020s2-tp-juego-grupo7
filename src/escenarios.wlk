import wollok.game.*

class BloqueDePared{
	var property position=new Position()
	var property tipo = "muro"
	
	method image()= tipo + ".png"
	method agregarBloqueAlEscenario(){
		game.addVisual(self)
	}
		
	method colisiono(personaje) {}

}


class Habitacion {  
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
