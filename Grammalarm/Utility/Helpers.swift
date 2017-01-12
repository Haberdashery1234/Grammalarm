//
//  Helpers.swift
//  Grammalarm
//
//  Created by Christian.Grise on 5/26/17.
//  Copyright © 2017 Christian.Grise. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Enums



// MARK: - Structs

struct ScreenSize {
    static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType {
    static let IS_IPHONE_4_OR_LESS = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPHONE = UIDevice.current.userInterfaceIdiom == .phone
    static let IS_IPAD = UIDevice.current.userInterfaceIdiom == .pad
}


// MARK: Extensions

extension UIViewController {
    
    func presentOkAlert(title: String, message: String, handler: ((UIAlertAction) -> Void)? = nil, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constants.Strings.ok, style: .default, handler: handler))
        present(alert, animated: true, completion: completion)
    }
    
    func popOrDismiss(animated: Bool) {
        popOrDismiss(animated: animated, completion: nil)
    }
    
    func popOrDismiss(animated: Bool, completion: (() -> Void)?) {
        if DeviceType.IS_IPAD {
            dismiss(animated: animated) {
                completion?()
            }
        } else {
            navigationController?.popViewController(animated) {
                completion?()
            }
        }
    }
}

extension UINavigationController {
    func pushViewController(_ viewController: UIViewController, animated: Bool, completion: @escaping () -> Void) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }
    
    func popViewController(_ animated: Bool, completion: @escaping () -> Void) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.popViewController(animated: animated)
        CATransaction.commit()
    }
    
    func popToViewController(_ viewController: UIViewController, animated: Bool, completion: @escaping () -> Void) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popToViewController(viewController, animated: animated)
        CATransaction.commit()
    }
}

extension UIAlertAction {
    
    static var ok: UIAlertAction {
        return UIAlertAction.ok()
    }
    
    static var cancel: UIAlertAction {
        return UIAlertAction.cancel()
    }
    
    class func cancel(_ handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertAction {
        return UIAlertAction(title: NSLocalizedString(Constants.Strings.cancel, comment: "Alert button title - Cancel"), style: .default, handler: handler)
    }
    
    class func ok(_ handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertAction {
        return UIAlertAction(title: NSLocalizedString(Constants.Strings.ok, comment: "Alert button title - OK"), style: .default, handler: handler)
    }
}

extension UITableView {
    
    /// Shows or hides extra separators/cells when tableView has less content height than its view height.
    ///
    /// - parameter hidden: Boolean indicating whether to hide or show extra separators/cells
    func setExtraSeparators(hidden: Bool) {
        self.tableFooterView = hidden ? UIView(frame: CGRect.zero) : nil
    }
    
    /// Sets the table up to use AutomaticDimension for rowHeight and sets the estimated row height
    ///
    /// - parameter height: Height to set the estimatedRowHeight
    func configureAutomaticDimensions(withDefaultRowHeight height: CGFloat = 0) {
        self.rowHeight = UITableViewAutomaticDimension
        self.estimatedRowHeight = height
    }
}
