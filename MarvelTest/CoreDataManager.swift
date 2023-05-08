//
//  CoreDataManager.swift
//  MarvelTest
//
//  Created by Ultimo Alves on 05/05/23.
//

import CoreData

internal struct CoreDataManager {
    
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Marvel")
        container.loadPersistentStores {(storeDescription, error) in
            if let error = error {
                fatalError("Error: \(error)")
            }
        }
        return container
        
    }()
    
    func createUser() {
        let context = persistentContainer.viewContext
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context) as! User
        user.email = "teste@email.com"
        user.password = "senha123"
        
        do {
            try context.save()
        } catch {
            print("error")
        }
    }
    
    func verifyIfExistsUser() -> Bool {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<User>(entityName: "User")
        
        do {
            let user = try context.fetch(fetchRequest)
            if user.count > 0 {
                return true
            } else {
                return false
            }
            
        } catch {
            print("Error")
        }
        
        return false
    }
    
    func aunthenticate(email: String, password: String) -> Bool{
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<User>(entityName: "User")
        
        do {
            let users = try context.fetch(fetchRequest)
            for user in users {
                if (user.email == email && user.password == password) {
                    return true
                }
            }
        } catch {
            print("Error")
        }
        
        return false
    }
    
    func getUser() -> [User]? {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<User>(entityName: "User")
        
        do {
            let users = try context.fetch(fetchRequest)
            return users
        } catch {
            print("Error")
        }
        
        return nil
    }
    
}
