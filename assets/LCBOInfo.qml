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
                
                Label {
                    text: "Search By Keyword"
                    horizontalAlignment: HorizontalAlignment.Left
                }
                TextField {
                    id: searchField
                    hintText: "e.g. City, Street Name, Store Postal Code"
                    horizontalAlignment: HorizontalAlignment.Fill
                }
                Button {
                    text: "Search"
                    horizontalAlignment: HorizontalAlignment.Center
                    
                    onClicked: {
                        navPane.push(searchResultsPage);
                        var query = {};
                        query.q = searchField.text;
                        app.query(query);
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