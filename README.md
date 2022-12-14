# News App
### Made by Flutter

## Used
- Skills
```
Flutter, Dart, Getx, MVVM
```
- Install
```
get: ^4.6.5
cached_network_image: ^3.2.2
http: ^0.13.5

//Fonts
PlayfairDisplay
```
## Data
```
https://newsapi.org/

//General News API
https://newsapi.org/v2/top-headlines?country=us&apiKey=

//Category News API
https://newsapi.org/v2/top-headlines?country=us&categpry=sports&apiKey=

//search News API
https://newsapi.org/v2/everything?q=bitcoin&apiKey=
```

## To do
```
- MVVM Refactoring
```

## Screen Shot

### Home
![home](https://user-images.githubusercontent.com/55618626/193697384-3305e177-a9b4-4f61-85cd-31b6d94a750d.gif)



### Search
![search](https://user-images.githubusercontent.com/55618626/193697402-d38d50f1-a122-48ba-bb1b-651eb2a0c97e.gif)

### Breacking News
![ezgif com-gif-maker](https://user-images.githubusercontent.com/55618626/193698084-6e7a4020-6b77-47ec-b1fb-0ac4b28cb75d.gif)


## Folder Structure 
```
  main.dart
│  size.dart
│
├─components
│      news_basic_tile.dart
│      news_horizontal_tile.dart
│      news_tile.dart
│      news_type_tile.dart
│      search_result_tile.dart
│      title_tile.dart
│
├─models
│      news_model.dart
│
├─screens
│      detail_screen.dart
│      home_screen.dart
│      main_screen.dart
│      news_screen.dart
│      search_screen.dart
│
└─viewmodels
        main_sceen_view_model.dart
        news_view_model.dart
```


