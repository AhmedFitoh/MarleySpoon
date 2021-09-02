import Foundation
import XCTest

@testable import MarleySpoon

class RecipesListPresenterTests: XCTestCase {
    var presenter: RecipesListPresenter!
    
    // MARK: - Test Objects
    var delegateMock: RecipesListDelegateMock!
    var interactorMock: RecipesListPresenterToInteractorInterfaceMock!
    var viewMock: RecipesListPresenterToViewInterfaceMock!
    var wireframeMock: RecipesListWireframeInterfacesMock!
    
    override func setUp() {
        super.setUp()
        
        
        delegateMock = RecipesListDelegateMock()
        interactorMock = RecipesListPresenterToInteractorInterfaceMock()
        viewMock = RecipesListPresenterToViewInterfaceMock()
        wireframeMock = RecipesListWireframeInterfacesMock()
        
        presenter = RecipesListPresenter(wireframe: wireframeMock,
                                         view: viewMock,
                                         interactor: interactorMock)
        presenter.delegate = delegateMock
    }
    
    // MARK: - Operational
    func testModuleWireframeComputedVariableWithConnectedWireframeReturnsTheWireframeAsARecipesListObject() {
        // Arrange

        // Act
        let moduleWireframe = presenter.wireframe
        
        // Assert
        XCTAssert(moduleWireframe === wireframeMock)
    }
    
    
}
