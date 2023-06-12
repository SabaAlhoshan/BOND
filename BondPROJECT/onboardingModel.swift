//
//  onboardingModel.swift
//  Bond
//
//  Created by Ghadah on 08/11/1444 AH.
//

import Foundation

struct Page: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
    
    static var samplePage = Page(name: "Title Example", description: "This is a sample description for the purpose of debugging", imageUrl: "work", tag: 0)
    
    static var samplePages: [Page] = [
        Page(name: " Bond when online ", description: "Even if you work from home , you  can always be involved with your team and know the recent news .", imageUrl: "onboarding1", tag: 0),
        Page(name: "Post and share", description: "Post your daily activity through your work day and  share your recent event to celebrate it. ", imageUrl: "onboarding2", tag: 1),
        Page(name: "Anonymous feedback", description: "Share your thoughts directly and anonymously with your manager to make your work environment better.", imageUrl: "onboarding3", tag: 2),
    ]
}


