//
//  Base64.swift
//  WhatsApp Clone
//
//  Created by Vinícius Rodrigues Duarte on 29/07/18.
//  Copyright © 2018 Vinícius Rodrigues Duarte. All rights reserved.
//

import Foundation


class Base64 {
    
    
    func decodeStringBase64(text: String) -> String {
        var base64: String = "";
        if let code = text.data(using: String.Encoding.utf8){
            base64 = code.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0));
        }
        
        return base64;
    }
}
