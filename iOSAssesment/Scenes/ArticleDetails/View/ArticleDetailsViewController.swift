//
//  ArticleDetailsViewController.swift
//  MVVMRx
//
//  Created by Ahmed Elsman on 20/12/2020.
//  Copyright © 2020 storm. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ArticleDetailsViewController: UIViewController,Storyboarded {
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var articleTitle: UILabel!
    @IBOutlet private weak var articleAbstract: UILabel!
    
    // MARK: - variables
    
    var articleDetailsViewModel = ArticleDetailsViewModel()
    private var disposeBag = DisposeBag()
//    public var article = PublishSubject<Article>()
    static var storyboard = AppStoryboard.articles
    
    
    // MARK: - View's Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupBindings()
    }
    
    private func setupBindings() {
//        articleDetailsViewModel.selectedArticle
//            .subscribe(onNext: {[weak self] article in
//                self?.articleTitle.rx.bind(article.title)
//                self?.articleAbstract.rx.text.onNext(article.abstractField)
//            }).disposed(by: disposeBag)
        articleDetailsViewModel.selectedArticleObservable
            .observeOn(MainScheduler.instance)
            .map { $0.title }
            .bind(to:self.articleTitle.rx.text)
            .disposed(by: disposeBag)
    }
    
}
