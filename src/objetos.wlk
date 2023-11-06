import wollok.game.*
import mario.*
import sopresa.*

class Bomba {
	
	var property position = pos.posicionAleatoria()
	
	const property esEnemigo = true
	
	const property danio = 100
	
	const property vitalidad = 0
	
	method image() = "bomba.png"
	
	method colisionoCon(personaje){
		personaje.colisionoConObjeto(self)
   		game.say(personaje,"mi vitalidad bajo a" + mario.vitalidad().toString())
   		game.removeVisual(self)
     }
}

class Fantasma {
	
	var property position = pos.posicionAleatoria()
	
	const property danio = 100
	
	const property esEnemigo = true
	
	const property vitalidad = 0

	method image() = "fantasma.png"
	
	method colisionoCon(personaje){
		personaje.colisionoConObjeto(self)
     	game.removeVisual(self)
     	game.say(personaje,"mi vitalidad bajo a" + mario.vitalidad().toString())
     }
}

class Hongo {
	
	var property position = pos.posicionAleatoria()
	
	const property vitalidad = 150
	
	const property esEnemigo = false
	
	const property danio = 0
	
	method image() = "hongo.png"
	
	method colisionoCon(personaje){
		personaje.colisionoConObjeto(self)
		game.say(personaje,"perfecto, busquemos mas")
		game.removeVisual(self) 
     }
}

class Cubo {
	
	var property position
	
	const property esEnemigo = false
	
	method image() = "cubo.png"
	
	method colisionoCon(personaje){
	   return if(position == personaje.position()){
	   		game.removeVisual(self)
	   		sorpresa.sorpresa(personaje)
	   		game.onTick(100,"trampa",{game.say(browser,"Caiste en una trampa")})         
	           }
	           else{}  
	}
}  

object browser{
  	
  	const property esAtravesable = false
  	
   var property position = game.at(11,11)
  
   method image() = "enemigo.png"
}

object pos {
	method posicionAleatoria(){
		return game.at(1.randomUpTo(24),
			3.randomUpTo(7) 		
			)
		

	}
}