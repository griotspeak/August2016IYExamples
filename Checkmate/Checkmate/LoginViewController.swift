//
//  LoginViewController.swift
//  Checkmate
//
//  Created by TJ Usiyan on 2016/05/10.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import UIKit

protocol UserAuthViewControllerDelegate {
    func loginViewController(_ controller: UIViewController, successfullyAuthenticated user: User)
}

internal func presentErrorAlert(title: String, message: String, from controller: UIViewController) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let dismissAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
    alertController.addAction(dismissAction)
    controller.present(alertController, animated: true, completion: nil)
}

final class LoginViewController : UIViewController {
    var delegate: UserAuthViewControllerDelegate?
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!

    var loginRequest: Login.Request? {
        guard let email = emailField?.text,
            let password = passwordField?.text,
            !email.isEmpty,
            !password.isEmpty else {
                return nil
        }

        return Login.Request(email: email, password: password)
    }

    func sendLoginRequest(email: String, password: String) {

    }

    func presentErrorAlert() {
        Checkmate.presentErrorAlert(title: "Error", message: "Please check credentials and try again.", from: self)
    }

    @IBAction func login(_ sender: AnyObject) {
        guard let loginReq = loginRequest else {
            presentErrorAlert()
            return
        }

        let session = URLSession(configuration: CheckmateAPI.sessionConfig)
        let method = CheckmateAPI.Method.login
        var request = URLRequest(url: method.url)
        request.httpMethod = "POST"
        request.httpBody = try! loginReq.jsonData()

        session.dataTask(with: request) { (optData, optResponse, optError) in
            OperationQueue.main.addOperation {
                guard let data = optData else {
                    self.presentErrorAlert()
                    return
                }
                switch Login.Response.Result(data: data) {
                case let .success(user):
                    self.delegate?.loginViewController(self, successfullyAuthenticated: user)
                case .failure:
                    self.presentErrorAlert()
                }
            }
            }.resume()
        
    }
    
    @IBOutlet var register: UIButton!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let registationVC = segue.destination as! RegistrationViewController
        registationVC.delegate = delegate
    }
}







