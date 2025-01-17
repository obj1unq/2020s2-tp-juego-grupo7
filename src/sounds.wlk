import wollok.game.*

object sonidos {
	var property musica
	var property soundWinner=game.sound("ganar.mp3")
	var property soundOff=false
	
	method play(unSonido){
		if(not soundOff){
			game.sound(unSonido).play()}
	}
	
	method stopMusic(){
		musica.stop()
	}
	
	method playMusic(unaMusica){
		if(not soundOff){
			musica=game.sound(unaMusica)
			musica.shouldLoop(true)
			game.schedule(100, {musica.play()})	
		}
	}

	
	method soundOff(booleano){
		soundOff=booleano
	}

}
