import escenarios.*
import wollok.game.*
import config.*
import enemigos.*
import objetos.*
import trampas.*
import caballero.*
import sounds.*

object nivel1 {

	
	method iniciarEscenario(){
		self.agregarTrampas()
		self.agregarEnemigos()
		self.agregarCofresYMonedas()
		self.agregarAntorchas()
		self.configuracionBaseJuego()
		self.configuracionEscenario()
		self.agregarPuertasYPalancas()
		self.agregarTimer()
		self.agregarCaballeroYAtributos()
		self.configuracionJuego()
		
	
	}
	
	method agregarTrampas(){
		const agujero1 = new Agujero(position = game.at(5,5))
		const agujero2 = new Agujero(position = game.at(8,3))
		const agujero3 = new Agujero(position = game.at(15,4))
		const agujero4 = new Agujero(position = game.at(1,3))
		const agujerosEscenario = [agujero1,agujero2,agujero3,agujero4]
		
		agujerosEscenario.forEach({agujero => game.addVisual(agujero)})
	}
	
	method agregarEnemigos(){
		var  babosa = new Enemigo(position = game.at(10,4),direccion = izquierda,movimientosALlegar = 10)
		var  babosa2 = new Enemigo(position = game.at(12,5),direccion = derecha,movimientosALlegar= 7)
		var  babosa3 = new Enemigo(position = game.at(6,6),direccion = arriba,movimientosALlegar=6)
		var  babosa4 = new Enemigo(position = game.at(7,2),direccion = derecha,movimientosALlegar=5)
		const babosasEscenarios = [babosa,babosa2,babosa3,babosa4]
		
		babosasEscenarios.forEach({babosa => game.addVisual(animator.crearObjetoAnimado(babosa))})
		
		game.schedule(15000,{self.configuracionEnemigos(500,babosa)})
		game.schedule(15000,{self.configuracionEnemigos(1000,babosa2)})
		game.schedule(15000,{self.configuracionEnemigos(700,babosa3)})
		game.schedule(15000,{self.configuracionEnemigos(200,babosa4)})

			
	}
	
	method agregarCofresYMonedas(){
		const cofre=new Cofre(position= game.at(4,8))
		const cofre2=new Cofre(position=game.at(11,10))
		const cofre3=new Cofre(position=game.at(18,10))
		const cofre4=new Cofre(position=game.at(18,1))
		const cofre5=new Cofre(position=game.at(18,8))
		const cofre6=new Cofre(position=game.at(11,7))
		const cofre7=new Cofre(position=game.at(14,1))
		const cofre8=new Cofre(position=game.at(2,2))
		const cofre9=new Cofre(position=game.at(4,10))
		const cofresEscenario = [cofre,cofre2,cofre3,cofre4,cofre5,cofre6,cofre7,cofre8,cofre9]
		const monedaBronze = new MonedaDeBronze(position = game.at(10, 9))
		const monedaOro = new MonedaDeOro(position = game.at(4, 7))
		const monedaPlata = new MonedaDePlata(position = game.at(18, 2))
		
		cofresEscenario.forEach({cofre => game.addVisual(cofre)})
		
		cofre.contener(animator.crearObjetoAnimado(new Llave(position=cofre.position())))
		cofre2.contener(animator.crearObjetoAnimado(monedaOro))
		cofre3.contener(animator.crearObjetoAnimado(monedaPlata))
		cofre4.contener(animator.crearObjetoAnimado(monedaBronze))
	}	
		
	method agregarAntorchas(){
		const antorcha=new Antorcha(position=game.at(2,6))
 		const antorcha1=new Antorcha(position=game.at(17,6))
 		const antorcha2=new Antorcha(position=game.at(9,1))
 		const antorcha3=new Antorcha(position=game.at(7,7))
 		const antorchasEscenario = [antorcha,antorcha1,antorcha2,antorcha3]
 		
 		antorchasEscenario.forEach({antorcha => game.addVisual(animator.crearObjetoAnimado(antorcha))})
 	}
	
	method configuracionBaseJuego(){
		game.height(14)
		game.width(20)
		game.ground("suelo.png")
		sonidos.playMusic("prueba1.mp3")
	}
	
	method configuracionEscenario(){
		habitacion.crear(6,6,game.at(0,6))
		habitacion.crear(6,6,game.at(7,6))
		habitacion.crear(6,6,game.at(14,6))
		habitacion.crear(7,4,game.at(13,0))
		habitacion.crearParedHorizontal(10, game.at(0,1))
 		habitacion.crearParedVertical(3, game.at(2,7))
 		habitacion.crearParedHorizontal(20,game.at(0,13))
 	}
 	
 	method agregarPuertasYPalancas(){
 		const puertaEscape=new PuertaEscape(estado=cerrada, position=game.at(18,12))
 		const palanca=new Palanca(position = game.at(0,12))
 		game.addVisual(aberturas.crearPuerta(cerrada, game.at(1, 6)))
		game.addVisual(aberturas.crearPuerta(abierta, game.at(16, 6)))
		game.addVisual(aberturas.crearPuerta(cerrada, game.at(7, 8)))
		game.addVisual(aberturas.crearPuerta(abierta, game.at(13, 2)))
		game.addVisual(escalera)
		game.addVisual(puertaEscape)
		game.addVisual(palanca)
		
		game.schedule(3000,{game.say(puertaEscape,"La puerta de escape")})
		game.schedule(4000,{game.say(puertaEscape,"solo se abre con la llave maestra")})	
		game.schedule(11000,{game.say(palanca,"Puedo usar la palanca ")})
		game.schedule(13000,{game.say(palanca,"para abrir las puertas")})
	}
	
	method agregarTimer(){
		game.addVisual(indicador)
		game.addVisual(segundosUnidad)
		game.addVisual(segundosDecena)
		game.addVisual(minutosUnidad)
		game.addVisual(minutosDecena)
		game.addVisual(separadorReloj)
	}
	
	method agregarCaballeroYAtributos(){
		atributos.vidaInicial()
		game.addVisual(animator.crearObjetoAnimado(caballero))
		game.say(caballero,"El casitillo ha sido capturado")
		
		game.schedule(7000,{game.say(caballero,"La llave esta escondida")})
		game.schedule(9000,{game.say(caballero,"en algun cofre")})
		
	}	
	
	method configuracionJuego(){	
		game.schedule(15000,{self.configuraciones()})
	}
	
	method configuraciones(){
		config.configurarColisiones()
		config.configurarTeclas()
		config.configurarAnimaciones()

		setTimer.configurar(90)
		generadorDeTrampas.agregarTrampas()
	}
	
	method configuracionEnemigos(tiempo,enemigo){
		game.onTick(tiempo, "enemigo", { enemigo.mover()})}


	method restart(){
		caballero.reestablecer()
		atributos.reestablecer()
		segundo.reestablecer()
		minuto.reestablecer()

	}
}
	
	

