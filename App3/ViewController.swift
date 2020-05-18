//
//  ViewController.swift
//  App3
//
//  Created by Vương Toàn Bắc on 5/15/20.
//  Copyright © 2020 VTB. All rights reserved.
//

import UIKit

protocol ViewcontrollerDelegate: class {
    func changeBackgroundColor(_ color: UIColor?)
}

class ViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {
    var data:[DataJ] = []
    var loatData = LoadData()
    
    weak var delegate: ViewcontrollerDelegate?

    
    
    var name2:String = ""
    var phone2:String = ""
    var email2:String = ""
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(data.count)
        loatData.readJson { (data) in
            self.data = data ?? []
            self.tableView.reloadData()
        }
        
    }
    
    func changeData(_ color: UIColor?) {
        view.backgroundColor = color
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
        print(data.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let vc = data[indexPath.row]
        
        cell.lblName.text = vc.createdAt
        cell.lblEmail.text = vc.email
        cell.lblAc.text = vc.name
        cell.lblPhone.text = vc.phone
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let cell =  Storyboard.instantiateViewController(withIdentifier: "detail") as! DetailviewController
        let vc = data[indexPath.row]
        cell.Dname = vc.name ?? ""
        cell.Demail = vc.email ?? ""
        cell.Dphone = vc.phone ?? ""
        self.present(cell, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        guard let mealDetailViewController = segue.destination as? ViewController else {
            fatalError("Unexpected destination: \(segue.destination)")
        }
        
        guard let selectedMealCell = sender as? TableViewCell else {
            fatalError("Unexpected sender: \(sender)")
        }
        
        guard let indexPath = tableView.indexPath(for: selectedMealCell) else {
            fatalError("The selected cell is not being displayed by the table")
        }
        
        let selectedMeal = data[indexPath.row]
        mealDetailViewController.data = [selectedMeal]
        
    }
    
    func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? DetailviewController, let meal = sourceViewController.data {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing meal.
                data[selectedIndexPath.row] = meal
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
           
        }
    }
}





