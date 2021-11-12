import wollok.game.*
import personajes.*
object barraDeVidas {
	const property tipo = "interface"
	var property image = "4_vidas.png"
	var property position = game.at(0,game.height() - 1)
	method validarLugarLibre(){return true}
	method validarMovimiento(){return true}
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
 
object barraDeEnergia{
	const property tipo = "interface"
	var property image ="energy_4.png"
	method validarLugarLibre(){return true}
	method position()= game.at(12,game.height() - 1)
	method validarMovimiento(){return true}
	method energia(){return player.energia()}
	
	
	method barra(){
		
		if (self.energia() >= 30) {
			self.image("energy_4.png")
		}
		else if(self.energia().between(20,30)) {
			self.image("energy_3.png")
		}
		else if(self.energia().between(10,20)){
			self.image("energy_2.png")
		}
		else if(self.energia().between(1,10)){
			self.image("energy_1.png")
		}
		else if(self.energia() <= 0){
			self.image("energy_0.png")
		}
		
	}
	
}
