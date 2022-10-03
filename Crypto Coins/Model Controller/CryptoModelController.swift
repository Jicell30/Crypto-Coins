//
//  CryptoModelController.swift
//  Crypto Coins
//
//  Created by Jicell on 10/3/22.
//

import Foundation

class CryptoController {
    //MARK: - SOT
   static var coins: [Coin] = []
    init() {
        
    }
    
   //MARK: - CRUD
    
    //Private and static function that will not change
    
    private static let baseURLString: String? = "https://api.coingecko.com/"
    
    private static var keyCoinsComponent = "api/v3/coins/"
    
    private static let keyListComponent = "list"
    
    //private static let finalURL = baseURLString + keyCoinsComponent + keyListComponent

    // Create func
    static func fetchCoins(completion: @escaping (Bool) -> Void) {
        
        guard let baseURL = baseURLString  else { return completion(false) }
        
        let coinsURL = baseURL + keyCoinsComponent
        let finalURL = coinsURL + keyListComponent
        
        print(finalURL)
        
    }
    
    
    
    
    
    
    
}// End of class.
