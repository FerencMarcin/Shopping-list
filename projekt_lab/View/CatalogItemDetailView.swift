//
//  CatalogItemDetailView.swift
//  projekt_lab
//
//  Created by MarcinMB on 13/05/2022.
//

import SwiftUI
import Foundation

struct CatalogItemDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: ShopingList.entity(),
                  sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]
    ) var allLists: FetchedResults<ShopingList>
    
    var item: CatalogItem
    
    @State private var showAlert: Bool = false
    
    @State private var itemAmountStr: String = ""
    @State private var itemDesc: String = ""
    @State private var selectedList: ShopingList?
    @State private var activeListCount: Int = 0
    
    private func isAnyActiveList() -> Bool {
        for list in allLists {
            if(!list.isCompleted){
                return true;
            }
        }
        return false;
    }
    
    private func addItemToList() {
        let newItem = Item(context: viewContext)
        newItem.name = item.name
        newItem.itemDescription = itemDesc
        newItem.isPacked = item.isPacked
        newItem.createdAt = Date()
        newItem.isPurchased = false
        newItem.amount = Double(itemAmountStr)!
        newItem.toList = selectedList
        
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
        itemDesc = ""
        itemAmountStr = ""
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(alignment: .center, spacing: 20) {
                    CatalogItemHeaderView(item: item).padding(.bottom)
                    LazyVStack(alignment: .leading, spacing: 20) {
                        Text(item.name)
                            .font(.largeTitle).fontWeight(.heavy)
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        
                        Text(item.descritpion)
                            .font(.headline)
                            .frame(width: 350)
                            .multilineTextAlignment(.leading)

                        Text("Dodaj do listy produkt: \(item.name)".uppercased())
                            .fontWeight(.bold)
                            .padding(.horizontal)
                            .frame(width: 350, height: 60)
                            .foregroundColor(.blue)
                    }   .padding(.horizontal, 20)
                        .frame(maxWidth: 640, alignment: .center)
                    Divider()
                    Text("Wybierz listę zakupów: ")
                        .fontWeight(.semibold)
                    if(isAnyActiveList()){
                        Picker(selection: $selectedList, label: Text("Wybierz listę zakupów")) {
                            ForEach(allLists, id: \.self) { (list:ShopingList) in
                                if(!list.isCompleted){
                                    Text(list.name!).tag(list as ShopingList?)
                                }
                            }
                        }
                    } else {
                        Text("Nie posiadasz żadnej aktywnej listy zakupów")
                    }
                    Text("Uzupełnij dane o produkcie:")
                        .fontWeight(.semibold)
                    Group {
                        TextField(item.isPacked ? "Podaj ilość (w sztukach)" : "Podaj ilość (w kg)", text: $itemAmountStr)
                        TextField("Opis do tej pozycji", text: $itemDesc)
                    }
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 300)
                    Button(action: {
                        if(itemAmountStr.isEmpty || Double(itemAmountStr) == nil || selectedList == nil || Double(itemAmountStr)! <= 0) {
                            showAlert = true
                        } else {
                            addItemToList()
                        }
                    }, label: {
                        Text("Dodaj do listy!")
                            .padding(10)
                            .padding(.horizontal, 50)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .font(.title3)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            
                    }
                    )
                }   .navigationBarTitle("", displayMode: .inline)
                    .alert("Wybierz listę ponownie lub podaj poprawną ilość", isPresented: $showAlert) {
                        Button("OK", role: .cancel) { }
                    }
                    .navigationBarItems(leading:
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "arrow.left.circle")
                            Text("Wróć")
                                .padding(.horizontal)
                        }   .frame(width: 150, height: 40)
                            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 30))
                            .shadow(color: .black.opacity(0.2), radius: 4)
                            .padding(.bottom)
                    }
                    )
            }   .edgesIgnoringSafeArea(.top)
        }
    }
}

struct CatalogItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogItemDetailView(item: catalogItems_fruits[10])
    }
}
