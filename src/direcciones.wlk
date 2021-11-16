import wollok.game.*
class Direccion {
	method siguiente(position)
	
}

object izquierda inherits Direccion { 
	override method siguiente(position) = position.left(1) 
	
	
}

object derecha inherits Direccion { 
	override method siguiente(position) = position.right(1) 

	
}

object abajo inherits Direccion { 
	override method siguiente(position) = position.down(1) 

}

object arriba inherits Direccion { 
	override method siguiente(position) = position.up(1) 

	
}