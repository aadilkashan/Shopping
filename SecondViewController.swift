//
//  SecondViewController.swift
//  
//
//  Created by Apple on 17/04/18.
//

import UIKit
import CoreData

class SecondViewController:
UIViewController,UITableViewDelegate,UITableViewDataSource {
    var rows1 = [ShoppingInventory]()
    @IBOutlet weak var myTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        cell.itemName.text = rows1[indexPath.row].itemName
        cell.Quantity.text = String(rows1[indexPath.row].quantity)
        cell.totalPrice.text = String(rows1[indexPath.row].quantity * rows1[indexPath.row].costPerItem)
        cell.Quantity.textAlignment = .center
        cell.totalPrice.textAlignment = .center
        print("test")
        return cell
       // myTableView.reloadData()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            let appDel = UIApplication.shared.delegate as! AppDelegate
            let context = appDel.persistentContainer.viewContext
            let contextObj = rows1[indexPath.row]
            appDel.persistentContainer.viewContext.delete(contextObj)
            rows1.remove(at: indexPath.row)
            
            tableView.reloadData()
            appDel.saveContext()
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Item Name \t\t\t\tQuantity \tPrice"
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
