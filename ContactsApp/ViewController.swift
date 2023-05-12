//
//  ViewController.swift
//  ContactsApp
//
//  Created by Khắc Hùng on 11/05/2023.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    @IBOutlet weak var tblContacts: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var txtSearch: UITextField!
    var danhBa: [LienHe] = []
    var filteredData: [LienHe]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initData()
        filteredData = danhBa
        
    }
    func initData() {
        let lienHe1 = LienHe(id: 1, name: "Hung", phoneNumber: "123")
        danhBa.append(lienHe1)
        
        let lienHe2 = LienHe(id: 2, name: "Duan", phoneNumber: "234")
        danhBa.append(lienHe2)
        
        let lienHe3 = LienHe(id: 3, name: "Hoang", phoneNumber: "345")
        danhBa.append(lienHe3)
        
        let lienHe4 = LienHe(id: 4, name: "Linh", phoneNumber: "456")
        danhBa.append(lienHe4)
        
        let lienHe5 = LienHe(id: 5, name: "Phuong", phoneNumber: "567")
        danhBa.append(lienHe5)
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblContacts.dequeueReusableCell(withIdentifier: "ContactsIdentifier")!
        
        let currentContact = filteredData[indexPath.row]
        let lblContactName = cell.viewWithTag(101) as! UILabel
        lblContactName.text = currentContact.name
        
        let lblContactPhone = cell.viewWithTag(102) as! UILabel
        lblContactPhone.text = currentContact.phoneNumber
        
        return cell
        
    }

    @IBAction func btnDeleteContacts(_ sender: UIButton) {

        for (index, contact) in danhBa.enumerated().reversed() {
            if contact.id % 2 == 0 {
                danhBa.remove(at: index)
            }
        }
        tblContacts.reloadData()
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        danhBa.remove(at: indexPath.row)
        tblContacts.reloadData()
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        if searchText == "" {
            filteredData = danhBa
        }
    
        for word in danhBa {
            if word.name.uppercased().contains(searchText.uppercased()) {
                filteredData.append(word)
            }
        }
        tblContacts.reloadData()
        
    }
    
}



struct LienHe {
    var id: Int
    var name: String
    var phoneNumber: String
}

