//
//  RecipesListInteractor.swift
//
//  Created by AhmedFitoh on 8/31/21.
//  
//

import Foundation

class RecipesListInteractor {
    
    // MARK: - VIPER Stack
    weak var presenter: RecipesListInteractorToPresenterProtocol!
    var webService: WebService!
    init(webService: WebService = WebService()) {
        self.webService = webService
    }
}

// MARK: - Presenter To Interactor Protocol
extension RecipesListInteractor: RecipesListPresenterToInteractorProtocol {
    
    func fetchRecipes(){
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
