//
//  ContatosViewController.swift
//  WhatsApp Clone
//
//  Created by Vinícius Rodrigues Duarte on 04/08/18.
//  Copyright © 2018 Vinícius Rodrigues Duarte. All rights reserved.
//

import UIKit

class ContatosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //metodos para listagem
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaContatos", for: indexPath) as! ContatoTableViewCell;
        celula.nomeUsuarioLabel.text = "Vinicius";
        celula.emailUsuarioLabel.text = "vinird1993@gmail";
        celula.fotoUsuario.image = #imageLiteral(resourceName: "padrao");
        
        return celula;
    }
    
}
