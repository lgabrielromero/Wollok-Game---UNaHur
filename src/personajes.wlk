import wollok.game.*
import elementos.*
import hud.*
import direcciones.*
import utilidades.*




////////////////////
/////PERSONAJE//////
////////////////////

object player {
	var property position = game.center()
	var property image = "RightPlayer.png"
	var property vida = 4
	var property energia = 30
	var property direccion = null
	var property llaves = 0
	var property monedas = 0
	method esAtravesable() = true
	method validarLugarLibre(){
		const alLado = self.direccion().siguiente(position)
		return game.getObjectsIn(alLado).all{ obj => obj.validarLugarLibre()}
		
	}
	method moverArriba(){
		self.image("UpPlayer.png")
		self.direccion(arriba)
		if(self.validarLugarLibre()){
			self.energia(self.energia() - 1)
			barraDeEnergia.barra()
			if (self.position().y() == game.height() - 2){
				position = game.at(self.position().x(),0)
			}
			else{
				position = position.up(1)
			}
		}
		
	}
	method moverAbajo(){
		self.image("DownPlayer.png")
		self.direccion(abajo)
		if(self.validarLugarLibre()){
			self.energia(self.energia() - 1)
			barraDeEnergia.barra()
			if (self.position().y() == 0){
				position = game.at(self.position().x(),game.height() - 2)
			}
			else{
				position = position.down(1)
			}
		}
		
	}
	method moverIzquierda(){
		self.image("LeftPlayer.png")
		self.direccion(izquierda)
		if(self.validarLugarLibre()){
			self.energia(self.energia() - 1)
			barraDeEnergia.barra()
			if (self.position().x() == 0 ){
				position = game.at(game.width() - 1,self.position().y())
			}
			else{
				position = position.left(1)
			}
		}
		
	}
	method moverDerecha(){
		self.image("RightPlayer.png")
		self.direccion(derecha)
		if(self.validarLugarLibre()){
			self.energia(self.energia() - 1)
			barraDeEnergia.barra()
			if (self.position().x() == game.width() - 1){
				position = game.at(0,self.position().y())
			}
			else{
				position = position.right(1)
			}
		}
		
	}
	
	
	method movimientos(){
	keyboard.left().onPressDo({ self.moverIzquierda() })
	keyboard.right().onPressDo({ self.moverDerecha() })
	keyboard.up().onPressDo({ self.moverArriba() })
	keyboard.down().onPressDo({ self.moverAbajo() })
	keyboard.space().onPressDo({ self.agarrar() })
	}
	
	method danio(){
	if (self.vida() == 1){
		
		}
	else{
		self.vida(vida-1)
		game.sound("dmg.mp3").play()
		utilidadesParaJuego.pausarMovimientosAutomaticos(2000)
		self.moverPorGolpe()
		}
	barraDeVidas.barra()
	}
	
	method moverPorGolpe(){ 
		if(self.position().x() == 0){
			self.position(game.at(self.position().x() + 1, self.position().y()))
		}
		else{
			self.position(game.at(self.position().x() - 1, self.position().y()))
		}
		
	}
	
	method colision(elemento){
		elemento.colisionAccion()
	}
	method colision2(elemento){
		elemento.colisionAccion2()
	}
	
	method agarrarLlave(){
		self.llaves(self.llaves() + 1)
	}
	
	method agarrarMoneda(){
		self.monedas(self.monedas() + 1)
	}
	
	method sumaEnergia(cantidad) { energia += cantidad }

	method restaEnergia(cantidad) {
		if (cantidad > energia)
			throw new Exception(message = "No tengo suficiente energia")
		energia -= cantidad
	}
	
	
	// Valida la accion de Agarrar Objetos ( Por alguna razón no funciona con All, preguntarle al profesor)
	
	method consumibleEnfrente(){
		var objetoEnfrente = null
		const alLado = self.direccion().siguiente(position)
		if(game.getObjectsIn(alLado).any{ obj => obj.tipo() == "consumible"}){
			objetoEnfrente = "consumible"
		}
		else{
			objetoEnfrente = "item"
		}
		return objetoEnfrente
		
	}
	
	method puedeAgarrar(){
		
		const alLado = self.direccion().siguiente(position)
		return game.getObjectsIn(alLado).any{ obj => obj.tipo() == "consumible" or obj.tipo() == "item"}
		
	}
	method agarrar(){
		const alLado = self.direccion().siguiente(position)
		
		if(self.puedeAgarrar() and self.consumibleEnfrente() == "consumible") {
			game.getObjectsIn(alLado).find({cosa => cosa.tipo() == "consumible"}).consumir()	
		}
		else if(self.puedeAgarrar() and self.consumibleEnfrente() == "item"){
			game.getObjectsIn(alLado).find({cosa => cosa.tipo() == "item"}).recoger()
		}
		
		
	}
	
	
}







////////////////////
//////ENEMIGO///////
////////////////////

class Enemigo{
	var property position = game.at(0.randomUpTo(game.width() - 1),0.randomUpTo(game.height() - 1))
	var property image
	var property esAtravesable = false
	const property tipo = "enemigo"
	var property direccion = null
	method colisionAccion(){
		player.danio()
	}
	
	method validarLugarLibre(){
		return true
	}
	
	method muerte(){}
	method mover()
	method cambiarDireccionImg()	
}





////////////////////
/////ESQUELETO//////
////////////////////

class Esqueleto inherits Enemigo{
	method random(){return new Range(start =1,end=4).anyOne()}
	override method mover(){
		if (self.random() == 1){self.moverArriba()}
		else if (self.random() == 2){self.moverAbajo()}
		else if (self.random() == 3){self.moverIzquierda()}
		else if (self.random() == 4){self.moverDerecha()}
		else{self.cambiarDireccionImg()}
	}
	
	override method validarLugarLibre(){
		const alLado = direccion.siguiente(position)
		return game.getObjectsIn(alLado).all{ obj => obj.esAtravesable()}
	}
	method moverArriba(){
		self.direccion(arriba)
		if (self.validarLugarLibre()){
			position = position.up(1)
		}
		
	}
	method moverAbajo(){
		self.direccion(abajo)
		if (self.validarLugarLibre()){
			position = position.down(1)
		}
		
	}
	method moverIzquierda(){
		self.direccion(izquierda)
		self.image("LeftSkeleton.png")
		if (self.validarLugarLibre() ){
			position = position.left(1)
		}
		
	}
	method moverDerecha(){
		self.direccion(derecha)
		self.image("RightSkeleton.png")
		if (self.validarLugarLibre()){
			position = position.right(1)
		}
		
	}
	
	override method cambiarDireccionImg(){
		if (self.image() == "LeftSkeleton.png" ){
			self.image("RightSkeleton.png")
		}
		else{
			self.image("LeftSkeleton.png")
		}
	}
}






////////////////////
//////CRANEO////////
////////////////////

class Craneo inherits Enemigo{
	method direccionMasConveniente(direcciones) = direcciones.min{ direccion => direccion.siguiente(self.position()).distance(player.position()) }
	method direcciones() = [ izquierda, arriba, abajo, derecha ]
	method moverHaciaJugador() {
		
		position =  self.direccionMasConveniente(self.direcciones()).siguiente(position)
		
	}
	override method mover(){
		
	}
	
	override method cambiarDireccionImg(){
		if (self.image() == "LeftFloatingSkeleton.png" ){
			self.image("RightFloatingSkeleton.png")
		}
		else{
			self.image("LeftFloatingSkeleton.png")
		}
	}
}

const craneo1 = new Craneo(image = "LeftFloatingSkeleton.png")
const esqueleto1 = new Esqueleto(image = "LeftSkeleton.png")
const esqueleto2 = new Esqueleto(image = "LeftSkeleton.png")
