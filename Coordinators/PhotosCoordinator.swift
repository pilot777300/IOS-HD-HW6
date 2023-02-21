//
//  PhotosCoordinator.swift


import Foundation
import UIKit

class PhotosCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let topRatedDetailViewController = PhotosViewController()
        topRatedDetailViewController.coordinator = self
        navigationController.present(topRatedDetailViewController, animated: true, completion: nil)
    }

  }
