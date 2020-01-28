//
//  PacotesViagensViewController.swift
//  Alura Viagens
//
//  Created by Felipe Weber on 21/01/20.
//  Copyright © 2020 Felipe Weber. All rights reserved.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    @IBOutlet weak var pesquisarViagens: UISearchBar!

    @IBOutlet weak var labelContadorDePacotes: UILabel!

    
    let listaComTodasViagens: Array<PacoteViagem> = PacoteViagemDAO().retornaTodasAsViagens()
    var listaViagens: Array<PacoteViagem> = []
    

    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaViagens = listaComTodasViagens
        colecaoPacotesViagem.dataSource = self
        colecaoPacotesViagem.delegate = self
        pesquisarViagens.delegate = self
        self.labelContadorDePacotes.text = self.atualizaContadorLabel()
    }
    
    
    // retorna o numero de item da celula
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaViagens.count
    }
    
    //
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacotesViagemCollectionViewCell
//        celulaPacote.backgroundColor = UIColor.blue
        
        let pacoteAtual = listaViagens[indexPath.item]
        celulaPacote.configuraCelula(pacoteViagem: pacoteAtual)
        //foi refatorado 
//        celulaPacote.labelTitulo.text = pacoteAtual.viagem.titulo
//        celulaPacote.labelQuantidadeDeDias.text = "\(pacoteAtual.viagem.quantidadeDeDias) dias"
//        celulaPacote.labelPreco.text = "R$ \(pacoteAtual.viagem.preco)"
//        celulaPacote.imagemViagem.image = UIImage(named: pacoteAtual.viagem.caminhoDaImagem)
//
//        celulaPacote.layer.borderWidth = 0.5
//        celulaPacote.layer.borderColor = UIColor(displayP3Red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
//        celulaPacote.layer.cornerRadius = 8
        return celulaPacote
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let larguraCelula = collectionView.bounds.width / 2
//        return CGSize(width: larguraCelula - 20, height: 160)
        
        return UIDevice.current.userInterfaceIdiom == .phone ? CGSize(width: collectionView.bounds.width/2-20, height: 160) : CGSize(width: collectionView.bounds.width/3-20, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pacote = listaViagens[indexPath.item]

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "detalhes") as! DetalhesViagensViewController
        controller.pacoteSelecionado = pacote
        // era usado para apresentar, depois refatorei para usar uma viewcontroller
        // self.present(controller, animated: true, completion: nil)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return UIDevice.current.userInterfaceIdiom == .phone ? CGSize(width: collectionView.bounds.width/2-20, height: 160) : CGSize(width: collectionView.bounds.width/3-20, height: 250)
//    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listaViagens = listaComTodasViagens
       // se filter diferente de vazio entra no filtro
        if searchText != ""{
            listaViagens = listaViagens.filter{ $0.viagem.titulo.contains(searchText) }
        }

        self.labelContadorDePacotes.text = self.atualizaContadorLabel()
        colecaoPacotesViagem.reloadData()
    }
    func atualizaContadorLabel() -> String{
        return listaViagens.count == 1 ? "1 pacote encontrado" : "\(listaViagens.count) pacotes encontrados"
    }
}
