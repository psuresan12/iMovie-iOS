//
//  FavoriteMovie+CoreDataProperties.swift
//  
//
//  Created by pratap surendran ganesan on 8/10/17.
//
//

import Foundation
import CoreData


extension FavoriteMovie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteMovie> {
        return NSFetchRequest<FavoriteMovie>(entityName: "FavoriteMovie")
    }

    @NSManaged public var id: Int16
    @NSManaged public var imageName: String?
    @NSManaged public var overview: String?
    @NSManaged public var rating: Double?
    @NSManaged public var trailorID: String?
    @NSManaged public var moviepoints: MoviePoints?

}
