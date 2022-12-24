//
//  ContentView.swift
//  HiddenNavExample
//
//  Created by Robert Galli on 12/24/22.
//

import SwiftUI

let listeningText = "Listening..."
let keyPhrase = "Hello world"
let instructionalText = "Say \"" + keyPhrase + "\""
let startText = "Press the green button to start"

struct ContentView: View {
    @State private var isRecording = false
    @State private var result = ""
    @State private var showResult = false
    @StateObject private var speechRecognizer = SpeechRecognizer()
    
    var body: some View {
        NavigationStack {
            
            VStack {
                HStack {
                    Text("Search")
                        .font(.title)
                        .padding(.leading, 15)
                        .padding(.top, 5)
                    Spacer()
                }
                
                Divider()
                Spacer()
                
                Button(action: {
                    self.isRecording.toggle()
                    
                    if isRecording {
                        speechRecognizer.transcribe()
                    } else {
                        speechRecognizer.stopTranscribing()
                        result = speechRecognizer.transcript
                        showResult = isValid(input: result)
                    }
                }) {
                    if isRecording {
                        Image(systemName: "stop.fill")
                            .font(.system(size: 120))
                            .foregroundColor(.white)
                    } else {
                        Image(systemName: "mic.fill")
                            .font(.system(size: 120))
                            .foregroundColor(.white)
                    }
                }
                .frame(width: 220, height: 220)
                .background(isRecording ? Color.red : Color.green)
                .clipShape(Circle())
                
                .onAppear {
                    speechRecognizer.reset()
                }
                
                Text(isRecording ? listeningText : startText)
                    .padding()
                
                Text(isRecording && speechRecognizer.transcript.isEmpty ? instructionalText : "")
                
                Text(speechRecognizer.transcript)

                Spacer()
                
                Divider()
            }
            
            NavigationLink("Result", value: "result")
                .hidden()
                .navigationDestination(isPresented: $showResult) {
                    ResultView()
                }
        }
    }
    
    private func isValid(input: String) -> Bool {
        return input == keyPhrase
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
