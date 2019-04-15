//
//  ProtocoloComidas.swift
//  TabelinhaDeComidas
//
//  Created by Hundily Cerqueira Silva on 02/04/19.
//  Copyright © 2019 Hundily Cerqueira Silva. All rights reserved.
//

import Foundation

struct ComidasDoMundo: Decodable {
    var comidasDoMundo: [AtributosDeComidas]
    
    enum CodingKeys: String, CodingKey {
        case comidasDoMundo = "comidas_do_mundo"
    }
}

extension ComidasDoMundo {
    static func parse(_ data: Data) -> ComidasDoMundo {
        
        var comidasDoMundo = ComidasDoMundo(comidasDoMundo: [AtributosDeComidas]())
        do {
            comidasDoMundo = try JSONDecoder().decode(ComidasDoMundo.self, from: data)
        } catch let err {
            print(err)
        }
        return comidasDoMundo
    }
}

struct AtributosDeComidas: Decodable {
    var nomeDaComida: String?
    var restaurante: String?
    var calorias: Int?
    var descricaoDaComida: String?
    var imagem: String?
    
    enum CodingKeys: String, CodingKey {
        case nomeDaComida = "nome"
        case restaurante
        case calorias
        case descricaoDaComida = "descricao"
        case imagem
    }
    
    init(from decoder: Decoder) throws {
        let valores = try decoder.container(keyedBy: CodingKeys.self)
        
        nomeDaComida = try valores.decode(String.self, forKey: .nomeDaComida)
        calorias = try valores.decode(Int.self, forKey: .calorias)
        restaurante = try valores.decode(String.self, forKey: .restaurante)
        descricaoDaComida = try valores.decode(String.self, forKey: .descricaoDaComida)
        imagem = try valores.decode(String.self, forKey: .imagem)
    }
}
