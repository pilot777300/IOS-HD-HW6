
import Foundation
import UIKit

class TabBarCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let tabBarController = TabBarController()
        tabBarController.coordinator = self
        
        let profileNavigationController = UINavigationController()
        profileNavigationController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.circle"), tag: 0)
        let profileCoordinator = ProfileCoordinator(navigationController: profileNavigationController)
        
        let feedNavigationController = UINavigationController()
        feedNavigationController.tabBarItem = UITabBarItem(title: "Игра", image: UIImage(systemName: "doc.richtext"), tag: 0)
        let feedCoordinator = FeedCoordinator(navigationController: feedNavigationController)
        
        tabBarController.viewControllers = [profileNavigationController,
                                            feedNavigationController]
                                         
        tabBarController.modalPresentationStyle = .fullScreen
        navigationController.present(tabBarController, animated: true, completion: nil)
        
        coordinate(to: profileCoordinator)
        coordinate(to: feedCoordinator)
    }
}
