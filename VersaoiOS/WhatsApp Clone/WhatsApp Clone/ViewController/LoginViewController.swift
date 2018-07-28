//
//  LoginViewController.swift
//  WhatsApp Clone
//
//  Created by Vinícius Rodrigues Duarte on 26/07/18.
//  Copyright © 2018 Vinícius Rodrigues Duarte. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var fieldEmail: UITextField!
    @IBOutlet weak var fieldSenha: UITextField!
    
    
    
    var mAuth: Auth!

    override func viewDidLoad() {
        super.viewDidLoad()

        //Login Automatico
        self.mAuth = Auth.auth();
        
//        
        
        //ouvinte de usuario logado
        // chamado toda vez que o usuario sofrer alteracoes em seu estado de atenticado
        self.mAuth.addStateDidChangeListener { (auth, user) in
            
            if user != nil{
                
                self.performSegue(withIdentifier: "segueLoginAutomatico", sender: nil);
            }
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Esconder a barra de navegacao
        self.navigationController?.setNavigationBarHidden(true, animated: true);
    }
    

    @IBAction func logar(_ sender: Any) {
        
        if let email = self.fieldEmail.text{
            if let senha = self.fieldSenha.text{
                
                self.mAuth.signIn(withEmail: email, password: senha) { (usuarioLogin, erro) in
                    
                    if erro == nil{
                        if let usuarioLogado = usuarioLogin{
                            
                        }
                    }
                    
                }
                
            }
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
