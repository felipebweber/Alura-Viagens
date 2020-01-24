//
//  DetalhesViagensViewController.swift
//  Alura Viagens
//
//  Created by Felipe Weber on 24/01/20.
//  Copyright © 2020 Felipe Weber. All rights reserved.
//

import UIKit

class DetalhesViagensViewController: UIViewController {

    
    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!
    @IBOutlet weak var labelDataViagem: UILabel!
    @IBOutlet weak var labelPrecoPaoteViagem: UILabel!
    
    @IBAction func botaoVoltar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    //nao vai ser inicializado pq so vai receber dados quando o pacote for selecionado
    var pacoteSelecionado: PacoteViagem? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let pacote = pacoteSelecionado{
            self.imagemPacoteViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.labelTituloPacoteViagem.text = pacote.viagem.titulo
            self.labelDescricaoPacoteViagem.text = pacote.descricao
            self.labelDataViagem.text = pacote.dataViagem
            self.labelPrecoPaoteViagem.text = pacote.viagem.preco
        }
    }
    

}
