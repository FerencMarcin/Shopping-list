//
//  ListsView.swift
//  projekt_lab
//
//  Created by MarcinMB on 15/05/2022.
//

import SwiftUI
import Foundation

struct ListsView: View {
    
    @State private var listName: String = ""
    @State private var listDesc: String = ""
    @State private var listTime = Date()
    @State private var showAlert: Bool = false
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: ShopingList.entity(),
                  sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]
    ) var allLists: FetchedResults<ShopingList>

    private func addList() {
        let newList = ShopingList(context: viewContext)
        newList.name = listName
        newList.listDescription = listDesc
        newList.shopingDate = listTime
        newList.createdAt = Date()
        newList.isCompleted = false
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        listName = ""
        listDesc = ""
        listTime = Date()
    }
    
    public func getLists() -> FetchedResults<ShopingList> {
        return allLists
    }
    
    private func removeList(at offsets: IndexSet) {
        for index in offsets {
            let list = allLists[index]
            viewContext.delete(list)
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    private func displayAllLists() -> some View {
        List {
            if (allLists.isEmpty) {
                Text("Rozpocznij od dodania nowej listy zakupów")
            } else {
                ForEach(allLists, id: \.self) {list in
                    NavigationLink(destination: ListDetailView(list: list), label: {
                        HStack {
                            Text(list.name!)
                            Text(" - ")
                            Text(list.shopingDate!, style: .date)
                            Spacer()
                            if(list.isCompleted){
                                Image(systemName: "checkmark.circle.fill")
                            }
                        }
                    })
                }
                .onDelete(perform: removeList)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                displayAllLists()
                    .navigationTitle("Twoje Listy")
                    .navigationBarTitleDisplayMode(.inline)
                Divider()
                Text("Podaj dane nowej listy:")
                    .fontWeight(.semibold)
                TextField("Nazwa listy", text: $listName)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 300)
                TextField("Opis listy", text: $listDesc)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 300)
                Divider()
                Text("Wybierz datę zakupów:")
                DatePicker(selection: $listTime, in: Date()..., displayedComponents: .date) {
                    Text("Wybierz date zakupów:")
                }.textFieldStyle(.roundedBorder)
                    .frame(width: 300)
                Divider()
                Button(action: {
                    if(listName.isEmpty) {
                        showAlert = true
                    } else {
                        addList()
                    }
                }){
                    Text("Dodaj nową liste")
                        .padding(5)
                        .padding(.horizontal, 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .font(.title3)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding()
                }
                .alert("Musisz podać nazwę nowej listy", isPresented: $showAlert) {
                    Button("OK", role: .cancel) { }
                }
                
            }
        }
    }
}

struct ListsView_Previews: PreviewProvider {
    static var previews: some View {
        ListsView()
    }
}
