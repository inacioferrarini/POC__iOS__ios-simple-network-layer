//
//  CurrencyRatesApiClient.swift
//  SimpleNetworkLayer
//
//  Created by Inacio Ferrarini on 23/06/17.
//  Copyright © 2017 com.inacioferrarini. All rights reserved.
//

import UIKit

class FinancialApiClient: ApiClient {
    
    
    // MARK: - Initialization
    
    let rootUrl = "https://api.fixer.io"
    
    
    // MARK: - Properties
    
    public lazy var rates: FixerApi = {
        [unowned self] in
        return FixerApi(self)
    }()
    
}
