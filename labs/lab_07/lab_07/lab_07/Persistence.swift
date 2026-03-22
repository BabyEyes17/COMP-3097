//
//  Persistence.swift
//  lab_07
//
//  Created by Tech on 2026-03-17.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            
            
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "lab_07")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        
        seedCourses(context: self.container.viewContext)
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    
    
    private func seedCourses(context: NSManagedObjectContext) {
        
        let request: NSFetchRequest<Course> = Course.fetchRequest()
        
        do {
            
            let count = try context.count(for: request)
            
            if count == 0 {
                
                let courseNames = [
                
                    "Math",
                    "Chemistry",
                    "Biology",
                    "History",
                    "Comp Science"
                ]
                
                for name in courseNames {
                    
                    let course = Course(context: context)
                    course.id = UUID()
                    course.title = name
                }
                
                try? context.save()
            }
        }
        
        catch {
            
            print("\(error)")
        }
    }
}
