//
//  BirthDateTextField.swift
//  SignUp
//
//  Created by HOONHA CHOI on 2021/04/01.
//

import UIKit

class BirthDateTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(datePicker : BirthDatePicker , toolbar : UIToolbar) {
        self.inputView = datePicker
        self.inputAccessoryView = toolbar
    }
    
    func setDateText(_ birthDateText : String) {
        self.text = birthDateText
    }
}
