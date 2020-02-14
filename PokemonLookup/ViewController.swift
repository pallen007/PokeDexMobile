//
//  ViewController.swift
//  PokemonLookup
//
//  Created by admin on 2/14/20.
//  Copyright © 2020 HolyDiver. All rights reserved.
//

import UIKit
import WebKit

struct PokeDB : Codable {
    var count = 0
    var results : [pokeEntry]?
}

struct pokeEntry : Codable {
    var name : String = ""
    var url: URL?
    
    var pokeNum : String {
        return url?.lastPathComponent ?? ""
    }
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var dexDirectory: UITableView!
    var items : PokeDB?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "directoryCell", for: indexPath)
        
        let cellInfo = items!.results![indexPath.row]
        cell.textLabel?.text = cellInfo.name
        cell.detailTextLabel?.text = cellInfo.pokeNum
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "entryCell" {
            let row = dexDirectory.indexPathForSelectedRow!.row
            if let vc = segue.destination as? PokedexDetailViewController {
                vc.pokeUrl = items!.results![row].url!
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchEntries()
    }
    
    // fetch list of all pokemon and cache list with urls
    func fetchEntries() {
        let urlString = URL.init(string: "https://pokeapi.co/api/v2/pokemon/?limit=964")
        let task = URLSession.shared.dataTask(with: urlString!) { (data, response, error) in
            guard let dataUnwrapped = data else {return}
            self.items = try? JSONDecoder().decode(PokeDB.self, from: dataUnwrapped)
            DispatchQueue.main.async {
                self.dexDirectory.reloadData()
            }
        }
        task.resume()
        
        
        
    }

    // https://pokeapi.co/docs/v2.html/#pokemon

}

