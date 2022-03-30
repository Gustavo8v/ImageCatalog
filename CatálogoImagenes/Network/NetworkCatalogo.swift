//
//  NetworkCatalogo.swift
//  CatálogoImagenes
//
//  Created by Gustavo on 29/03/22.
//

import Foundation

class Network: ObservableObject {
    
    func getIamges(imageID: String, completionHandler: @escaping(Data) -> Void, errorHandler: @escaping(Error?) -> Void) {
        guard let url = URL(string: "https://picsum.photos/id/\(imageID)/200/100") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case 200:
                    if data != nil {
                        completionHandler(data!)
                    }                default:
                    errorHandler(error)
                }
            }
        }.resume()
    }
}
