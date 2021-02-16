//
//  SecondRouter.swift
//  Second
//
//  Created by Luna Graysen on 2021-01-19.
//

import Foundation
import UIKit

final class SecondRouter: RouterInterface {
    weak var presenter: SecondPresenterRouterInterface!
    weak var viewController: UIViewController?
}

extension SecondRouter: SecondRouterPresenterInterface {
    func handleBackButtonPressed() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    

}
