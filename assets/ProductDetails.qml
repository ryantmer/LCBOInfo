import bb.cascades 1.2

Page {
    property variant data: {}
    attachedObjects: [
        ComponentDefinition {
            id: imageSheetDef
            content: Sheet {
                id: imageSheet
                Page {
                    titleBar: TitleBar {
                        dismissAction: ActionItem {
                            title: "Close"
                            onTriggered: {
                                imageSheet.close();
                            }
                        }
                    }
                    Container {
                        layout: DockLayout {}
                        background: Color.White
                        
                        ScrollView {
                            horizontalAlignment: HorizontalAlignment.Fill
                            verticalAlignment: VerticalAlignment.Fill
                            scrollViewProperties {
                                pinchToZoomEnabled: true
                                scrollMode: ScrollMode.Both
                                minContentScale: 1.0
                                maxContentScale: 5.0
                            }
                            
                            WebView {
                                url: data.image_url
                            }
                        }
                    }
                }
            }
        }
    ]
    function setup() {
        console.log("Getting inventory info for " + data.id + " at " + app.myStore);
        app.queryProductAtStore(data.id, app.myStore);
    }
    function price(price_in_cents) {
        var price = price_in_cents / 100;
        if (price_in_cents % 100 == 0) {
            price += ".00"
        } else if (price_in_cents % 10 == 0) {
            price += "0"
        }
        return "$" + price
    }
    
    Container {
        ScrollView {
            scrollViewProperties.scrollMode: ScrollMode.Vertical
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            
            Container {
                layout: StackLayout { orientation: LayoutOrientation.TopToBottom }
                topPadding: 20
                rightPadding: topPadding
                bottomPadding: topPadding
                leftPadding: topPadding
                horizontalAlignment: HorizontalAlignment.Fill
                verticalAlignment: VerticalAlignment.Fill

                Label {
                    text: data.name
                    textStyle.fontSize: FontSize.Large
                    multiline: true
                }
                Label {
                    text: "This product is discontinued"
                    visible: data.is_discontinued
                    textStyle.color: Color.Red
                    textStyle.fontSize: FontSize.Medium
                }
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    topPadding: 20
                    bottomPadding: topPadding
                    leftPadding: topPadding
                    rightPadding: topPadding
                    
                    WebView {
                        url: data.image_thumb_url.toString()
                        minWidth: 240
                        minHeight: 320
                        preferredWidth: minWidth
                        preferredHeight: minHeight
                        rightMargin: 20
                        verticalAlignment: VerticalAlignment.Center
                        gestureHandlers: TapHandler {
                            onTapped: {
                                imageSheetDef.createObject().open();
                            }
                        }
                    }
                    Container {
                        layout: StackLayout { orientation: LayoutOrientation.TopToBottom }
                        
                        Label {
                            text: data.style + ", " + data.varietal
                            multiline: true
                            visible: data.style != undefined && data.varietal != undefined
                        }
                        Label {
                            text: data.package
                            multiline: true
                            visible: data.package != undefined
                        }
                        //Sale label
                        Label {
                            text: "<html><span style='text-decoration:line-through'>" +
                            price(data.regular_price_in_cents) +
                            "</span>  <span style='color:red'>" +
                            price(data.price_in_cents) +
                            "</span> - save " +
                            price(data.limited_time_offer_savings_in_cents) +
                            " until " + data.limited_time_offer_ends_on + "!</html>"
                            multiline: true
                            visible: data.has_limited_time_offer
                        }
                        //Non-sale label
                        Label {
                            text: price(data.price_in_cents)
                            multiline: true
                            visible: !data.has_limited_time_offer
                        }
                        ImageView {
                            topMargin: 20
                            rightMargin: topMargin
                            bottomMargin: topMargin
                            leftMargin: topMargin
                            imageSource: "asset:///images/vqa.png"
                            preferredHeight: 100
                            preferredWidth: 100
                            visible: data.is_vqa
                        }
                        ImageView {
                            topMargin: 20
                            rightMargin: topMargin
                            bottomMargin: topMargin
                            leftMargin: topMargin
                            imageSource: "asset:///images/ocb.png"
                            preferredHeight: 100
                            preferredWidth: 100
                            visible: data.is_ocb
                        }
                        ImageView {
                            topMargin: 20
                            rightMargin: topMargin
                            bottomMargin: topMargin
                            leftMargin: topMargin
                            imageSource: "asset:///images/kosher.png"
                            preferredHeight: 100
                            preferredWidth: 100
                            visible: data.is_kosher
                        }
                    }
                }
                SegmentedControl {
                    id: selector
                    Option {
                        text: "Information"
                        value: "Information"
                    }
                    Option {
                        text: "Tasting & Serving"
                        value: "Tasting & Serving"
                    }
                }
                //Information
                Label {
                    text: "Bonus Reward Miles: " + data.bonus_reward_miles +
                    " (ends on " + data.bonus_reward_miles_ends_on + ")"
                    visible: data.has_bonus_reward_miles && selector.selectedValue == "Information"
                    multiline: true
                }
                Label {
                    text: "Promotion: " + data.value_added_promotion_description
                    visible: data.has_value_added_promotion && selector.selectedValue == "Information"
                    multiline: true
                }
                Label {
                    text: "Produced by " + data.producer_name + " in " + data.origin
                    visible: data.producer_name != undefined && data.origin != undefined && selector.selectedValue == "Information"
                    multiline: true
                }
                Label {
                    text: "Price per Litre: " + price(data.price_per_liter_in_cents)
                    visible: data.price_per_liter_in_cents != undefined && selector.selectedValue == "Information"
                    multiline: true
                }
                Label {
                    text: "Price per Litre of Alcohol: " + price(data.price_per_liter_of_alcohol_in_cents)
                    visible: data.price_per_liter_of_alcohol_in_cents != undefined && selector.selectedValue == "Information"
                    multiline: true
                }
                Label { //No favourite store label
                    text: "<html><i>Set a favourite store to see if this product is " +
                    "available at an LCBO near you!</i></html>"
                    visible: app.inventoryCount < 0
                    multiline: true
                }
                Label { //No inventory label
                    text: "<html>Inventory at Store #" + app.myStore + ": " +
                    "<span style='color:red'>" + app.inventoryCount + "</span></html>"
                    visible: app.inventoryCount == 0
                    multiline: true
                }
                Label { //Has inventory label
                    text: "<html>Inventory at Store #" + app.myStore + ": " +
                    "<span style='color:green'>" + app.inventoryCount + "</span></html>"
                    visible: app.inventoryCount > 0
                    multiline: true
                }
                //Tasting & Serving
                Label {
                    text: data.tasting_note
                    visible: data.tasting_note != undefined && selector.selectedValue == "Tasting & Serving"
                    multiline: true
                }
                Label {
                    text: data.serving_suggestion
                    visible: data.serving_suggestion != undefined && selector.selectedValue == "Tasting & Serving"
                    multiline: true
                }
            }
        }
    }
}