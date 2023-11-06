import wollok.game.*
import objetos.*

object mario {
	
	 var vidas = 5
	 
	 var vitalidad = 300
	 
	 var property position = game.at(3,3)
	 
	method move(newPos, direccion) {
		if (self.staysOnMap(newPos) && self.canMove(direccion)) {
			self.position(newPos)
		}
	}

	method staysOnMap(newPos) = return newPos.x() >= 0 && newPos.x() < 24 && newPos.y() >= 0 && newPos.y() < 24
	
	method canMove(direccion) = return !direccion.contains(self.position().toString())
	 
	 method vitalidad() = vitalidad
	 
	 method colisionoConObjeto(unObjeto){
	 	if(unObjeto.esEnemigo()){
	 		self.chocoConUnEnemigo(unObjeto)
	 	} else {
	 		self.chocoConUnHongo(unObjeto)
	 		}
	 }
	 
	 method chocoConUnEnemigo(unObjeto){
	 		vitalidad = 0.max(vitalidad - unObjeto.danio())
	 		vidas --
	 		game.say(self,"mi vitalidad bajo a" + self.vitalidad().toString())
	 		self.puedeSeguirViviendoMario()
	 }
	 
	 method chocoConUnHongo(unObjeto){
	 		vitalidad = 1000.min(vitalidad + unObjeto.vitalidad())
	 		vidas = vidas + 1
	 		game.say(self,"perfecto, busquemos mas")
	 		self.marioConsiguioLaVidaSuprema()
	 }
	 
	 method puedeSeguirViviendoMario(){
	 	if(vidas == 0 or vitalidad == 0){
	 		game.onTick(5000, "muerte",{game.say(self,"No tengo nada para sobrevivir")})
	 		game.onTick(8000, "muerte",{game.stop()})
	 	}
	 }
	 
	 method marioConsiguioLaVidaSuprema(){
	 	// si las vidas son 15 o su vitalidad es de 1500
	 	// cambiar a mario de imagen
	 	// juego ganar

	 }
	 
	 method image() = "mario.png"
	

}