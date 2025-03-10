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
        
//        let tabBarAppearance = UITabBarAppearance()
//        tabBarAppearance.configureWithOpaqueBackground() // Elimina la translucidez
//        tabBarAppearance.backgroundColor = UIColor.white // Cambia el color de fondo
//        
//        tabBar.standardAppearance = tabBarAppearance
//        if #available(iOS 15.0, *) {
//            tabBar.scrollEdgeAppearance = tabBarAppearance
//        }
//        
//        let topBorder = CALayer()
//        topBorder.name = "topBorder"
//        topBorder.frame = CGRect(x: 0, y: 0, width: tabBar.bounds.width, height: 1)
//        topBorder.backgroundColor = UIColor.black.cgColor
//        
//        tabBar.layer.addSublayer(topBorder)
        
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
