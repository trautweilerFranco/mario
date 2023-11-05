import wollok.game.*
import objetos.*

object mario {
	
	 var vidas = 5
	 
	 var vitalidad = 3000
	 
	 var property position = game.at(1,1)
	 
	method move(newPos, direccion) {
		if (self.staysOnMap(newPos) && self.canMove(direccion)) {
			self.position(newPos)
		}
	}

	method staysOnMap(newPos) = return newPos.x() >= 0 && newPos.x() < 15 && newPos.y() >= 0 && newPos.y() < 15
	
		method canMove(direccion) = return !direccion.contains(self.position().toString())
	 
	 method vitalidad() = vitalidad
	 
	 method colisionoConObjeto(unObjeto){
	 	if(unObjeto.esEnemigo()){
	 		vitalidad = 0.max(vitalidad - unObjeto.danio())
	 		vidas --
	 	} else {
	 		vitalidad = vitalidad + unObjeto.vitalidad()
	 		}
	 }
	 
	 method image() = "mario.png"
	

}