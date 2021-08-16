//
//  TabBarViewController.swift
//  TikTok-UIKit
//
//  Created by PROGRAMAR on 21/05/21.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpControllers()
        // Do any additional setup after loading the view.
    }
    
    private func setUpControllers(){
        let home = HomeViewController()
        let explore = ExploreViewController()
        let camera = CameraViewController()
        let notificatons = NotificationsViewController()
        let profile = ProfileViewController(user: User(username: "Otro usuario", profilePictureURL: nil, identifier: UUID().uuidString))
//        
//        home.title = "Home"
//        explore.title = "Explore"
        notificatons.title = "Notifications"
        profile.title = "Profile"
            
        
        let nav1 = UINavigationController(rootViewController: home)
        let nav2 = UINavigationController(rootViewController: explore)
        let nav3 = UINavigationController(rootViewController: notificatons)
        let nav4 = UINavigationController(rootViewController:profile)
        
        nav1.navigationBar.backgroundColor = .clear
        nav1.navigationBar.setBackgroundImage(UIImage(), for: .default)
        nav1.navigationBar.shadowImage = UIImage()
        
        nav1.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "safari"), tag: 1)
        nav3.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "bell"), tag: 1)
        nav4.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person.circle"), tag: 1)
        camera.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "camera"), tag: 1)
        
        
        setViewControllers([nav1,nav2,camera,nav3,nav4], animated: true)
            
    }

}
