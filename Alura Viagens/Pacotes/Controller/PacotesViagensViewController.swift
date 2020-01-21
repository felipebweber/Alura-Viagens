//
//  PacotesViagensViewController.swift
//  Alura Viagens
//
//  Created by Felipe Weber on 21/01/20.
//  Copyright © 2020 Felipe Weber. All rights reserved.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource {
    
    let listaViagens: Array<Viagem> = ViagemDAO().retornaTodasAsViagens()
    
    

    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.colecaoPacotesViagem.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    // retorna o numero de item da celula
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaViagens.count
    }
    
    //
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacotesViagemCollectionViewCell
//        celulaPacote.backgroundColor = UIColor.blue
        
        let viagemAtual = listaViagens[indexPath.item]
        
        celulaPacote.labelTitulo.text = viagemAtual.titulo
        celulaPacote.labelQuantidadeDeDias.text = "\(viagemAtual.quantidadeDeDias) dias"
        celulaPacote.labelPreco.text = "R$ \(viagemAtual.preco)"
        celulaPacote.imagemViagem.image = UIImage(named: viagemAtual.caminhoDaImagem)
        
        return celulaPacote
    }

}
