//
//  AnyObjectToRateTransformer.swift
//  SimpleNetworkLayer
//
//  Created by Inacio Ferrarini on 23/06/17.
//  Copyright © 2017 com.inacioferrarini. All rights reserved.
//

import UIKit

class AnyObjectToRateTransformer: Transformer {
    
    func transform(_ input: AnyObject?) -> Rates? {
        
        guard let dict = input as? [String : AnyObject] else { return nil }
        
        let base = dict["base"] as? String ?? ""
        let date = dict["date"] as? String ?? ""
        let rates = dict["rates"] as? [String : Double] ?? [:]
        
        return Rates(base: base,
                     date: date,
                     rates: rates)
    }

}
