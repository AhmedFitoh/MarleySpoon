//
//  RecipeDetailsWireframe.swift
//
//  Created by AhmedFitoh on 9/1/21.
//  
//

import UIKit

class RecipeDetailsWireframe {
    
    // MARK: - Instance Variables
    weak var viewController: UIViewController!

    // MARK:- Life cycle
    init(recipe: RecipeModel, delegate: RecipeDetailsDelegate? = nil) {
        let storyboard = UIStoryboard(name: RecipeDetailsConstants.storyboardIdentifier, bundle: Bundle(for: RecipeDetailsWireframe.self))
 
        let view = (storyboard.instantiateViewController(withIdentifier: RecipeDetailsConstants.viewControllerIdentifier) as? RecipeDetailsView)!
        
        viewController = view
        
        let interactor = RecipeDetailsInteractor()
        let presenter = RecipeDetailsPresenter(recipe: recipe, wireframe: self, view: view, interactor: interactor, delegate: delegate)
        
        view.presenter = presenter
        interactor.presenter = presenter
    }
}

// MARK: - Presenter to Wireframe Protocol
extension RecipeDetailsWireframe: RecipeDetailsPresenterToWireframeProtocol {
    
    
}
