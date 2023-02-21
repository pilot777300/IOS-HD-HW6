//
//  PhotosCollectionViewCell.swift
//  NavigTest
//
//  Created by Mac on 16.09.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    lazy var backView: UILabel = {
        let bv = UILabel()
        bv.translatesAutoresizingMaskIntoConstraints = false
        bv.backgroundColor = .systemGray5
        bv.contentMode = .scaleToFill
        bv.layer.cornerRadius = 12
      return bv
    }()
    
    
    lazy var image: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        img.backgroundColor = .clear
        img.layer.cornerRadius = 12
       return img
   }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        addSubview(backView)
        backView.addSubview(image)
    }
    
    func setupConstraints() {
       
        NSLayoutConstraint.activate([
          
            backView.leftAnchor.constraint(equalTo: leftAnchor),
           backView.topAnchor.constraint(equalTo: topAnchor),
           backView.heightAnchor.constraint(equalTo: heightAnchor),
           backView.widthAnchor.constraint(equalTo: widthAnchor),
           
           image.leftAnchor.constraint(equalTo: backView.leftAnchor),
           image.topAnchor.constraint(equalTo: backView.topAnchor),
           image.heightAnchor.constraint(equalTo: backView.heightAnchor),
           image.widthAnchor.constraint(equalTo: backView.widthAnchor)
        
        ])
    }
}
