import CoreGraphics

extension CGAffineTransform {
    
    /// Converts UIBezierPath in GlyphInfo from CoreImage coordinate system to UIKit
    public static func fromCoreImageCoordinates(in view: PlatformSpecificViewClass) -> CGAffineTransform {
        CGAffineTransform(scaleX: 1, y: -1).translatedBy(x: 0, y: -view.bounds.size.height)
    }
}


