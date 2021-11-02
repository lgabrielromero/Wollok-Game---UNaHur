import wollok.game.*
import personajes.*

class Llave {
	var property position
	const property image = "Key.png" 	
	
	// agregar comportamiento	
}

class Moneda {
	var property position
	const property image = "Coin.png"
}

class Puerta {
	var property position
	const property image = "Door.png"
}

object energia {
	method position() = game.center()
	method text() = player.energia()
}


