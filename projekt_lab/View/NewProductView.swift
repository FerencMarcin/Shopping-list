//
//  NewProductView.swift
//  projekt_lab
//
//  Created by MarcinMB on 15/05/2022.
//

import SwiftUI

struct NewProductView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: ShopingList.entity(),
                  sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]
    ) var allLists: FetchedResults<ShopingList>
    
    @State private var itemName: String = ""
    @State private var itemAmountStr: String = ""
    @State private var itemDesc: String = ""
    @State private var selectedList: ShopingList?
    @State private var activeListCount: Int = 0
    @State private var isPacked = 1
    
    @State private var showAlert: Bool = false
    
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
        newItem.name = itemName
        newItem.itemDescription = itemDesc
        if(isPacked == 1){
            newItem.isPacked = true
        } else {
            newItem.isPacked = false
        }
        newItem.createdAt = Date()
        newItem.isPurchased = false
        newItem.amount = Double(itemAmountStr)!
        newItem.toList = selectedList
        
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
        itemName = ""
        itemDesc = ""
        itemAmountStr = ""
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Wybierz listę zakupów:")
                    .font(.title3).fontWeight(.semibold)
                    .padding()
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
                Divider()
                Group {
                    Text("Podaj dane nowego produktu:")
                        .font(.title3).fontWeight(.semibold)
                        .padding()

                    TextField("Nazwa produktu", text: $itemName)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 300)
                    TextField(isPacked==1 ? "Podaj ilość (w sztukach)" : "Podaj ilość (w kg)", text: $itemAmountStr)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 300)
                    TextField("Opis", text: $itemDesc)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 300)
                    Divider()
                    Text("Wybierz rodzaj jednostki:")
                    Picker(selection: $isPacked, label: Text("Jednostka")) {
                        Text("Sztuki").tag(1)
                        Text("Kilogramy").tag(2)
                    }
                    Divider()
                }
                Button(action: {
                    if(itemName.isEmpty || Double(itemAmountStr) == nil || selectedList == nil || Double(itemAmountStr)! <= 0) {
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
                    .alert("Wybierz listę ponownie lub podaj poprawną ilość oraz nazwę", isPresented: $showAlert) {
                        Button("OK", role: .cancel) { }
                    }
                Spacer()
            }   .frame(maxWidth: .infinity, alignment: .center)
                .navigationTitle("Nowy produkt do listy")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NewProductView_Previews: PreviewProvider {
    static var previews: some View {
        NewProductView()
    }
}
