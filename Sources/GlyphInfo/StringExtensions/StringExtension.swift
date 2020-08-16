import Foundation

extension String {
    public func getGlyphsInfo(forFont font: PlatformSpecificFontClass, convertToCoordinatesOf sourceView: PlatformSpecificViewClass? = nil) -> [GlyphInfo] {

        let attributedString = NSAttributedString(string: self, attributes: [.font: font])
        
        return attributedString.getGlyphsInfo(convertToCoordinatesOf:  sourceView)
    }
}
