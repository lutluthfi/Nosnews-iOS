//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.

import Foundation
import RealmSwift

class RealmModule {
    static let sInstance = RealmModule()
    
    private var realm: Realm
    
    private init() {
        //self.realm = try! Realm()
        let config = Realm.Configuration(
            // Set the new schema version. This must be greater than the previously used
            // version (if you've never set a schema version before, the version is 0).
            schemaVersion: 1,
            // Set the block which will be called automatically when opening a Realm with
            // a schema version lower than the one set above
            migrationBlock: { migration, oldSchemaVersion in
                // We haven’t migrated anything yet, so oldSchemaVersion == 0
                if (oldSchemaVersion < 1) {
                    // Nothing to do!
                    // Realm will automatically detect new properties and removed properties
                    // And will update the schema on disk automatically
                }},
            deleteRealmIfMigrationNeeded: true
        )

        self.realm = try! Realm(configuration: config)
    }
    
    // MARK: - CHECK
    func check<T: Object>(objectType: T.Type, filter predicate: NSPredicate) -> Bool {
        guard ((self.realm.objects(objectType).filter(predicate).map({$0}).first) != nil) else {
            return false
        }
        return true
    }
    
    // MARK: - GET
    func get<T: Object>(objectType: T.Type) -> T {
        return self.realm.objects(objectType).first?.detached() ?? T().detached()
    }
    
    func get<T: Object>(objectType: T.Type, filter predicate: NSPredicate) -> T {
        return self.realm.objects(objectType).filter(predicate).map({$0}).first?.detached() ?? T().detached()
    }
    
    func get<T: Object>(objectType: T.Type, key: AnyObject) -> T {
        return self.realm.object(ofType: objectType, forPrimaryKey: key)?.detached() ?? T().detached()
    }
    
    func get<T: Object>(objectType: T.Type, sortBy property: String, ascending: Bool = true, limit: Int) -> [T] {
        let datas = self.realm.objects(objectType).sorted(byKeyPath: property, ascending: ascending).map({$0.detached()})
        return (0 ..< min(limit, datas.count)).map({datas[$0]})
    }
    
    func get<T: Object>(objectType: T.Type, filter predicate: NSPredicate, sortBy property: String, ascending: Bool = true, limit: Int) -> [T] {
        let datas = self.realm.objects(objectType).filter(predicate).sorted(byKeyPath: property, ascending: ascending).map({$0.detached()})
        return (0 ..< min(limit, datas.count)).map({datas[$0]})
    }
    
    // MARK: - GET ALL
    func getAll<T: Object>(objectType: T.Type) -> [T] {
        return self.realm.objects(objectType).map({$0.detached()})
    }
    
    func getAll<T: Object>(objectType: T.Type, filter predicate: NSPredicate) -> [T] {
        return self.realm.objects(objectType).filter(predicate).map({$0.detached()})
    }
    
    func getAll<T: Object>(objectType: T.Type, sortBy property: String, ascending: Bool) -> [T] {
        return self.realm.objects(objectType).sorted(byKeyPath: property).map({$0.detached()})
    }
    
    func getAll<T: Object>(objectType: T.Type, filter predicate: NSPredicate, sortBy property: String, ascending: Bool = true) -> [T] {
        return self.realm.objects(objectType).filter(predicate).sorted(byKeyPath: property, ascending: ascending).map({$0.detached()})
    }
    
    func getAll<T: Object>(objectType: T.Type, sortBy property: [SortDescriptor]) -> [T] {
        return self.realm.objects(objectType).sorted(by: property).map({$0.detached()})
    }
    
    func getAll<T: Object>(objectType: T.Type, filter predicate: NSPredicate, sortBy property: [SortDescriptor]) -> [T] {
        return self.realm.objects(objectType).filter(predicate).sorted(by: property).map({$0.detached()})
    }
    
    // MARK: ADD
    func add(object: Object, update: Bool = true) {
        let update_: Realm.UpdatePolicy = update ? .all : .error
        do {
            try self.realm.write({
                self.realm.add(object, update: update_)
            })
            
        } catch _ as NSError {
            return
        }
    }
    
    func add(object: Object, update: Bool = true, completion: @escaping(Bool) -> Void) {
        let update_: Realm.UpdatePolicy = update ? .all : .error
        do {
            try self.realm.write {
                self.realm.add(object, update: update_)
            }
            completion(true)
        } catch _ as NSError {
            completion(false)
            return
        }
    }
    
    // MARK: - ADD ALL
    func addAll(objects: [Object], update: Bool = true) {
        let update_: Realm.UpdatePolicy = update ? .all : .error
        do {
            try self.realm.write({
                self.realm.add(objects, update: update_)
            })
            
        } catch let error as NSError {
            print("RealmModule: addAll objects -> \(error.localizedDescription)")
            return
        }
    }
    
    // MARK: - REMOVE
    func remove(object: Object) {
        do {
            try self.realm.write({
                self.realm.delete(object)
            })
            
        } catch let error as NSError {
            print("RealmModule: remove objects -> \(error.localizedDescription)")
            return
        }
    }
    
    func remove(objects: [Object]) -> Bool {
        do {
            try self.realm.write({
                self.realm.delete(objects)
            })
            
            return true
            
        } catch _ as NSError {
            return false
        }
    }
    
    // MARK: - REMOVE ALL
    func removeAll<T: Object>(in objectType: T.Type) {
        do {
            try self.realm.write({
                self.realm.delete(realm.objects(objectType))
            })
            
        } catch _ as NSError {
            return
        }
    }
    
    func removeAll<T: Object>(in objectType: T.Type, filter predicate: String) {
        do {
            try self.realm.write({
                self.realm.delete(realm.objects(objectType))
            })
            
        } catch _ as NSError {
            return
        }
    }
    
    // MARK: - WRITE
    func write(writeBlock: (Realm) -> Void) -> Bool {
        do {
            try realm.write({
                writeBlock(realm)
            })
            
            return true
            
        } catch _ as NSError {
            return false
        }
    }
}

