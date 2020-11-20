//
//  JU_QuizUITests.swift
//  JU QuizUITests
//
//  Created by Garrit on 23.10.20.
//

import XCTest
import Nimble

class JU_QuizUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app.textFields["Your Name"].tap()
        
        app/*@START_MENU_TOKEN@*/.buttons["Done"]/*[[".keyboards",".buttons[\"Fertig\"]",".buttons[\"Done\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        app/*@START_MENU_TOKEN@*/.staticTexts["Highscore"]/*[[".buttons[\"Highscore\"].staticTexts[\"Highscore\"]",".staticTexts[\"Highscore\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["JU_Quiz.HighscoreTableView"].buttons["JU Quiz"].tap()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testGame() throws {
        let app = XCUIApplication()
        app.launch()
        
        expect(app.buttons["Start"].isEnabled).toEventually(beTrue(), timeout: .seconds(10))
        app.buttons["Start"].tap()
        
        var rightAnswers = 0
        app.buttons.firstMatch.tap()
        XCTAssertEqual(app.alerts.count, 1)
        if app.alerts.staticTexts["You're right 🥳"].exists {
            rightAnswers += 1
        }
        app.alerts.buttons.firstMatch.tap()
        
        app.buttons.firstMatch.tap()
        XCTAssertEqual(app.alerts.count, 1)
        if app.alerts.staticTexts["You're right 🥳"].exists {
            rightAnswers += 1
        }
        app.alerts.buttons.firstMatch.tap()
        
        app.buttons.firstMatch.tap()
        XCTAssertEqual(app.alerts.count, 1)
        if app.alerts.staticTexts["You're right 🥳"].exists {
            rightAnswers += 1
        }
        app.alerts.buttons.firstMatch.tap()
        
        app.buttons.firstMatch.tap()
        XCTAssertEqual(app.alerts.count, 1)
        if app.alerts.staticTexts["You're right 🥳"].exists {
            rightAnswers += 1
        }
        app.alerts.buttons.firstMatch.tap()
        
        app.buttons.firstMatch.tap()
        XCTAssertEqual(app.alerts.count, 1)
        if app.alerts.staticTexts["You're right 🥳"].exists {
            rightAnswers += 1
        }
        app.alerts.buttons.firstMatch.tap()
        
        XCTAssertTrue(app.staticTexts["Your Result"].exists)
        XCTAssertTrue(app.staticTexts["🥳 You answered \(rightAnswers) right from 5 questions."].exists)
    }
    
}
