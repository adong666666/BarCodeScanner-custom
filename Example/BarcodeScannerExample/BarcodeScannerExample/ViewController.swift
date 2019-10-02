import UIKit
import BarcodeScanner
import SnapKit

final class ViewController: UIViewController {
  @IBOutlet var presentScannerButton: UIButton!
  @IBOutlet var pushScannerButton: UIButton!

  @IBAction func handleScannerPresent(_ sender: Any, forEvent event: UIEvent) {
    let viewController = makeBarcodeScannerViewController()
    viewController.title = "Barcode Scanner"
    present(viewController, animated: true, completion: nil)
  }

  @IBAction func handleScannerPush(_ sender: Any, forEvent event: UIEvent) {
    let viewController = makeBarcodeScannerViewController()
    viewController.title = "Barcode Scanner"
    navigationController?.pushViewController(viewController, animated: true)
  }

  private func makeBarcodeScannerViewController() -> BarcodeScannerViewController {
    let viewController = BarcodeScannerViewController()
    viewController.codeDelegate = self
    viewController.errorDelegate = self
    viewController.dismissalDelegate = self
    viewController.messageViewController.regularTintColor = .clear
    viewController.messageViewController.errorTintColor = .clear
    viewController.messageViewController.textLabel.textColor = .clear
    viewController.messageViewController.view.backgroundColor = .clear
    viewController.messageViewController.view.isHidden = true
    viewController.headerViewController.titleLabel.textColor = .clear
    viewController.headerViewController.closeButton.tintColor = .clear
    viewController.cameraViewController.flashButton.isHidden = true
    viewController.cameraViewController.settingsButton.isHidden = true
    viewController.cameraViewController.cameraButton.isHidden = true
    viewController.cameraViewController.focusView.isHidden = true
//    viewController.cameraViewController.view.snp.makeConstraints {
//        $0.width.equalTo(viewController.view)
//        $0.height.equalTo(viewController.view)
//        $0.top.equalTo(viewController.view)
//        $0.bottom.equalTo(viewController.view)
//        $0.leading.equalTo(viewController.view)
//        $0.trailing.equalTo(viewController.view)
//    }
    return viewController
  }
}

// MARK: - BarcodeScannerCodeDelegate

extension ViewController: BarcodeScannerCodeDelegate {
  func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
    print("Barcode Data: \(code)")
    print("Symbology Type: \(type)")

    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
      controller.resetWithError()
    }
  }
}

// MARK: - BarcodeScannerErrorDelegate

extension ViewController: BarcodeScannerErrorDelegate {
  func scanner(_ controller: BarcodeScannerViewController, didReceiveError error: Error) {
    print(error)
  }
}

// MARK: - BarcodeScannerDismissalDelegate

extension ViewController: BarcodeScannerDismissalDelegate {
  func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
    controller.dismiss(animated: true, completion: nil)
  }
}
