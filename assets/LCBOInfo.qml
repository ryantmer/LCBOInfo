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
            
            Container {
                layout: StackLayout { orientation: LayoutOrientation.TopToBottom }
                horizontalAlignment: HorizontalAlignment.Fill
                verticalAlignment: VerticalAlignment.Center
                topPadding: 50
                rightPadding: topPadding
                bottomPadding: topPadding
                leftPadding: topPadding
                
                Label {
                    text: "What would you like to do?"
                    textStyle.fontSize: FontSize.Large
                    bottomMargin: 50
                    horizontalAlignment: HorizontalAlignment.Center
                }
                CustomButton {
                    buttonText: "Find a Store"
                    buttonColour: Color.create("#2C3C2D")
                    onClicked: {
                        var page = storeSearch.createObject();
                        navPane.push(page);
                    }
                }
                CustomButton {
                    buttonText: "Find a Product"
                    buttonColour: Color.create("#4C3838")
                    onClicked: {
                        var page = productSearch.createObject();
                        navPane.push(page);
                    }
                }
            }
        }
    }
}