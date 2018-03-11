//
//  FMovie+CoreDataProperties.swift
//  
//
//  Created by never on 3/11/2561 BE.
//
//

import Foundation
import CoreData


extension FMovie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FMovie> {
        return NSFetchRequest<FMovie>(entityName: "FMovie")
    }

    @NSManaged public var id: Int64
    @NSManaged public var title_en: String?
    @NSManaged public var synopsis_en: String?
    @NSManaged public var poster_ori: String?

}
