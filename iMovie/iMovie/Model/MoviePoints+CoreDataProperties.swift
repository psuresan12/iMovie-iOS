//
//  MoviePoints+CoreDataProperties.swift
//  
//
//  Created by pratap surendran ganesan on 8/10/17.
//
//

import Foundation
import CoreData


extension MoviePoints {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MoviePoints> {
        return NSFetchRequest<MoviePoints>(entityName: "MoviePoints")
    }

    @NSManaged public var name: String?
    @NSManaged public var reward: Int16
    @NSManaged public var detail: FavoriteMovie?

}
