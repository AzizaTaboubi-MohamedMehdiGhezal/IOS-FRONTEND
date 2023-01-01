//
//  BotResponse.swift
//  SavyStoryBoard
//
//  Created by Aziza Taboubi on 2/1/2023.
//

import Foundation

func getBotResponse(message: String) -> String{
    let tempMessage = message.lowercased()
    if tempMessage.contains("hello"){
        return "Hey there!"
    } else if tempMessage.contains("thank you"){
        return "Come back for more information  anytime"
    }else if tempMessage.contains("how are you"){
        return "I'm fine how about you? "
    } else {
        return "SAVY is an app that helps you find electronics with the best prices. By giving you choices from many websites."
    }
}
