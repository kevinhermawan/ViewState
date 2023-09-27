import XCTest
@testable import ViewState
import SwiftUI
import ViewInspector

final class ViewStateTests: XCTestCase {
    func testLoadingState() throws {
        let view = createMockView(for: .loading)
        let text = try view.inspect().vStack().text(0).string()
        
        XCTAssertEqual(text, "Loading...")
    }
    
    func testEmptyState() throws {
        let view = createMockView(for: .empty)
        let text = try view.inspect().vStack().text(0).string()
        
        XCTAssertEqual(text, "No data available.")
    }
    
    func testErrorState() throws {
        let view = createMockView(for: .error)
        let text = try view.inspect().vStack().text(0).string()
        
        XCTAssertEqual(text, "An error occurred.")
    }
    
    func testContentState() throws {
        let view = createMockView(for: nil)
        let text = try view.inspect().vStack().text(0).string()
        
        XCTAssertEqual(text, "This is the main content.")
    }
}

func createMockView(for state: ViewState?) -> some View {
    VStack {
        Text("This is the main content.")
            .when(state, is: .loading) {
                Text("Loading...")
            }
            .when(state, is: .empty) {
                Text("No data available.")
            }
            .when(state, is: .error) {
                Text("An error occurred.")
            }
    }
}
