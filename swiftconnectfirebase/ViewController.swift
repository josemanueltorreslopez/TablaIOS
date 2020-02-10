//
//  ViewController.swift
//  swiftconnectfirebase
//
//  Created by Antonio y Jose on 23/01/2020.
//  Copyright © 2020 Antonio y Jose. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tabla: UITableView!
    
    var listaJuegos : Array<Videojuegos> = []
    static var videojuego = Videojuegos(titulo: "", sinopsis: "", pegi: 0, valoracion: 0, distribuidor: "", key: "")
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaJuegos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "juegos", for : indexPath) as! TableViewCell
        cell.lbJuegos?.text = listaJuegos[indexPath.row].titulo
        
        cell.videojuego = Videojuegos(titulo: listaJuegos[indexPath.row].titulo,
            sinopsis: listaJuegos[indexPath.row].sinopsis,
            pegi: listaJuegos[indexPath.row].pegi,
            valoracion: listaJuegos[indexPath.row].valoracion,
            distribuidor: listaJuegos[indexPath.row].distribuidor,
            key: listaJuegos[indexPath.row].key)
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ref = Database.database().reference().child("videojuegos")
        
        ref.observe(.value, with: { (snapshot) in
            self.listaJuegos = []
            
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                let videojuego = snap.value as! [String: Any]
                let titulo = videojuego["titulo"] as? String ?? ""
                let sinopsis = videojuego["sinopsis"] as? String ?? ""
                let pegi = videojuego["pegi"] as? Int ?? 0
                let valoracion = videojuego["valoracion"] as? Int ?? 0
                let distribuidor = videojuego["distribuidor"] as? String ?? ""
                let key = snap.key
                
                self.listaJuegos.append(
                    Videojuegos(
                        titulo: titulo,
                        sinopsis: sinopsis,
                        pegi: pegi,
                        valoracion: valoracion,
                        distribuidor: distribuidor,
                        key: key
                    )
                )
                
                self.tabla.reloadData()
            }
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "pasarDatos"){
            
            //print(ViewController.videojuego.titulo)
            let segundaVista = segue.destination as! VCDatosJuegos
            
            segundaVista.titulo = ViewController.videojuego.titulo
            segundaVista.sinopsis = ViewController.videojuego.sinopsis
            segundaVista.pegi = ViewController.videojuego.pegi
            segundaVista.valoracion = ViewController.videojuego.valoracion
            segundaVista.distribuidor = ViewController.videojuego.distribuidor
            segundaVista.key = ViewController.videojuego.key
            
        }
        
        if(segue.identifier == "pasarEdit"){
            let segundaVista = segue.destination as! EditJuego
            
            segundaVista.videojuego = ViewController.videojuego
        }
        
    }
    
}
