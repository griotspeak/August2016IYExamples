//
//  RegistrationViewController.swift
//  Checkmate
//
//  Created by TJ Usiyan on 2016/05/10.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    @IBOutlet var givenNameField: UITextField!
    @IBOutlet var familyNameField: UITextField!
    @IBOutlet var skillsTextField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var passwordConfirmationField: UITextField!

    var delegate: UserAuthViewControllerDelegate?

    var registrationRequest: Registration.Request? {
        guard let email = emailField?.text,
        let password = passwordField?.text,
        let confirmed = passwordConfirmationField?.text,
        let givenName = givenNameField?.text,
        let familyName = familyNameField?.text,
        let skillsString = skillsTextField?.text,
        !email.isEmpty,
        !password.isEmpty,
        !confirmed.isEmpty,
        !givenName.isEmpty,
        !familyName.isEmpty,
        !skillsString.isEmpty,
        password == confirmed else {
            return nil
        }

        return Registration.Request(givenName: givenName, familyName: familyName, password: password, skills: skillsString.components(separatedBy: User.skillsSeparator), email: email)
    }
    func presentErrorAlert() {
        Checkmate.presentErrorAlert(title: "Error", message: "Please check provided information and try again", from: self)
    }


    @IBAction func register(_ sender: AnyObject) {
        guard let regReq = registrationRequest else {
            presentErrorAlert()
            return
        }

        let session = URLSession(configuration: CheckmateAPI.sessionConfig)
        let method = CheckmateAPI.Method.register
        var request = URLRequest(url: method.url)
        request.httpMethod = "POST"
        request.httpBody = try! regReq.jsonData()

        session.dataTask(with: request) { (optData, optResponse, optError) in
            OperationQueue.main.addOperation {
                guard let data = optData else {
                    self.presentErrorAlert()
                    return
                }
                switch Registration.Response.Result(data: data) {
                case let .success(user):
                    self.delegate?.loginViewController(self, successfullyAuthenticated: user)
                case .failure:
                    self.presentErrorAlert()
                }
            }
            }.resume()


    }

}
