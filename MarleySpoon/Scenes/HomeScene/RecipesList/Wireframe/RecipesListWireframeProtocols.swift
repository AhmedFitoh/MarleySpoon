//
//  RecipesListWireframeProtocols.swift
//
//  Created by AhmedFitoh on 8/31/21.
//  
//

// VIPER Module Constants
struct RecipesListConstants {
    
    // Uncomment to utilize a navigation contoller from storyboard
    static let navigationControllerIdentifier = "RecipesListNavigationController"
    
    static let storyboardIdentifier = "RecipesList"
    static let viewControllerIdentifier = "RecipesListView"
}

// VIPER Protocol for communication from Presenter -> Wireframe
protocol RecipesListPresenterToWireframeProtocol: AnyObject {
    func navigateToRecipeDetails(_ model: RecipeModel)
}
