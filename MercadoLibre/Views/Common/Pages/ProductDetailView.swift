//
//  ProductDetailView.swift
//  MercadoLibre
//
//  Created by Juan Camilo Marín Ochoa on 7/05/24.
//

import SwiftUI

struct ProductDetailView: View {
    var product: ProductModel
    
    @State private var isLandscape = false
    
    var body: some View {
        let height = UIScreen.main.bounds.height / (!isLandscape ? 2 : 1)
        
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Spacer()
                        .frame(height: 20)
                    
                    VStack(alignment: .leading) {
                        Text(product.title)
                            .lineLimit(1)
                            .truncationMode(.tail)
                        
                        Text("seller").foregroundStyle(.gray) +
                        Text(" \(product.seller.nickname)")
                            .foregroundStyle(Color(hex: "fee603"))
                            .bold()
                    }
                    .padding(.horizontal)
                    
                    ImageView(imageURL: URL(string: product.thumbnail)!)
                        .frame(
                            width: UIScreen.main.bounds.width,
                            height: height
                        )
                        .clipped()
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                        .frame(height: height)
                    
                    Spacer()
                        .frame(height: 30)
                    
                    VStack(alignment: .leading) {
                        Text(product.price != nil ? "$\(product.price!)" : "price-not-available")
                            .font(.title)
                        
                        Text("stock \(String(product.installments?.quantity ?? 0))")
                            .foregroundStyle(.gray)
                    }
                    .padding(.horizontal)
                }
            }
            .onAppear {
                self.updateOrientation()
                
                NotificationCenter.default.addObserver(
                    forName: UIDevice.orientationDidChangeNotification, object: nil, queue: .main) { _ in
                        self.updateOrientation()
                    }
            }
            .onDisappear {
                NotificationCenter.default.removeObserver(self)
            }
        }
        
    }
    
    private func updateOrientation() {
        isLandscape = [UIDeviceOrientation.landscapeLeft, UIDeviceOrientation.landscapeRight].contains(UIDevice.current.orientation)
    }
}

#Preview {
    ProductDetailView(
        product: ProductModel(
            id: "MCO2331938410",
            title: "Veneno Cancún No Tóxico Mata Cucarachas X 500 Ml",
            condition: "new",
            thumbnailID: "637649-MLU75684312228_042024",
            catalogProductID:"MCO35859957",
            listingTypeID: "gold_special",
            permalink: "https://www.mercadolibre.com.co/veneno-cancun-no-toxico-mata-cucarachas-x-500-ml/p/MCO35859957",
            buyingMode: "buy_it_now",
            siteID: "MCO",
            categoryID: "MCO442409",
            domainID: "MCO-INSECTICIDES",
            thumbnail: "http://http2.mlstatic.com/D_637649-MLU75684312228_042024-I.jpg",
            currencyID: "COP",
            orderBackend: 1,
            price: 19500,
            originalPrice: nil,
            salePrice: nil,
            availableQuantity: 1,
            officialStoreID: nil,
            useThumbnailID: true,
            acceptsMercadopago: true,
            shipping: ProductsShipping(
                storePickUp: false,
                freeShipping: false,
                logisticType: "fulfillment",
                mode: "me2",
                tags: [
                    "fulfillment"
                ],
                benefits: nil,
                promise: nil
            ),
            stopTime: "2044-04-13T04:00:00.000Z",
            seller: ProductsSeller(
                id: 165861021,
                nickname: "KATERINESERRANOA"
            ),
            attributes: [
                ProductsResultAttribute(
                    id: "BRAND",
                    name: "Marca",
                    valueID: "15888701",
                    valueName: "Cancun",
                    attributeGroupID: "OTHERS",
                    attributeGroupName: "Otros",
                    valueStruct: nil,
                    values: [
                        ProductsAttributeValue(
                            id: "15888701",
                            name: "Cancun",
                            valueStruct: nil,
                            source: 1
                        )
                    ],
                    source: 1,
                    valueType: "string"
                )
            ],
            installments: ProductsInstallments(
                quantity: 48,
                amount: 406.25,
                rate: 0,
                currencyID: "COP"
            ),
            winnerItemID: nil,
            catalogListing: true,
            discounts: nil,
            promotions: [],
            inventoryID: "GOZI31419",
            location: nil,
            sellerContact: nil,
            variationFilters: nil,
            variationsData: nil,
            officialStoreName: nil,
            differentialPricing: nil
        )
    )
}
