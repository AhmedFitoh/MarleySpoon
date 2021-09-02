//
//  RecipesListView.swift
//
//  Created by AhmedFitoh on 8/31/21.
//  
//

import UIKit

class RecipesListView: UIViewController {
    
    @IBOutlet weak var recipesTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - VIPER Stack
    var presenter: RecipesListViewToPresenterProtocol!
    
    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.viewDidFinishLoading()
    }
    
    private func setupUI(){
        setupTableView()
    }
    
    private func setupTableView() {
        recipesTableView.register(UINib(nibName: "\(RecipesListCell.self)", bundle: nil), forCellReuseIdentifier: "\(RecipesListCell.self)")
        recipesTableView.tableFooterView = UIView()
    }
    
}

// MARK: - Presenter to View Protocol
extension RecipesListView: RecipesListPresenterToViewProtocol {
    
    func showLoadingAnimation() {
        activityIndicator.startAnimating()
    }
    
    func hideLoadingAnimation() {
        activityIndicator.stopAnimating()
    }
    
    func reloadRecipes() {
        recipesTableView.reloadData()
    }
}


// MARK: - UITableViewDelegates
extension RecipesListView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.recipes?.fields.count ?? 00
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(RecipesListCell.self)") as? RecipesListCell
        if let recipeInfo = presenter?.recipes?.fields [indexPath.row] {
            cell?.setupCell(info: recipeInfo, indexPath: indexPath)
        }
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.userDidSelectRecipeAt(index: indexPath.row)
    }
}
