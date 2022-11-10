//
//  Router.swift
//  TestTaskAvito
//
//  Created by Антон Денисюк on 08.11.2022.
//

import UIKit

// Object
// Entry point

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry: EntryPoint? { get }
    
    static func start() -> AnyRouter
}

class EmployeeRouter: AnyRouter {
    var entry: EntryPoint?
    
    static func start() -> AnyRouter {
        let router = EmployeeRouter()
        
        // Assign VIP
        
        var view: AnyView = EmployeeViewController()
        var interactor: AnyInteractor = EmployeeInteractor()
        var presenter: AnyPresenter = EmployeePresenter()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        
        router.entry = view as? EntryPoint
        
        return router
    }
}
