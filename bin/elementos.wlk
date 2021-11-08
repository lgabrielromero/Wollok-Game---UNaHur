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

class Barril {
	var property position
	const property image = "Barril.png"
	method SePuedeMover() = true
	method movete(direccion){
		position = direccion.siguiente(position)
	}
}

// PRUEBA (CREAR LUEGO UN ARCHIVO CON DIRECCIONES)
class Direccion {
	method siguiente(position)
}

object izquierda inherits Direccion { 
	override method siguiente(position) = position.left(1) 
	method opuesto() = derecha
}

object derecha inherits Direccion { 
	override method siguiente(position) = position.right(1) 
	method opuesto() = izquierda
}

object abajo inherits Direccion { 
	override method siguiente(position) = position.down(1) 
	method opuesto() = arriba
}

object arriba inherits Direccion { 
	override method siguiente(position) = position.up(1) 
	method opuesto() = abajo
}