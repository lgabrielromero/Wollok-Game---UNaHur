import wollok.game.*

// PARED (Los objetos no pueden atravesarlo)
class Wall{
	var property position
	const property image = "WALL.png"
	method esAtravesable() = false
	method colisionAccion(){}
	method validarLugarLibre(){
		return true
		
	}
}

object borde {
	
	method addBordeCompleto(){
		// Borde Abajo
		game.addVisual(new Wall(position = game.at(0,-1)))
		game.addVisual(new Wall(position = game.at(1,-1)))
		game.addVisual(new Wall(position = game.at(2,-1)))
		game.addVisual(new Wall(position = game.at(3,-1)))
		game.addVisual(new Wall(position = game.at(4,-1)))
		game.addVisual(new Wall(position = game.at(5,-1)))
		game.addVisual(new Wall(position = game.at(6,-1)))
		game.addVisual(new Wall(position = game.at(7,-1)))
		game.addVisual(new Wall(position = game.at(8,-1)))
		game.addVisual(new Wall(position = game.at(9,-1)))
		game.addVisual(new Wall(position = game.at(10,-1)))
		game.addVisual(new Wall(position = game.at(11,-1)))
		game.addVisual(new Wall(position = game.at(12,-1)))
		game.addVisual(new Wall(position = game.at(13,-1)))
		game.addVisual(new Wall(position = game.at(14,-1)))
		game.addVisual(new Wall(position = game.at(15,-1)))
		// Borde Izquierda
		game.addVisual(new Wall(position = game.at(-1,0)))
		game.addVisual(new Wall(position = game.at(-1,1)))
		game.addVisual(new Wall(position = game.at(-1,2)))
		game.addVisual(new Wall(position = game.at(-1,3)))
		game.addVisual(new Wall(position = game.at(-1,4)))
		game.addVisual(new Wall(position = game.at(-1,5)))
		game.addVisual(new Wall(position = game.at(-1,6)))
		game.addVisual(new Wall(position = game.at(-1,7)))
		game.addVisual(new Wall(position = game.at(-1,8)))
		game.addVisual(new Wall(position = game.at(-1,9)))
		game.addVisual(new Wall(position = game.at(-1,10)))
		game.addVisual(new Wall(position = game.at(-1,11)))
		game.addVisual(new Wall(position = game.at(-1,12)))
		game.addVisual(new Wall(position = game.at(-1,13)))
		game.addVisual(new Wall(position = game.at(-1,14)))
		game.addVisual(new Wall(position = game.at(-1,15)))
		// Borde Derecha
		game.addVisual(new Wall(position = game.at(15,0)))
		game.addVisual(new Wall(position = game.at(15,1)))
		game.addVisual(new Wall(position = game.at(15,2)))
		game.addVisual(new Wall(position = game.at(15,3)))
		game.addVisual(new Wall(position = game.at(15,4)))
		game.addVisual(new Wall(position = game.at(15,5)))
		game.addVisual(new Wall(position = game.at(15,6)))
		game.addVisual(new Wall(position = game.at(15,7)))
		game.addVisual(new Wall(position = game.at(15,8)))
		game.addVisual(new Wall(position = game.at(15,9)))
		game.addVisual(new Wall(position = game.at(15,10)))
		game.addVisual(new Wall(position = game.at(15,11)))
		game.addVisual(new Wall(position = game.at(15,12)))
		game.addVisual(new Wall(position = game.at(15,13)))
		game.addVisual(new Wall(position = game.at(15,14)))
		game.addVisual(new Wall(position = game.at(15,15)))
		
			// Borde Arriba
		game.addVisual(new Wall(position = game.at(0,14)))
		game.addVisual(new Wall(position = game.at(1,14)))
		game.addVisual(new Wall(position = game.at(2,14)))
		game.addVisual(new Wall(position = game.at(3,14)))
		game.addVisual(new Wall(position = game.at(4,14)))
		game.addVisual(new Wall(position = game.at(5,14)))
		game.addVisual(new Wall(position = game.at(6,14)))
		game.addVisual(new Wall(position = game.at(7,14)))
		game.addVisual(new Wall(position = game.at(8,14)))
		game.addVisual(new Wall(position = game.at(9,14)))
		game.addVisual(new Wall(position = game.at(10,14)))
		game.addVisual(new Wall(position = game.at(11,14)))
		game.addVisual(new Wall(position = game.at(12,14)))
		game.addVisual(new Wall(position = game.at(13,14)))
		game.addVisual(new Wall(position = game.at(14,14)))
		game.addVisual(new Wall(position = game.at(15,14)))
	}
	
}