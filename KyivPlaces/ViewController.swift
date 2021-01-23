//
//  ViewController.swift
//  KyivPlaces
//
//  Created by MacBook on 19.01.2021.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
   
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    



    @IBAction func goToMapView(_ sender: UIButton) {
    
        emptyLoginFieldMessage()
    
        let mapVC = self.storyboard?.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        mapVC.navigationItem.title = emailTextField.text
        self.navigationController?.pushViewController(mapVC, animated: true)
    }
    
   private func emptyLoginFieldMessage(){
   
    if emailTextField.isEmpty || passwordTextField.isEmpty {
            let message = "Fields can't be empty"
            let alert = UIAlertController(title: "ERROR", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    
}

extension UITextField {
    var isEmpty:Bool {
        if text == "" || text == "Enter Email" || text == "Enter Password"{
            return true
        }
        return false
    }
   
}



