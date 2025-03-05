//
//  ContentView.swift
//  QuoteFinder
//
//  Created by Nicholas Hwang on 4/3/2025.
//

import SwiftUI

struct QuoteView: View {
    
    // MARK: Stored properties
    
  
    @State var viewModel = QuoteViewModel()
    
    
    
    // Controls button visibility
    @State var buttonOpacity = 0.0
    
    
    @State var buttonTimer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()




    // MARK: Computed properties
    var body: some View {
        VStack {
            
            // Show a joke if one exists
            if let currentQuote = viewModel.currentQuote {
                
                Group {
                    Text(currentQuote.quoteText ?? "")
                        .padding(.bottom, 100)
                    
                    Text(currentQuote.quoteAuthor ?? "")


 
                }
                .font(.title)
                .multilineTextAlignment(.center)
                
                Button {
                 
                    // Hide punchline and button
                    withAnimation {
                        viewModel.currentQuote = nil
                        buttonOpacity = 0.0
                    }
                                        
                    // Get a new joke
                    Task {
                        await viewModel.fetchQuote()
                    }
                    
        
                    
                } label: {
                 
                    Text("New Quote")
                    
                }
                .buttonStyle(.borderedProminent)
                .opacity(buttonOpacity)
                .onReceive(buttonTimer) { _ in
                    
                    withAnimation {
                        buttonOpacity = 1.0
                    }
                    
                    // Stop the timer
                    buttonTimer.upstream.connect().cancel()
                }

                
            }
            
        }
    }
}
 
#Preview {
    QuoteView()
}


