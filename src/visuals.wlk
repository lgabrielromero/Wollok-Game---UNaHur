import wollok.game.*
import elementos.*
import personajes.*
import utilidades.*
import hud.*
import paredes.*
// Sirve para crear elementos visuales que no interactuan con nada.
class Visuals {
	const property tipo = "interface"
	var property image = null
	var property position = game.at(0,game.height() - 1)
	method validarLugarLibre(){return true}
	method validarMovimiento(){return true}
	method colisionAccion(){}
}

/////////////////////////////////////////
//////MUESTRA LA INTERFAZ(HUD)//////////
////////////////////////////////////////

const monedaHud = new Visuals(image = "blood_coin.png", position = game.at(2,0))
const keyHud = new Visuals(image = "SkeletonKey.png", position = game.at(14,0))
const bombaHud = new Visuals(image = "bombaInactiva.png", position = game.center().down(7).right(1))

const unidadEnergia = new Unidad(elementoActual = player.energia(),position = game.at(12,game.height() - 1).left(1))
const decenaEnergia = new Decena(elementoActual = player.energia(),position = game.at(12,game.height() - 1).left(2))
const numeroEnergia = new Numero(decena = decenaEnergia, unidad = unidadEnergia)


const unidadVida = new Unidad(elementoActual = player.vida(),position = game.at(0,game.height() - 1).right(1))
const decenaVida = new Decena(elementoActual = player.vida(),position = game.at(0,game.height() - 1))
const numeroVida = new Numero(decena = decenaVida, unidad = unidadVida)


const unidadMoneda = new Unidad(elementoActual = player.monedas(),position = game.at(1,0))
const decenaMoneda = new Decena(elementoActual = player.monedas(),position = game.at(0,0))
const numeroMoneda = new Numero(decena = decenaMoneda, unidad = unidadMoneda)


const unidadLlave = new Unidad(elementoActual = player.llaves(),position = game.at(13,0))
const decenaLlave = new Decena(elementoActual = player.llaves(),position = game.at(12,0))
const numeroLlave = new Numero(decena = decenaLlave, unidad = unidadLlave)

const unidadBomba = new Unidad(elementoActual = player.granadas(),position = game.center().down(7).left(0))
const decenaBomba = new Decena(elementoActual = player.granadas(),position = game.center().down(7).left(1))
const numeroBomba = new Numero(decena = decenaBomba, unidad = unidadBomba)
	

object interfaz{
	
	method agregar(){
		game.addVisual(barraDeVidas)
		game.addVisual(barraDeEnergia)
		game.addVisual(monedaHud)
		game.addVisual(keyHud)
		game.addVisual(bombaHud)
		numeroMoneda.mostrar()
		numeroEnergia.mostrar()
		numeroVida.mostrar()
		numeroLlave.mostrar()
		numeroBomba.mostrar()
		
	}
	
}

/////////////////////////////////////////////
//////VISUALS PARA EL TEST //////////////////
////////////////////////////////////////////
const spiderP = new Spider(image = "spiderLeft.png", position = game.center().right(7), positionOriginal = game.center().right(7))
const craneoP = new Craneo(image = "LeftFloatingSkeleton.png", position = game.center().right(7).up(1),positionOriginal = game.center().right(7).up(1))
const esqueletoP = new Esqueleto(image = "LeftSkeleton.png",position = game.center().right(7).down(1), positionOriginal = game.center().right(7).down(1))
object visualTest {
	method agregar(){
		[new PisoQuitaEnergia(position = game.center().down(6)),
			new PisoSumaEnergia(position = game.center().down(6).left(1)),
			new PisoItemAleatorio(position = game.center().down(6).left(2)),
			new PisoTeletransporta(position = game.center().down(6).right(1)),
			new Consumible(energiaQueAporta = 15, image = "zanahoria.png", position =  game.center().up(6)),
			new Consumible(energiaQueAporta = 30, image = "carne.png", position = game.center().up(6).left(1)),
			new Consumible(energiaQueAporta = 50, image = "pocionEnergia.png", position = game.center().up(6).right(1)),
			new Consumible(energiaQueAporta = 20, image = "manzana.png", position = game.center().up(6).right(2)),
			new Bomba(energiaQueAporta = 15 , position = game.center().up(6).right(3)),
			new PocionVida(energiaQueAporta = 20 , image = "pocionVida.png", position = game.center().up(6).left(2)),
			new PocionMana(energiaQueAporta=50,image = "pocionMana.png", position = game.center().up(6).left(3)),
			new Puerta(position= game.center().up(6).left(4)),
			new Llave(image = "Key.png", position= game.center().up(6).left(5)),
			new Llave(image = "Key.png", position= game.center().up(6).left(5)),
			new Llave(image = "Key.png", position= game.center().up(6).left(5)),
			new PuertaLvl2(position = game.center().up(6).right(4)),
			new Moneda(position = game.center().up(6).right(5)),
			new Moneda(position = game.center().up(6).right(5)),
			new Moneda(position = game.center().up(6).right(5)),
			new Moneda(position = game.center().up(6).right(5)),
			new Moneda(position = game.center().up(6).right(5)),
			new Moneda(position = game.center().up(6).right(5)),
			new Moneda(position = game.center().up(6).right(5)),
			new Moneda(position = game.center().up(6).right(5)),
			new Moneda(position = game.center().up(6).right(5)),
			new Moneda(position = game.center().up(6).right(5)),
			new Barril(position= game.center().up(1).left(2)),
			spiderP,craneoP,esqueletoP
			
			
		].forEach{cosa => game.addVisual(cosa)}
	}
}


/////////////////////////////////////////////
//////CELDAS SORPRESA //////////////////////
////////////////////////////////////////////

object pisosAleatorios{
	method agregar(){
		[new PisoQuitaEnergia(position = randomSinPisarse.colocar()),
			new PisoSumaEnergia(position = randomSinPisarse.colocar()),
			new PisoItemAleatorio(position =randomSinPisarse.colocar()),
			new PisoTeletransporta(position = game.at(1,2)),
			new PisoTeletransporta(position = game.at(13,2)),
			new PisoTeletransporta(position = game.at(1,12)),
			new PisoTeletransporta(position = game.at(13,12))
		
			
			
		].forEach{cosa => game.addVisual(cosa)}
		
	}
}


/////////////////////////////////////////////
//////MUESTRAN OBJETOS Y CONSUMIBLES////////
////////////////////////////////////////////


object consumiblesLvl1{
	method agregar(){
		[new Consumible(energiaQueAporta = 15, image = "zanahoria.png"),
			new Consumible(energiaQueAporta = 30, image = "carne.png"),
			new Consumible(energiaQueAporta = 25, image = "carne.png"),
			new Consumible(energiaQueAporta = 50, image = "pocionEnergia.png"),
			new Consumible(energiaQueAporta = 20, image = "manzana.png"),
			new Consumible(energiaQueAporta = 50, image = "pocionEnergia.png"),
			new Consumible(energiaQueAporta = 20, image = "manzana.png"),
			new PocionVida(energiaQueAporta = 20 , image = "pocionVida.png"),
			new PocionVida(energiaQueAporta = 20 , image = "pocionVida.png")
			
		].forEach{cosa => game.addVisual(cosa)}
	}
}

object consumiblesLvl2{
	method agregar(){
		[new Consumible(energiaQueAporta = 15, image = "zanahoria.png"),
			new Consumible(energiaQueAporta = 30, image = "carne.png"),
			new Consumible(energiaQueAporta = 25, image = "carne.png"),
			new Consumible(energiaQueAporta = 50, image = "pocionEnergia.png"),
			new Consumible(energiaQueAporta = 20, image = "manzana.png"),
			new Consumible(energiaQueAporta = 50, image = "pocionEnergia.png"),
			new Consumible(energiaQueAporta = 20, image = "manzana.png"),
			new PocionVida(energiaQueAporta = 20 , image = "pocionVida.png"),
			new PocionVida(energiaQueAporta = 20 , image = "pocionVida.png"),
			new PocionVida(energiaQueAporta = 20 , image = "pocionVida.png"),
			new PocionVida(energiaQueAporta = 20 , image = "pocionVida.png")
		].forEach{cosa => game.addVisual(cosa)}
	}
}

object consumiblesLvl3{
	method agregar(){
		[new Consumible(energiaQueAporta = 15, image = "zanahoria.png"),
			new Consumible(energiaQueAporta = 30, image = "carne.png"),
			new Consumible(energiaQueAporta = 25, image = "carne.png"),
			new Consumible(energiaQueAporta = 50, image = "pocionEnergia.png"),
			new Consumible(energiaQueAporta = 20, image = "manzana.png"),
			new Consumible(energiaQueAporta = 50, image = "pocionEnergia.png"),
			new Consumible(energiaQueAporta = 20, image = "manzana.png"),
			new PocionVida(energiaQueAporta = 20 , image = "pocionVida.png"),
			new PocionVida(energiaQueAporta = 20 , image = "pocionVida.png"),
			new PocionVida(energiaQueAporta = 20 , image = "pocionVida.png"),
			new PocionVida(energiaQueAporta = 20 , image = "pocionVida.png"),
			new Bomba(),new Bomba(),new Bomba(), new Bomba(), new Bomba()
		].forEach{cosa => game.addVisual(cosa)}
	}
}





object llaveslvl1{
	method agregar(){
		[new Llave(image = "Key.png", position=randomSinPisarse.colocar()),
			new Llave(image = "Key.png", position=randomSinPisarse.colocar()),
			new Llave(image = "Key.png", position=randomSinPisarse.colocar())
		].forEach{cosa => game.addVisual(cosa)}
		
	}
}


object monedaslvl2{
	
	method agregar(){
		[new Moneda(),new Moneda(),new Moneda(),new Moneda(),new Moneda(),
			new Moneda(),new Moneda(),new Moneda(), new Moneda(), new Moneda()
		].forEach{cosa => game.addVisual(cosa)}
	}
}


object enemigoslvl3{
	method agregar(){
		[spider1,spider2,spider3,spider4,spider5].forEach{cosa => game.addVisual(cosa)}
	}
}

///////////////////////////////////
//////ESTRUCTURAS Y PAREDES////////
//////////////////////////////////
object borde {
	
	method addBordeCompleto(){
		// Borde Abajo
		game.addVisual(new Wall(position = game.at(0,0)))
		game.addVisual(new Wall(position = game.at(1,0)))
		game.addVisual(new Wall(position = game.at(2,0)))
		game.addVisual(new Wall(position = game.at(3,0)))
		game.addVisual(new Wall(position = game.at(4,0)))
		game.addVisual(new Wall(position = game.at(5,0)))
		game.addVisual(new Wall(position = game.at(6,0)))
		game.addVisual(new Wall(position = game.at(7,0)))
		game.addVisual(new Wall(position = game.at(8,0)))
		game.addVisual(new Wall(position = game.at(9,0)))
		game.addVisual(new Wall(position = game.at(10,0)))
		game.addVisual(new Wall(position = game.at(11,0)))
		game.addVisual(new Wall(position = game.at(12,0)))
		game.addVisual(new Wall(position = game.at(13,0)))
		game.addVisual(new Wall(position = game.at(14,0)))
		game.addVisual(new Wall(position = game.at(15,0)))
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

