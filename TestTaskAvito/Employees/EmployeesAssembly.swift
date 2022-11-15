//
//  EmployeesAssembly.swift
//  TestTaskAvito
//
//  Created by Антон Денисюк on 15.11.2022.
//

enum EmployeesAssembly {
    static func create() -> EmployeesViewController {
        let view = EmployeesViewController()
        let presenter = EmployeesPresenter()
        let interactor = EmployeesInteractor()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor  = interactor
        interactor.presenter = presenter

        return view
    }
}
