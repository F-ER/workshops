//
//  Noty+CoreDataProperties.swift
//  SwiftUICode
//
//  Created by Abdullah Alhaider on 15/02/2020.
//  Copyright © 2020 Abdullah Alhaider. All rights reserved.
//
//

import Foundation
import CoreData


extension Noty {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Noty> {
        return NSFetchRequest<Noty>(entityName: "Noty")
    }

    @NSManaged public var isImportent: Bool
    @NSManaged public var text: String

}
