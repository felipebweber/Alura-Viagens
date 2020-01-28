//
//  ViewController.swift
//  Alura Viagens
//
//  Created by Felipe Weber on 12/12/19.
//  Copyright © 2019 Felipe Weber. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tabelaViagens: UITableView!
    @IBOutlet weak var viewHoteis: UIView!
    @IBOutlet weak var viewPacotes: UIView!
    
//    let listaViagens: Array<String> = ["Rio de Janeiro", "Ceará", "São Paulo"]
    let listaViagens: Array<Viagem> = ViagemDAO().retornaTodasAsViagens()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tabelaViagens.dataSource = self
        self.tabelaViagens.delegate = self
        self.viewHoteis.layer.cornerRadius = 10
        self.viewPacotes.layer.cornerRadius = 10
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaViagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Quando se esta usando tableview customizada é preciso dar um identificador
        //O cast é pq foi criado uma tableviewcell para gerenciar/controlar
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let viagemAtual = listaViagens[indexPath.row]
        cell.configuraCelula(viagem: viagemAtual)
        //essa parte foi refatorada, colocado na parte que cuida da parte visual
//        cell.labelTitulo.text = viagemAtual.titulo
//        cell.labelQuantidadeDeDias.text = "\(viagemAtual.quantidadeDeDias) dias"
//        cell.labelPreco.text = "R$ \(viagemAtual.preco)"
//        cell.imagemViagem.image = UIImage(named: viagemAtual.caminhoDaImagem)
//
//        cell.imagemViagem.layer.cornerRadius = 10
//        cell.imagemViagem.layer.masksToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 175 : 260
    }
}

