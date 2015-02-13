import bb.cascades 1.2

NavigationPane {
    id: navPane
    
    Page {
        Container {
            Button {
                text: "Go"
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
                
                onClicked: {
                    var query = {};
                    query.lat = 43.4541;
                    query.lon = -80.5554;
                    app.storeSearch(query);
                    navPane.push(searchResultsPage);
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