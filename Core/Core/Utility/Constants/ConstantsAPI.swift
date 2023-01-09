//
//  ConstantsAPI.swift
//  MovieX
//
//  Created by Raden Dimas on 10/12/22.
//

import Foundation

public struct ConstantAPI {
    static let sharedIntance: ConstantAPI = ConstantAPI()
    static var apiKeyFromPlist: String {
        guard let filePath = Bundle.main.path(forResource: "API_KEY", ofType: "plist") else {
            fatalError("Couldn't find file 'API_KEY.plist'.")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "MOVIE_DB_APIKEY") as? String else {
            fatalError("Couldn't find key 'RAWG-APIKEY' in 'API_KEY.plist'.")
        }
        return value
    }
}
