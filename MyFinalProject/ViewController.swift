//
//  ViewController.swift
//  MyFinalProject
//
//  Created by Halyson Ribeiro Pessoa on 10/01/2019.
//  Copyright © 2019 Halyson Ribeiro Pessoa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtLogin: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!

    var onboardingViewController: UIViewController?

    var autentication: AutenticationModel!
    
    var userTypeEnum = UserTypeEnumeration.Invalid
    
    var listOnboard:Array<String> = []
    
    var onboardModel = OnboardingModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        autentication = AutenticationModel()
        //Lista o Onboarding apenas na Instalacao
        if onboardModel.list().count == 0 {
            inflateOnboarding()
            onboardModel.insert("S")
        }
    }
    /*
     * Inicializa O storyBoard Onboarding
     */
    func inflateOnboarding(){
        if let viewController = UIStoryboard(name: "Onboarding", bundle: nil).instantiateInitialViewController() as? OnboardingViewController {
            present(viewController, animated: true, completion: nil)
        }
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let listMemberView = segue.destination as! ListMemberTableViewController
        listMemberView.userTypeEnum = self.userTypeEnum
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if let login = self.txtLogin.text,
            let password = self.txtPassword.text {
        
            self.userTypeEnum = autentication.validarLogin(login, password)
            
            return autentication.isUserValid(userTypeEnum)
    }
        return false
    }
}

