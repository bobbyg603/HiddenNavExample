//
//  ResultView.swift
//  HiddenNavExample
//
//  Created by Robert Galli on 12/24/22.
//

import SwiftUI

struct ResultView: View {
    
    private var message: String
    
    init(result: String) {
        self.message = result
    }
    
    var body: some View {
        Text(message)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(result: "Hello world")
    }
}
