import wollok.game.*
import personajes.*



object barraDeVidas {
	const property tipo = "interface"
	var property image = "4_vidas.png"
	var property position = game.at(0,game.height() - 1).right(2)
	method validarLugarLibre(){return true}
	method validarMovimiento(){return true}
	method vida() {return player.vida()}
	method barra(){
		if (self.vida() >= 99) {
			self.image("4_vidas.png")
		}
		else if(self.vida().between(66,99)) {
			self.image("3_vidas.png")
		}
		else if(self.vida().between(33,66)){
			self.image("2_vidas.png")
		}
		else if(self.vida().between(1,33)){
			self.image("1_vidas.png")
		}
		else if(self.vida() <= 0){
			self.image("0_vidas.png")
		}
	}
}
///barra de energia///
 
object barraDeEnergia{
	const property tipo = "interface"
	var property image ="energy_1.png"
	method validarLugarLibre(){return true}
	method validarMovimiento(){return true}	
	method position()= game.at(12,game.height() - 1)
	method energia(){return player.energia()}
	
	
	method barra(){
		
		if (self.energia() >= 99) {
			self.image("energy_4.png")
		}
		else if(self.energia().between(66,99)) {
			self.image("energy_3.png")
		}
		else if(self.energia().between(33,66)){
			self.image("energy_2.png")
		}
		else if(self.energia().between(1,33)){
			self.image("energy_1.png")
		}
		else if(self.energia() <= 0){
			self.image("energy_0.png")
		}
		
	}
	
}


//Numeros para la interfaz//
class Numeros{
	const property tipo = "interface"
	var property position = game.at(0,game.height() - 1)
	method validarLugarLibre(){return true}
	method validarMovimiento(){return true}
}

class Decena inherits Numeros{
	var property elementoActual
	var property image = numberConvert.getNumber(elementoActual.div(10))
	
	
	method actualiza(){
		self.image(numberConvert.getNumber(elementoActual.div(10)))
	}
}

class Unidad inherits Numeros(position = position.right(1)){
	var property elementoActual
	var property image = numberConvert.getNumber(elementoActual % 10)
	
	method actualiza(){
		self.image(numberConvert.getNumber(elementoActual % 10))
	}
}

class Numero inherits Numeros {
	var property decena
	var property unidad

	method actualiza(cosa){
		decena.elementoActual(cosa)
		unidad.elementoActual(cosa)

		unidad.actualiza()
		decena.actualiza()

	}
	
	method mostrar(){
		
		game.addVisual(decena)
		game.addVisual(unidad)
	}
}


object numberConvert {
	method getNumber(numero){
		return "nro" + numero + ".png"
	}
}


const unidadEnergia = new Unidad(elementoActual = player.energia(),position = game.at(12,game.height() - 1).left(1))
const decenaEnergia = new Decena(elementoActual = player.energia(),position = game.at(12,game.height() - 1).left(2))
const numeroEnergia = new Numero(decena = decenaEnergia, unidad = unidadEnergia)


const unidadVida = new Unidad(elementoActual = player.vida(),position = game.at(0,game.height() - 1).right(1))
const decenaVida = new Decena(elementoActual = player.vida(),position = game.at(0,game.height() - 1))
const numeroVida = new Numero(decena = decenaVida, unidad = unidadVida)







