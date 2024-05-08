//
//  ColorExtensionTests.swift
//  MercadoLibreTests
//
//  Created by Juan Camilo Marín Ochoa on 8/05/24.
//

import XCTest
import SwiftUI
@testable import MercadoLibre

class ColorExtensionTests: XCTestCase {
    func testThreeCharacterHex() {
        let color = Color(hex: "FAB")
        XCTAssertEqual(color, Color(red: 255 / 255, green: 170 / 255, blue: 187 / 255, opacity: 1.0))
    }
    
    func testSixCharacterHex() {
        let color = Color(hex: "FFAABB")
        XCTAssertEqual(color, Color(red: 255 / 255, green: 170 / 255, blue: 187 / 255, opacity: 1.0))
    }
    
    func testEightCharacterHex() {
        let color = Color(hex: "FFFFAABB")
        XCTAssertEqual(color, Color(red: 255 / 255, green: 170 / 255, blue: 187 / 255, opacity: 1.0))
    }
    
    func testInvalidHex() {
        let color = Color(hex: "XYZ")
        XCTAssertEqual(color, Color(red: 0, green: 0, blue: 0, opacity: 1.0))
    }
}
