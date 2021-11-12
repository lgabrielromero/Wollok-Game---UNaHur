import wollok.game.*

class Fondo {
	const property position = game.at(0, 0)
	const property image
	method esAtravesable() = true
	method colisionAccion(){}
	method validarLugarLibre(direccion){
		return true
	}
	method validarLugarLibre(){return true}
}
