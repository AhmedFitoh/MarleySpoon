//
//  RecipeDetailsPresenterProtocols.swift
//
//  Created by AhmedFitoh on 9/1/21.
//  
//

// VIPER Protocol to the Module
protocol RecipeDetailsDelegate: AnyObject {
    
}

// VIPER Protocol for communication from Interactor -> Presenter
protocol RecipeDetailsInteractorToPresenterProtocol: AnyObject {
    
}

// VIPER Protocol for communication from View -> Presenter
protocol RecipeDetailsViewToPresenterProtocol: AnyObject {
    var recipe: RecipeModel! {get}
}
