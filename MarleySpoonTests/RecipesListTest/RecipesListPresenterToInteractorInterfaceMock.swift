@testable import MarleySpoon

class RecipesListPresenterToInteractorInterfaceMock {
    var functionsCalled = [String]()
    var presenter: RecipesListInteractorToPresenterInterfaceMock?

//    RecipesListInteractor(webService: self.webServiceMock ?? WebServiceMock())

    // MARK: - Input Variables
}

extension RecipesListPresenterToInteractorInterfaceMock: RecipesListPresenterToInteractorProtocol {
    
    func fetchRecipes() {
        WebServiceMock().fetchRequestedItems(router: .recipeList, value: ItemsModel.self) {[weak self] result in
            switch result{
            case .success(let model):
                self?.presenter?.fetchRecipesSuccess(model)
            case .failure(let error):
                self?.presenter?.fetchRecipesFailure(error)
            }
        }
    }
    
    func fetchRecipesFailure(){
        let webService = WebServiceMock()
        webService.expectedError = .invalidData
        
        webService.fetchRequestedItems(router: .recipeList, value: ItemsModel.self) {[weak self] result in
            switch result{
            case .success(let model):
                self?.presenter?.fetchRecipesSuccess(model)
            case .failure(let error):
                self?.presenter?.fetchRecipesFailure(error)
            }
        }
    }
    
}
