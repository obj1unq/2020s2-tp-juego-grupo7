import escenarios.*
import wollok.game.*
import config.*
import enemigos.*
import objetos.*
import trampas.*
import caballero.*
import sounds.*

object nivel1 {
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

	
	//power ups
	const monedaBronze = new MonedaDeBronze(position = game.at(10, 9))
	const monedaOro = new MonedaDeOro(position = game.at(4, 7))
	const monedaPlata = new MonedaDePlata(position = game.at(18, 2))
	
	//cofres
	const cofre=new Cofre(position= game.at(4,8))
	const cofre2=new Cofre(position=game.at(11,10))
	const cofre3=new Cofre(position=game.at(18,10))
	const cofre4=new Cofre(position=game.at(18,1))
	const cofre5=new Cofre(position=game.at(18,8))
	const cofre6=new Cofre(position=game.at(11,7))
	const cofre7=new Cofre(position=game.at(14,1))
	const cofre8=new Cofre(position=game.at(2,2))
	const cofre9=new Cofre(position=game.at(4,10))
	//antorchas 
	const antorcha=new Antorcha(position=game.at(2,6))
 	const antorcha1=new Antorcha(position=game.at(17,6))
 	const antorcha2=new Antorcha(position=game.at(9,1))
 	const antorcha3=new Antorcha(position=game.at(7,7))
	
	method iniciarEscenario(){
	game.height(14)
	game.width(20)
	game.ground("suelo.png")
	sonidos.musicaFondo()
	
	//escenario
	habitacion.crear(6,6,game.at(0,6))
	habitacion.crear(6,6,game.at(7,6))
	habitacion.crear(6,6,game.at(14,6))
	habitacion.crear(7,4,game.at(13,0))
	habitacion.crearParedHorizontal(10, game.at(0,1))
 	habitacion.crearParedVertical(3, game.at(2,7))
 	habitacion.crearParedHorizontal(20,game.at(0,13))
 	//visuales
 	//cofres
 	game.addVisual(cofre)
 	game.addVisual(cofre2)
 	game.addVisual(cofre3)
 	game.addVisual(cofre4)
 	game.addVisual(cofre5)
 	game.addVisual(cofre6)
 	game.addVisual(cofre7)
 	game.addVisual(cofre8)
 	game.addVisual(cofre9)
 	cofre.contener(animator.crearObjetoAnimado(new Llave(position=cofre.position())))
	cofre2.contener(animator.crearObjetoAnimado(monedaOro))
	cofre3.contener(animator.crearObjetoAnimado(monedaPlata))
	cofre4.contener(animator.crearObjetoAnimado(monedaBronze))
	
 	//pozos
	game.addVisual(agujero1)
	game.addVisual(agujero2)
	game.addVisual(agujero3)
	game.addVisual(agujero4)
	
	//enemigos
	game.addVisual(animator.crearObjetoAnimado(babosa))
	game.addVisual(animator.crearObjetoAnimado(babosa2))
	game.addVisual(animator.crearObjetoAnimado(babosa3))
	game.addVisual(animator.crearObjetoAnimado(babosa4))
	
	//puertas
	game.addVisual(aberturas.crearPuerta(cerrada, game.at(1, 6)))
	game.addVisual(aberturas.crearPuerta(abierta, game.at(16, 6)))
	game.addVisual(aberturas.crearPuerta(cerrada, game.at(7, 8)))
	game.addVisual(aberturas.crearPuerta(abierta, game.at(13, 2)))
	game.addVisual(escalera)
	const puertaEscape=new PuertaEscape(estado=cerrada, position=game.at(19,12))
	game.addVisual(puertaEscape)
	const palanca=new Palanca(position = game.at(0,12))
	game.addVisual(palanca)
	
	//timer
	game.addVisual(indicador)
	game.addVisual(segundosUnidad)
	game.addVisual(segundosDecena)
	game.addVisual(minutosUnidad)
	game.addVisual(minutosDecena)
	game.addVisual(separadorReloj)

	//antorchas
	game.addVisual(animator.crearObjetoAnimado(antorcha))
	game.addVisual(animator.crearObjetoAnimado(antorcha1))
	game.addVisual(animator.crearObjetoAnimado(antorcha2))
	game.addVisual(animator.crearObjetoAnimado(antorcha3))

	game.addVisual(animator.crearObjetoAnimado(caballero))
	atributos.vidaInicial()
	
	game.say(caballero,"El casitillo ha sido capturado")
	game.schedule(3000,{game.say(puertaEscape,"La puerta de escape")})
	game.schedule(4000,{game.say(puertaEscape,"solo se abre con la llave maestra")})	
	game.schedule(7000,{game.say(caballero,"La llave esta escondida")})
	game.schedule(9000,{game.say(caballero,"en algun cofre")})
	game.schedule(11000,{game.say(palanca,"Puedo usar la palanca ")})
	game.schedule(13000,{game.say(palanca,"para abrir las puertas")})
	//seteos iniciales
	game.schedule(15000,{self.configuraciones()})

	}
	
	method configuraciones(){
	
	config.configurarColisiones()
	config.configurarTeclas()
	config.configurarAnimaciones()

	setTimer.configurar(90)
	
	game.onTick(500, "enemigo", { babosa.mover()})
	game.onTick(1000, "enemigo", { babosa2.mover()})
	game.onTick(700, "enemigo", { babosa3.mover()})
	game.onTick(200, "enemigo", { babosa4.mover()})
	

	generadorDeTrampas.agregarTrampas()

	}
		
}
	
	

