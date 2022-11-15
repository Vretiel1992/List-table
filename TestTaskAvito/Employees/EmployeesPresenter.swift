//
//  EmployeesPresenter.swift
//  TestTaskAvito
//
//  Created by Антон Денисюк on 08.11.2022.
//

import Foundation

enum FetchError: LocalizedError {
    case noInternetConnection
    case decode
    case unknown

    var errorDescription: String? {
        switch self {
        case .noInternetConnection:
            return "no Network"
        case .decode:
            return "decode error"
        case .unknown:
            return "unknown error"
        }
    }
}

// MARK: - EmployeesViewOutput

class EmployeesPresenter: EmployeesViewOutput {
    
    weak var view: EmployeesViewInput?
    var interactor: EmployeesInteractorInput?
    var router: EmployeesRouterInput?

    func viewDidLoad() {
        interactor?.provideCompanyData()
    }
}

extension EmployeesPresenter: EmployeesInteractorOutput {
    func didFetchCompany(with result: Result<CompanyModel, Error>) {
        switch result {
        case .success(let companyModel):
            view?.update(with: companyModel)
        case let .failure(error):
            view?.update(with: error.localizedDescription)
        }
    }
}
