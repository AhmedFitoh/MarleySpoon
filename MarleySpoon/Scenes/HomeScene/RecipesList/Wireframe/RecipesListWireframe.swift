//
//  RecipesListWireframe.swift
//
//  Created by AhmedFitoh on 8/31/21.
//  
//

import UIKit

class RecipesListWireframe {
    
    // MARK: - Instance Variables
    weak var viewController: UIViewController!
    weak var navigationController: UINavigationController?
    
    // MARK:- Life cycle
    init(delegate: RecipesListDelegate? = nil) {
        let storyboard = UIStoryboard(name: RecipesListConstants.storyboardIdentifier, bundle: Bundle(for: RecipesListWireframe.self))
                
        navigationController = storyboard.instantiateViewController(withIdentifier: RecipesListConstants.navigationControllerIdentifier) as? UINavigationController
        let view = navigationController?.viewControllers[0] as! RecipesListView
        
        viewController = view
        
        let interactor = RecipesListInteractor()
        let presenter = RecipesListPresenter(wireframe: self, view: view, interactor: interactor, delegate: delegate)
        
        view.presenter = presenter
        interactor.presenter = presenter
    }
}

// MARK: - Presenter to Wireframe Protocol
extension RecipesListWireframe: RecipesListPresenterToWireframeProtocol {
    
    func navigateToRecipeDetails(_ model: RecipeModel){
        let wireframe = RecipeDetailsWireframe(recipe: model)
        viewController?.navigationController?.pushViewController(wireframe.viewController, animated: true)
    }
}
