//
//  ContentView.swift
//  CustomButtonWithStyle
//
//  Created by Mits on 23/09/19.
//  Copyright © 2019 Ubrain. All rights reserved.
//

import SwiftUI

public struct BackgroundButtonStyle : ButtonStyle
{
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(.white)
            .background(configuration.isPressed ? Color.red : Color.blue)
            .cornerRadius(8.0)
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(Animation.spring().speed(2))
    }
}

struct MyButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.yellow)
            .cornerRadius(5)
    }
}

extension View {
    
    func myButtonStyle() -> some View {
        
        ModifiedContent(content: self, modifier: MyButtonStyle())
    }
}



struct ContentView: View {
    var body: some View {
        
        VStack {
            Button(action: doSomething) {
                VStack {
                    Image(systemName: "rectangle.grid.1x2.fill")
                    Text("Vertical Button!")
                }
                .myButtonStyle()
            }
            
            Button(action: {print("Button Click")}, label: {
                
                Text("DATA LIST")
                
            })
            .buttonStyle(BackgroundButtonStyle())
        }
    }
    
    func doSomething()
    {
        print("BUTTON ACTION")
    }

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
