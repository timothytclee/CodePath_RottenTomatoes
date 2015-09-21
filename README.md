## Rotten Tomatoes

This is a movies app displaying box office and top rental DVDs using the [Rotten Tomatoes API](http://developer.rottentomatoes.com/docs/read/JSON).

Time spent: 15hrs

### Features
- I used container views to separate the DVD and BoxOffice tabs.  Not sure if this is the most efficient way to implement.
- Navigation bar is customized for each tab
- Images fade in using animation/alpha, replacing low-res thumbnail images, but I wasn't sure how to deal with the caching
- Spent some time investigating but I couldn't figure out how to add search functionality (beyond a basic search box and delegate)'
- First screenshot shows networking error with wifi turned off, then wifi is turned on to walk through full functionality

#### Required

- [x] User can view a list of movies. Poster images load asynchronously.
- [x] User can view movie details by tapping on a cell.
- [x] User sees loading state while waiting for the API.
- [x] User sees error message when there is a network error: http://cl.ly/image/1l1L3M460c3C
- [x] User can pull to refresh the movie list.

#### Optional

- [x] Add a tab bar for Box Office and DVD.
- [ ] Implement segmented control to switch between list view and grid view.
- [ ] Add a search bar.
- [x] All images fade in.
- [x] For the large poster, load the low-res image first, switch to high-res when complete.
- [x] Customize the highlight and selection effect of the cell.
- [x] Customize the navigation bar.


### Walkthrough
![Video Walkthrough](https://raw.githubusercontent.com/timothytclee/CodePath_RottenTomatoes/master/CodePath_RottenTomatoes2.gif)

Credits
---------
* [Rotten Tomatoes API](http://developer.rottentomatoes.com/docs/read/JSON)
* [AFNetworking](https://github.com/AFNetworking/AFNetworking)