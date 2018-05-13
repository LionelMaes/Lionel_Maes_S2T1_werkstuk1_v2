//
//  ViewController.swift
//  Lionel_Maes_S2T1_werkstuk1
//
//  Created by MAES Lionel (s) on 27/04/2018.
//  Copyright © 2018 MAES Lionel (s). All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
  
        var personList = [Person]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let Tanguy_Cosyns = Person(name: "Tanguy Cosyns", lat: 50.862437, lon: 4.312991, telefoon: "0485679953", image: UIImage(named: "Tanguy Cosyns")!,club:"Daring")
        personList.append(Tanguy_Cosyns)
        let Tom_Boon = Person(name: "Tom Boon", lat: 50.794419, lon: 4.379979, telefoon: "0465923359", image: UIImage(named: "Tom Boon")!,club:"Racing")
        let Dom_Uher = Person(name: "Dominic Uher", lat: 51.284635, lon: 4.488290, telefoon: "0475369859", image: UIImage(named: "Dominic Uher")!,club:"Heracles")
        personList.append(Tom_Boon)
        personList.append(Dom_Uher)
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! CustomTableViewCell
        
        cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
        
        cell.lblPerson.text = personList[indexPath.row].name
        cell.imgPerson.image = personList[indexPath.row].image
        
        cell.imgPerson.layer.cornerRadius = cell.imgPerson.layer.frame.height / 2
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedInex = indexPath.row
        
        performSegue(withIdentifier: "detailMap", sender: self)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MapDetailViewController{
            destination.person = personList[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
}

