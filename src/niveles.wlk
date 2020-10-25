import escenarios.*
import wollok.game.*
import config.*
import enemigos.*
import objetos.*
import trampas.*
import caballero.*

object nivel1 {
	
	method iniciarEscenario(){
	game.height(14)
	game.width(20)
	game.ground("suelo.png")
	//trampas
	const agujero1 = new Agujero(position = game.at(5,5))
	const agujero2 = new Agujero(position = game.at(8,3))
	const agujero3 = new Agujero(position = game.at(15,4))
	const agujero4 = new Agujero(position = game.at(1,3))
	//enemigos	
	const babosa = new Enemigo(position = game.at(10,4),direccion = izquierda,movimientosALlegar = 10)
	const babosa2 = new Enemigo(position = game.at(12,5),direccion = derecha,movimientosALlegar= 7)
	const babosa3 = new Enemigo(position = game.at(6,6),direccion = arriba,movimientosALlegar=6)
	const babosa4 = new Enemigo(position = game.at(7,2),direccion = derecha,movimientosALlegar=5)
	
	//escenario
	const habitacion1=new Habitacion()
	const habitacion2=new Habitacion()
	const habitacion3=new Habitacion()
	const habitacion4=new Habitacion()
	const pared1=new Habitacion()
	const pared2=new Habitacion()
		
	habitacion1.crear(6,6,game.at(0,6))
	habitacion2.crear(6,6,game.at(7,6))
	habitacion3.crear(6,6,game.at(14,6))
	habitacion4.crear(7,4,game.at(13,0))
	pared1.crearParedHorizontal(10, game.at(0,1))
 	pared2.crearParedVertical(3, game.at(2,7))
 	
	game.addVisual(agujero1)
	game.addVisual(agujero2)
	game.addVisual(agujero3)
	game.addVisual(agujero4)
	
	game.addVisual(babosa)
	game.addVisual(babosa2)
	game.addVisual(babosa3)
	game.addVisual(babosa4)
	
	game.addVisual(monedero.crearMoneda("Bronze", game.at(10, 9)))
	game.addVisual(monedero.crearMoneda("Gold", game.at(4, 7)))
	game.addVisual(monedero.crearMoneda("Silver", game.at(18, 2)))
	
	game.addVisual(aberturas.crearPuerta(cerrada, game.at(1, 6)))
	game.addVisual(aberturas.crearPuerta(abierta, game.at(16, 6)))
	game.addVisual(aberturas.crearPuerta(cerrada, game.at(7, 8)))
	game.addVisual(aberturas.crearPuerta(abierta, game.at(13, 2)))
	
	game.addVisual(new Palanca(position = game.at(0,12)))
	game.addVisual(new Palanca(position = game.at(8,7)))
	
	//game.onTick(5000, "NUEVA TRAMPA", { generadorDeTrampas.nuevaTrampa() })
	generadorDeTrampas.agregarTrampas()
	game.addVisual(llave)
	
	game.addVisual(caballero)
	
//	config.configurarColisiones()
	config.configurarTeclas()
	config.configurarAnimaciones()
	
	game.onTick(100,"ANIMACION", {babosa.cambiarImagen()})
	game.onTick(500, "enemigo", { babosa.mover()})
	game.onTick(100,"ANIMACION", {babosa2.cambiarImagen()})
	game.onTick(1000, "enemigo", { babosa2.mover()})
	game.onTick(100,"ANIMACION", {babosa3.cambiarImagen()})
	game.onTick(700, "enemigo", { babosa3.mover()})
	game.onTick(100,"ANIMACION", {babosa4.cambiarImagen()})
	game.onTick(200, "enemigo", { babosa4.mover()})
	
	}
	
	
	
}
