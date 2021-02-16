//
//  SecondModule.swift
//  Second
//
//  Created by Luna Graysen on 2021-01-19.
//
import Foundation
import UIKit

// MARK: - router

protocol SecondRouterPresenterInterface: RouterPresenterInterface {
    func handleBackButtonPressed()
}

// MARK: - presenter

protocol SecondPresenterRouterInterface: PresenterRouterInterface {

}

protocol SecondPresenterInteractorInterface: PresenterInteractorInterface {

}

protocol SecondPresenterViewInterface: PresenterViewInterface {
    var pangramString: String { get set }
    var pangramObject: Pangram? { get set }
    func handleBackButtonPressed()
    func checkPangram(string: String) -> Bool
    func start()
}

// MARK: - interactor

protocol SecondInteractorPresenterInterface: InteractorPresenterInterface {
    func persistToRealm(pangram: Pangram?)
}

// MARK: - view

protocol SecondViewPresenterInterface: ViewPresenterInterface {
    func updateLabel(pangram: String)
}


// MARK: - module builder

final class SecondModule: ModuleInterface {

    typealias View = SecondView
    typealias Presenter = SecondPresenter
    typealias Router = SecondRouter
    typealias Interactor = SecondInteractor

    func build(pangram: String) -> UIViewController {
        let view = View()
        let interactor = Interactor()
        let presenter = Presenter()
        let router = Router()

        self.assemble(view: view, presenter: presenter, router: router, interactor: interactor)
        presenter.pangramString = pangram
        
        router.viewController = view

        return view
    }
}
