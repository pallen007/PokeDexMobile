//
//  PokedexDetailViewController.swift
//  PokemonLookup
//
//  Created by admin on 2/14/20.
//  Copyright © 2020 HolyDiver. All rights reserved.
//

import UIKit
import WebKit


class Pokemon {
    var name: String = ""
    var type: String = ""
    var type2: String = ""
    var descript: String = ""
    
    
}

class PokedexDetailViewController: UIViewController {

    var entry : Pokemon?
    var pokeUrl: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
