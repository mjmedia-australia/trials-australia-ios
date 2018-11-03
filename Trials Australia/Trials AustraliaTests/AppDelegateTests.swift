//
//  AppDelegateTests.swift
//  Trials AustraliaTests
//
//  Created by Matt Langtree on 3/11/18.
//  Copyright © 2018 Matt Langtree. All rights reserved.
//

import XCTest
@testable import Trials_Australia

class AppDelegateTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAppDelegate() {
        let appDelegate = AppDelegate()
        XCTAssertNotNil(appDelegate)
    }
    
}
