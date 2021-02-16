//
//  FirstRouter.swift
//  First
//
//  Created by Luna Graysen on 2021-01-19.
//

import Foundation
import UIKit

final class FirstRouter: RouterInterface {

    weak var presenter: FirstPresenterRouterInterface!

    weak var viewController: UIViewController?
}

extension FirstRouter: FirstRouterPresenterInterface {
    func handleButtonPressed(pangram: String) {
        let secondModule = SecondModule().build(pangram: pangram)
        viewController?.navigationController?.pushViewController(secondModule, animated: true)
    }
    

}
