//
//  NetWorkManager.swift
//  Rampage
//
//  Created by lapstore on 7/27/18.
//  Copyright © 2018 AmrSobhy. All rights reserved.
//

import Foundation

class NetworkManager {
    static func getData(url: String, complete: @escaping (_: [String:Any])->()){
        
        let url = URL(string: url)
        
        print("========>",url?.absoluteString)
        URLSession.shared.dataTask(with:url!) { (data, response, error) in
            if error != nil {
                print(error as Any)
            } else {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!) as? [String:Any]{
                        DispatchQueue.main.async {
                            print("json%%%%%%%",json)

                            complete(json)

                            
                            
                        }

                    }
                    
                } catch let error as NSError {
                    print(error)
                }
            }
            }.resume()
    }
}
