//
//  Users+CoreDataProperties.swift
//  
//
//  Created by Patrick Löber on 06.08.18.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var age: Int16
    @NSManaged public var password: String?
    @NSManaged public var username: String?

}
