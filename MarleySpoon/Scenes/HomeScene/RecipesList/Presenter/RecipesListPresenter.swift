//
//  RecipesListPresenter.swift
//
//  Created by AhmedFitoh on 8/31/21.
//  
//

import Foundation

class RecipesListPresenter {
    
    // MARK: - VIPER Stack
    weak var view: RecipesListPresenterToViewProtocol!
    var interactor: RecipesListPresenterToInteractorProtocol!
    var wireframe: RecipesListPresenterToWireframeProtocol!
    
    // MARK: - Instance Variables
    weak var delegate: RecipesListDelegate?
    var recipes: ItemsModel?
    
    // MARK: - Life Cycle
    init(wireframe: RecipesListPresenterToWireframeProtocol, view: RecipesListPresenterToViewProtocol, interactor: RecipesListPresenterToInteractorProtocol, delegate: RecipesListDelegate? = nil) {
        self.wireframe = wireframe
        self.interactor = interactor
        self.view = view
        self.delegate = delegate
    }
    
    private func fetchRecipes(){
        interactor.fetchRecipes()
    }
}

// MARK: - Interactor to Presenter Protocol
extension RecipesListPresenter: RecipesListInteractorToPresenterProtocol {
    func fetchRecipesSuccess(_ model: ItemsModel) {
        recipes = model
        view?.reloadRecipes()
        view?.hideLoadingAnimation()
    }
    
    func fetchRecipesFailure(_ error: Error) {
        debugPrint(error.localizedDescription)
        view?.showAlert(message: "NetworkError_RequestFailureMessage".localized,
                        completionHandler: nil)
        view?.hideLoadingAnimation()
    }
    
    func viewDidFinishLoading() {
        fetchRecipes()
    }
}

// MARK: - View to Presenter Protocol
extension RecipesListPresenter: RecipesListViewToPresenterProtocol{
    func userDidSelectRecipeAt(index: Int) {
        if let model = recipes?.fields [index]{
            wireframe?.navigateToRecipeDetails(model)
        }
    }
    
    
}
