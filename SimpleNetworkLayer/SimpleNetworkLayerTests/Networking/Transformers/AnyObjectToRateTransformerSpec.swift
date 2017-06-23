//
//  AnyObjectToRateTransformerSpec.swift
//  SimpleNetworkLayer
//
//  Created by Inacio Ferrarini on 23/06/17.
//  Copyright © 2017 com.inacioferrarini. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import SimpleNetworkLayer

class AnyObjectToRateTransformerSpec: QuickSpec {

    override func spec() {
        
        describe("Rates Transformer") {
            
            let transformer = AnyObjectToRateTransformer()
            
            it("must parse Rates data") {
                guard let fixtureData = FixtureHelper().objectFixture(using: "ValidRatesFixture") else { fail("null fixture data"); return }
                
                guard let parsedRates = transformer.transform(fixtureData) else { fail("returned nil object"); return }
                expect(parsedRates).toNot(beNil())

                expect(parsedRates.base) == "EUR"
                expect(parsedRates.date) == "2017-06-23"
                expect(parsedRates.rates.count) == 2
                expect(parsedRates.rates["AUD"]) == 1.4764
                expect(parsedRates.rates["BGN"]) == 1.9558
            }
            
            it("must parse Rates having empty data") {
                guard let fixtureData = FixtureHelper().objectFixture(using: "ValidEmptyRatesFixture") else { fail("null fixture data"); return }
                
                guard let parsedRates = transformer.transform(fixtureData) else { fail("returned nil object"); return }

                expect(parsedRates.base) == ""
                expect(parsedRates.date) == ""
                expect(parsedRates.rates.count) == 0
            }
        }
    }
    
}
