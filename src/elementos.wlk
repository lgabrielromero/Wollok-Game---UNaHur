import wollok.game.*
import personajes.*
import nivel1.*



////////////////////
///////LLAVE////////
////////////////////

class Llave {
	var property position
	const property image = "Key.png" 	
	
	method colisionAccion(){
		player.agarrarLlave()
		game.removeVisual(self)
	}
}



////////////////////
//////MONEDA////////
////////////////////

class Moneda {
	var property position
	const property image = "Coin.png"
	method colisionAccion(){
		player.agarrarMoneda()
		game.removeVisual(self)
	}
}



////////////////////
//////PUERTA////////
////////////////////

class Puerta {
	var property position
	const property image = "Door.png"
	
	method colisionAccion(){
		if (player.llaves() == 3){
			nivelBloques.terminar()
		}
		else{
			game.say(player, "Necesito las 3 llaves!")
		}
	}
}



////////////////////
//////BARRIL////////
////////////////////

class Barril {
	var property position
	const property image = "Barril.png"
	method SePuedeMover() = true
	method movete(direccion){
		position = direccion.siguiente(position)
	}
	method colisionAccion(){
		self.movete(player.direccion())
	}
}



// PRUEBA (CREAR LUEGO UN ARCHIVO CON DIRECCIONES)
class Direccion {
	method siguiente(position)
	method opuesto()
}

object izquierda inherits Direccion { 
	override method siguiente(position) = position.left(1) 
	override method opuesto() = derecha
}

object derecha inherits Direccion { 
	override method siguiente(position) = position.right(1) 
	override method opuesto() = izquierda
}

object abajo inherits Direccion { 
	override method siguiente(position) = position.down(1) 
	override method opuesto() = arriba
}

object arriba inherits Direccion { 
	override method siguiente(position) = position.up(1) 
	override method opuesto() = abajo
}