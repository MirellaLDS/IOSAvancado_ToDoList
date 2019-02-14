import Foundation

class DatabaseOnboarding {
    
    static let shared = DatabaseOnboarding()
    
    public init(){}
    
    func insert(add value: String) {
        
        var storage = list()
        storage.insert(value, at: 0)
        encodding(storage)
    }
    
    
    func update(add value: String,_ index: Int){
        var storage = list()
        storage[index] = value
        encodding(storage)
        
    }
    
    func setValue(_ list: Array<String>){
        encodding(list)
    }
    
    func delete(add index: Int) {
        var storage = list()
        storage.remove(at: index)
        setValue(storage)
    }
    
    func deleteAll(){
        let storage : Array<String> = []
        setValue(storage)
    }
    
    func list() -> Array<String>{
        
        return decode()
    }
    
    
    static func instance() -> DatabaseOnboarding {
        return self.shared
    }
    
    func encodding(_ membros: [String]) {
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: membros)
        let userDefaults = UserDefaults.standard
        userDefaults.set(encodedData, forKey: "onboarding")
        
    }
    
    func decode() -> [String] {
        if let decoded = UserDefaults.standard.object(forKey:"onboarding") as? Data {
            let decodedTeams = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [String]
            return decodedTeams
        }
        return []
    }
}
