//
//  ShoppingCartBtnViewUITests.swift
//  MercadoLibreUITests
//
//  Created by Juan Camilo Marín Ochoa on 8/05/24.
//

import XCTest

final class ShoppingCartBtnViewUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testButtonExists() throws {
        let cartButton = app.buttons["CartButton"]
        XCTAssertTrue(cartButton.exists, "El botón del carrito de compras debería estar visible")
    }
}
