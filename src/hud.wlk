import wollok.game.*
import personajes.*
object barraDeVidas {
	var property image = "4_vidas.png"
	var property position = game.at(0,9)
	
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
