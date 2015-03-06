import bb.cascades 1.2

NavigationPane {
    id: navPane

    Page {
        attachedObjects: [
            ComponentDefinition {
                id: storeSearch
                content: StoreSearch {}
            },
            ComponentDefinition {
                id: productSearch
                content: ProductSearch {}
            }
        ]
        
        Container {
            layout: DockLayout {}
            background: Color.create("#BBCACB")
            
            Container {
                layout: StackLayout { orientation: LayoutOrientation.TopToBottom }
                horizontalAlignment: HorizontalAlignment.Fill
                verticalAlignment: VerticalAlignment.Center
                topPadding: 50
                rightPadding: 50
                bottomPadding: 50
                leftPadding: 50
                
                Label {
                    text: "What would you like to do?"
                    textStyle.fontSize: FontSize.Large
                    bottomMargin: 50
                    horizontalAlignment: HorizontalAlignment.Center
                }
                Container {
                    topPadding: 50
                    rightPadding: 50
                    bottomPadding: 50
                    leftPadding: 50
                    bottomMargin: 50
                    background: Color.create("#2C3C2D")
                    horizontalAlignment: HorizontalAlignment.Fill
                    gestureHandlers: [
                        TapHandler {
                            onTapped: {
                                var page = storeSearch.createObject();
                                navPane.push(page);
                            }
                        }
                    ]
                    
                    Label {
                        text: "Find a Store"
                        textStyle.fontSize: FontSize.XLarge
                        textStyle.color: Color.White
                        horizontalAlignment: HorizontalAlignment.Center
                        verticalAlignment: VerticalAlignment.Center
                    }
                }
                Container {
                    topPadding: 50
                    rightPadding: 50
                    bottomPadding: 50
                    leftPadding: 50
                    background: Color.create("#4C3838")
                    horizontalAlignment: HorizontalAlignment.Fill
                    gestureHandlers: [
                        TapHandler {
                            onTapped: {
                                var page = productSearch.createObject();
                                navPane.push(page);
                            }
                        }
                    ]
                    
                    Label {
                        text: "Find a Product"
                        textStyle.fontSize: FontSize.XLarge
                        textStyle.color: Color.White
                        horizontalAlignment: HorizontalAlignment.Center
                        verticalAlignment: VerticalAlignment.Center
                    }
                }
            }
        }
    }
}