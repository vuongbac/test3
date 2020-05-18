//
//  DetailviewController.swift
//  App3
//
//  Created by Vương Toàn Bắc on 5/16/20.
//  Copyright © 2020 VTB. All rights reserved.
//

import UIKit


protocol DetailviewControllerDelegate: class {
    func changeData(_ cv2: ViewController , name:String , email:String , phone:String)
}
class DetailviewController: UIViewController {
    
    var data: DataJ?
    weak var delegate: DetailviewControllerDelegate?

    var Dname:String = ""
    var Dphone:String = ""
    var Demail:String = ""

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        tfName.text = Dname
        tfEmail.text = Demail
        tfPhone.text = Dphone
    }
    
    @IBAction func actionUpdate(_ sender: Any) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let cell =  Storyboard.instantiateViewController(withIdentifier: "controller") as! ViewController
        cell.name2 = String(tfName.text!)
        cell.phone2 = String(tfPhone.text!)
        cell.email2 = String(tfEmail.text!)
        self.present(cell, animated: true, completion: nil)
    }
    
    
    @IBAction func actionReset(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        let name = tfName.text ?? ""
        let email = tfEmail.text ?? ""
        let phone = tfPhone.text ?? ""
        data = DataJ(createdAt: "AS", name: name, email: email, phone: phone)
    }
    

}
