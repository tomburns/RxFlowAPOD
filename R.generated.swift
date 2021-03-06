//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 0 colors.
  struct color {
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 0 files.
  struct file {
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 0 fonts.
  struct font {
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 0 images.
  struct image {
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 0 nibs.
  struct nib {
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 1 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `dateCell`.
    static let dateCell: Rswift.ReuseIdentifier<UIKit.UITableViewCell> = Rswift.ReuseIdentifier(identifier: "dateCell")
    
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 0 view controllers.
  struct segue {
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 4 storyboards.
  struct storyboard {
    /// Storyboard `APOD`.
    static let apoD = _R.storyboard.apoD()
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    /// Storyboard `Settings`.
    static let settings = _R.storyboard.settings()
    
    /// `UIStoryboard(name: "APOD", bundle: ...)`
    static func apoD(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.apoD)
    }
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    
    /// `UIStoryboard(name: "Settings", bundle: ...)`
    static func settings(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.settings)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 0 localization tables.
  struct string {
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct nib {
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try main.validate()
      try apoD.validate()
    }
    
    struct apoD: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UISplitViewController
      
      let apodSplitViewController = StoryboardViewControllerResource<UIKit.UISplitViewController>(identifier: "apodSplitViewController")
      let bundle = R.hostingBundle
      let dateList = StoryboardViewControllerResource<DateListViewController>(identifier: "dateList")
      let dateListNavController = StoryboardViewControllerResource<UIKit.UINavigationController>(identifier: "dateListNavController")
      let name = "APOD"
      let pictureDetail = StoryboardViewControllerResource<RxFlowAPOD.PictureViewController>(identifier: "pictureDetail")
      let pictureDetailNavController = StoryboardViewControllerResource<UIKit.UINavigationController>(identifier: "pictureDetailNavController")
      
      func apodSplitViewController(_: Void = ()) -> UIKit.UISplitViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: apodSplitViewController)
      }
      
      func dateList(_: Void = ()) -> DateListViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: dateList)
      }
      
      func dateListNavController(_: Void = ()) -> UIKit.UINavigationController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: dateListNavController)
      }
      
      func pictureDetail(_: Void = ()) -> RxFlowAPOD.PictureViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: pictureDetail)
      }
      
      func pictureDetailNavController(_: Void = ()) -> UIKit.UINavigationController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: pictureDetailNavController)
      }
      
      static func validate() throws {
        if _R.storyboard.apoD().pictureDetail() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'pictureDetail' could not be loaded from storyboard 'APOD' as 'RxFlowAPOD.PictureViewController'.") }
        if _R.storyboard.apoD().dateList() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'dateList' could not be loaded from storyboard 'APOD' as 'DateListViewController'.") }
        if _R.storyboard.apoD().pictureDetailNavController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'pictureDetailNavController' could not be loaded from storyboard 'APOD' as 'UIKit.UINavigationController'.") }
        if _R.storyboard.apoD().apodSplitViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'apodSplitViewController' could not be loaded from storyboard 'APOD' as 'UIKit.UISplitViewController'.") }
        if _R.storyboard.apoD().dateListNavController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'dateListNavController' could not be loaded from storyboard 'APOD' as 'UIKit.UINavigationController'.") }
      }
      
      fileprivate init() {}
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      fileprivate init() {}
    }
    
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UITabBarController
      
      let bundle = R.hostingBundle
      let name = "Main"
      let tabController = StoryboardViewControllerResource<UIKit.UITabBarController>(identifier: "tabController")
      
      func tabController(_: Void = ()) -> UIKit.UITabBarController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: tabController)
      }
      
      static func validate() throws {
        if _R.storyboard.main().tabController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'tabController' could not be loaded from storyboard 'Main' as 'UIKit.UITabBarController'.") }
      }
      
      fileprivate init() {}
    }
    
    struct settings: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = UIKit.UINavigationController
      
      let bundle = R.hostingBundle
      let name = "Settings"
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
