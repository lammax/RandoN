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

import UIKit

protocol GenerateSceneDisplayLogic: class {
    func displaySomething(viewModel: GenerateScene.Something.ViewModel)
}

class GenerateSceneViewController: UIViewController {
    var interactor: GenerateSceneBusinessLogic?
    var router: (NSObjectProtocol & GenerateSceneRoutingLogic & GenerateSceneDataPassing)?

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
        doSomething()
    }

    // MARK: Do something

    //@IBOutlet weak var nameTextField: UITextField!

    func doSomething() {
        let request = GenerateScene.Something.Request()
        interactor?.doSomething(request: request)
    }

}

extension GenerateSceneViewController: GenerateSceneDisplayLogic {
    
    func displaySomething(viewModel: GenerateScene.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }

}
