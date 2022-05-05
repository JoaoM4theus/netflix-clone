//
//  HomeHeaderView.swift
//  Netflix-Clone
//
//  Created by Joao Matheus on 05/05/22.
//

import UIKit

class HomeHeaderView: UIView {

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
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headerImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
}
