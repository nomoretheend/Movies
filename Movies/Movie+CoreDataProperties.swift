//
//  Movie+CoreDataProperties.swift
//  
//
//  Created by never on 3/11/2561 BE.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var id: Int64
    @NSManaged public var title_en: String?
    @NSManaged public var synopsis_en: String?
    @NSManaged public var poster_ori: String?

}
