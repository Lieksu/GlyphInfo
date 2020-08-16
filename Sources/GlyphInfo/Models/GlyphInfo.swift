import CoreGraphics

public struct GlyphInfo {
    let letter: Character
    let index: Int
    let path: CGPath?
    let position: CGPoint
    let bounds: CGSize
}
