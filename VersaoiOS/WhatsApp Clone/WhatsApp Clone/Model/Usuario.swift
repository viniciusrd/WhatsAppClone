//
//  Usuario.swift
//  WhatsApp Clone
//
//  Created by Vinícius Rodrigues Duarte on 30/07/18.
//  Copyright © 2018 Vinícius Rodrigues Duarte. All rights reserved.
//

import Foundation

class Usuario {
    var nome: String;
    var email: String;
    var foto: String?;
    
    init(nome:String, email:String) {
        self.nome = nome;
        self.email = email;
        
    }
}
