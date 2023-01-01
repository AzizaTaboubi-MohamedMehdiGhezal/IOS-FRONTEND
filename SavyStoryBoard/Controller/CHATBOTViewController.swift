//
//  CHATBOTViewController.swift
//  SavyStoryBoard
//
//  Created by Aziza Taboubi on 1/1/2023.
//

import UIKit
import SwiftUI

class CHATBOTViewController: UIViewController {

    @State private var messageText = ""
    @State var messages: [String] = ["Welcome to SAVY chat"]
    
    var body: some View{
        VStack {
            HStack {
                Text("iBot")
                    .font(.largeTitle)
                    .bold()
                
                Image(systemName: "bubble.left.fill")
                    .font(.system(size: 26))
                    .foregroundColor(Color.green)
            }
            ScrollView{
                //Messages
                ForEach(messages, id: \.self) { message in
                    if message.contains("[USER]") {
                        let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                        
                        HStack {
                            Spacer()
                            Text(newMessage)
                                .padding()
                                .foregroundColor(.white)
                                .background(.green.opacity(0.8))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                        }
                    } else {
                        HStack {
                            
                            Text(message)
                                .padding()
                                .background(.gray.opacity(0.15))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                            Spacer()
                        }
                        
                    }
                } .rotationEffect(.degrees(180))
            } .rotationEffect(.degrees(180))
             
            HStack {
                TextField(" Type your questions here.", $messageText)
                    .padding()
                    .backgroundStyle(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .onSubmit{
                        sendMessage(message: messageText)
                    }
                Button {
                    sendMessage(message: messageText)

                     
                } label: {
                    Image(systemName: "paperplane.fill")
                        .font(.system(size: 26))
                        .padding(.horizontal, 10)
                    
                }
                .padding()
            }
        }
        
        func sendMessage(message: String) {
            withAnimation {
                messages.append("[USER]" + message)
                self.messageText= "
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                withAnimation{
                    messages.append(getBotResponse(message: message ))
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
