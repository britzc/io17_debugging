
import XCTest
@testable import CoolSpots

final class CoolSpotsTests: XCTestCase {
    
    func testSpotDataNextNotNil() throws {
        let spotData = SpotData()
        
        let currentItem = spotData.next()
        
        XCTAssertNotNil(currentItem, "spotData.next must not be nil")
    }
    
    func testSpotDataNextDifferent() throws {
        let spotData = SpotData()
        
        var lastItem = spotData.next()
        for _ in 1...100 {
            let nextItem = spotData.next()
            XCTAssertNotEqual(lastItem.ordinal,nextItem.ordinal, "cannot repeat the same image")
            
            lastItem = nextItem
        }
    }
    

    
}
