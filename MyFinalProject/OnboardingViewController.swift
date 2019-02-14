//
//  OnboardingViewController.swift
//  MyFinalProject
//
//  Created by Halyson Ribeiro Pessoa on 05/02/2019.
//  Copyright © 2019 Halyson Ribeiro Pessoa. All rights reserved.
//

import Foundation
import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var positionCell = 0
    
    var datasource = [
        OnboardingCollectionViewCellModel(title: "This aplication has Login", image: "background4"),
        OnboardingCollectionViewCellModel(title: "Click ADD for add new member", image: "background4"),
        OnboardingCollectionViewCellModel(title: "Upside Down for closed Onboarding", image: "background4")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        
        myCollectionView.register(UINib(nibName: "OnboardingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OnboardingCollectionViewCell")
        myCollectionView.isPagingEnabled = true
        
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(aplicarGesture))
        gesture.direction = .down
        view.addGestureRecognizer(gesture)
        //        configureButton()
    }
    
    @objc func aplicarGesture(){
        if(positionCell == datasource.count-1){
            dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Or to rotate and lock
        OrientationUtil.lockOrientation(.portrait, andRotateTo: .portrait)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Don't forget to reset when view is being removed
        OrientationUtil.lockOrientation(.all)
    }
}


extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as! OnboardingCollectionViewCell
        let row = indexPath.row
        positionCell = row
        cell.populateOnboarding(model: datasource[row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
