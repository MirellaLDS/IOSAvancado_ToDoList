//
//  OnboardingCollectionViewController.swift
//  MyFinalProject
//
//  Created by Halyson Ribeiro Pessoa on 05/02/2019.
//  Copyright © 2019 Halyson Ribeiro Pessoa. All rights reserved.
//

import UIKit

struct OnboardingCollectionViewCellModel {
    var title: String?
    var image: String?
    
    init(title: String, image: String) {
        self.title = title
        self.image = image
    }
}

class OnboardingCollectionViewCell: UICollectionViewCell {


    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    var model: OnboardingCollectionViewCellModel?
    
    //Nao usado ainda
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func populateOnboarding(model: OnboardingCollectionViewCellModel) {
        self.model = model
        titleLabel.text = model.title
        
        if let image = model.image {
            backgroundImage.image = UIImage(named: image)
        }
    }
    
}
