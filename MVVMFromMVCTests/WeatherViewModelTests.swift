import XCTest
@testable import Grados

class WeatherViewModelTests: XCTestCase {
  
  func testChangeLocationUpdatesLocationName() {
    // 1
    let expectation = self.expectation(
      description: "Find location using geocoder")
    // 2
    let viewModel = WeatherViewModel()
    // 3
    viewModel.locationName.bind {
      if $0.caseInsensitiveCompare("Richmond, VA") == .orderedSame {
        expectation.fulfill()
      }
    }
    // 4
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
      viewModel.changeLocation(to: "Richmond, VA")
    }
    // 5
    waitForExpectations(timeout: 8, handler: nil)
  }
  
}
