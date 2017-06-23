//
//  Transformer.swift
//  SimpleNetworkLayer
//
//  Created by Inacio Ferrarini on 23/06/17.
//  Copyright © 2017 com.inacioferrarini. All rights reserved.
//

import Foundation

public protocol Transformer {
    
    associatedtype T
    associatedtype U
    
    func transform(_ input: T) -> U
    
}
