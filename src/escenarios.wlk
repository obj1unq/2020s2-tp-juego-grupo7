import wollok.game.*

class BloqueDePared{
	var property position=new Position()
	var property tipo = "muro"
	
	method image()= tipo + ".png"
	method agregarBloqueAlEscenario(){
		game.addVisual(self)
	}
	method puedeMoverse (){ return false }

}


object generadorDeHabitacion {  //podria ser un class? 
	var pared=[]
	method factory(largoDePared,altoDePared, posicionInicial){
	
		self.armadoDeParedHorizontal(largoDePared,posicionInicial)
	
		self.armadoDeParedVertical(altoDePared,posicionInicial)
	
		self.armadoDeParedHorizontal(largoDePared,posicionInicial.up(altoDePared-1))				
	
		self.armadoDeParedVertical(altoDePared,posicionInicial.right(largoDePared-1))
	}
	
//	//TODO:codigo duplicado. 
//	method armadoDeParedHorizontal(largoDePared,posicionInicial){
//			var celdas=largoDePared 
//			var pos=posicionInicial
//			if (celdas>0){
//			pared.add(new BloqueDePared(position=pos))
//			pos=pos.right(1)
//			celdas-=1
//			self.armadoDeParedHorizontal(celdas,pos)}
//			else{self.paredEnGame()}
//			pared=[]
//}
//	method armadoDeParedVertical(largoDePared,posicionInicial){
//			var celdas=largoDePared
//			var pos=posicionInicial
//			if (celdas>0){
//			pared.add(new BloqueDePared(position=pos))
//			pos=pos.up(1)
//			celdas-=1
//			self.armadoDeParedVertical(celdas,pos)}
//			else{self.paredEnGame()}
//			pared=[]
//	}

  method paredEnGame(){pared.forEach({unbloque=>unbloque.agregarBloqueAlEscenario()})}
  //TODO:validaciones
  method generarAcceso(unaposicion){
 	const elemento=game.getObjectsIn(unaposicion).get(0)
 	game.removeVisual(elemento)
  }
  
  
  method armadoDePared (largoDePared,posicionInicial,movimiento){
			var celdas=largoDePared 
			var pos=posicionInicial
			if (celdas>0){
			pared.add(new BloqueDePared(position=pos))
			pos= movimiento.apply(pos)
			celdas-=1
			self.armadoDePared (celdas,pos,movimiento)}
			else{self.paredEnGame()}
			pared=[]
}

  method armadoDeParedHorizontal (largoDePared, posicionInicial){
  	
  			self.armadoDePared(largoDePared, posicionInicial, { pos => pos.right(1) })
  }
  
  method armadoDeParedVertical (largoDePared, posicionInicial){
 	
  			self.armadoDePared(largoDePared, posicionInicial, { pos => pos.up(1) })
  }
	
}
