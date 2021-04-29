//
//  ViewController.swift
//  SignUp
//
//  Created by HOONHA CHOI on 2021/03/29.
//

import UIKit
import Combine

class ViewController: BaseViewController {

    @IBOutlet weak var idStackView: SignUpStackView!
    @IBOutlet weak var passwordStackView: SignUpStackView!
    @IBOutlet weak var passwordConfirmStackView: SignUpStackView!
    @IBOutlet weak var nameStackView: SignUpStackView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    private var cancellable = Set<AnyCancellable>()
    private var viewModel = SignUpViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBind()
    }
    
    func configureBind() {

        idStackView.textField.textPublisher.assign(to: &viewModel.idViewModel.$idText)
        passwordStackView.textField.textPublisher.assign(to: &viewModel.passwordViewModel.$passwordText)
        passwordConfirmStackView.textField.textPublisher
            .assign(to: &viewModel.passwordViewModel.$passwordConfirmText)
        nameStackView.textField.textPublisher
            .assign(to: &viewModel.nameViewModel.$nameText)
        
        viewModel.isIdMatchValid.sink { state in
            self.idStackView.updateUI(state.message, state.isValid())
        }.store(in: &cancellable)
        
        viewModel.isPasswordValid.sink { state in
            self.passwordStackView.updateUI(state.message, state.isValid())
        }.store(in: &cancellable)

        viewModel.isMatchPasswordValid.sink { state in
            self.passwordConfirmStackView.updateUI(state.message, state.isValid())
        }.store(in: &cancellable)
        
        viewModel.isNameValid.sink { state in
            self.nameStackView.updateUI(state.message, state.isValid())
        }.store(in: &cancellable)
        
        viewModel.isInputValid.receive(on: RunLoop.main)
            .assign(to: \.isEnabled, on: nextButton)
            .store(in: &cancellable)
    }
}



