# E-Commerce App

A Flutter application that provides users with a seamless e-commerce shopping experience.  
The app allows users to browse products, view details, add to cart, save favorites, and manage their profile.

---

## Features
- Browse products with detailed information
- Search and filter products
- Add products to cart
- Wishlist to save favorite products
- User profile management: edit profile, avatar selection
- Register, LogIn, and Password reset functionality
- Google Maps integration for delivery location
- Offline/online connectivity detection
- Persistent local storage for cart, wishlist, and user preferences

---

## Technologies & Packages
- **State Management**: Bloc, Flutter Bloc, Provider  
- **Dependency Injection**: Injectable, GetIt  
- **Networking**: Dio, HTTP  
- **Functional Programming**: Dartz  
- **Local Storage**: Hive, Hive Flutter, Shared Preferences, Path Provider  
- **UI & Styling**: Google Fonts, Carousel Slider, Cached Network Image  
- **Connectivity**: Connectivity Plus  
- **Onboarding**: Introduction Screen  

---

## Architecture
The project follows **Clean Architecture with MVVM pattern**, ensuring scalability, testability, and maintainability:

- **Presentation Layer** → Flutter UI with Bloc/Provider  
- **Domain Layer** → Entities and Use Cases (business logic)  
- **Data Layer** → Repository pattern with Remote (Dio/HTTP) and Local (Hive/SharedPreferences) sources  

---

## Screenshots

### Main Tabs
| Home | Product | Favourite | Profile |
|------|---------|-----------|---------|
| ![Home](assets/ScreenShots/E-Commerce%20Home%20Tab.png) | ![Product](assets/ScreenShots/E-Commerce%20Product%20Tab.png) | ![Favourite](assets/ScreenShots/E-Commerce%20Favourite%20Tab.png) | ![Profile](assets/ScreenShots/E-Commerce%20Profile%20Tab.png) |

### Other Screens
| Login | Register | Forget Password | Google Map |
|-------|----------|-----------------|------------|
| ![Login](assets/ScreenShots/E-Commerce%20LogIn%20Screen.png) | ![Register](assets/ScreenShots/E-Commerce%20Register%20Screen.png) | ![Forget Password](assets/ScreenShots/E-Commerce%20Forget%20Password%20Screen.png) | ![Google Map](assets/ScreenShots/E-Commerce%20Google%20Maps%20Tab.png) | 
