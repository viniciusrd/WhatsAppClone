//
//  CreateAccountViewController.swift
//  WhatsApp Clone
//
//  Created by Vinícius Rodrigues Duarte on 26/07/18.
//  Copyright © 2018 Vinícius Rodrigues Duarte. All rights reserved.
//

import UIKit
import FirebaseAuth

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var fieldName: UITextField!
    @IBOutlet weak var fieldEmail: UITextField!
    @IBOutlet weak var fieldPassword: UITextField!
    
    var mAuth: Auth!;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Configurar o firebase
        self.mAuth = Auth.auth();
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Esconder a barra de navegacao
        self.navigationController?.setNavigationBarHidden(true, animated: true);
    }
    
    @IBAction func register(_ sender: Any) {
        
        if let name = self.fieldName.text{
            
            if let email = self.fieldEmail.text{
                
                if let senha = self.fieldPassword.text{
                    
                    self.mAuth.createUser(withEmail: email, password: senha) { (usuario, error) in

                        if error == nil{
                            print("sucesso");
                        }else{
                            print("erro");
                        }
                        
                    }
                    
                }else{
                    print("senha nao informada");
                }
                
            }else{
                print("email nao informado");
            }
            
        }else{
            print("nome nao informado");
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
