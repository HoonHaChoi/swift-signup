//
//  BaseViewController.swift
//  SignUp
//
//  Created by HOONHA CHOI on 2021/04/01.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
}
