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
        
        let dataTask = URLSession.shared.dataTask(with: finalURL) { coinData, _, error in
            guard let error = error else {completion(false); return }
            guard let data = coinData else {completion(false); return }
            
            do {
                if let topLevelArrayOfCoinDictionaries = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.fragmentsAllowed) as? [[String:String]] {
                    for coinDictionary in topLevelArrayOfCoinDictionaries {
                        if let id = coinDictionary.id, let symbol = coinDictionary.symbol, let name = coinDictionary.name {
                            let parcedCoin = Coin(id: id, symbol: symbol, name: name)
                            coins.append(parcedCoin)
                        }
                    }
                    
              }
                completion(true)
            } catch {
                print("Error in Do/Try/Catch \(error.localizedDescription)")
                completion(false)
            }
            
            
            
            
        }.resume()
        
        //dataTask(with: URL, completionHandler: (Data?, URLResponse?, Error?) -> Void)
    }
    
    
    
}// End of class.
