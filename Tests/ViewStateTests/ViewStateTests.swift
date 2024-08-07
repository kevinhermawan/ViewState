import XCTest
@testable import ViewState
import SwiftUI
import ViewInspector

final class ViewStateTests: XCTestCase {
    func testLoadingState() throws {
        let view = createMockView(for: .loading, hidden: false)
        let text = try view.inspect().vStack().text(0).string()
        
        XCTAssertEqual(text, "Loading...")
    }
    
    func testEmptyState() throws {
        let view = createMockView(for: .empty, hidden: false)
        let text = try view.inspect().vStack().text(0).string()
        
        XCTAssertEqual(text, "No data available.")
    }
    
    func testSuccessState() throws {
        let successMessage = "Operation successful."
        let view = createMockView(for: .success(message: successMessage), hidden: false)
        let text = try view.inspect().vStack().text(0).string()
        
        XCTAssertEqual(text, successMessage)
    }
    
    func testErrorState() throws {
        let errorMessage = "An error occurred."
        let view = createMockView(for: .error(message: errorMessage), hidden: false)
        let text = try view.inspect().vStack().text(0).string()
        
        XCTAssertEqual(text, errorMessage)
    }
    
    func testContentState() throws {
        let view = createMockView(for: nil, hidden: false)
        let text = try view.inspect().vStack().text(0).string()
        
        XCTAssertEqual(text, "This is the main content.")
    }
}

func createMockView(for state: ViewState?, hidden: Bool) -> some View {
    VStack {
        Text("This is the main content.")
            .when(state, is: .loading) {
                Text("Loading...")
            }
            .when(state, is: .empty) {
                Text("No data available.")
            }
            .whenSuccess(state) { message in
                Text(message)
            }
            .whenError(state) { message in
                Text(message)
            }
    }
}
