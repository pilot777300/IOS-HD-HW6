//
//  FeedCoordinator.swift
//  NavigTest
//


import Foundation
import UIKit


class FeedCoordinator: Coordinator {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let searchViewController = FeedViewController()
        searchViewController.coordinator = self
        navigationController?.pushViewController(searchViewController, animated: false)
    }
        
}
