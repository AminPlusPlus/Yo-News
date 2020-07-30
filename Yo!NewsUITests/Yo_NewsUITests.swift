//
//  Yo_NewsUITests.swift
//  Yo!NewsUITests
//
//  Created by Aminjoni Abdullozoda on 7/25/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import XCTest


class Yo_NewsUITests: XCTestCase {
    
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["enable-testing"]

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    
    func testLauchApp() {
          app.launch()
    }
    
    func testCellView(){
        app.launch()
        let table =  app.tables["newsTable"]
        let firstElement = table.cells.element(boundBy: 0)
        
        print(firstElement.staticTexts)
       // let title =
        
       // let navigation =

       // anchorageDailyNewsNavigationBar.buttons["Back"].tap()
//

    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
