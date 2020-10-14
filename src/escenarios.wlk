import wollok.game.*

class BloqueDePared{
	var property position=new Position()
	const image="muro.png"
	method image()=image
	method agregarBloqueAlEscenario(){
		game.addVisual(self)
	}

}

object bloque{
	method construirBloque(posicion){
	return new BloqueDePared(position=posicion)}
	

}

object generadorDeHabitacion {  //podria ser un class? 
	var pared=[]
	method factory(largoDePared,altoDePared, posicionInicial){
	
	self.armadoDeParedHorizontal(largoDePared,posicionInicial)
	
	self.armadoDeParedVertical(altoDePared,posicionInicial)
	
	self.armadoDeParedHorizontal(largoDePared,posicionInicial.up(altoDePared-1))				
	
	self.armadoDeParedVertical(altoDePared,posicionInicial.right(largoDePared-1))
	}
	
	//TODO:codigo duplicado. 
	method armadoDeParedHorizontal(largoDePared,posicionInicial){
			var celdas=largoDePared 
			var pos=posicionInicial
			if (celdas>0){
			pared.add(bloque.construirBloque(pos))
			pos=pos.right(1)
			celdas-=1
			self.armadoDeParedHorizontal(celdas,pos)}
			else{self.paredEnGame()}
			pared=[]
}
	method armadoDeParedVertical(largoDePared,posicionInicial){
			var celdas=largoDePared
			var pos=posicionInicial
			if (celdas>0){
			pared.add(bloque.construirBloque(pos))
			pos=pos.up(1)
			celdas-=1
			self.armadoDeParedVertical(celdas,pos)}
			else{self.paredEnGame()}
			pared=[]
	}

  method paredEnGame(){pared.forEach({unbloque=>unbloque.agregarBloqueAlEscenario()})}
  //TODO:validaciones
  method generarAcceso(unaposicion){
 	const elemento=game.getObjectsIn(unaposicion).get(0)
 	game.removeVisual(elemento)
  }
}	


