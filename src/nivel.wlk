import mario.*
import wollok.game.*
import objetos.*
import movimiento.*

object nivel {

	method inicio() {
		// LIMITES DEL JUEGO
		game.title("El Fontanero")
		game.addVisual(introJuego)	
		game.height(15)
		game.width(25)
		keyboard.enter().onPressDo{self.controles()}
	}
	
	method controles(){
		game.clear()
		game.addVisual(controles)	
		keyboard.enter().onPressDo{self.juego()}
	}
	
	method juego(){
		game.clear()
		game.addVisual(primeraEtapa)
		game.addVisual(mario)
		game.showAttributes(mario) 
		game.say(mario, "Ayudame a recolectar todos")
		game.say(mario, "los hongos del tablero")
		game.say(mario, "sin tocar otra cosa")
		moves.config()
		collides.config(mario)
		game.whenCollideDo(mario, { arma => arma.colisionoCon(mario)})
			// agregar objetos
		self.agregarObjetos()
	}
	
	method ganarEtapa1() {
		game.clear()
		game.addVisual(ganarMario1)
		game.onTick(5000,"finalizar",{game.stop()})
	}
	
	method ganarEtapa2(){
		game.clear()
		game.addVisual(ganarMario2)
		game.onTick(5000,"finalizar",{game.stop()})
	}
	
	method perderEtapa1(){
		game.clear()
		game.addVisual(gameOver1)
		keyboard.f().onPressDo{self.inicio()}
		keyboard.s().onPressDo{game.stop()}
	}
	
	method perderEtapa2(){
		game.clear()
		game.addVisual(gameOver2)
		keyboard.f().onPressDo{self.inicio()}
		keyboard.s().onPressDo{game.stop()}
	}
	
	
	method agregarObjetos() {
		game.schedule(30000, {game.removeTickEvent("agregar fantasmas")})
		game.schedule(31000, {game.removeTickEvent("agregar cubo trampa")})
		game.schedule(32000, {game.removeTickEvent("frase")})
		game.onTick(4000, "agregar fantasmas", {game.addVisual(new Fantasma())})
		game.onTick(4000, "agregar fantasmas", {game.addVisual(new Bomba())})
		game.onTick(6000, "agregar fantasmas", {game.addVisual(new Hongo())})
		game.onTick(30000, "agregar cubo trampa",{game.addVisual(new Cubo(position = game.at(12,11)))})
		game.onTick(30000, "agregar cubo trampa",{game.addVisual(new Cubo(position = game.at(13,11)))})
		game.onTick(31000, "frase",{game.say(mario, "¿que son esas cosas?")})
		game.onTick(31000, "frase",{game.say(mario, "vamos a descubrirlas")})
	}
}
	

object introJuego{
	var property position = game.at(0,0)
	var property image = "inicio.jpg"
}

object controles {
	var property position = game.at(0,0)
	var property image = "controles.jpg"
}

object primeraEtapa{
	var property position = game.at(0,0)
	var property image = "fondo2.jpg"
}

object segundaEtapa {
	var property position = game.at(0,0)
	var property image = "fondo.png"
}

object ganarMario2 {
	var property position = game.at(0,0)
	var property image = "ganar.jpg"
}

object ganarMario1{ 
	var property position = game.at(0,0)
	var property image = "gana2.png"
}

object gameOver1{
	var property position = game.at(0,0)
	var property image = "gameOver.jpg"
}

object gameOver2{
	var property position = game.at(0,0)
	var property image = "gameOver2.jpg"
}