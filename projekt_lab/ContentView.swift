//
//  ContentView.swift
//  projekt_lab
//
//  Created by MarcinMB on 13/05/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 2
    @State private var showView = false
    
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        TabView(selection: $selection) {
            ZStack {
                ProgressView("Ładowanie...")
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .padding()
                    .onAppear(perform: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            showView=true
                        }
                    })
                if (showView) {
                    CatalogView()
                }
            }   .tabItem() {
                    Image(systemName: "book.closed")
                    Text("Katalog produktów")
                }
                .tag(1)
            HomeScreenView()
                .tabItem() {
                    Image(systemName: "house")
                    Text("Ekran główny")
                }
                .tag(2)
            ListsView()
                .tabItem() {
                    Image(systemName: "list.bullet.rectangle.portrait")
                    Text("Moje listy")
                }
                .tag(3)
            NewProductView()
                .tabItem() {
                    Image(systemName: "cart.badge.plus")
                    Text("Dodaj produkt")
                }
                .tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
