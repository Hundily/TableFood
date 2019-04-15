//
//  ComidinhasTableViewCell.swift
//  TabelinhaDeComidas
//
//  Created by Hundily Cerqueira Silva on 02/04/19.
//  Copyright © 2019 Hundily Cerqueira Silva. All rights reserved.
//

import UIKit

class ComidinhasTableViewCell: UITableViewCell {

    @IBOutlet weak var imgViewComida: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelCaloria: UILabel!
    @IBOutlet weak var textViewDescricao: UITextView!
    @IBOutlet weak var restaurante: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        print(labelTitulo)
        
//        labelTitulo.text = 
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
