import Foundation
import XCTest

@testable import MarleySpoon

protocol HomeScreenPresenterToInteractorProtocolMock: AnyObject {
    var fetchExp: XCTestExpectation? {get}
}

class RecipesListInteractorTests: XCTestCase, HomeScreenPresenterToInteractorProtocolMock {
    var interactor: RecipesListPresenterToInteractorInterfaceMock!
    var fetchExp: XCTestExpectation?
    // MARK: - Test Objects
    var presenterMock: RecipesListInteractorToPresenterInterfaceMock!
    
    
    override func setUp() {
        super.setUp()
        interactor = RecipesListPresenterToInteractorInterfaceMock()
        presenterMock = RecipesListInteractorToPresenterInterfaceMock(interactor: self)
        interactor.presenter = presenterMock
    }

    override func tearDownWithError() throws {
        presenterMock.resetPresenterState()
    }
    
    // MARK: - Operational
    
    func testFetchDataSuccess(){
        let firstRecipeTitle = "White Cheddar Grilled Cheese with Cherry Preserves & Basil"
        
        fetchExp = expectation(description: "Fetching items")
        
        interactor?.fetchRecipes()
        waitForExpectations(timeout: 1)
        
        XCTAssertNotNil(presenterMock?.model, "Failed to load data.")
        XCTAssertNil(presenterMock?.error, "Error should be nil.")
        
        XCTAssertEqual(presenterMock?.model?.fields.count, 4, "Fields should be 4")
        XCTAssertEqual(presenterMock?.model?.fields.first?.title, firstRecipeTitle, "Recipe title is incorrect")
    }
    
    func testFetchDataFailure(){
        fetchExp = expectation(description: "Fetching items")

        interactor?.fetchRecipesFailure()
        waitForExpectations(timeout: 1)

        XCTAssertNil(presenterMock?.model, "Data should be nil")
        XCTAssertNotNil(presenterMock?.error, "Error shouldn't be nil.")
    }
    
}
