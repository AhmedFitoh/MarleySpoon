//
//  RecipeDetailsView.swift
//
//  Created by AhmedFitoh on 9/1/21.
//  
//

import UIKit

class RecipeDetailsView: UIViewController {
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var chefNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    
    // MARK: - VIPER Stack
    var presenter: RecipeDetailsViewToPresenterProtocol!
    
    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        setData()
    }
    
    private func setData(){
        recipeTitleLabel.text = presenter.recipe.title
        chefNameLabel.text = presenter.recipe.chef?.name
        descriptionLabel.text = presenter.recipe.description
        recipeImageView.loadImageUsingCache(withUrl: ImageUrlGenerator.generatePath(path: presenter.recipe.photo.url ?? ""),  placeHolderImage: nil)
        tagsLabel.text = presenter.recipe.tags?.reduce([String](), { res, item in
            var arr = res
            arr.append(item.name?.capitalized ?? "")
            return arr
        }).joined(separator: " & ")
    }
    
    
}

// MARK: - Presenter to View Protocol
extension RecipeDetailsView: RecipeDetailsPresenterToViewProtocol {
    
}
