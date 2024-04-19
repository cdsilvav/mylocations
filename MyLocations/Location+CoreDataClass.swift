//
//  Location+CoreDataClass.swift
//  MyLocations
//
//  Created by Claudia Dalila Silva Valencia on 8/03/24.
//
//

import Foundation
import CoreData
import MapKit


@objc(Location)
public class Location: NSManagedObject, MKAnnotation {
    var hasPhoto: Bool {
        return photoID != nil
    }
    
    class func nextPhotoID() -> Int {
      let userDefaults = UserDefaults.standard
      let currentID = userDefaults.integer(forKey: "PhotoID") + 1
      userDefaults.set(currentID, forKey: "PhotoID")
      return currentID
    }
    
    var photoImage : UIImage? {
        return UIImage(contentsOfFile: photoURL.path)
    }
    
    var photoURL: URL {
        assert(photoID != nil, "No photo ID set")
        let filename = "Photo-\(photoID!.intValue).jpg"
        return
        applicationDocumentsDirectory.appendingPathComponent(filename)
    }
    
    public var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(latitude, longitude)
    }
    
    public var title: String? {
        if locationDescription.isEmpty {
            return "(No Description)"
        } else {
            return locationDescription
        }
    }
    
    public var subtitle: String? {
        return category
    }
    
    func removePhotoFile() {
        if hasPhoto {
            do {
                try FileManager.default.removeItem(at: photoURL)
            } catch {
                print("Error removing file: \(error)")
            }
        }
    }
}


    

