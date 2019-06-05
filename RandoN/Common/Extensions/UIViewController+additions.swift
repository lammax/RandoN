//
//  UIViewController+additions.swift
//  myPlace
//
//  Created by Mac on 08/11/2018.
//  Copyright © 2018 Unit. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboardView))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboardView() {
        view.endEditing(true)
    }
    
    func showAlertOK(alert: AlertMessage?) {
        if let alert = alert {
            showAlertOK(title: alert.title, message: alert.message)
        }
    }

    func showAlertOkCancel(alert: AlertMessage?, okCompletion: @escaping () -> Void) {
        if let alert = alert {
            showAlertOK(title: alert.title, message: alert.message, okCompletion: okCompletion)
        }
    }
    
    func showAlertOK(title: String, message: String, okCompletion: (() -> Void)? = nil) {

        let ac = UIAlertController(title: NSLocalizedString(title, comment: ""), message: NSLocalizedString(message, comment: ""), preferredStyle: .alert)

        let okAction = UIAlertAction(title: "OK", style: .default) { action in
            okCompletion?()
        }
        ac.addAction(okAction)

        if okCompletion != nil {
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            ac.addAction(cancelAction)
        }

        self.present(ac, animated: true, completion: nil)
    }
    
    func showAlert(with image: UIImage?) {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        alert.modalPresentationStyle = .overFullScreen
        //alert.view.frame = self.view.bounds
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        /*let size = self.view.bounds.size
        let imgViewTitle = UIImageView(frame: CGRect(x: 20, y: 20, width: size.width / 2, height: size.height / 2))
        imgViewTitle.image = image
        alert.view.addSubview(imgViewTitle)*/
        
        /*let width: NSLayoutConstraint = NSLayoutConstraint(item: alert.view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: size.width)
        let height: NSLayoutConstraint = NSLayoutConstraint(item: alert.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: size.height)
        alert.view.addConstraint(height)
        alert.view.addConstraint(width)*/
        
        alert.addImage(imageO: image)
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showErrorAlert(error: Error?) {
        if let error = error {
            let alert = AlertMessage(
                title: "Error",
                message: error.localizedDescription
            )
            self.showAlertOK(alert: alert)
        }
    }
    
    private class func storyboardInstancePrivate<T: UIViewController>() -> T? {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        return storyboard.instantiateInitialViewController() as? T
    }
    class func storyboardInstance() -> Self? {
        return storyboardInstancePrivate()
    }

}
