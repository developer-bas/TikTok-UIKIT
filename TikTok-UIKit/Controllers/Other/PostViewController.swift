//
//  PostViewController.swift
//  TikTok-UIKit
//
//  Created by PROGRAMAR on 22/05/21.
//

import UIKit

class PostViewController: UIViewController {

     let model : PostModel
    
    init(model: PostModel){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder:NSCoder){
    fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let colos: [UIColor] = [.red,.darkGray,.green,.cyan,.orange, .brown,.gray,.yellow,.blue,.black,.systemPink]
        
        view.backgroundColor = colos.randomElement()
    }
  

}
