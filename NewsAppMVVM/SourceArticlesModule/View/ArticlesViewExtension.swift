//
//  ArticlesViewExtension.swift
//  NewsAppMVVM
//
//  Created by Иван Тиминский on 14.12.2021.
//

import Foundation
import UIKit

extension ArticlesViewController: UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    
    //MARK: DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getNumberOfRows(inSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.getCell(from: viewModel.getArticleCellViewModel(indexPath: indexPath)) as! UITableViewCell
    }
    
    //MARK: Delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        viewModel.getHeightOfRow(forIndexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = viewModel.didSelect(indexPath: indexPath)
        guard let source = viewModel.inputSource else { return }
        let nextScreen = ModuleBuilder.createDetailArticleModule(inputArticle: article, inputSource: source)
        self.navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    //MARK: - UISearchResultsUpdating
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        viewModel.getArticlesFromSearchText(text: searchText)
    }
    
}

extension UITableView {
    func getCell(from vm: ArticleCellViewModelProtocol) -> ArticleCellProtocol {
        guard let cell = dequeueReusableCell(withIdentifier: vm.associatedClass.identifier) as? ArticleCellProtocol else { fatalError() }
        cell.configure(with: vm)
        return cell
    }
}
