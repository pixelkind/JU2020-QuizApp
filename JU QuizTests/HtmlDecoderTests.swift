//
//  HtmlDecoderTests.swift
//  JU QuizTests
//
//  Created by Garrit on 13.11.20.
//

import XCTest
@testable import JU_Quiz

class HtmlDecoderTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testHTMLDecoding() throws {
        let encodedString = "&quot;"
        XCTAssertEqual(encodedString.htmlDecoded, "\"")
        
        let encodedUmlaut = "&auml;"
        XCTAssert(encodedUmlaut.htmlDecoded == "ä")
    }

}
