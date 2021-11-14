import wollok.game.*
import elementos.*
import hud.*
import direcciones.*
import utilidades.*
import visuals.*
import nivel1.*
import nivel2.*



////////////////////
/////PERSONAJE//////
////////////////////

object player {
	var property position = game.center()
	var property image = "RightPlayer.png"
	var property vida = 99
	var property energia = 30
	var property direccion = null
	var property llaves = 0
	var property monedas = 0
	var property nivel = 1
	method esAtravesable() = true
	method validarLugarLibre(){
		const alLado = self.direccion().siguiente(position)
		return game.getObjectsIn(alLado).all{ obj => obj.validarLugarLibre()}
		
	}
	
	method perderPorEnergia(){
		if (self.nivel() == 1){nivelBloques.perderPorEnergia()}
		else if (self.nivel() == 2){nivelLlaves.perderPorEnergia()}
		else{nivelBonus.perderPorEnergia()}
	}
	
	method perderPorVida(){
		if (self.nivel() == 1){nivelBloques.perderPorVida()}
		else if (self.nivel() == 2){nivelLlaves.perderPorVida()}
		else{nivelBonus.perderPorVida()}
	}
	
	method resetStats(){
		self.vida(80)
		self.energia(30)
		self.direccion(null)
		self.llaves(0)
		self.monedas(0)
		self.position(game.center())
	}
	
	method moverArriba(){
		self.image("UpPlayer.png")
		self.direccion(arriba)
		if(self.validarLugarLibre()){
			self.energia(self.energia() - 1)
			if (self.energia() == 0){
				self.perderPorEnergia()
			}
			else{
			numeroEnergia.actualiza(self.energia())
			barraDeEnergia.barra()
			if (self.position().y() == game.height() - 2){
				position = game.at(self.position().x(),1)
			}
			else{
				position = position.up(1)
			}}
		}
		
	}
	method moverAbajo(){
		self.image("DownPlayer.png")
		self.direccion(abajo)
		if(self.validarLugarLibre()){
			self.energia(self.energia() - 1)
			if (self.energia() == 0){
				self.perderPorEnergia()
			}
			else{
			numeroEnergia.actualiza(self.energia())
			barraDeEnergia.barra()
			if (self.position().y() == 1){
				position = game.at(self.position().x(),game.height() - 2)
			}
			else{
				position = position.down(1)
			}
		}}
		
	}
	method moverIzquierda(){
		self.image("LeftPlayer.png")
		self.direccion(izquierda)
		if(self.validarLugarLibre()){
			self.energia(self.energia() - 1)
			if (self.energia() == 0){
				self.perderPorEnergia()
			}
			else{
			barraDeEnergia.barra()
			numeroEnergia.actualiza(self.energia())
			if (self.position().x() == 0 ){
				position = game.at(game.width() - 1,self.position().y())
			}
			else{
				position = position.left(1)
			}
		}}
		
	}
	method moverDerecha(){
		self.image("RightPlayer.png")
		self.direccion(derecha)
		if(self.validarLugarLibre()){
			self.energia(self.energia() - 1)
			if (self.energia() == 0){
				self.perderPorEnergia()
			}
			else{
			barraDeEnergia.barra()
			numeroEnergia.actualiza(self.energia())
			if (self.position().x() == game.width() - 1){
				position = game.at(0,self.position().y())
			}
			else{
				position = position.right(1)
			}
		}}
		
	}
	
	
	method movimientos(){
	keyboard.left().onPressDo({ self.moverIzquierda() })
	keyboard.right().onPressDo({ self.moverDerecha() })
	keyboard.up().onPressDo({ self.moverArriba() })
	keyboard.down().onPressDo({ self.moverAbajo() })
	keyboard.space().onPressDo({ self.agarrar() })
	}
	
	method danio(danio){
	if (self.vida() - danio <= 0){
		self.perderPorVida()
		}
	else{
		self.vida(self.vida() - 20)
		game.sound("dmg.mp3").play()
		utilidadesParaJuego.pausarMovimientosAutomaticos(2000)
		self.moverPorGolpe()
		}
	barraDeVidas.barra()
	numeroVida.actualiza(self.vida())
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
		llaves = 99.min(llaves + 1)
		numeroLlave.actualiza(self.llaves())
	}
	
	method agarrarMoneda(){
		monedas = 99.min(monedas + 1)
		vida -= 1
		numeroMoneda.actualiza(self.monedas())
		numeroVida.actualiza(self.vida())
		barraDeVidas.barra()
	}
	
	method sumaEnergia(cantidad) { 
		energia = 99.min(energia + cantidad)
		barraDeEnergia.barra()
		numeroEnergia.actualiza(self.energia())
	}

	method restaEnergia(cantidad) {
		energia = 0.max(energia - cantidad)
		barraDeEnergia.barra()
		numeroEnergia.actualiza(self.energia())
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
	method colisionAccion()
	
	method validarLugarLibre(){return true}
	
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
	
	override method colisionAccion(){
		player.danio(40)
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
	
	method direccionMasConveniente(direcciones) = direcciones.min{ direccion => direccion.siguiente(self.position()).distance(player.position())}
	method direcciones() = [ izquierda, arriba, abajo, derecha ]
	method moverHaciaJugador() {
		
		position =  self.direccionMasConveniente(self.direcciones()).siguiente(position)
		
	}
	override method mover(){
		
	}
	
	override method colisionAccion(){
		player.danio(20)
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

const craneo1 = new Craneo(image = "LeftFloatingSkeleton.png", position = game.at(0,0))
const esqueleto1 = new Esqueleto(image = "LeftSkeleton.png")
const esqueleto2 = new Esqueleto(image = "LeftSkeleton.png")
