//
//  PhishingViewController.swift
//  DVIA-v2
//
//  Created by Prateek Gianchandani on 17/03/18.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//

import UIKit

class PhishingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //Bug Fix if view goes under the navigation bar
        self.edgesForExtendedLayout = []
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage(named: "menu.png"), for: UIControlState.normal)
        button.addTarget(self, action: #selector(menuTapped(_:)), for: UIControlEvents.touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 28, height: 28)
        button.widthAnchor.constraint(equalToConstant: 28).isActive = true
        button.heightAnchor.constraint(equalToConstant: 28).isActive = true
        let barButton = UIBarButtonItem(customView: button)
        //assign button to navigationbar
        self.navigationItem.leftBarButtonItem = barButton
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func menuTapped(_ sender: Any) {
        mainViewController?.toogle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "Phishing"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.navigationItem.title = " "
    }

    @IBAction func phishingPopup1Tapped(_ sender: Any) {
        let alert = UIAlertController(title: "Sign In to iTunes Store", message: "To continue, enter the password for \"test123@gmail.com\"", preferredStyle: UIAlertControllerStyle.alert)
        alert.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "Password"
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Sign In", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)


    }
    
    @IBAction func phishingPopup2Tapped(_ sender: Any) {
        let alert = UIAlertController(title: "Sign-In Required", message: "Sign In to manage your account.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "Password"
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Sign In", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func phishingPopup3Tapped(_ sender: Any) {
    let alertController = UIAlertController(title: "Sign In to iTunes store", message: "To continue, enter the password for your Apple ID 'test123@gmail.com'.", preferredStyle: UIAlertControllerStyle.alert)
    alertController.addTextField { (textField : UITextField) -> Void in
    textField.isSecureTextEntry = true
    textField.placeholder = "Password"
    }
    let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
    }
    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
        
        let alert = UIAlertController(title: "Oops!!", message: "This was a phishing attempt, be careful of such alerts generated from within apps.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    alertController.addAction(cancelAction)
    alertController.addAction(okAction)
    self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
