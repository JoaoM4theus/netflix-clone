//
//  ExtensionsString.swift
//  Netflix-Clone
//
//  Created by Joao Matheus on 13/09/22.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }

}
