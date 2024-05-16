import SwiftUI
import UIKit

struct SwiftUIViewConfiguration<Content> where Content: View {
    let view: Content
    let hidesNavBackButton: Bool
    init(view: Content, hidesNavBackButton: Bool = false) {
        self.view = view
        self.hidesNavBackButton = hidesNavBackButton
    }
}

final class SwiftUIViewController<Content>: UIViewController where Content: View {
    let configuration: SwiftUIViewConfiguration<Content>
    init(configuration: SwiftUIViewConfiguration<Content>) {
        self.configuration = configuration
        super.init(nibName: nil, bundle: nil)
        let hostingController = UIHostingController(rootView: configuration.view)
        hostingController.view.backgroundColor = .clear
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
           hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
           hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
           hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
           hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        hostingController.didMove(toParent: self)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if configuration.hidesNavBackButton {
            navigationItem.setHidesBackButton(true, animated: true)
        }
    }
}
