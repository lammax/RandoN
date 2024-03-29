//
//  GenerateSceneViewController.swift
//  RandoN
//
//  Created by Mac on 03/06/2019.
//  Copyright (c) 2019 Lammax. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
// TODO:
// - disperse logic through architecture

import UIKit

protocol GenerateSceneDisplayLogic: class {
    func displayUnique(viewModel: GenerateScene.Unique.ViewModel)
    func displayNumbers(viewModel: GenerateScene.Numbers.ViewModel)
}

class GenerateSceneViewController: UIViewController {
    var interactor: GenerateSceneBusinessLogic?
    var router: (NSObjectProtocol & GenerateSceneRoutingLogic & GenerateSceneDataPassing)?
    
    var isUnique: Bool = true

    @IBOutlet weak var resultTextField: UITextField!
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var toTextField: UITextField!
    @IBOutlet weak var numbersCountTextField: UITextField!
    
    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup

    private func setup() {
        GenerateSceneConfigurator.sharedInstance.configure(viewController: self)
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    @IBAction func calculateButtonClicked(_ sender: UIButton) {
        self.calcNumbers()
    }
    
    @IBAction func uniqueNumbersSwitchChanged(_ sender: UISwitch) {
        self.saveUnique(isUnique: sender.isOn)
    }
    // MARK: Do life

    private func setupView() {
        self.hideKeyboardWhenTappedAround()
    }
    
    private func saveUnique(isUnique: Bool) {
        let request = GenerateScene.Unique.Request(isUnique: isUnique)
        self.interactor?.saveUnique(request: request)
    }

    private func calcNumbers() {
        let maybeFrom = fromTextField.text
        let maybeTo = toTextField.text
        let maybeNums = numbersCountTextField.text

        let request = GenerateScene.Numbers.Request(maybeFrom: maybeFrom, maybeTo: maybeTo, maybeNums: maybeNums)
        self.interactor?.calcNumbers(request: request)
    }
    
}

extension GenerateSceneViewController: GenerateSceneDisplayLogic {
    
    func displayUnique(viewModel: GenerateScene.Unique.ViewModel) {
        self.calcNumbers()
    }
    
    func displayNumbers(viewModel: GenerateScene.Numbers.ViewModel) {
        DispatchQueue.main.async {
            self.resultTextField.text = viewModel.numbersString
        }
    }

}
