//
//  ContentView.swift
//  CatálogoImagenes
//
//  Created by Gustavo on 29/03/22.
//

import SwiftUI

struct CatalogView: View {
    
    @StateObject var viewModel = CatalogViewModel()
    @State var initialPar: String = ""
    @State var finalPar: String = ""
    @State private var errorAlert = ""
    @State private var presentAlert = false
    
    var body: some View {
        Spacer().frame(height: 10)
        HStack {
            Spacer().frame(width: 10)
            TextField("id Inicial", text: $initialPar)
                .font(.custom("GilroyRegular", size: 14))
                .frame(maxWidth: .infinity, alignment: .leading)
                .minimumScaleFactor(0.5)
                .foregroundColor(Color.black)
                .border(.gray, width: 1)
            Spacer().frame(width: 10)
            Text("a")
            Spacer().frame(width: 10)
            TextField("id Final", text: $finalPar)
                .font(.custom("GilroyRegular", size: 14))
                .frame(maxWidth: .infinity, alignment: .leading)
                .minimumScaleFactor(0.5)
                .foregroundColor(Color.black)
                .border(.gray, width: 1)
            Spacer().frame(width: 10)
            Button(action: {
                viewModel.getArrayID(initial: self.initialPar, final: self.finalPar) { error in
                    presentAlert = true
                    self.errorAlert = error
                }
            }, label: {
                Text("Traer imagenes")
            }).frame(width:UIScreen.main.bounds.width * 0.35, height: 20)
                .cornerRadius(8)
                .alert(isPresented: $presentAlert) {
                    Alert(title: Text("Ups!"), message: Text(errorAlert))
                }
            Spacer().frame(width: 10)
        }
        List {
            ForEach(viewModel.imagesURL, id: \.self) { image in
                AsyncImage(
                    url: image,
                    placeholder: { Text("Loading ...") },
                    image: { Image(uiImage: $0).resizable() }
                )
                    .frame(width: UIScreen.main.bounds.width * 0.80, height: UIScreen.main.bounds.width * 0.70, alignment: .center)
                    .scaledToFit()
            }
        }
    }
}

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
