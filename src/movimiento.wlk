import wollok.game.*
import mario.*

object moves {

	method config() {
		keyboard.left().onPressDo{ izquierdaPrimero.move(mario)}
		keyboard.right().onPressDo{ derechaPrimero.move(mario)}
		keyboard.up().onPressDo{ arribaPrimero.move(mario)}
		keyboard.down().onPressDo{ abajoPrimero.move(mario)}

	}
	method configSegundaParte(personaje){
		keyboard.left().onPressDo{ izquierdaSegundo.move(personaje)}
		keyboard.right().onPressDo{ derechaSegundo.move(personaje)}
		keyboard.up().onPressDo{ arribaSegundo.move(personaje)}
		keyboard.down().onPressDo{ abajoSegundo.move(personaje)}
		
	}
}

object collides {

	method config(personaje) {
		game.whenCollideDo(personaje, { elemento => elemento.colisionoCon(personaje)})
	}

}

class Movimientos {

	const property celdasBloqueadas
	method canMove(personaje) = return not celdasBloqueadas.contains(personaje.position())

	method move(personaje) {
	}

}

const arribaPrim = ["2@9","1@9","3@8","4@7","5@6","6@6","7@7","8@8","9@9","10@10","11@11","12@11","13@11","14@11","15@10","16@9","17@8","18@7","19@8","20@9","21@9","22@8","23@7","0@13", "1@13", "2@13", "3@13", "4@13", "5@13", "6@13", "7@13", "8@13", "9@13", "10@13", "11@13", "12@13", "13@13", "14@13", "15@13", "16@13", "17@13", "18@13", "19@13", "20@13", "21@13", "22@13", "23@13"]
const abajoPrim = ["0@3", "1@3", "2@3", "3@3", "4@3", "5@3", "6@3", "7@3", "8@3", "9@3", "10@3", "11@3", "12@3", "13@3", "14@3", "15@3", "16@3", "17@3", "18@3", "19@3", "20@3", "21@3", "22@3", "23@3"]
const derechaPrim = ["2@9","3@8","14@11","15@10","16@9","17@8","22@8","21@9","4@7","24@0", "24@1", "24@2", "24@3", "24@4", "24@5", "24@6", "24@7", "24@8", "24@9", "24@10", "24@11", "24@12", "24@13", "24@14"]
const izquierzaPrim = ["7@7","8@8","9@9","10@10","19@8","20@10","20@9","11@11","1@0", "1@1", "1@2", "1@3", "1@4", "1@5", "1@6", "1@7", "1@8", "1@9", "1@10", "1@11", "1@12", "1@13", "1@14"]
const arribaSeg = ["15@12","1@3","1@5","1@13","2@1","2@5","2@11","2@13","3@8","3@11","3@13","4@10","4@13","5@6","5@10","5@13","6@3","6@10","7@4","7@6","7@13","8@2","8@6","8@12","9@8","10@6", "11@4","11@6","11@9","12@4","12@6","12@9","13@9","14@3","15@2","15@9","16@1","16@5","16@9","16@13","17@1","17@4","17@9","17@13","18@3","18@6","18@11","18@13","19@9","19@13","20@5","20@9","20@12","21@9","21@13","22@2","22@5","22@11","22@13","23@13"]
const abajoSeg = ["1@1","1@5","1@7","2@1","2@5","2@11","2@13","3@1","3@10","3@13","4@8","4@13","5@1","5@10","5@12","6@3","6@6","7@1","7@6","7@12","8@2","8@6","8@8","9@2","10@6","11@1","11@6","11@8","12@4","12@6","12@9","13@3","14@2","15@1","15@5","16@1","16@4","16@9","17@1","17@3","17@6","18@1","18@6","19@5","16@11","17@11","18@13","18@11","19@11","19@5","20@5","20@9","20@12","21@1","21@11","22@2","22@5","22@11","22@13","23@1"]
const derechaSeg = ["1@2","1@3","1@12","1@7","1@8","1@9","1@10","3@1","3@2","3@3","3@4","3@5","3@6","3@7","3@11","4@8","4@9","5@1","5@2","5@4","5@5","5@12","5@13","6@7","6@7","6@8","6@9","6@10","7@1","7@3","7@4","7@13","8@9","8@10","8@11","8@12","9@2","9@3","9@4","9@5","9@7","9@8","11@1","11@2","11@3","11@8","13@4","13@5","13@6","13@7","13@8","13@9","14@3","15@2","15@6","15@7","15@8","16@5","17@4","17@7","17@8","17@9","17@12","18@1","18@2","18@3","19@6","19@7","19@8","19@11","19@13","21@1","21@3","21@4","21@6","21@7","21@8","21@9","21@12","23@1","23@2","23@3","23@4","23@5","23@6","23@7","23@8","23@9","23@10","23@11","23@12","23@13"] 
const izquierzaSeg = ["15@11","15@12","1@1","1@2","1@3","1@5","1@7","1@8","1@9","1@10","1@11","1@12","1@13","3@2","3@3","3@4","3@6","3@7","3@8","3@10","4@9","5@1","5@2","5@3","5@4","5@5","5@6","5@12","6@7","6@8","6@9","7@1","7@2","7@4","7@12","7@13","8@8","8@9","8@10","8@11","9@3","9@4","9@5","9@7","11@1","11@2","11@3","11@4","11@8","11@9","13@3","13@5","13@7","13@8","14@2","15@1","15@5","15@6","15@7","15@8","15@9","16@4","17@3","17@6","17@7","17@8","18@2","19@5","19@7","19@8","19@9","19@12","16@13","21@1","21@1","21@2","21@3","21@4","21@6","21@7","21@8","21@11","21@13","23@1","23@3","23@4","23@6","23@7","23@8","23@9","23@10","23@12"]


object arribaPrimero inherits Movimientos(celdasBloqueadas =  arribaPrim){

	override method move(personaje) {
		personaje.move(personaje.position().up(1), celdasBloqueadas)
	}

}

object abajoPrimero inherits Movimientos(celdasBloqueadas = abajoPrim) {

	override method move(personaje) {
		personaje.move(personaje.position().down(1), celdasBloqueadas)
	}

}

object derechaPrimero inherits Movimientos(celdasBloqueadas = derechaPrim) {

	override method move(personaje) {
		personaje.move(personaje.position().right(1), celdasBloqueadas)
	}

}

object izquierdaPrimero inherits Movimientos(celdasBloqueadas = izquierzaPrim) {

	override method move(personaje) {
		personaje.move(personaje.position().left(1), celdasBloqueadas)
	}

}

object arribaSegundo inherits Movimientos(celdasBloqueadas =  arribaSeg){

	override method move(personaje) {
		personaje.move(personaje.position().up(1), celdasBloqueadas)
	}

}

object abajoSegundo inherits Movimientos(celdasBloqueadas = abajoSeg) {

	override method move(personaje) {
		personaje.move(personaje.position().down(1), celdasBloqueadas)
	}

}

object derechaSegundo inherits Movimientos(celdasBloqueadas = derechaSeg) {

	override method move(personaje) {
		personaje.move(personaje.position().right(1), celdasBloqueadas)
	}

}

object izquierdaSegundo inherits Movimientos(celdasBloqueadas = izquierzaSeg) {

	override method move(personaje) {
		personaje.move(personaje.position().left(1), celdasBloqueadas)
	}

}
