

import Foundation
import UIKit

protocol ProfileFlow: AnyObject {
    func coordinateToDetail()
    func openPhotosViewController()
}

class ProfileCoordinator: Coordinator, ProfileFlow {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let profileViewController = ProfileViewController()
        profileViewController.coordinator = self
        
        navigationController?.pushViewController(profileViewController, animated: false)
    }
 
    func coordinateToDetail() {
        let photosCoordinator = PhotosCoordinator(navigationController: navigationController!)
        coordinate(to: photosCoordinator)
    }
    
    func openPhotosViewController() {
        let photosViewController = PhotosViewController()
        navigationController?.pushViewController(photosViewController, animated: true)
    }
    
}
