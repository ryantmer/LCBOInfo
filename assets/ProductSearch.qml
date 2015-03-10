import bb.cascades 1.2

Page {
    attachedObjects: [
        ComponentDefinition {
            id: resultsPage
            content: ProductSearchResults {}
        }
    ]
    
    Container {
        ScrollView {
            scrollViewProperties.scrollMode: ScrollMode.Vertical
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            
            Container {
                layout: StackLayout { orientation: LayoutOrientation.TopToBottom }
                horizontalAlignment: HorizontalAlignment.Fill
                verticalAlignment: VerticalAlignment.Fill
                topPadding: 50
                rightPadding: topPadding
                bottomPadding: topPadding
                leftPadding: topPadding
                
                Label {
                    text: "Select a category"
                    horizontalAlignment: HorizontalAlignment.Center
                    textStyle.fontSize: FontSize.Medium
                    bottomMargin: 20
                }
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    bottomMargin: 20
                    
                    ProductCategory {
                        buttonText: "Sale Items"
                        onClicked: {
                            var query = {};
                            query.where = "has_limited_time_offer";
                            app.queryProducts(query);
                            var page = resultsPage.createObject();
                            page.searchQuery = query;
                            navPane.push(page);
                        }
                    }
                    ProductCategory {
                        buttonText: "Reward Miles"
                        onClicked: {
                            var query = {};
                            query.where = "has_bonus_reward_miles";
                            app.queryProducts(query);
                            var page = resultsPage.createObject();
                            page.searchQuery = query;
                            navPane.push(page);
                        }
                    }
                }
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    bottomMargin: 20
                    
                    ProductCategory {
                        buttonText: "Special Offers"
                        onClicked: {
                            var query = {};
                            query.where = "has_value_added_promotion";
                            app.queryProducts(query);
                            var page = resultsPage.createObject();
                            page.searchQuery = query;
                            navPane.push(page);
                        }
                    }
                    ProductCategory {
                        buttonText: "Seasonal Items"
                        onClicked: {
                            var query = {};
                            query.where = "is_seasonal";
                            app.queryProducts(query);
                            var page = resultsPage.createObject();
                            page.searchQuery = query;
                            navPane.push(page);
                        }
                    }
                }
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    bottomMargin: 20
                    
                    ProductCategory {
                        buttonText: "VQA Wines"
                        onClicked: {
                            var query = {};
                            query.where = "is_vqa";
                            app.queryProducts(query);
                            var page = resultsPage.createObject();
                            page.searchQuery = query;
                            navPane.push(page);
                        }
                    }
                    ProductCategory {
                        buttonText: "OCB Beers"
                        onClicked: {
                            var query = {};
                            query.where = "is_ocb";
                            app.queryProducts(query);
                            var page = resultsPage.createObject();
                            page.searchQuery = query;
                            navPane.push(page);
                        }
                    }
                }
                Label {
                    text: "-or-"
                    textStyle.fontSize: FontSize.Medium
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                    topMargin: 50
                    bottomMargin: topMargin
                    multiline: true
                }
                Container { //Search by Keyword box
                    layout: StackLayout { orientation: LayoutOrientation.TopToBottom }
                    background: Color.create("#4C3838")
                    horizontalAlignment: HorizontalAlignment.Fill
                    verticalAlignment: VerticalAlignment.Center
                    topPadding: 50
                    rightPadding: topPadding
                    bottomPadding: topPadding
                    leftPadding: topPadding
                    
                    Label {
                        text: "Search by Keyword"
                        textStyle.fontSize: FontSize.XLarge
                        textStyle.color: Color.White 
                        bottomMargin: 50
                        horizontalAlignment: HorizontalAlignment.Center
                        multiline: true
                    }
                    TextField {
                        id: searchField
                        hintText: "e.g. vodka, Ontario, VQA"
                        horizontalAlignment: HorizontalAlignment.Center
                        textStyle.color: Color.create("#2C3C2D")
                        focusHighlightEnabled: false
                        input.submitKey: SubmitKey.Search
                        input.onSubmitted: {
                            var query = {};
                            query.q = searchField.text;
                            app.queryProducts(query);
                            var page = resultsPage.createObject();
                            page.searchQuery = query;
                            navPane.push(page);
                        }
                    }
                }
            }
        }
    }
}