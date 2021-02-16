//
//  FirstModule.swift
//  First
//
//  Created by Luna Graysen on 2021-01-19.
//
import Foundation
import UIKit

// MARK: - router

protocol FirstRouterPresenterInterface: RouterPresenterInterface {
    func handleButtonPressed(pangram: String)
}

// MARK: - presenter

protocol FirstPresenterRouterInterface: PresenterRouterInterface {

}

protocol FirstPresenterInteractorInterface: PresenterInteractorInterface {
    func updateUI(with results: [Pangram])
}

protocol FirstPresenterViewInterface: PresenterViewInterface {
    func handleDeleteButtonPressed(deletionText: String)
    func handleButtonPressed(pangram: String)
    func start()
}

// MARK: - interactor

protocol FirstInteractorPresenterInterface: InteractorPresenterInterface {
    func handleDelete(deletionText: String)
    func fetch()
}

// MARK: - view

protocol FirstViewPresenterInterface: ViewPresenterInterface {
    func updateUI(with string: String)
}


// MARK: - module builder

final class FirstModule: ModuleInterface {

    typealias View = FirstView
    typealias Presenter = FirstPresenter
    typealias Router = FirstRouter
    typealias Interactor = FirstInteractor

    func build() -> UIViewController {
        let view = View()
        let interactor = Interactor()
        let presenter = Presenter()
        let router = Router()

        self.assemble(view: view, presenter: presenter, router: router, interactor: interactor)

        router.viewController = view

        return view
    }
}
