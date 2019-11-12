//
//  SearchViewController.swift
//  RutasCU
//
//  Created by 2020-1 on 11/12/19.
//  Copyright © 2019 UltaCode. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    
    var locationName: [Location] = [Location]()
    @IBOutlet weak var tabla: UITableView!
    let searchBarController = UISearchController (searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabla.dataSource = self
        tabla.dataSource = self
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchBarController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchBarController.searchBar.delegate = self
        searchBarController.dimsBackgroundDuringPresentation = false
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        let name = locationName[indexPath.row]
        cell.textLabel!.text = "\(name)"
       // cell.imageView!.image =
        return cell
    }
    
   func getName (){
        let path = Bundle.main.path(forResource: "LocationData", ofType: "json")
        let jsonData = NSData(contentsOfFile: path!)
        let location = try! JSONDecoder().decode([Location].self, from: jsonData! as Data)
        for cont in location{
            let nombre = cont.name
            //self.locationName.append("\(nombre)")
            }
    
    }
    
    
    
    
}
