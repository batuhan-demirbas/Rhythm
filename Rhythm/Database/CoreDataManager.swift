//
//  DatabaseController.swift
//  Rhythm
//
//  Created by Batuhan on 11.05.2023.
//

import CoreData
import Foundation
import UIKit

class CoreDataManager {
    static let shared = CoreDataManager()

    private var appDelegate: AppDelegate
    private var context: NSManagedObjectContext

    private init() {
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
    }
    
    func saveFavorite(id: Int, name: String, image: String, link: String, duration: Int) {
        let newFavorite = NSEntityDescription.insertNewObject(forEntityName: "Favorites", into: context) as! Favorites
        newFavorite.id = Int64(id)
        newFavorite.name = name
        newFavorite.image = image
        newFavorite.link = link
        newFavorite.duration = Int16(duration)

        do {
            try context.save()
        } catch {
            print("Bir hata oluştu: \(error)")
        }
    }

    func fetchFavorites() -> [Favorites] {
        let fetchRequest = NSFetchRequest<Favorites>(entityName: "Favorites")
        do {
            let favorites = try context.fetch(fetchRequest)
            return favorites
        } catch {
            print("Bir hata oluştu: \(error)")
            return []
        }
    }

    func deleteFavorite(favorite: Favorites) {
        context.delete(favorite)
        do {
            try context.save()
        } catch {
            print("Bir hata oluştu: \(error)")
        }
    }
}
