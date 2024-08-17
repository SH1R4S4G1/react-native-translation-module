import Foundation
import SwiftUI
import Translation

@objc(TranslationModule)
class TranslationModule: NSObject {

  @objc static func requiresMainQueueSetup() -> Bool {
    return false
  }

  @objc func constantsToExport() -> [String: Any]! {
    return ["minimumOSVersion": "17.4"]
  }

  private func sanitizeInput(_ input: String) -> String {
    return input.trimmingCharacters(in: .whitespacesAndNewlines)
  }

  @objc(showTranslationPopover:withResolver:withRejecter:)
  func showTranslationPopover(_ text: String, resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) {
    let sanitizedText = self.sanitizeInput(text)

    DispatchQueue.main.async {
      if #available(iOS 17.4, *) {
        guard let window = UIApplication.shared.windows.first,
              let rootViewController = window.rootViewController else {
          reject("ERROR", "No window or root view controller found", nil)
          return
        }

        let translationView = TranslationView(text: sanitizedText) { translatedText in
          resolve(translatedText)
          rootViewController.dismiss(animated: true, completion: nil)
        }

        let hostingController = UIHostingController(rootView: translationView)
        hostingController.modalPresentationStyle = .overFullScreen
        hostingController.view.backgroundColor = .clear
        rootViewController.present(hostingController, animated: true, completion: nil)
      } else {
        reject("UNSUPPORTED_OS_VERSION", "iOS 17.4 or newer is required", nil)
      }
    }
  }
}

struct TranslationView: View {
  let text: String
  let onTranslation: (String) -> Void
  @State private var isPresented = false

  var body: some View {
    if #available(iOS 17.4, *) {
      Color.clear
        .translationPresentation(
          isPresented: $isPresented,
          text: text,
          replacementAction: { translatedText in
            onTranslation(translatedText)
            isPresented = false
          }
        )
        .onAppear {
          isPresented = true
        }
    } else {
      Text("iOS 17.4 or newer is required")
    }
  }
}
