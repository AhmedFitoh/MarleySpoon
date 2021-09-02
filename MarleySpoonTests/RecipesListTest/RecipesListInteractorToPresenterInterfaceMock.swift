@testable import MarleySpoon

class RecipesListInteractorToPresenterInterfaceMock {
    var functionsCalled = [String]()
    weak var interactor: HomeScreenPresenterToInteractorProtocolMock?
    var model: ItemsModel?
    var error: Error?
    // MARK: - Input Variables
    init(interactor: HomeScreenPresenterToInteractorProtocolMock) {
        self.interactor = interactor
    }
    
    func resetPresenterState(){
        model = nil
        error = nil
        functionsCalled.removeAll()
    }
}

extension RecipesListInteractorToPresenterInterfaceMock: RecipesListInteractorToPresenterProtocol {
    func fetchRecipesSuccess(_ model: ItemsModel) {
        functionsCalled.append(#function)
        self.model = model
        interactor?.fetchExp?.fulfill()
    }
    
    func fetchRecipesFailure(_ error: Error) {
        functionsCalled.append(#function)
        self.error = error
        interactor?.fetchExp?.fulfill()
    }
    
    
}
