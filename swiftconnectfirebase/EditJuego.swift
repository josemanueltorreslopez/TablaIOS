//
//  AddJuego.swift
//  swiftconnectfirebase
//
//  Created by Antonio y Jose on 05/02/2020.
//  Copyright © 2020 Antonio y Jose. All rights reserved.
//

import UIKit
import FirebaseDatabase

class EditJuego: UIViewController{
    
    @IBOutlet weak var bt_Edit: UIButton!
    @IBOutlet weak var txf_Titulo: UITextField!
    @IBOutlet weak var txf_PEGI: UITextField!
    @IBOutlet weak var txf_Valoracion: UITextField!
    @IBOutlet weak var txf_Distribuidor: UITextField!
    @IBOutlet weak var txa_Sinopsis: UITextView!
    
    var videojuego = Videojuegos(titulo: "", sinopsis: "", pegi: 0, valoracion: 0, distribuidor: "", key: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txa_Sinopsis.layer.borderWidth = 1.0
        txa_Sinopsis.layer.borderColor = UIColor.gray.cgColor
        
    }
    
    @IBAction func edit(_ sender: Any) {
        if(!txf_Titulo.text!.isEmpty && !txf_PEGI.text!.isEmpty){
            let ref = Database.database().reference().child("videojuegos")
            
            ref.child(videojuego.key).updateChildValues([
                "titulo": txf_Titulo.text,
                "sinopsis": txa_Sinopsis.text,
                "pegi": txf_PEGI.text,
                "valoracion": txf_Valoracion.text,
                "distribuidor": txf_Distribuidor.text])
            
            _ = navigationController?.popViewController(animated: true)
        }
        
    }
}
