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
                    navPane.push(searchResultsPage);
                    var query = {};
                    query.type = "store";
                    query.lat = 43.4541;
                    query.lon = -80.5554;
                    app.query(query);
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