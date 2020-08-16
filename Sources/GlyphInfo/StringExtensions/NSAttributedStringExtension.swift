import Foundation
import CoreGraphics
import CoreText

extension NSAttributedString {
    
    public func getGlyphsInfo(convertToCoordinatesOf sourceView: PlatformSpecificViewClass? = nil) -> [GlyphInfo] {
        
        let typesetter = CTTypesetterCreateWithAttributedString(self)
        let line = CTTypesetterCreateLine(typesetter, CFRange(location: 0, length: length))
            
        let runs = CTLineGetGlyphRuns(line)
        let runsArray = (runs as [AnyObject]) as! [CTRun]
        
        var glyphInfos = [GlyphInfo]()
        
        for run in runsArray {
            let numberOfGlyphsInRun = CTRunGetGlyphCount(run)
            let range = CFRangeMake(0, numberOfGlyphsInRun)
            
            // Get glyphs
            let glyphsBuffer = UnsafeMutablePointer<CGGlyph>.allocate(capacity: numberOfGlyphsInRun)
            CTRunGetGlyphs(run, range, glyphsBuffer)
            
            // Get positions
            let positionsBuffer = UnsafeMutablePointer<CGPoint>.allocate(capacity: numberOfGlyphsInRun)
            CTRunGetPositions(run, range, positionsBuffer)
            
            for index in 0..<numberOfGlyphsInRun {
                let position = positionsBuffer[index]

                let ctFont = (attribute(.font, at: index, effectiveRange: nil) as! CTFont?) ?? CTFontCreateUIFontForLanguage(.system, 12, nil)!
                
                var path: CGPath?
                if let cgPath = CTFontCreatePathForGlyph(ctFont, glyphsBuffer[index], nil) {
                    if let sourceView = sourceView {
                        var transform = CGAffineTransform.fromCoreImageCoordinates(in: sourceView)
                        path = cgPath.copy(using: &transform)
                    } else {
                        path = cgPath
                    }
                }

                let letter = string[string.index(string.startIndex, offsetBy: Int(index))]
                
                let bounds = CTFontGetBoundingRectsForGlyphs(ctFont, .default, &glyphsBuffer[index], nil, 1)
                
                let glyphInfo = GlyphInfo(letter: letter,
                                          index: Int(index),
                                          path: path,
                                          position: position,
                                          bounds: bounds.size)
                glyphInfos.append(glyphInfo)
            }
        }
        
        return glyphInfos
    }
}
