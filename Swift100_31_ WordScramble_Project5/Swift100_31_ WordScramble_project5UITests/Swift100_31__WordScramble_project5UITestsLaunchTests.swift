//
//  Swift100_31__WordScramble_project5UITestsLaunchTests.swift
//  Swift100_31_ WordScramble_project5UITests
//
//  Created by Zaiyuan Xiao on 2023/2/7.
//

import XCTest

final class Swift100_31__WordScramble_project5UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
