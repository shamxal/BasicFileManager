//
//  FileManagerHelper.swift
//  UserFileManagerApp
//
//  Created by Shamkhal Guliyev on 16.07.22.
//

import Foundation

class FileManagerHelper {
    static let shared = FileManagerHelper()
    
    var users = [User]()
    
    //Get documents path
    func getDocumentPath() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        return documentDirectory
    }
    
    //Create json file path
    func getJsonFilePath() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        return documentDirectory.appendingPathComponent("Users.json")
    }
    
    //Read from json file
    func readJsonFile() {
        if let data = try? Data(contentsOf: getJsonFilePath()) {
            do {
                users = try JSONDecoder().decode([User].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("no file")
        }
    }
    
    //Write to json file
    func writeToJsonFile(complete: ()->()) {
        do {
            let data = try JSONEncoder().encode(users)
            try data.write(to: getJsonFilePath())
            complete()
        } catch {
            print(error.localizedDescription)
        }
    }
}
