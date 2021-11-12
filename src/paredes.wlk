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
		game.addVisual(new Wall(position = game.at(0,0)))
		game.addVisual(new Wall(position = game.at(0,1)))
		game.addVisual(new Wall(position = game.at(0,2)))
		game.addVisual(new Wall(position = game.at(0,3)))
		game.addVisual(new Wall(position = game.at(0,4)))
		game.addVisual(new Wall(position = game.at(0,5)))
		game.addVisual(new Wall(position = game.at(0,6)))
		game.addVisual(new Wall(position = game.at(0,7)))
		game.addVisual(new Wall(position = game.at(0,8)))
		game.addVisual(new Wall(position = game.at(0,9)))
		game.addVisual(new Wall(position = game.at(0,10)))
		game.addVisual(new Wall(position = game.at(0,11)))
		game.addVisual(new Wall(position = game.at(0,12)))
		game.addVisual(new Wall(position = game.at(0,13)))
		game.addVisual(new Wall(position = game.at(0,14)))
		game.addVisual(new Wall(position = game.at(0,15)))
		// Borde Derecha
		game.addVisual(new Wall(position = game.at(14,0)))
		game.addVisual(new Wall(position = game.at(14,1)))
		game.addVisual(new Wall(position = game.at(14,2)))
		game.addVisual(new Wall(position = game.at(14,3)))
		game.addVisual(new Wall(position = game.at(14,4)))
		game.addVisual(new Wall(position = game.at(14,5)))
		game.addVisual(new Wall(position = game.at(14,6)))
		game.addVisual(new Wall(position = game.at(14,7)))
		game.addVisual(new Wall(position = game.at(14,8)))
		game.addVisual(new Wall(position = game.at(14,9)))
		game.addVisual(new Wall(position = game.at(14,10)))
		game.addVisual(new Wall(position = game.at(14,11)))
		game.addVisual(new Wall(position = game.at(14,12)))
		game.addVisual(new Wall(position = game.at(14,13)))
		game.addVisual(new Wall(position = game.at(14,14)))
		game.addVisual(new Wall(position = game.at(14,15)))
		
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