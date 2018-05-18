//
//  ViewController.swift
//  GoShoppingEasy
//
//  Created by Apple on 17/04/18.
//  Copyright © 2018 tryCatch. All rights reserved.
//

import UIKit
import TextFieldEffects
var rows = [ShoppingInventory]()
var counter = 0
class ViewController: UIViewController,UITabBarDelegate {
    @IBOutlet var popUp: UIVisualEffectView!
    

    @IBOutlet weak var itemName: KaedeTextField!
    @IBOutlet weak var QuantityName: KaedeTextField!
    @IBOutlet weak var CostPerItem: KaedeTextField!
    @IBOutlet weak var TabBar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.TabBar.delegate = self
    }
    @IBAction func popupPress(_ sender: Any) {
        popUp.removeFromSuperview()
    }
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if TabBar.selectedItem?.tag == 0
        {
            itemName.text = ""
            QuantityName.text = ""
            CostPerItem.text = ""
        }
        else if TabBar.selectedItem?.tag == 1
        {
            if itemName.text == "" || CostPerItem.text == "" || QuantityName.text == ""
            {
                    popUp.center = self.view.center
                    self.view.addSubview(popUp)
            }else
            {
            let appDel = UIApplication.shared.delegate as! AppDelegate
            let context = appDel.persistentContainer.viewContext
            let data = ShoppingInventory(context : context)
            data.itemName = itemName.text
            data.costPerItem = Int64(CostPerItem.text!)!
            data.quantity = Int64(QuantityName.text!)!
            appDel.saveContext()
            counter += 1
            for item in rows{
                print("\(item.itemName ?? "") \(String(item.quantity) ?? "") \(String(item.costPerItem) ?? "")")
            }
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SecondView"
        {
            let appDel = UIApplication.shared.delegate as! AppDelegate
            let context = appDel.persistentContainer.viewContext
            do{
                rows = try context.fetch(ShoppingInventory.fetchRequest())
            }catch{
                print("failed fetching")
            }
            let controller = segue.destination as! SecondViewController
            controller.rows1 = rows
            print("working")
            
        }
    }
        // Do any additional setup after loading the view, typically from a nib.


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

