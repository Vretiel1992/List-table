//
//  Presenter.swift
//  TestTaskAvito
//
//  Created by Антон Денисюк on 08.11.2022.
//

import Foundation

// object
// protocol
// reference interactor, view, to router

enum FetchError: Error {
    case failed
}

protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    
    func interactorDidFetchCompany(with result: Result<JSONContainer, Error>)
}

class EmployeePresenter: AnyPresenter {
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.getUsers()
        }
    }
    
    var view: AnyView?
    
    func interactorDidFetchCompany(with result: Result<JSONContainer, Error>) {
        switch result {
        case .success(let parse):
            view?.update(with: parse)
        case .failure:
            view?.update(with: "Что-то пошло не так")
        }
    }
    
    
}
