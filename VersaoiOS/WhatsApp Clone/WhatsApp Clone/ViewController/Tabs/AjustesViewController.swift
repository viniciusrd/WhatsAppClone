//
//  AjustesViewController.swift
//  WhatsApp Clone
//
//  Created by Vinícius Rodrigues Duarte on 28/07/18.
//  Copyright © 2018 Vinícius Rodrigues Duarte. All rights reserved.
//

import UIKit
import FirebaseAuth

class AjustesViewController: UIViewController {
    
    var mAuth: Auth!;

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deslogar(_ sender: Any) {
        self.mAuth = Auth.auth();
        do {
            try self.mAuth.signOut()
            self.dismiss(animated: true, completion: nil);
        } catch let exception {
            print("Erro: \(exception)");
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
