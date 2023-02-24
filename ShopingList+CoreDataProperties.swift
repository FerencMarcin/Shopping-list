//
//  ShopingList+CoreDataProperties.swift
//  projekt_lab
//
//  Created by MarcinMB on 18/05/2022.
//
//

import Foundation
import CoreData


extension ShopingList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ShopingList> {
        return NSFetchRequest<ShopingList>(entityName: "ShopingList")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var name: String?
    @NSManaged public var listDescription: String?
    @NSManaged public var shopingDate: Date?
    @NSManaged public var isCompleted: Bool
    @NSManaged public var toBuy: NSSet?

    public var itemArray: [Item] {
        let set = toBuy as? Set<Item> ?? []
        return set.sorted{
            $0.name! < $1.name!
        }
    }
}

// MARK: Generated accessors for toBuy
extension ShopingList {

    @objc(addToBuyObject:)
    @NSManaged public func addToToBuy(_ value: Item)

    @objc(removeToBuyObject:)
    @NSManaged public func removeFromToBuy(_ value: Item)

    @objc(addToBuy:)
    @NSManaged public func addToToBuy(_ values: NSSet)

    @objc(removeToBuy:)
    @NSManaged public func removeFromToBuy(_ values: NSSet)

}

extension ShopingList : Identifiable {

}
