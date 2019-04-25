//
//  ViewController.swift
//  ColeccionDeJuegos
//
//  Created by MAC13 on 25/04/19.
//  Copyright © 2019 luis huarachi. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tableview: UITableView!
    var juegos :[Juego] = []
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            try juegos = context.fetch(Juego.fetchRequest())
            tableview.reloadData()
        }catch{
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return juegos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let juego = juegos[indexPath.row]
        cell.textLabel?.text = juego.titulo
        cell.imageView?.image = UIImage(data: (juego.imagen!))
        return cell
    }

}

