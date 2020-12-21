//
//  ArticleDetailsViewModel.swift
//  MVVMRx
//
//  Created by Ahmed Elsman on 20/12/2020.
//  Copyright © 2020 storm. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa



class ArticleDetailsViewModel {

    public var selectedArticle : PublishSubject<Article> = PublishSubject()
    private let disposable = DisposeBag()

    
    var selectedArticleObservable: Observable<Article> {
        return selectedArticle
    }
}
