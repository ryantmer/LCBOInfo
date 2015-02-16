import bb.cascades 1.2

NavigationPane {
    id: navPane
    
    Page {
        Container {
            layout: DockLayout {}
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
                
                Button {
                    text: "Find nearby stores"
                    horizontalAlignment: HorizontalAlignment.Center
                    
                    onClicked: {
                        navPane.push(searchResultsPage);
                        app.nearbyStores();
                    }
                }
            }
        }
    }
    
    attachedObjects: [
        FavouriteStores {
            id: favouriteStoresPage
        },
        FavouriteProducts {
            id: favouriteProductsPage
        },
        SearchResults {
            id: searchResultsPage
        }
    ]
}