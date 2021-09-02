//
//  RecipesListViewProtocols.swift
//
//  Created by AhmedFitoh on 8/31/21.
//  
//

// VIPER Protocol for communication from Presenter -> View
protocol RecipesListPresenterToViewProtocol: AnyObject, Alertable {
    func reloadRecipes()
    func showLoadingAnimation()
    func hideLoadingAnimation()
}
