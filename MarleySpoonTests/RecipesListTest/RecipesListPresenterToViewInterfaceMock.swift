@testable import MarleySpoon

class RecipesListPresenterToViewInterfaceMock {
    var functionsCalled = [String]()
    
    // MARK: - Input Variables
}

extension RecipesListPresenterToViewInterfaceMock: RecipesListPresenterToViewProtocol {
    func reloadRecipes() {
        functionsCalled.append(#function)

    }

    func showLoadingAnimation() {
        functionsCalled.append(#function)

    }

    func hideLoadingAnimation() {
        functionsCalled.append(#function)

    }

    func showAlert(message: String, completionHandler: (() -> ())?) {
        functionsCalled.append(#function)

    }
}
