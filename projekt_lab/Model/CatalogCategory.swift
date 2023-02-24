//
//  CatalogCategory.swift
//  projekt_lab
//
//  Created by MarcinMB on 13/05/2022.
//

import SwiftUI

struct CatalogCategory: Identifiable {
    var id: String
    let name: String
}

var catalogCategories = [
    CatalogCategory(id: "fruits", name: "Owoce"),
    CatalogCategory(id: "vegetables", name: "Warzywa"),
    CatalogCategory(id: "breadstuff", name: "Pieczywo"),
    CatalogCategory(id: "dairy", name: "Nabiał"),
    CatalogCategory(id: "meat", name: "Mięso"),
    CatalogCategory(id: "drinks", name: "Napoje"),
    CatalogCategory(id: "spices", name: "Przyprawy"),
    CatalogCategory(id: "sweets", name: "Słodycze"),
    CatalogCategory(id: "other", name: "Inne")
]
