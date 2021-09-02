//
//  RecipesListInteractorProtocols.swift
//
//  Created by AhmedFitoh on 8/31/21.
//  
//

// VIPER Protocol for communication from Presenter to Interactor
protocol RecipesListPresenterToInteractorProtocol: AnyObject {
    func fetchRecipes()
}
