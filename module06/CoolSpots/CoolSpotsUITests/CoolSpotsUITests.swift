
import XCTest

final class CoolSpotsUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func testButtonsVisible() throws {
        let app = XCUIApplication()
        app.launch()
        
        XCTAssertTrue(app.buttons["Show Next"].isHittable)
        XCTAssertTrue(app.buttons["Post"].isHittable)
    }
}
