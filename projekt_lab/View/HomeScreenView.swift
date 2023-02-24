//
//  HomeScreenView.swift
//  projekt_lab
//
//  Created by MarcinMB on 15/05/2022.
//

import SwiftUI

struct HomeScreenView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: ShopingList.entity(),
                  sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]
    ) var allLists: FetchedResults<ShopingList>
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("ZakupoLista")
                .font(.largeTitle).fontWeight(.heavy)
                .foregroundColor(Color(hue: 225/360, saturation: 0.76, brightness: 0.33))
                .padding(.horizontal)
            List() {
                VStack {
                    Text("Witaj!")
                        .font(.title).fontWeight(.heavy)
                        .foregroundColor(.blue)
                    Divider()
                    GroupBox {
                        Text("Masz przed sobą aplikację, które pozowli Ci w łatwy i przjrzysty sposób wykonać listę zakupów, z którą będziesz mógł wybrać się do ulubionego sklepu, bez obaw, że zapomnisz włożyć do koszyka jakiś ważnego produktu")
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                    }   .padding()
                    Divider().padding()
                    Text("Posiadane listy zakupów: \(allLists.count)")
                        .font(.title2).fontWeight(.medium)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 10)
                        .padding(.vertical)
                } .padding(.vertical)
                Section(){
                    VStack(alignment: .leading){
                        Text("Poradnik:")
                            .font(.title3).fontWeight(.medium)
                            .padding(.bottom, 5)
                        HStack {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 8))
                            Image(systemName: "book.closed")
                            Text(" - wyświetl katalog produktów")
                        }
                        HStack {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 8))
                            Image(systemName: "house")
                            Text(" - wyświetl ekran główny")
                        }
                        
                        HStack {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 8))
                            Image(systemName: "list.bullet.rectangle.portrait")
                            Text(" - wyświetl wszystkie listy")
                        }
                        HStack {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 8))
                            Image(systemName: "cart.badge.plus")
                            Text(" - dodaj własny produkt do listy")
                        }   .padding(.bottom, 30)
                    }
                }
            }
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
