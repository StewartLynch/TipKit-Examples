//
//  SimplePopOverTipScreen.swift
//  TipKit Examples
//
//  Created by Jordi Bruin on 28/07/2023.
//

import SwiftUI
import TipKit

struct SimplePopOverTipScreen: View {
    
    @AppStorage("simplePopOverTipFavorited") var simplePopOverTipFavorited: Bool = false
    
    var body: some View {
        List {
            Text("This screen shows a popover tip which you can present from buttons in your toolbar for example.")
        }
        .navigationTitle("Simple Popover Tip")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing, content: {
                Button(action: {
                    simplePopOverTipFavorited.toggle()
                }) {
                    Image(systemName: "star")
                }
                .popoverTip(SimplePopOverTip(), arrowEdge: .top, action: { action in
                    if action.id == "learn-more" {
                        print("Used tapped on Learn More")
                    }
                    
                    if action.id == "remove" {
                        print("Used tapped on Remove")
                    }
                })
            }
            )
        }
    }
}

struct SimplePopOverTipScreen_Previews: PreviewProvider {
    static var previews: some View {
        SimplePopOverTipScreen()
    }
}
