//
//  TabController.swift
//  cine
//
//  Created by Angelo on 27/02/25.
//

import UIKit

class TabController: UITabBarController {
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
    }
    
    private func setupTabs() {
        
        let cartelera = self.createNav(with: "Cartelera", and: UIImage(systemName: "house"), vc: MoviesViewController())
        let tickets = self.createNav(with: "Tickets", and: UIImage(systemName: "house"), vc: MyTicketsViewController())
        
        self.setViewControllers([cartelera, tickets], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        
//        nav.viewControllers.first?.navigationItem.title = title + "Controller"
//        nav.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Button", style: .plain , target: nil, action: nil)
        nav.navigationBar.isHidden = true
        
        
        return nav
        
        
    }
}
