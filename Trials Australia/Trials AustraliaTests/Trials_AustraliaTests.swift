//
//  ViewControllerTests.swift
//  Trials AustraliaTests
//
//  Created by Matt Langtree on 3/11/18.
//  Copyright © 2018 Matt Langtree. All rights reserved.
//

import XCTest
@testable import Trials_Australia

class ViewControllerTests: XCTestCase {

    var viewController: ViewController!
    
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: ViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        viewController = vc
        _ = viewController.view // To call viewDidLoad
    }

    override func tearDown() {

    }

    func testViewIsConfigured() {
        XCTAssertNotNil(viewController.view)
    }


}
