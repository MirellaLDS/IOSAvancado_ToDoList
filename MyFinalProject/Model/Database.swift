import Foundation

class Database {
    
    static let shared = Database()
    
    public init(){}
    
    func insert(add value: MemberModel) {
        
        var storage = list()
        storage.insert(value, at: 0)
        encodding(storage)
    }
    
    
    func update(add value: MemberModel,_ index: Int){
        var storage = list()
        storage[index] = value
        encodding(storage)
        
    }
    
    func setValue(_ listAluno: Array<MemberModel>){
        encodding(listAluno)
    }
   
    func delete(add index: Int) {
        var storage = list()
        storage.remove(at: index)
        setValue(storage)
    }
    
    func deleteAll(){
        let storage : Array<MemberModel> = []
        setValue(storage)
    }
    
    func list() -> Array<MemberModel>{
        
        return decode()
    }
    
    
    static func instance() -> Database {
        return self.shared
    }
    
    func encodding(_ membros: [MemberModel]) {
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: membros)
        let userDefaults = UserDefaults.standard
        userDefaults.set(encodedData, forKey: "base64")
     
    }
    
    func decode() -> [MemberModel] {
        if let decoded = UserDefaults.standard.object(forKey:"base64") as? Data {
            let decodedTeams = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [MemberModel]
            return decodedTeams
        }
        return []
    }
}
