//
//  RecipesListPresenterProtocols.swift
//
//  Created by AhmedFitoh on 8/31/21.
//  
//

// VIPER Protocol to the Module
protocol RecipesListDelegate: AnyObject {
    
}

// VIPER Protocol for communication from Interactor -> Presenter
protocol RecipesListInteractorToPresenterProtocol: AnyObject {
    func fetchRecipesSuccess(_ model: ItemsModel)
    func fetchRecipesFailure(_ error: Error)
}

// VIPER Protocol for communication from View -> Presenter
protocol RecipesListViewToPresenterProtocol: AnyObject {
    var recipes: ItemsModel? {get}
    func viewDidFinishLoading()
    func userDidSelectRecipeAt(index: Int)
}
