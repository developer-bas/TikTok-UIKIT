//
//  CommentViewController.swift
//  TikTok-UIKit
//
//  Created by PROGRAMAR on 12/06/21.
//

import UIKit

protocol CommentsViewControllerDelegate: AnyObject {
    func didTapCloseForComments(with viewControler: CommentViewController)
}

class CommentViewController: UIViewController {

    private var post : PostModel
    
    weak var delegate : CommentsViewControllerDelegate?
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    init(post: PostModel){
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(didTapClose), for: .touchUpInside)
        view.backgroundColor = .white
        
        fetchPostComments()
        
        
    }
    
    @objc private func didTapClose(){
        delegate?.didTapCloseForComments(with: self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        closeButton.frame = CGRect(x: view.width - 60, y: 10, width: 50, height: 50)
        
    }

    func fetchPostComments() {
        
    }

}
