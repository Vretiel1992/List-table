//
//  EmployeesInteractor.swift
//  TestTaskAvito
//
//  Created by Антон Денисюк on 08.11.2022.
//

import UIKit

protocol EmployeesInteractorInput: AnyObject {
    func provideCompanyData()
}

protocol EmployeesInteractorOutput: AnyObject {
    func didFetchCompany(with result: Result<CompanyModel, Error>)
}

// MARK: - EmployeesInteractorInput

class EmployeesInteractor: EmployeesInteractorInput {
    weak var presenter: EmployeesInteractorOutput?

    func provideCompanyData() {
        guard let url = URL(
            string: "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c"
        ) else { return }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            if let error = error {
                if error.isNoInternetConnectionError {
                    self?.presenter?.didFetchCompany(with: .failure(FetchError.noInternetConnection))
                } else {
                    self?.presenter?.didFetchCompany(with: .failure(FetchError.unknown))
                }
                return
            }
            guard let data = data else {
                self?.presenter?.didFetchCompany(with: .failure(FetchError.unknown))
                return
            }

            do {
                let entities = try JSONDecoder().decode(CompanyModel.self, from: data)
                self?.presenter?.didFetchCompany(with: .success(entities))
            } catch {
                self?.presenter?.didFetchCompany(with: .failure(FetchError.unknown))
            }
        }
        task.resume()
    }
}
