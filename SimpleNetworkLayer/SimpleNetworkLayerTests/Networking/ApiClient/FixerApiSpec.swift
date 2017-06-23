//
//  FixerApiSpec.swift
//  SimpleNetworkLayer
//
//  Created by Inacio Ferrarini on 23/06/17.
//  Copyright © 2017 com.inacioferrarini. All rights reserved.
//

import Foundation
import Quick
import Nimble
import OHHTTPStubs
@testable import SimpleNetworkLayer

class FixerApiSpec: QuickSpec {
    
    override func spec() {
        
        describe("all Api Request") {
            
            it("if request succeeds, must return valid object") {
                
                stub(condition: isHost("api.fixer.io")) { request in
                    let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.cfurlErrorNotConnectedToInternet.rawValue), userInfo:nil)
                    let error = OHHTTPStubsResponse(error:notConnectedError)
                    guard let fixtureFile = OHPathForFile("FixerApi_all_response.json", type(of: self)) else { return error }

                    return OHHTTPStubsResponse(
                        fileAtPath: fixtureFile,
                        statusCode: 200,
                        headers: ["Content-Type" : "application/json"]
                    )
                }


                var returnedRates: Rates? = nil

                let client = FinancialApiClient()
                let api = AppBaseApi(client)
                waitUntil { done in
                    guard let apiClient = api.apiClient as? FinancialApiClient else { done(); return }
                    apiClient.rates.all(completionBlock: { (rates) in
                        returnedRates = rates
                        done()
                    }) { (error) in
                        fail("Mocked response returned error")
                        done()
                    }
                }
                
                expect(returnedRates).toNot(beNil())
                
                expect(returnedRates?.base) == "EUR"
                expect(returnedRates?.date) == "2017-06-23"
                expect(returnedRates?.rates.count) == 31
            }
            
            it("if request fails, must execute failure block") {
                
                stub(condition: isHost("api.fixer.io")) { request in
                    let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.cfurlErrorNotConnectedToInternet.rawValue), userInfo:nil)
                    return OHHTTPStubsResponse(error: notConnectedError)
                }

                var returnedRates: Rates? = nil

                let client = FinancialApiClient()
                let api = AppBaseApi(client)

                waitUntil { done in
                    guard let apiClient = api.apiClient as? FinancialApiClient else { done(); return }
                    apiClient.rates.all(completionBlock: { (rates) in
                        fail("Mocked response returned success")
                        returnedRates = rates
                        done()
                    }) { (error) in
                        done()
                    }
                }
                
                expect(returnedRates).to(beNil())
            }
            
        }
        
        describe("byCurrency Api Request") {
//            FixerApi_byCurrency_response
            
            
            it("if request succeeds, must return valid object") {
                
                stub(condition: isHost("api.fixer.io")) { request in
                    let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.cfurlErrorNotConnectedToInternet.rawValue), userInfo:nil)
                    let error = OHHTTPStubsResponse(error:notConnectedError)
                    guard let fixtureFile = OHPathForFile("FixerApi_all_response.json", type(of: self)) else { return error }
                    
                    return OHHTTPStubsResponse(
                        fileAtPath: fixtureFile,
                        statusCode: 200,
                        headers: ["Content-Type" : "application/json"]
                    )
                }
                
                
                var returnedRates: Rates? = nil
                
                let client = FinancialApiClient()
                let api = AppBaseApi(client)
                waitUntil { done in
                    guard let apiClient = api.apiClient as? FinancialApiClient else { done(); return }
                    apiClient.rates.byCurrency("USD", completionBlock: { (rates) in
                        returnedRates = rates
                        done()
                    }) { (error) in
                        fail("Mocked response returned error")
                        done()
                    }
                }
                
                expect(returnedRates).toNot(beNil())
                
                expect(returnedRates?.base) == "EUR"
                expect(returnedRates?.date) == "2017-06-23"
                expect(returnedRates?.rates.count) == 31
            }
            
            it("if request fails, must execute failure block") {
                
                stub(condition: isHost("api.fixer.io")) { request in
                    let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.cfurlErrorNotConnectedToInternet.rawValue), userInfo:nil)
                    return OHHTTPStubsResponse(error: notConnectedError)
                }
                
                var returnedRates: Rates? = nil
                
                let client = FinancialApiClient()
                let api = AppBaseApi(client)
                
                waitUntil { done in
                    guard let apiClient = api.apiClient as? FinancialApiClient else { done(); return }
                    apiClient.rates.byCurrency("USD", completionBlock: { (rates) in
                        fail("Mocked response returned success")
                        returnedRates = rates
                        done()
                    }) { (error) in
                        done()
                    }
                }
                
                expect(returnedRates).to(beNil())
            }
            
        }
        
        
    }
    
}
