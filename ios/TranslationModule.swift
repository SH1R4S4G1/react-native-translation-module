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

    DispatchQueue.main.async { [self] in
      if #available(iOS 17.4, *) {
        guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else {
          reject("ERROR", "No root view controller found", nil)
          return
        }

        let hostingController = UIHostingController(rootView: TranslationView(text: sanitizedText) { translatedText in
          resolve(translatedText)
        })

        hostingController.modalPresentationStyle = .popover

        if let popover = hostingController.popoverPresentationController {
          popover.sourceView = rootViewController.view
          popover.sourceRect = CGRect(x: rootViewController.view.bounds.midX, y: rootViewController.view.bounds.midY, width: 0, height: 0)
          popover.permittedArrowDirections = []
        }

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
        .frame(width: 1, height: 1)
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
