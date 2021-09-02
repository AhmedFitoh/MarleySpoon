//
//  RecipesList.swift
//  MarleySpoon
//
//  Created by AhmedFitoh on 8/31/21.
//

import UIKit

class RecipesListCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI(){
        containerView.layer.cornerRadius = 6
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        recipeImageView.image = nil
    }

    func setupCell(info: RecipeModel, indexPath: IndexPath){
        recipeLabel.text = info.title
        
        recipeImageView.loadImageUsingCache(withUrl: ImageUrlGenerator.generatePath(path: info.photo.url ?? ""), cellIndexPathRow: indexPath.row)
    }
    
}
