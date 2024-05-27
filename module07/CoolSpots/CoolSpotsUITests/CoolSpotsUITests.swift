
import XCTest

final class CoolSpotsUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func testPortraitButtonsVisible() throws {
        XCUIDevice.shared.orientation = UIDeviceOrientation.portrait
        
        let app = XCUIApplication()
        app.launch()
        
        XCTAssertTrue(app.buttons["Show Next"].isHittable)
        XCTAssertTrue(app.buttons["Post"].isHittable)
    }
    func testLandscapeButtonsVisible() throws {
        XCUIDevice.shared.orientation = UIDeviceOrientation.landscapeLeft
        
        let app = XCUIApplication()
        app.launch()
        
        XCTAssertTrue(app.buttons["Show Next"].isHittable)
        XCTAssertTrue(app.buttons["Post"].isHittable)
    }
}
