import wollok.game.*
import mario.*

object moves {

	method config() {
		keyboard.left().onPressDo{ izquierdaPrimero.move(mario)}
		keyboard.right().onPressDo{ derechaPrimero.move(mario)}
		keyboard.up().onPressDo{ arribaPrimero.move(mario)}
		keyboard.down().onPressDo{ abajoPrimero.move(mario)}

	}
	method configSegundaParte(){
		keyboard.left().onPressDo{ izquierdaSegundo.move(mario)}
		keyboard.right().onPressDo{ derechaSegundo.move(mario)}
		keyboard.up().onPressDo{ arribaSegundo.move(mario)}
		keyboard.down().onPressDo{ abajoSegundo.move(mario)}
	}
}

object collides {

	method config() {
		game.whenCollideDo(mario, { elemento => elemento.colision()})
	}

}

class Movimientos {

	const property celdasBloqueadas
	method canMove(character) = return not celdasBloqueadas.contains(character.position())

	method move(character) {
	}

}

const arribaPrim = ["2@9","1@9","3@8","4@7","5@6","6@6","7@7","8@8","9@9","10@10","11@11","12@11","13@11","14@11","15@10","16@9","17@8","18@7","19@8","20@9","21@9","22@8","23@7","0@13", "1@13", "2@13", "3@13", "4@13", "5@13", "6@13", "7@13", "8@13", "9@13", "10@13", "11@13", "12@13", "13@13", "14@13", "15@13", "16@13", "17@13", "18@13", "19@13", "20@13", "21@13", "22@13", "23@13"]
const abajoPrim = ["0@3", "1@3", "2@3", "3@3", "4@3", "5@3", "6@3", "7@3", "8@3", "9@3", "10@3", "11@3", "12@3", "13@3", "14@3", "15@3", "16@3", "17@3", "18@3", "19@3", "20@3", "21@3", "22@3", "23@3"]
const derechaPrim = ["2@9","3@8","14@11","15@10","16@9","17@8","22@8","21@9","4@7","24@0", "24@1", "24@2", "24@3", "24@4", "24@5", "24@6", "24@7", "24@8", "24@9", "24@10", "24@11", "24@12", "24@13", "24@14"]
const izquierzaPrim = ["7@7","8@8","9@9","10@10","19@8","20@10","20@9","11@11","1@0", "1@1", "1@2", "1@3", "1@4", "1@5", "1@6", "1@7", "1@8", "1@9", "1@10", "1@11", "1@12", "1@13", "1@14"]
const arribaSeg = []
const abajoSeg = []
const derechaSeg = [] 
const izquierzaSeg = []


object arribaPrimero inherits Movimientos(celdasBloqueadas =  arribaPrim){

	override method move(character) {
		character.move(character.position().up(1), celdasBloqueadas)
	}

}

object abajoPrimero inherits Movimientos(celdasBloqueadas = abajoPrim) {

	override method move(character) {
		character.move(character.position().down(1), celdasBloqueadas)
	}

}

object derechaPrimero inherits Movimientos(celdasBloqueadas = derechaPrim) {

	override method move(character) {
		character.move(character.position().right(1), celdasBloqueadas)
	}

}

object izquierdaPrimero inherits Movimientos(celdasBloqueadas = izquierzaPrim) {

	override method move(character) {
		character.move(character.position().left(1), celdasBloqueadas)
	}

}

object arribaSegundo inherits Movimientos(celdasBloqueadas =  arribaSeg){

	override method move(character) {
		character.move(character.position().up(1), celdasBloqueadas)
	}

}

object abajoSegundo inherits Movimientos(celdasBloqueadas = abajoSeg) {

	override method move(character) {
		character.move(character.position().down(1), celdasBloqueadas)
	}

}

object derechaSegundo inherits Movimientos(celdasBloqueadas = derechaSeg) {

	override method move(character) {
		character.move(character.position().right(1), celdasBloqueadas)
	}

}

object izquierdaSegundo inherits Movimientos(celdasBloqueadas = izquierzaSeg) {

	override method move(character) {
		character.move(character.position().left(1), celdasBloqueadas)
	}

}







