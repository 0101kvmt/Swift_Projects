//
//  BucketListItem+CoreDataProperties.swift
//  bucket
//
//  Created by Kevin M Tran on 1/30/17.
//  Copyright © 2017 Kevin M Tran. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension BucketListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BucketListItem> {
        return NSFetchRequest<BucketListItem>(entityName: "BucketListItem");
    }

    @NSManaged public var text: String?

}
