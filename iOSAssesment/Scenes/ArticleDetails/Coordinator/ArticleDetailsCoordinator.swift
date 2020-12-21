import Foundation
import UIKit

class ArticleDetailsCoordinator: BaseCoordinator {
    
    private let articleDetailsViewModel: ArticleDetailsViewModel

    init(articleDetailsViewModel: ArticleDetailsViewModel, selectedArticle: Article) {
        self.articleDetailsViewModel = articleDetailsViewModel
        self.articleDetailsViewModel.selectedArticle.onNext(selectedArticle)
    }
    
    override func start() {
        let viewController = ArticleDetailsViewController.instantiate()
        viewController.articleDetailsViewModel = self.articleDetailsViewModel
        navigationController.viewControllers.append(viewController)
    }
}
