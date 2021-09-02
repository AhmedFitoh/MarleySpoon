@testable import MarleySpoon

class RecipesListWireframeInterfacesMock {
    var functionsCalled = [String]()
    
    // MARK: - Input Variables
}

extension RecipesListWireframeInterfacesMock: RecipesListPresenterToWireframeProtocol {
    func navigateToRecipeDetails(_ model: RecipeModel) {
        functionsCalled.append(#function)
        
    }

}
