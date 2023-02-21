

import Foundation
import UIKit

protocol StartFlow: AnyObject {
    func coordinateToTabBar()
    func openProfileViewController()
}

class LoginCoordinator: Coordinator, StartFlow {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let startViewController = LogInViewController()
        startViewController.coordinator = self
        navigationController.pushViewController(startViewController, animated: true)
    }
    
    func coordinateToTabBar() {
        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
        coordinate(to: tabBarCoordinator)
    }
    
    func openProfileViewController() {
        let profileViewController = ProfileViewController()
        navigationController.pushViewController(profileViewController, animated: true)
    }
}
