//
//  AddJuego.swift
//  swiftconnectfirebase
//
//  Created by Antonio y Jose on 05/02/2020.
//  Copyright © 2020 Antonio y Jose. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AddJuego: UIViewController{
    
    @IBOutlet weak var bt_Add: UIButton!
    @IBOutlet weak var txf_Titulo: UITextField!
    @IBOutlet weak var txf_PEGI: UITextField!
    @IBOutlet weak var txf_Valoracion: UITextField!
    @IBOutlet weak var txf_Distribuidor: UITextField!
    @IBOutlet weak var txa_Sinopsis: UITextView!
    
    
    override func viewDidLoad() {
           super.viewDidLoad()
        txa_Sinopsis.layer.borderWidth = 1.0
        txa_Sinopsis.layer.borderColor = UIColor.gray.cgColor
    }
    
    @IBAction func Add(_ sender: Any) {
        if(!txf_Titulo.text!.isEmpty && !txf_PEGI.text!.isEmpty){
        let ref = Database.database().reference().child("videojuegos")
            
            let valoracion: Int = Int(txf_Valoracion.text!) ?? 0
            let pegi: Int = Int(txf_PEGI.text!) ?? 0
            
        ref.childByAutoId().setValue(["titulo": txf_Titulo.text, "sinopsis": txa_Sinopsis.text,
                                      "pegi": pegi,
                                      "valoracion": valoracion,
            "distribuidor": txf_Distribuidor.text])
        
        _ = navigationController?.popViewController(animated: true)
        }
    }
}

