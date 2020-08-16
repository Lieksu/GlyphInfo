import XCTest
@testable import GlyphInfo

final class GlyphInfoTests: XCTestCase {
    func testNumberOfGlyphs() {
        let testString = NSAttributedString(string: "Hello, world!")
        let glyphs = testString.getGlyphsInfo()
        XCTAssertEqual(glyphs.count, testString.string.count)
    }
    
    func testGlyphsBounds() {
        let firstTestString = NSAttributedString(string: "H", attributes: [.font: UIFont.systemFont(ofSize: 13)])
        let secondTestString = NSAttributedString(string: "H", attributes: [.font: UIFont.systemFont(ofSize: 14)])
        
        let firstGlyph = firstTestString.getGlyphsInfo().first
        let secondGlyph = secondTestString.getGlyphsInfo().first
        
        XCTAssertNotEqual(firstGlyph?.bounds, secondGlyph?.bounds)
    }
    
    func testDifferentFontsInSameString() {
        let testString = NSMutableAttributedString(string: "Hello, world!", attributes: [.font: UIFont.systemFont(ofSize: 13)])
        let subrange = NSRange(location: 3, length: 1)
        testString.addAttribute(.font, value: 14, range: subrange)
        
        let glyphs = testString.getGlyphsInfo()
        let firstL = glyphs[2]
        let secondL = glyphs[3]
        
        XCTAssertNotEqual(firstL.bounds, secondL.bounds)
    }

    static var allTests = [
        ("testNumberOfGlyphs", testNumberOfGlyphs),
    ]
}
