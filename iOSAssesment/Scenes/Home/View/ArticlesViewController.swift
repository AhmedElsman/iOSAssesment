//
//  HomeVC.swift
//  iOSAssesment
//
//  Created by Ahmed Elsman on 20/12/2020.
//

import UIKit
import RxSwift
import RxCocoa

class ArticlesViewController: UIViewController, Storyboarded {
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var articlesTableView: UITableView!
    
    // MARK: - variables
    
    var homeViewModel = HomeViewModel()
    let disposeBag = DisposeBag()
    public var articles = PublishSubject<[Article]>()
    static var storyboard = AppStoryboard.articles
    
    // MARK: - View's Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addBlurArea(area: self.view.frame, style: .dark)
        bindingTableView()
        setupBindings()
        homeViewModel.getArticles()
    }
    
    
    // MARK: - Bindings
    
    private func setupBindings() {
        
        // binding loading to vc
        homeViewModel.loading
            .bind(to: self.rx.isAnimating).disposed(by: disposeBag)
        // bind to hidden table
        homeViewModel.isTableHiddenObservable.bind(to: self.articlesTableView.rx.isHidden).disposed(by: disposeBag)
        // observing errors to show
        homeViewModel
            .error
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (error) in
                switch error {
                case .internetError(let message):
                    MessageView.sharedInstance.showOnView(message: message, theme: .error)
                case .serverMessage(let message):
                    MessageView.sharedInstance.showOnView(message: message, theme: .warning)
                }
            })
            .disposed(by: disposeBag)
    }
    
    private func bindingTableView() {
        
        // register article cell to articles table view
        articlesTableView.register(cellType: ArticleTableViewCell.self)
        // bind article to table
        homeViewModel.articlesModelObservable.bind(to: articlesTableView.rx.items(cellIdentifier: "ArticleTableViewCell", cellType: ArticleTableViewCell.self)) {  (row,article,cell) in
            cell.cellArticle = article
        }.disposed(by: disposeBag)
        // observe for item selection
        Observable
            .zip(articlesTableView.rx.itemSelected, articlesTableView.rx.modelSelected(Article.self))
            .bind { [weak self] selectedIndex, article in
                print(selectedIndex, article.type ?? "")
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self?.dismiss(animated: true) {
                        self?.homeViewModel.article.onNext(article)
                    }
                }
        }.disposed(by: disposeBag)
    }
}
