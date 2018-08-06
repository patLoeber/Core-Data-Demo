//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Patrick Löber on 20.05.18.
//  Copyright © 2018 Patrick Loeber. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        /*
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        newUser.setValue("Kirsten", forKey: "username")
        newUser.setValue("myPass", forKey: "password")
        newUser.setValue(29, forKey: "age")
        
        do {
            
            try context.save()
            print("saved")
        } catch {
            print("save error")
        }
         */
        
        // restore it:
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        
        request.predicate = NSPredicate(format: "username = %@", "Kirsten") // searches database, returns only this when found
        //request.predicate = NSPredicate(format: "age < %@", "10") 
        
        do {
        
            let results = try context.fetch(request)
            
            if results.count > 0
            {
                for result in results as! [NSManagedObject] {
                    
                    if let username = result.value(forKey: "username") as? String {
                        print(username)
                        result.setValue("Cirsten", forKey: "username") //update Kirstens name
                        do {
                            try context.save()
                        } catch {
                        }
                        //context.delete(result) // delete it
                    }
                }
            } else {
                print("no results")
            }
        } catch {
            print("couldt restore")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

