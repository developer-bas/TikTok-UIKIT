//
//  PostViewController.swift
//  TikTok-UIKit
//
//  Created by PROGRAMAR on 22/05/21.
//

import UIKit
import AVFoundation


protocol PostViewControllerDelegate: AnyObject {
    func postViewController(_ vc: PostViewController,didTapCommentButtonFor post: PostModel)
    func postViewController(_ vc: PostViewController,didTapProfileButtonFor post: PostModel)
}


class PostViewController: UIViewController {

     var model : PostModel
    
    weak var delegate : PostViewControllerDelegate?
    
    private let likeButton : UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .white
        return button
    }()
    
    private let commentButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "text.bubble.fill"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .white
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .white
        return button
    }()
    
    private let profileButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "person.circle"), for: .normal)
        button.tintColor = .white
        button.layer.masksToBounds = true
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()
    
    private let captionalLabel : UILabel = {
       let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Checkout this video #hash #otherhash"
        label.font = .systemFont(ofSize: 25)
        label.textColor = .white
        return label
    }()
    
    var player : AVPlayer?
    private var playerDidFinishObserver: NSObjectProtocol?
    
    //MARK: - INIT
    init(model: PostModel){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder:NSCoder){
    fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVideo()
        let colos: [UIColor] = [.red,.darkGray,.green,.cyan,.orange, .brown,.gray,.yellow,.blue,.black,.systemPink]
        
        view.backgroundColor = colos.randomElement()
        
       setUpButtons()
        setUpDoubleTapToLike()
        view.addSubview(captionalLabel)
        view.addSubview(profileButton)
        profileButton.addTarget(self, action: #selector(didTapProfile), for: .touchUpInside)
      
    }
  

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let size: CGFloat = 40
        let yStart: CGFloat = view.height - (size * 4) - 30 - view.safeAreaInsets.bottom - (tabBarController?.tabBar.height ?? 0)
        for (index, button ) in [likeButton,commentButton,shareButton].enumerated() {
            button.frame = CGRect(x: view.width-size-10, y: yStart + (CGFloat(index)*10) + (CGFloat(index)*size), width: size, height: size)
        }
        
        captionalLabel.sizeToFit()
        let labelSize = captionalLabel.sizeThatFits(CGSize(width: view.width - size - 12, height: view.height))
        captionalLabel.frame = CGRect(x: 5, y: view.height - 10 - view.safeAreaInsets.bottom - labelSize.height - (tabBarController?.tabBar.height ?? 0), width: view.width - size - 12, height: labelSize.height)
        
        profileButton.frame = CGRect(x: likeButton.left, y: likeButton.top - 10 - size , width: size, height: size)
        profileButton.layer.cornerRadius = size / 2
    }
    
    func setUpButtons(){
        view.addSubview(likeButton)
        view.addSubview(commentButton)
        view.addSubview(shareButton)
        
        likeButton.addTarget(self, action: #selector(didTapLike), for: .touchUpInside)
        commentButton.addTarget(self, action: #selector(didTapComment), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(didTapShare), for: .touchUpInside)
    }
    
    @objc func didTapProfile(){
        delegate?.postViewController(self, didTapProfileButtonFor: model)
    }
    
    @objc private func didTapLike(){
        model.islikeByCurrentUser = !model.islikeByCurrentUser
        likeButton.tintColor = model.islikeByCurrentUser ? .systemRed : .white
    }
    @objc private func didTapComment(){
        
        delegate?.postViewController(self, didTapCommentButtonFor: model)
        
    }
    @objc private func didTapShare(){
        
        guard let url = URL (string: "https://www.tiktok.com") else {return}
        let vc = UIActivityViewController(
        activityItems: [url], applicationActivities: []
        )
        present(vc, animated: true)
    }
    
    private func configureVideo(){
        guard let path = Bundle.main.path(forResource: "pexels-roman-odintsov-6421805", ofType: "mp4") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        player = AVPlayer(url: url)
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(playerLayer)
        player?.volume = 0
        player?.play()
        
        guard let player = player else{return}
        
        playerDidFinishObserver = NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem,
            queue: .main, using: { _ in
                
                player.seek(to: .zero)
                player.play()
            })
    }
    func setUpDoubleTapToLike(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(didDoubleTap(_:)))
        tap.numberOfTapsRequired = 2
        view.addGestureRecognizer(tap)
        view.isUserInteractionEnabled = true
    }
    
    @objc private func didDoubleTap(_ gesture: UITapGestureRecognizer){
        if !model.islikeByCurrentUser{
            model.islikeByCurrentUser = true
        }
        
        let touchPoint = gesture.location(in: view)
        let imageView = UIImageView(image: UIImage(systemName: "heart.fill"))
        imageView.tintColor = .systemRed
       
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView.center = touchPoint
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0
        view.addSubview(imageView)
        
        UIView.animate(withDuration: 0.2) {
            imageView.alpha = 1
        } completion: {  done  in
            if done {
                DispatchQueue.main.async {
                    UIView.animate(withDuration: 0.3) {
                        imageView.alpha = 0
                    } completion: { done  in
                        if done{
                            imageView.removeFromSuperview()
                        }
                    }

                }
            }
        }

        }
        
    }
    

