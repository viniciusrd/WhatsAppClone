//
//  FirebaseUtil.swift
//  WhatsApp Clone
//
//  Created by Vinícius Rodrigues Duarte on 30/07/18.
//  Copyright © 2018 Vinícius Rodrigues Duarte. All rights reserved.
//

import Foundation
import FirebaseAuth

class FirebaseUtil {
    
    var mAuth:Auth!;
    
    init() {
        self.mAuth = Auth.auth();
    }
    
    func recuperarChaveUsuarioLogado() -> String {
        
        if self.usuarioLogado(){
            
            //recuperar email do usuario logado
            if let usuarioLogado = mAuth.currentUser{
                if let email = usuarioLogado.email{
                    let chave = Base64().decodeStringBase64(text: email);
                    return chave;
                }
            }
            
        }
        
        return "";
    }
    
    func usuarioLogado() -> Bool {
        return  self.mAuth.currentUser != nil ? true : false;
    }
    
}
