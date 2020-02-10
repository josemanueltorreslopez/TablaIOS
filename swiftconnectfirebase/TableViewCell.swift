//
//  TableViewCell.swift
//  swiftconnectfirebase
//
//  Created by Antonio y Jose on 23/01/2020.
//  Copyright © 2020 Antonio y Jose. All rights reserved.
//

import UIKit
import FirebaseDatabase

class TableViewCell: UITableViewCell {

    @IBOutlet weak var btInformacion: UIButton!
    @IBOutlet weak var bt_Delete: UIButton!
    @IBOutlet weak var lbJuegos: UILabel!
    
    var videojuego = Videojuegos(titulo: "", sinopsis: "", pegi: 0, valoracion: 0, distribuidor: "", key: "")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func pasarVideojuego(_ sender: Any) {
        
        ViewController.videojuego = videojuego
        
    }
    
    @IBAction func borrar(_ sender: Any) {
        let ref = Database.database().reference().child("videojuegos")
        ref.child(videojuego.key).removeValue()
        
    }
    
}
