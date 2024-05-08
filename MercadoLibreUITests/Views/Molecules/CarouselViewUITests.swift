//
//  CarouselViewUITests.swift
//  MercadoLibreUITests
//
//  Created by Juan Camilo Marín Ochoa on 8/05/24.
//

import XCTest

final class CarouselViewUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testInitialView() throws {
        let firstImage = app.images["cover-0"]
        XCTAssertTrue(firstImage.exists, "La primera imagen debería ser visible al cargar")
    }
    
    func testImageScaling() throws {
        XCUIDevice.shared.orientation = .portrait
        sleep(1)
        
        let image = app.images.element(boundBy: 0)
        let initialHeight = image.frame.size.height
        
        XCUIDevice.shared.orientation = .landscapeRight
        sleep(1)
        let landscapeHeight = image.frame.size.height
        
        XCUIDevice.shared.orientation = .portrait
        sleep(1)
        
        XCTAssertNotEqual(initialHeight, landscapeHeight, "La altura de la imagen debería cambiar con el cambio de orientación")
    }
    
    func testSwipeThroughImages() throws {
        let firstImage = app.images["cover-0"]
        let secondImage = app.images["cover-1"]
        
        firstImage.swipeLeft()
        XCTAssertTrue(secondImage.isHittable, "La segunda imagen debería ser accesible después de deslizar")
    }
    
    func testOrientationChange() throws {
        XCUIDevice.shared.orientation = .landscapeRight
        sleep(1)
        
        let image = app.images.element(boundBy: 0)
        
        XCUIDevice.shared.orientation = .portrait
        sleep(1)
        
        XCTAssertTrue(image.exists, "La imagen debería ajustarse y ser visible en orientación horizontal")
    }
}
