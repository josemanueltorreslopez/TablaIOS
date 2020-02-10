//
//  VCDatosJuegos.swift
//  swiftconnectfirebase
//
//  Created by Antonio y Jose on 05/02/2020.
//  Copyright © 2020 Antonio y Jose. All rights reserved.
//
import UIKit

class VCDatosJuegos: UIViewController{
    
    @IBOutlet weak var lb_Titulo: UILabel!
    @IBOutlet weak var lb_PEGI: UILabel!
    @IBOutlet weak var lb_Valoracion: UILabel!
    @IBOutlet weak var txa_Sinopsis: UITextView!
    @IBOutlet weak var lb_Distribuidora: UILabel!
    
    var titulo = ""
    var sinopsis = ""
    var pegi = 0
    var valoracion = 0
    var distribuidor = ""
    var key = ""
    
    override func viewDidLoad() {
            super.viewDidLoad()
        txa_Sinopsis.layer.borderWidth = 1.0
        txa_Sinopsis.layer.borderColor = UIColor.gray.cgColor
        
        lb_Titulo.text = titulo
        lb_PEGI.text = "PEGI: " + String(pegi)
        lb_Valoracion.text = "Valoracion: " + String(valoracion)
        txa_Sinopsis.text = sinopsis
        lb_Distribuidora.text = distribuidor
    }
}
