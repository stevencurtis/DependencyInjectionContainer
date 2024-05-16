import Foundation

struct UserError: Identifiable {
    let id = UUID()
    let message: String
    let title: String
    let acceptButton: String
    
    init(message: String, title: String = "Error", acceptButton: String = "OK") {
        self.message = message
        self.title = title
        self.acceptButton = acceptButton
    }
}
