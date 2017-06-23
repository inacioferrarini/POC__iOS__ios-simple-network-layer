//
//  FixerApi.swift
//  SimpleNetworkLayer
//
//  Created by Inacio Ferrarini on 23/06/17.
//  Copyright © 2017 com.inacioferrarini. All rights reserved.
//

import UIKit

class FixerApi: AppBaseApi {

    func all(completionBlock: @escaping ((Rates?) -> Void),
             errorHandlerBlock: @escaping ((Error) -> Void)) {
        
        let targetUrl = "/latest"
        let transformer = AnyObjectToRateTransformer()
        super.get(targetUrl,
                  responseTransformer: transformer,
                  completionBlock: completionBlock,
                  errorHandlerBlock: errorHandlerBlock,
                  retryAttempts: 30)
    }
    
    func byCurrency(_ currency: String,
                    completionBlock: @escaping ((Rates?) -> Void),
                    errorHandlerBlock: @escaping ((Error) -> Void)) {
        let targetUrl = "/latest?base=:baseCurrency"
            .replacingOccurrences(of: ":baseCurrency", with: currency)
        let transformer = AnyObjectToRateTransformer()
        super.get(targetUrl,
                  responseTransformer: transformer,
                  completionBlock: completionBlock,
                  errorHandlerBlock: errorHandlerBlock,
                  retryAttempts: 30)
    }
    
}
