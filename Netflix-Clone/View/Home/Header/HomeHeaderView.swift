//
//  HomeHeaderView.swift
//  Netflix-Clone
//
//  Created by Joao Matheus on 05/05/22.
//

import UIKit

class HomeHeaderView: UIView {

    private let downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "batmanPoster")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerImageView)
        addGradient()
        addSubview(playButton)
        addSubview(downloadButton)
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headerImageView.frame = bounds
    }
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor,
                                UIColor.systemBackground.cgColor]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    private func applyConstraints() {
        let playButtonConstraints = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 90),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60),
            playButton.widthAnchor.constraint(equalToConstant: 110)
        ]
        
        let downloadConstraints = [
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -90),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60),
            downloadButton.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let allConstraints = [
            playButtonConstraints,
            downloadConstraints
        ]
        
        allConstraints.forEach { constraints in
            NSLayoutConstraint.activate(constraints)
        }
    }
    
}
