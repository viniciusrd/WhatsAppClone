//
//  AjustesViewController.swift
//  WhatsApp Clone
//
//  Created by Vinícius Rodrigues Duarte on 28/07/18.
//  Copyright © 2018 Vinícius Rodrigues Duarte. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase
import SDWebImage

class AjustesViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var imageUsuario: UIImageView!
    @IBOutlet weak var nomeUsuario: UILabel!
    @IBOutlet weak var emailUsuario: UILabel!

    var mAuth: Auth!;
    var mStorage: Storage!;
    var mDataBase: DatabaseReference!;
    var imagePicker = UIImagePickerController();
    var usuario: Usuario!;
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.imagePicker.delegate = self;
        self.mStorage = Storage.storage();
        self.mDataBase = Database.database().reference();
        self.recupararUsuarioFirebase();
        
        self.imageUsuario.image = #imageLiteral(resourceName: "padrao");
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func alterarImagem(_ sender: Any) {
        
        imagePicker.sourceType = .savedPhotosAlbum;
        present(imagePicker, animated: true, completion: nil);
        
    }
    
    //recuperar imagem
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let imageRecuperada = info[UIImagePickerControllerOriginalImage] as! UIImage;
        
        self.imageUsuario.image = imageRecuperada;
        let imagens = mStorage.reference().child("imagens");
        //definindo qualidade da imagem
        if let imagenParaUpload = UIImageJPEGRepresentation(imageRecuperada, 0.3){
            
            let keyUser = FirebaseUtil().recuperarChaveUsuarioLogado();
            
            //salvar dados no storage
            let nomeImage = "\(keyUser).jpg";
            imagens.child("perfil").child(nomeImage).putData(imagenParaUpload, metadata: nil)
            { (metaDados, erro) in
                if erro == nil{
                    print("sucesso");
                    //salvar nome da imagem
                    self.atualizarDadosUsuario(foto: nomeImage)
                }else{
                    print("erro");
                }
            };
        }
        
        self.imagePicker.dismiss(animated: true, completion: nil);
    }
    
    
    func atualizarDadosUsuario(foto: String) {
        
        //recuperar referencia de usuarios
        let usuarios = self.mDataBase.child("usuarios");
        
        //recuperar chave
        let keyUser = FirebaseUtil().recuperarChaveUsuarioLogado();
         let dadosUsuario = [
            "nome": self.usuario.nome,
            "email": self.usuario.email,
            "foto": foto
        ]
        //salvar dados usuario
        usuarios.child(keyUser).setValue(dadosUsuario);
        
    }
    
    func recupararUsuarioFirebase()  {
        
        //recuperar referencia de usuarios
        let usuarios = self.mDataBase.child("usuarios");
        //recuperar chave
        let keyUser = FirebaseUtil().recuperarChaveUsuarioLogado();
        
        let usuarioLogado = usuarios.child(keyUser);
        usuarioLogado.observeSingleEvent(of: DataEventType.value) { (snapshot) in
            
            let dados = snapshot.value as? NSDictionary;
            let nome  = dados!["nome"] as? String;
            let email = dados!["email"] as? String;
            
            self.usuario = Usuario(nome: nome!, email: email!);
            
            //Exibir dados usuario
            self.nomeUsuario.text = nome;
            self.emailUsuario.text = email;
            
            if snapshot.hasChild("foto"){
                let foto = dados!["foto"] as? String
                self.usuario.foto = foto;
                //recuperar a foto
                let imagens = self.mStorage.reference().child("imagens");
                
                let localImagem = imagens.child("perfil").child(foto!);
                
                //recuperar imagem para carregar imagem
                localImagem.getMetadata(completion: { (metaData, erro) in
                    
                    if erro == nil
                    {

                        localImagem.downloadURL(completion: { (url, errorGetUrl) in
                            if errorGetUrl == nil
                            {
                                
                                if let urlFile = url?.absoluteString
                                {
                                    //teste
                                    print("URL: \(String(describing: urlFile))");
                                    self.imageUsuario.sd_setImage(with: url, completed: { (image, erro, cache, url) in
                                        
                                        if erro != nil{
                                            print("erro ao baixar");
                                        }
                                        
                                    })
                                }
                                
                            }
                            else
                            {
                                print("Erro ao baixar a imagem");
                                
                            }
                        })
                    }
                    else
                    {
                        print("Erro ao carregar imagem!");
                    }
                    
                })
           }
        }
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
