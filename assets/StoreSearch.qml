import bb.cascades 1.2

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
            
            Container {
                id: activityContainer
                objectName: "activityContainer"
                visible: false
                
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                
                ActivityIndicator {
                    visible: true
                    running: true
                    preferredHeight: 100
                }
                Label {
                    id: statusLabel
                    objectName: "statusLabel"
                    text: "Getting location..."
                    verticalAlignment: VerticalAlignment.Center
                }
            }
            
            Container {
                id: pageContent
                objectName: "pageContent"
                
                horizontalAlignment: HorizontalAlignment.Fill
                verticalAlignment: VerticalAlignment.Fill
                layout: StackLayout {
                    orientation: LayoutOrientation.TopToBottom
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
                        text: "Find Nearby Stores"
                        textStyle.fontSize: FontSize.XXLarge
                        textStyle.color: Color.White 
                        horizontalAlignment: HorizontalAlignment.Center
                        verticalAlignment: VerticalAlignment.Center
                    }
                    
                    gestureHandlers: [
                        TapHandler {
                            onTapped: {
                                var page = resultsPage.createObject();
                                navPane.push(page);
                                app.nearbyStores();
                            }
                        }
                    ]
                }
                
                
                
                Label {
                    text: "-or-"
                    textStyle.fontSize: FontSize.Medium
                    bottomMargin: 50
                    horizontalAlignment: HorizontalAlignment.Center
                    multiline: true
                }
                TextField {
                    id: searchField
                    hintText: "Search by city, street, etc."
                    horizontalAlignment: HorizontalAlignment.Fill
                    textStyle.color: Color.create("#2C3C2D")
                    focusHighlightEnabled: false
                    input.submitKey: SubmitKey.Search
                    input {
                        onSubmitted: {
                            var page = resultsPage.createObject();
                            navPane.push(page);
                            var query = {};
                            query.q = searchField.text;
                            app.query(query);
                        }
                    }
                }
            }
        }
    }
    
    attachedObjects: [
        ComponentDefinition {
            id: resultsPage
            content: StoreSearchResults {}
        }
    ]
}