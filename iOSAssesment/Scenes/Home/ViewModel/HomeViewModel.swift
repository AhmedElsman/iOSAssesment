//
//  HomeViewModel.swift
//  iOSAssesment
//
//  Created by Ahmed Elsman on 20/12/2020.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire


class HomeViewModel {
    
    public enum HomeError {
        case internetError(String)
        case serverMessage(String)
    }

    public var articles = PublishSubject<[Article]>()
    public var article : PublishSubject<Article> = PublishSubject()
    public let loading: PublishSubject<Bool> = PublishSubject()
    public let error : PublishSubject<HomeError> = PublishSubject()
    private let disposable = DisposeBag()
    private var isTableHidden = BehaviorRelay<Bool>(value: false)
    
    var articlesModelObservable: Observable<[Article]> {
        return articles
    }
    var isTableHiddenObservable: Observable<Bool> {
        return isTableHidden.asObservable()
    }
    
    func getArticles() {
        self.loading.onNext(true)
        APIServices.instance.getData(url: "mostpopular/v2/viewed/30.json?api-key=cK6hmFP2fgZRgaHU8GkTla4LgDySQDwj", method: .get, params: nil, encoding: JSONEncoding.default, headers: nil) { [weak self](articlesModel: ArticlesModel?, errorModel: BaseErrorModel?, error) in
            guard let self = self else { return }
            self.loading.onNext(false)
            if let error = error {
                print(error.localizedDescription)
            } else if let errorModel = errorModel {
                print(errorModel.message ?? "")
            } else {
                guard let articlesModel = articlesModel else { return }
                if articlesModel.results?.count ?? 0 > 0 {
                    self.articles.onNext(articlesModel.results ?? [])
                    self.isTableHidden.accept(false)
                } else {
                    self.isTableHidden.accept(true)
                }
            }
        }
    }
}
