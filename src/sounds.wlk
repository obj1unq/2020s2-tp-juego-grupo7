import wollok.game.*

object sonidos {
	var property musica
	var property soundWinner=game.sound("ganar.mp3")
	var property soundOff=false
	
	method play(unSonido){
		if(not soundOff){
			unSonido.play()}
	}
	
	method stopMusic(){
		musica.stop()
	}
	
	method playMusic(unaMusica){
		if(not soundOff){
			musica=unaMusica
			musica.shouldLoop(true)
			game.schedule(100, {musica.play()})	
		}
	}
	
	method nivelSuperado(){
		if(not soundOff){
			musica.stop()
			soundWinner.play()
			game.schedule(4000, {soundWinner.stop()})
		}
	}
	
	method soundOff(booleano){
		soundOff=booleano
	}

}
