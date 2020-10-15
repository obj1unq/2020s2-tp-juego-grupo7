import wollok.game.*
import caballero.*
import enemigos.*


// MONEDAS

object monedaCobre {
	
	var property position = game.at(2, 4)
	var indexImg = 0
		
	method image() = "Bronze_2" + indexImg + ".png" 
	
	method cambiarImagen() {
		indexImg = (indexImg+1) % 10
	}
}

object monedaOro {
	
	var property position = game.at(3, 4)
	var indexImg = 0
		
	method image() = "Gold_2" + indexImg +".png" 
	
	method cambiarImagen() {
		indexImg = (indexImg+1) % 10
	}
}

object monedaPlata {
	
	var property position = game.at(4, 4)
	var indexImg = 0
		
	method image() = "Silver_2" + indexImg +".png" 
	
	method cambiarImagen() {
		indexImg = (indexImg+1) % 10
	}
}

// MONEDAS FIN