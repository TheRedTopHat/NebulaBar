//
//  ContentView.swift
//  NebulaBar
//
//  Created by Sam Meester on 2022-09-25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var fullText: String = "This is some editable text..."
    
    var body: some View {
        VStack {
            Text("NebulaBar")
                .font(.title)
                .multilineTextAlignment(.leading)
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            Color(hue: 178/360, saturation: 22/100, brightness: 96/100) /* #bef4f3 */,
                            Color(hue: 249/360, saturation: 56/100, brightness: 98/100) /* #806bf4 */
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.top, .bottom], 10)
                .padding(.leading, 20)
            
            
            VStack{
                
                HStack {
                    Text("Status: ").frame(alignment: .leading)
                    Text("Running").frame(maxWidth: .infinity, alignment: .leading)
                }
                
                HStack {
                    Text("Uptime: ").frame(alignment: .leading)
                    Text("00:00:00").frame(maxWidth: .infinity, alignment: .leading)
                }
                
                HStack {
                    Text("Address: ").frame(alignment: .leading)
                    Text("100.100.0.10").frame(maxWidth: .infinity, alignment: .leading)
                }
                
            }.frame(maxWidth: .infinity)
                .padding([.leading, .trailing], 20)
            
            
            
//            TextEditor(text: $fullText)
//                .frame(width: 500)
//                .padding([.leading, .trailing], 20)
//
            
            HStack {
                Button(action: {
                    NSApplication.shared.terminate(self)
                }) {
                    Text("Show Logs")
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                Button(action: {
                }) {
                    Text("Start")
                }
                
                Button(action: { NSApplication.shared.terminate(self)
                }) {
                    Text("Quit")
                }
                
            }.frame(maxWidth: .infinity)
                .padding([.leading, .trailing], 20)
                .padding(.bottom, 10)
            
            
            
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
