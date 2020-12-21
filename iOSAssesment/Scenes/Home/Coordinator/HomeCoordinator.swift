import Foundation
import UIKit
import RxSwift
import RxCocoa

class HomeCoordinator: BaseCoordinator {
    
    private let homeViewModel: HomeViewModel
    private let disposeBag = DisposeBag()
    
    init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
    }
    
    override func start() {
        homeViewModel.article
            .subscribe(onNext: { [weak self] item in self?.showArticleDetails(item: item) })
            .disposed(by: disposeBag)
        let viewController = ArticlesViewController.instantiate()
        viewController.homeViewModel = homeViewModel
        navigationController.viewControllers = [viewController]
    }
    
    func showArticleDetails(item: Article) {
        print(item)
        removeChildCoordinators()
        let coordinator = ArticleDetailsCoordinator(articleDetailsViewModel: ArticleDetailsViewModel(), selectedArticle: item)
        coordinator.navigationController = navigationController
        start(coordinator: coordinator)
    }
}
