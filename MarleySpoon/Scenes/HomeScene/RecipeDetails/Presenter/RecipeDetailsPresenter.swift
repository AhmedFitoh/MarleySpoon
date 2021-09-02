//
//  RecipeDetailsPresenter.swift
//
//  Created by AhmedFitoh on 9/1/21.
//  
//

import Foundation

class RecipeDetailsPresenter {
    
    // MARK: - VIPER Stack
    weak var view: RecipeDetailsPresenterToViewProtocol!
    var interactor: RecipeDetailsPresenterToInteractorProtocol!
    var wireframe: RecipeDetailsPresenterToWireframeProtocol!
    
    // MARK: - Instance Variables
    weak var delegate: RecipeDetailsDelegate?
    var recipe: RecipeModel!
    // MARK: - Life Cycle
    init(recipe: RecipeModel,
         wireframe: RecipeDetailsPresenterToWireframeProtocol,
         view: RecipeDetailsPresenterToViewProtocol,
         interactor: RecipeDetailsPresenterToInteractorProtocol,
         delegate: RecipeDetailsDelegate? = nil) {
        self.wireframe = wireframe
        self.interactor = interactor
        self.view = view
        self.delegate = delegate
        self.recipe = recipe
    }
}

// MARK: - Interactor to Presenter Protocol
extension RecipeDetailsPresenter: RecipeDetailsInteractorToPresenterProtocol {
    
}

// MARK: - View to Presenter Protocol
extension RecipeDetailsPresenter: RecipeDetailsViewToPresenterProtocol {
    
}
