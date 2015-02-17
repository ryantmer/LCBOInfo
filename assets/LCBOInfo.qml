import bb.cascades 1.2

NavigationPane {
    id: navPane

    Page {
        Container {
            layout: DockLayout {}
            background: Color.create("#BBCACB")
            
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.TopToBottom
                }
                horizontalAlignment: HorizontalAlignment.Fill
                verticalAlignment: VerticalAlignment.Center
                topPadding: 50
                rightPadding: 50
                bottomPadding: 50
                leftPadding: 50
                
                Label {
                    text: "What would you like to do?"
                    textStyle {
                        base: SystemDefaults.TextStyles.TitleText
                        color: Color.Black
                    }
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
                    
                    Label {
                        text: "Find a Store"
                        textStyle {
                            base: SystemDefaults.TextStyles.BigText
                            color: Color.White
                        }
                        horizontalAlignment: HorizontalAlignment.Center
                        verticalAlignment: VerticalAlignment.Center
                    }
                    
                    gestureHandlers: [
                        TapHandler {
                            onTapped: {
                                var page = storeSearch.createObject();
                                navPane.push(page);
                            }
                        }
                    ]
                }
                
                Container {
                    topPadding: 50
                    rightPadding: 50
                    bottomPadding: 50
                    leftPadding: 50
                    background: Color.create("#4C3838")
                    horizontalAlignment: HorizontalAlignment.Fill
                    
                    Label {
                        text: "Find a Product"
                        textStyle {
                            base: SystemDefaults.TextStyles.BigText
                            color: Color.White
                        }
                        horizontalAlignment: HorizontalAlignment.Center
                        verticalAlignment: VerticalAlignment.Center
                    }
                    
                    gestureHandlers: [
                        TapHandler {
                            onTapped: {
                                var page = productSearch.createObject();
                                navPane.push(page);
                            }
                        }
                    ]
                }
            }
            
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
        }
    }
}