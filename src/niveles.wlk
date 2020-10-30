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

	//cofres
	const cofre=new Cofre(position= game.at(4,8))
	const cofre2=new Cofre(position=game.at(11,10))
	const cofre3=new Cofre(position=game.at(18,10))
	const cofre4=new Cofre(position=game.at(18,1))
	const cofre5=new Cofre(position=game.at(19,12))
	
	//power ups
	const monedaBronze = new MonedaDeBronze(position = game.at(10, 9))
	const monedaOro = new MonedaDeOro(position = game.at(4, 7))
	const monedaPlata = new MonedaDePlata(position = game.at(18, 2))

	
	habitacion.crear(6,6,game.at(0,6))
	habitacion.crear(6,6,game.at(7,6))
	habitacion.crear(6,6,game.at(14,6))
	habitacion.crear(7,4,game.at(13,0))
	habitacion.crearParedHorizontal(10, game.at(0,1))
 	habitacion.crearParedVertical(3, game.at(2,7))
 	habitacion.crearParedHorizontal(20,game.at(0,13))
 	
 	game.addVisual(cofre)
 	game.addVisual(cofre2)
 	game.addVisual(cofre3)
 	game.addVisual(cofre4)
 	game.addVisual(cofre5)
 	
	game.addVisual(agujero1)
	game.addVisual(agujero2)
	game.addVisual(agujero3)
	game.addVisual(agujero4)
	
	game.addVisual(animator.crearObjetoAnimado(babosa))
	game.addVisual(animator.crearObjetoAnimado(babosa2))
	game.addVisual(animator.crearObjetoAnimado(babosa3))
	game.addVisual(animator.crearObjetoAnimado(babosa4))
	
	game.addVisual(animator.crearObjetoAnimado(monedaBronze))
	game.addVisual(animator.crearObjetoAnimado(monedaOro))
	game.addVisual(animator.crearObjetoAnimado(monedaPlata))
	
	game.addVisual(aberturas.crearPuerta(cerrada, game.at(1, 6)))
	game.addVisual(aberturas.crearPuerta(abierta, game.at(16, 6)))
	game.addVisual(aberturas.crearPuerta(cerrada, game.at(7, 8)))
	game.addVisual(aberturas.crearPuerta(abierta, game.at(13, 2)))
	
	game.addVisual(new Palanca(position = game.at(0,12)))
	game.addVisual(new Palanca(position = game.at(8,7)))
	
	//game.onTick(5000, "NUEVA TRAMPA", { generadorDeTrampas.nuevaTrampa() })
	generadorDeTrampas.agregarTrampas()
	
	//game.addVisual(llave)
	cofre.contenerLLave(new Llave(position=cofre.position()))
	game.addVisual(animator.crearObjetoAnimado(caballero))
	
	config.configurarColisiones()
	config.configurarTeclas()
	config.configurarAnimaciones()
	
	
	game.onTick(500, "enemigo", { babosa.mover()})
	game.onTick(1000, "enemigo", { babosa2.mover()})
	game.onTick(700, "enemigo", { babosa3.mover()})
	game.onTick(200, "enemigo", { babosa4.mover()})
	game.onTick(1000,"verificar si estoy en pinche", {caballero.estoyEnPinche()})
	}
	
	
	
}
