//
//  PrivateDataViewController.swift
//  SignUp
//
//  Created by HOONHA CHOI on 2021/04/01.
//

import UIKit
import Combine

class PrivateDataViewController: BaseViewController {

    @IBOutlet weak var birthDateTextField: BirthDateTextField!
    @IBOutlet weak var emailStackView: SignUpStackView!
    @IBOutlet weak var phoneStackView: SignUpStackView!
    @IBOutlet weak var nextButton: UIButton!
    
    private var birthDatePicker = BirthDatePicker()
    private let toolbar : UIToolbar = {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonTouched(_:)))
        toolBar.setItems([doneButton], animated: true)
        return toolBar
    }()
    
    private var cancellable = Set<AnyCancellable>()
    private var privateDataViewModel = PrivateDataViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        birthDateTextField.configure(datePicker: birthDatePicker, toolbar: toolbar)
        configureBind()
    }
    
    func configureBind() {
        birthDateTextField.publisher(for: \.text).assign(to: &privateDataViewModel.$birthDateText)
        emailStackView.textField.textPublisher.assign(to: &privateDataViewModel.emailViewModel.$emailText)
        phoneStackView.textField.textPublisher.assign(to: &privateDataViewModel.phoneViewModel.$phoneText)
                
        privateDataViewModel.isEmailMatchValid.sink { (state) in
            self.emailStackView.updateUI(state.message, state.isValid())
        }.store(in: &cancellable)
        
        privateDataViewModel.isPhoneMatchValid.sink { (state) in
            self.phoneStackView.updateUI(state.message, state.isValid())
        }.store(in: &cancellable)
        
        privateDataViewModel.isInputValid.receive(on: RunLoop.main)
            .assign(to: \.isEnabled, on: nextButton)
            .store(in: &cancellable)
    }
    
    @objc func doneButtonTouched(_ sender : UIBarButtonItem) {
        birthDateTextField.setDateText(birthDatePicker.date.conventString())
        self.view.endEditing(true)
    }
    
    @IBAction func goBackButtonTouched(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
