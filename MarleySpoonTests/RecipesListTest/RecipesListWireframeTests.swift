import UIKit
import XCTest

@testable import MarleySpoon

class RecipesListWireframeTests: XCTestCase {
    var wireframe: RecipesListWireframe!
    
    // MARK: - Test Objects
    var viewMock: RecipesListNavigationInterfaceMock!
    
    override func setUp() {
        super.setUp()
        
        wireframe = RecipesListWireframe()
        viewMock = RecipesListNavigationInterfaceMock()
    }
    
    // MARK: - Init
    func testInitWithNothingShouldInstantiateVIPERStackAndConnectLayers() {
        // Arrange
        wireframe = RecipesListWireframe()
        
        // Act
        
        // Assert
        XCTAssertNotNil(wireframe, "Wireframe cannot be nil after init")
        XCTAssertNotNil(wireframe.viewController, "View cannot be nil after init")
    }
    
    // MARK: - Module Interface
    
    // MARK: - Presenter to Wireframe Interface
    
}
