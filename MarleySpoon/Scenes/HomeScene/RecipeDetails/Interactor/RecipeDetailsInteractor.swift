//
//  RecipeDetailsInteractor.swift
//
//  Created by AhmedFitoh on 9/1/21.
//  
//

import Foundation

class RecipeDetailsInteractor {
    
    // MARK: - VIPER Stack
    weak var presenter: RecipeDetailsInteractorToPresenterProtocol!
    
}

// MARK: - Presenter To Interactor Protocol
extension RecipeDetailsInteractor: RecipeDetailsPresenterToInteractorProtocol {
    
}
