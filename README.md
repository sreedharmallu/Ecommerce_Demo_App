
![Simulator Screenshot - iPhone 15 - 2024-11-07 at 18 56 53](https://github.com/user-attachments/assets/064788da-03e5-42d1-bdb5-250eca7950e0)


![Simulator Screenshot - iPhone 15 - 2024-11-07 at 18 57 02](https://github.com/user-attachments/assets/1360a48e-510a-4786-96d5-af476a42af89)

![Simulator Screenshot - iPhone 15 - 2024-11-07 at 18 57 26](https://github.com/user-attachments/assets/e71b4033-3310-4599-91fe-ca864b31f230)


# eCommerce iOS App
## Objective
A simple iOS app to display a list of items fetched from an API. Users can view item details, add items to a cart, and proceed to checkout.

## Features
<b>Grid View:</b> Displays items in a grid layout based on API data with static content as fallback.

<b>Item Interaction:</b> Tapping on an item displays a preview of the item’s details.

<b>Cart Functionality:</b> Users can add or remove items from the cart by tapping the heart icon. A badge on the cart icon reflects the cart count.

<b>Cart Display:</b> Shows cart items in a list format.

<b>Checkout:</b> A "Thank You" popup message upon checkout.


## Requirements
<b>Design:</b> UI based on provided reference screenshot.

<b>Data:</b> API URL - https://fakestoreapi.com/products.

<b>Content:</b> Each item displays an image, title, description, price, and rating.

<b>Error Handling:</b> Network request errors are handled gracefully.

<b>UI Update:</b> UI updates dynamically based on fetched data.


## Implementation Details
<b>Architecture:</b> Built using MVVM for a clear separation of concerns.

<b>Framework:</b> UIKit or SwiftUI (interchangeable as per app requirements).

<b>Image Caching:</b> Implemented an image caching mechanism to optimize performance.


## Custom Components:
<b>Custom Stepper:</b> Allows users to adjust item quantity.

<b>Custom Badge View:</b> Displays the cart count in the top bar.

## How to Use
<b>Launch the App:</b> Items from the API load automatically on the main screen.

<b>View Item Details:</b> Tap an item to see a detailed view.

<b>Add to Cart:</b> Tap the heart icon on items to add/remove them from the cart.

<b>View Cart:</b> Tap the cart icon to see all items added to the cart.

<b>Checkout:</b> Tap the checkout button in the cart to complete the purchase.

## Error Handling
Network requests are handled with error alerts for connection issues or data load failures.

## Installation
Clone the repository.
Open the project in Xcode.
Run the app on an iOS simulator or device.
