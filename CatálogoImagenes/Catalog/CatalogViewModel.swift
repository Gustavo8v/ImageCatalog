//
//  CatalogViewModel.swift
//  CatálogoImagenes
//
//  Created by Gustavo on 30/03/22.
//

import Foundation

class CatalogViewModel: ObservableObject {
    
    @Published var imagesURL: [URL] = []
    
    func getArrayID(initial: String, final: String, error: @escaping(String) -> Void) {
        var urls = [URL]()
        guard let initialNumber = Int(initial) else {
            error("Por favor ingrese solo números enteros")
            return
        }
        guard let finalNumber = Int(final) else {
            error("Por favor ingrese solo números enteros")
            return
        }
        if initialNumber <= finalNumber {
            let sequence = initialNumber...finalNumber
            sequence.forEach { id in
                let url = URL(string: "https://picsum.photos/id/\(id)/1280/710")
                urls.append(url!)
            }
            imagesURL = urls
        } else {
            error("El rango seleccionado no es correcto")
        }
    }
}
