import wollok.game.*
import fondo.*
import personajes.*
import elementos.*
import nivel2.*
import nivel3.*
import nivel1.*
import hud.*
import direcciones.*
import paredes.*
import visuals.*
import utilidades.*


object nivelTest {
	method configurate() {
		// fondo - es importante que sea el primer visual que se agregue
		game.addVisual(new Fondo(image="dungeonwall.png"))
		// Elementos del Hud (Estado del jugador)
		borde.addBordeCompleto()
		interfaz.agregar()
		// otros visuals, p.ej. bloques o llaves
		visualTest.agregar()
		// personaje, es importante que sea el último visual que se agregue
		game.addVisual(player)
		
		// teclado
		player.nivel(4)	
		player.movimientos()
		game.whenCollideDo(player, { elemento => player.colision(elemento)})
	}
	
	method prueba(){
		
		game.clear()
		self.configurate()
		
		
		
	}
}