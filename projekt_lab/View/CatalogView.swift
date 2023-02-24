//
//  CatalogView.swift
//  projekt_lab
//
//  Created by MarcinMB on 15/05/2022.
//

import SwiftUI

struct CatalogView: View {
    
    var itemsFruits: [CatalogItem] = catalogItems_fruits
    var itemsVegetables: [CatalogItem] = catalogItems_vegetables
    var itemsBreadstuff: [CatalogItem] = catalogItems_breadstuff
    var itemsDairy: [CatalogItem] = catalogItems_dairy
    var itemsMeat: [CatalogItem] = catalogItems_meat
    var itemsDrinks: [CatalogItem] = catalogItems_drinks
    var itemsSpices: [CatalogItem] = catalogItems_spices
    var itemsSweets: [CatalogItem] = catalogItems_sweets
    var itemsOther: [CatalogItem] = catalogItems_other
    var categories: [CatalogCategory] = catalogCategories
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                Divider()
                VStack {
                    ForEach(categories) { category in
                        Text(category.name)
                            .font(.title2.weight(.semibold))
                        ScrollView(.horizontal, showsIndicators: false, content: {
                            HStack {
                                switch category.id {
                                case "fruits": ForEach(itemsFruits) { item in itemCard(item: item)}
                                case "vegetables": ForEach(itemsVegetables) { item in itemCard(item: item)}
                                case "breadstuff": ForEach(catalogItems_breadstuff) { item in itemCard(item: item)}
                                case "dairy": ForEach(itemsDairy) { item in itemCard(item: item)}
                                case "meat": ForEach(itemsMeat) { item in itemCard(item: item)}
                                case "drinks": ForEach(itemsDrinks) { item in itemCard(item: item)}
                                case "spices": ForEach(itemsSpices) { item in itemCard(item: item)}
                                case "sweets": ForEach(itemsSweets) { item in itemCard(item: item)}
                                case "other": ForEach(itemsOther) { item in itemCard(item: item)}
                                default: Text("Nie odnaleziono produktów")
                                }
                            }
                        })
                        Divider()
                            .padding(.bottom)
                        
                    }
                }
            }   .navigationTitle("Katalog produktów")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func itemCard(item: CatalogItem) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.gray).opacity(0.2)
                .frame(width: 260, height: 300)
                .shadow(radius: 10)
                .padding()
            VStack {
                ZStack {
                    Image(item.itemImage)
                        .resizable()
                        .frame(width: 240, height: 220)
                        .scaledToFill()
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        .opacity(0.9)
                        .blur(radius: 3)
                    .shadow(radius: 10)
                    Image(item.itemImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 140, height: 140)
                        .clipShape(Circle())
                    
                }
                NavigationLink(destination: CatalogItemDetailView(item: item).navigationBarBackButtonHidden(true).navigationBarHidden(true)) {
                    HStack {
                        Group {
                            Text(item.name)
                                .font(.title3.weight(.bold))
                                .foregroundColor(.black)
                                .padding()
                            Image(systemName: "chevron.right")
                        }   .foregroundColor(.black)
                            .font(.title3.weight(.bold))
                    }
                }
                
            }
        }
    }
}

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
