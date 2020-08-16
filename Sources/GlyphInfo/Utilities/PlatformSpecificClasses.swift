#if canImport(UIKit)

import UIKit
public typealias PlatformSpecificViewClass = UIView
public typealias PlatformSpecificFontClass = UIFont

#elseif os(macOS)

import AppKit
public typealias PlatformSpecificViewClass = NSView
public typealias PlatformSpecificFontClass = NSFont

#endif
