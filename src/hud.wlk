import wollok.game.*
import personajes.*
object barraDeVidas {
	var property image = "4_vidas.png"
	var property position = game.at(0,game.height() - 1)
	
	method vida() {return player.vida()}
	
	method barra(){
		if (self.vida() == 4) {
			self.image("4_vidas.png")
		}
		else if(self.vida() == 3) {
			self.image("3_vidas.png")
		}
		else if(self.vida() == 2){
			self.image("2_vidas.png")
		}
		else if(self.vida() == 1){
			self.image("1_vidas.png")
		}
		else if(self.vida() == 0){
			self.image("0_vidas.png")
		}
	}
}
///barra de energia///

object paleta {
	const property verde = "00FF00FF"
	const property rojo = "FF0000FF"
}
 
object marcador{
	
	method position()= game.at(10,game.height() - 1)
	method image()="barraEnergia.png"
	method text() = "E:"+player.energia()
	method textColor() = paleta.rojo()
}
