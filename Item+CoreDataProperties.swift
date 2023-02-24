//
//  Item+CoreDataProperties.swift
//  projekt_lab
//
//  Created by MarcinMB on 18/05/2022.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var name: String?
    @NSManaged public var itemDescription: String?
    @NSManaged public var isPacked: Bool
    @NSManaged public var amount: Double
    @NSManaged public var isPurchased: Bool
    @NSManaged public var toList: ShopingList?

}

extension Item : Identifiable {

}
