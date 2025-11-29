# redditoster

Test task.

You need to write a Flutter app to view posts in the FlutterDev subreddit.

Link to retrieve posts: reddit.com/r/flutterdev/new.json

Main screen: A list of 25 posts. Each list cell displays a post image (thumbnail) and title. If the thumbnail is empty, only the title is displayed. The main screen allows you to perform a "Pull to refresh" gesture to reload the 25 posts. If the response contains new posts, we add them to the top of the list. If the response contains existing posts, we need to update their information. Tapping a list cell opens a screen with detailed information about the post.

Post screen: This screen displays detailed information about the post: title, number of upvotes, and post text (selftext).

The application should cache data and display the user's most recently loaded posts without internet access.

There are no restrictions on using external libraries. The resulting project should be uploaded to a public repository on GitHub.
