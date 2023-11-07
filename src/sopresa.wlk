import wollok.game.*
import objetos.*
import movimiento.*
import nivel.*

object sorpresa {
	method sorpresa(personaje){
	   	game.clear()
	   	game.addVisual(segundaEtapa)
	   	game.addVisual(personaje)
	   	game.addVisual(browser)
	   	moves.configSegundaParte(personaje)	
	   	muros.armarTablero()
	   	collides.config(personaje)
	    personaje.position(game.at(1,3))
	    game.say(browser,"Caiste en una trampa")
	    game.say(browser,"debes agarrar todas las")
	    game.say(browser,"estrellas para VENCERME")
	    self.agregarObjetos() 
	}
	
	method agregarObjetos(){
		game.addVisual(new Estrella(position = game.at(17,12)))
		game.addVisual(new Estrella(position = game.at(21,1)))
		game.addVisual(new Estrella(position = game.at(1,7)))
		game.addVisual(new Estrella(position = game.at(7,2)))
		game.addVisual(new Estrella(position = game.at(11,8)))
		game.addVisual(flor)
		game.addVisual(new HongoMalo(position = game.at(19,5)))
		game.addVisual(new HongoMalo(position = game.at(21,11)))
		game.addVisual(new HongoMalo(position = game.at(7,6)))
	}
	
}
