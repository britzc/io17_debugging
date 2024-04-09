
import XCTest
@testable import CoolSpots

final class CoolSpotsTests: XCTestCase {

    func testSpotData() throws {
        let spotData = SpotData()
        XCTAssertEqual(spotData.spotDescriptions.count, 3, "spotData must be 3")
    }

}
