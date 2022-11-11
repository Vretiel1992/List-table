//
//  Interactor.swift
//  TestTaskAvito
//
//  Created by Антон Денисюк on 08.11.2022.
//

import Foundation

// object
// protocol
// reference presenter

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }

    func getUsers()
}

// MARK: - AnyInteractor

class EmployeeInteractor: AnyInteractor {
    var presenter: AnyPresenter?

    func getUsers() {
        print("start fetching")
        guard let url = URL(string: "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data = data, error == nil else {
                    self?.presenter?.interactorDidFetchCompany(with: .failure(FetchError.failed)) //обработка ошибок
                    return
                }
                
                do {
                    let entities = try JSONDecoder().decode(ViewModel.self, from: data)
                    self?.presenter?.interactorDidFetchCompany(with: .success(entities))
                }
                catch {
                    print(error)
                    self?.presenter?.interactorDidFetchCompany(with: .failure(error)) //обработка ошибок
                }
            }
        task.resume()
    }
}
