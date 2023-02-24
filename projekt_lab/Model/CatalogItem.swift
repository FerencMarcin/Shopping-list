//
//  CatalogCategory.swift
//  projekt_lab
//
//  Created by MarcinMB on 31/05/2022.
//

import Foundation
import SwiftUI

struct CatalogItem: Identifiable {
    var id: String
    let name: String
    let itemImage: String
    let descritpion: String
    let isPacked: Bool
}

var catalogItems_fruits = [
    CatalogItem(id: "fruits_apple", name: "Jabłko", itemImage: "apple", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "fruits_avocado", name: "Awokado", itemImage: "avocado", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "fruits_banana", name: "Banan", itemImage: "banana", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "fruits_cherries", name: "Wiśnie", itemImage: "cherries", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "fruits_kiwi", name: "Kiwi", itemImage: "kiwi", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "fruits_lemon", name: "Cytryna", itemImage: "lemon", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "fruits_pineapple", name: "Ananas", itemImage: "pineapple", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "fruits_pomelo", name: "Pomelo", itemImage: "pomelo", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "fruits_strawberry", name: "Truskawka", itemImage: "strawberry", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "fruits_tangerine", name: "Mandarynka", itemImage: "tangerine", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "fruits_watermelon", name: "Arbuz", itemImage: "watermelon", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
]

var catalogItems_vegetables = [
    CatalogItem(id: "vegetables_brocoli", name: "Brokuł", itemImage: "broccoli", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "vegetables_brussels", name: "Brukselka", itemImage: "brusselsSprout", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "vegetables_carrot", name: "Marchew", itemImage: "carrot", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "vegetables_cucumber", name: "Ogórek", itemImage: "cucumber", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "vegetables_hotPepper", name: "Papryka (ostra)", itemImage: "hotPepper", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "vegetables_peppers", name: "Papryka (słodka)", itemImage: "peppers", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "vegetables_potato", name: "Ziemniaki", itemImage: "potato", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "vegetables_tomato", name: "Pomidor", itemImage: "tomato", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false)
]

var catalogItems_breadstuff = [
    CatalogItem(id: "breadstuff_wheatBread", name: "Chleb pszenny", itemImage: "wheatBread", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "breadstuff_ryeBread", name: "Chelb żytni", itemImage: "ryeBread", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "breadstuff_baguette", name: "Bagietka", itemImage: "baguette", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "breadstuff_wheatRoll", name: "Bułka pszenna", itemImage: "wheatRoll", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "breadstuff_sesameRoll", name: "Bułka z sezamem", itemImage: "sesameSeedsRoll", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false)
]

var catalogItems_dairy = [
    CatalogItem(id: "dairy_milk", name: "Mleko", itemImage: "milk", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "dairy_butter", name: "Masło", itemImage: "butter", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "dairy_egg", name: "Jajak", itemImage: "egg", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "dairy_cheese", name: "Ser", itemImage: "cheese", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "dairy_cottageCheese", name: "Twaróg", itemImage: "cottageCheese", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false)
]

var catalogItems_meat = [
    CatalogItem(id: "meat_beef", name: "Wołowina", itemImage: "beef", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "meat_pork", name: "Wieprzowina", itemImage: "pork", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "meat_bacon", name: "Bekon", itemImage: "bacon", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "meat_chicken", name: "Kurczak", itemImage: "chicken", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "meat_ham", name: "Szynka", itemImage: "ham", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "meat_meatballs", name: "Pulpety", itemImage: "meatballs", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "meat_salmon", name: "Łosoś", itemImage: "salmon", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "meat_prawns", name: "Krewetki", itemImage: "prawns", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false)
]

var catalogItems_drinks = [
    CatalogItem(id: "drinks_juice", name: "Sok", itemImage: "juice", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "drinks_colaZero", name: "Cola (bez cukru)", itemImage: "colaZero", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "drinks_cola", name: "Cola", itemImage: "cola", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "drinks_coffeeBeans", name: "Kawa (ziarna)", itemImage: "coffeeBeans", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "drinks_instantCoffee", name: "Kawa (rozpuszczalna)", itemImage: "instantCoffee", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "drinks_teaBags", name: "Herbata", itemImage: "teaBags", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "drinks_leafTea", name: "Herbata (liściasta)", itemImage: "leafTea", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "drinks_bottledWater", name: "Woda", itemImage: "bottledWater", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "drinks_energyDrink", name: "Napój energetyczny", itemImage: "energyDrink", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "drinks_fizzyDrink", name: "Napój gazowany", itemImage: "fizzyDrink", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false)
]

var catalogItems_spices = [
    CatalogItem(id: "spices_pepper", name: "Pieprz", itemImage: "pepper", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "spices_salt", name: "Sól", itemImage: "salt", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "spices_anise", name: "Anyż", itemImage: "anise", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "spices_honey", name: "Miód", itemImage: "honey", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "spices_sugar", name: "Cukier", itemImage: "sugar", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false)
]

var catalogItems_sweets = [
    CatalogItem(id: "sweets_chocolate", name: "Czekolada", itemImage: "chocolate", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "sweets_chocolateBar", name: "Baton czekoladowy", itemImage: "chocolateBar", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "sweets_chocolateCake", name: "Ciasto czekoladowe", itemImage: "chocolateCake", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "sweets_cookie", name: "Ciastka", itemImage: "cookie", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "sweets_donut", name: "Donat", itemImage: "donut", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "sweets_chocolateCookie", name: "Ciastka czekoladowe", itemImage: "chocolateCookie", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "sweets_iceCream", name: "Lody", itemImage: "iceCreamBox", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "sweets_cheeseCake", name: "Sernik", itemImage: "cheeseCake", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "lollipop", name: "Lizak", itemImage: "lollipop", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false)
]

var catalogItems_other = [
    CatalogItem(id: "other_pasta", name: "Makaron", itemImage: "pasta", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "other_whitePasta", name: "Makaron (biały)", itemImage: "whitePasta", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false),
    CatalogItem(id: "other_mushrooms", name: "Grzyby", itemImage: "mushrooms", descritpion: "Przykładowy opis produktu - tu mogłyby znaleźć się informacje na temat produktów", isPacked: false)
]
