import UIKit

protocol ErrorHandlerProtocol {
    func handle(error: Error)
}

final class ErrorHandler: ErrorHandlerProtocol {
    func handle(error: Error) {
        alertUserAboutError(error: error)
    }
    
    private func alertUserAboutError(error: Error) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let rootViewController = windowScene.windows.first(where: { $0.isKeyWindow })?.rootViewController else {
                return
            }
            rootViewController.present(alert, animated: true)
        }
    }
}
