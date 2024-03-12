//
//  ActiveOneTestTests.swift
//  ActiveOneTestTests
//
//  Created by Andres Orjuela on 12/03/24.
//

import XCTest
@testable import ActiveOneTest

final class ActiveOneTestTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLoadJson() {
        
        let jsonLoader = LoanService()
        
        let loan = jsonLoader.loadJson(filename: "data")
        
        XCTAssertNotNil(loan, "Loan object should not be nil")
    }
    
}
