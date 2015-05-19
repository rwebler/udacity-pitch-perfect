//
//  Pitch_PerfectTests.swift
//  Pitch PerfectTests
//
//  Created by Rodrigo Webler on 5/13/15.
//  Copyright (c) 2015 Rodrigo Webler. All rights reserved.
//

import UIKit
import XCTest

class Pitch_PerfectTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    /*func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }*/
    
    func testRecordingViewIsLoaded() {
        var recordSoundsViewController = RecordSoundsViewController()
        XCTAssertNotNil(recordSoundsViewController.view, "View not loaded for RecordSoundsViewController")
    }
    
    func testPlaySoundsViewIsLoaded() {
        var playSoundsViewController = PlaySoundsViewController()
        XCTAssertNotNil(playSoundsViewController.view, "View not loaded for PlaySoundsViewController")
    }
    
}
