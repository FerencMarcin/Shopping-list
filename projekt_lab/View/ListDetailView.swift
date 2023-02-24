//
//  ListDetailView.swift
//  projekt_lab
//
//  Created by MarcinMB on 16/05/2022.
//

import SwiftUI
import Foundation

struct ListDetailView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: ShopingList.entity(),
                  sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]
    ) var allLists: FetchedResults<ShopingList>
    
    var list: FetchedResults<ShopingList>.Element
    @State var refresh: Bool = false
    
    private func EditListComplition(_ list: ShopingList) {
        list.isCompleted = !list.isCompleted
        
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func howManyToBuy (_ list: ShopingList) -> Int {
        var purchased: Int = 0
        for it in list.itemArray {
            if(it.isPurchased) {
                purchased += 1
            }
        }
        return purchased;
    }
    
    private func deleteItemFromList(at offsets: IndexSet, from list: ShopingList) {
        for offset in offsets.sorted().reversed() {
            let itemToDel = list.itemArray[offset]
            list.removeFromToBuy(itemToDel)
            viewContext.delete(itemToDel)
            
            do {
                try viewContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func updateItem (_ item: Item) {
        item.isPurchased.toggle()
        refresh.toggle()
        
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Divider()
                Text("O liście:")
                    .fontWeight(.bold)
                    .padding(.horizontal)
                Text(list.listDescription! == "" ? "Brak opisu" : list.listDescription!)
                    .padding(.horizontal)
                Text("Zakupione produkty: \(howManyToBuy(list))/\(list.itemArray.count)")
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .padding(.top, 1)
                Text("Data zakupów: \(list.shopingDate!.formatted(date: .long, time: .omitted))")
                    .padding()
                Divider()
                HStack {
                    Spacer()
                    if(list.isCompleted) {
                        Text("Zakończona")
                            .font(.title)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                    }
                    Spacer()
                }
                HStack {
                    Spacer()
                Button(action: {
                    EditListComplition(list)
                }, label: {
                    Text(list.isCompleted ? "Oznacz jako niezakończona" : "Oznacz jako zakończona")
                        .padding(5)
                        .padding(.horizontal)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                })
                    Spacer()
                }
                List {
                    if(list.itemArray.count == 0) {
                        VStack {
                            Text("Ta lista jest pusta")
                        }
                    } else {
                        ForEach(list.itemArray, id: \.self) { toBuyItem in
                            HStack {
                                Text(toBuyItem.name! + ": \(toBuyItem.amount)" + (toBuyItem.isPacked ? " sztuk" : " kg"))
                                    .contextMenu {
                                        Text(toBuyItem.itemDescription!)
                                    }
                                Spacer()
                                if(toBuyItem.isPurchased) {
                                    Image(systemName: "checkmark.circle")
                                }
                                Image(systemName: toBuyItem.isPurchased ? "cart.fill" : "cart")
                                    .foregroundColor(.green)
                                    .background(Color.clear.disabled(refresh))
                                    .onTapGesture {
                                        if(!list.isCompleted) {
                                            updateItem(toBuyItem)
                                        }
                                    }
                                    .padding(.horizontal)
                            }
                        }
                        .onDelete(perform: {offsets in
                            deleteItemFromList(at: offsets, from: list)
                        })
                    }
                }
                .navigationTitle(list.name!)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
}

