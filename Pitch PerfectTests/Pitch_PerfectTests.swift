//
//  Pitch_PerfectTests.swift
//  Pitch PerfectTests
//
//  Created by Rodrigo Webler on 5/13/15.
//  Copyright (c) 2015 Rodrigo Webler. All rights reserved.
//

import UIKit
import XCTest

import Pitch_Perfect

class Pitch_PerfectTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRecordViewDidLoad()
    {
        // we only have access to this if we import our project above
        let v = ViewController()
        
        // assert that the ViewController.view is not nil
        XCTAssertNotNil(v.view, "Record View Did Not load")
    }
    
    func testPlaybackViewDidLoad()
    {
        // we only have access to this if we import our project above
        let v = PlaySoundsViewController()
        
        // assert that the ViewController.view is not nil
        XCTAssertNotNil(v.view, "Playback View Did Not load")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
