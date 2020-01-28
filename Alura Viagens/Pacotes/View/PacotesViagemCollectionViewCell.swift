//
//  PacotesViagemCollectionViewCell.swift
//  Alura Viagens
//
//  Created by Felipe Weber on 21/01/20.
//  Copyright © 2020 Felipe Weber. All rights reserved.
//

import UIKit

class PacotesViagemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imagemViagem: UIImageView!
    
    @IBOutlet weak var labelTitulo: UILabel!
    
    @IBOutlet weak var labelQuantidadeDeDias: UILabel!
    
    @IBOutlet weak var labelPreco: UILabel!
    
    func configuraCelula(pacoteViagem: PacoteViagem){
        labelTitulo.text = pacoteViagem.viagem.titulo
        labelQuantidadeDeDias.text = "\(pacoteViagem.viagem.quantidadeDeDias) dias"
        labelPreco.text = "R$ \(pacoteViagem.viagem.preco)"
        imagemViagem.image = UIImage(named: pacoteViagem.viagem.caminhoDaImagem)
        
        layer.borderWidth = 0.5
        layer.borderColor = UIColor(displayP3Red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        layer.cornerRadius = 8
    }
}
