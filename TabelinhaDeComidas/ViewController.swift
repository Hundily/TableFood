//
//  ViewController.swift
//  TabelinhaDeComidas
//
//  Created by Hundily Cerqueira Silva on 02/04/19.
//  Copyright © 2019 Hundily Cerqueira Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableViewComidinhas: UITableView!
    var arrayDeComidas = [AtributosDeComidas]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewComidinhas.delegate = self
        tableViewComidinhas.dataSource = self
//        tableViewComidinhas.register(ComidinhasTableViewCell.self, forCellReuseIdentifier: "comidinhasCell")
        let nibDaCelular = UINib(nibName: "ComidinhasTableViewCell", bundle: nil)
        tableViewComidinhas.register(nibDaCelular, forCellReuseIdentifier: "comidinhasCell")
        arrayDeComidas = retornaArrayDeComidas()
    }
    
    func retornaArrayDeComidas () -> [AtributosDeComidas] {
        let arquivoJSON = Bundle.main.url(forResource: "Comidas", withExtension: "json")!
        let dadosDoJSON: Data = try! Data(contentsOf: arquivoJSON)
        
        let comidas = ComidasDoMundo.parse(dadosDoJSON)
        print(comidas.comidasDoMundo)
        
        return comidas.comidasDoMundo
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayDeComidas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "comidinhasCell") as! ComidinhasTableViewCell
        
        let arrayDeComida = arrayDeComidas[indexPath.row]
        
        cell.labelTitulo?.text = arrayDeComida.nomeDaComida
        cell.labelCaloria?.text = "Calorias: \(arrayDeComida.calorias!)"
        cell.imgViewComida.image = UIImage(named: arrayDeComida.imagem!)
        cell.textViewDescricao?.text = arrayDeComida.descricaoDaComida
        cell.restaurante?.text = "Restaurante: \(arrayDeComida.restaurante!)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 196
    }
    

}
