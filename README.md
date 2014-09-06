gajeweb
=======

Now the question is about how to do with comment notification & brand notification?

1. only the app is running (foreground and background), it will pop up to info the user
2. the user table have a latest comment ID...or timestamp...

Reckless will bring a bad performance app....


User

    Image
    Follower (User)
    Comment

Image

    Brander
    Comment

Follower (User)

    Following (User)


User

    Image Collection

        Image

            Brander Collection

                Brander (User)

            Comment Collection

                Comment

    Follower Collection

        Follower

            Image Collection

                Image

                    Brander Collection
                    Comment Collection

    Following Collection

        Following

            Image Collection

                Image

                    Brander Collection
                    Comment Collection

    Notification (Latest)

        Image Collection
        Image Collection
        Follower Collection

To use mysql, the better way is having replicates enabled, and master, slave server will needed, the better way, we have two Virtual OS installed independently, and one is public, another is private one, this requirement also required more disk size...

For now, we only have 40G disk, and it's almost impossbile to have another OS running as well...
There is no way to support a large amout of traffics in current server, without cache, without database cache...

I think more better way, is to using mongodb && nodejs, coz it's easy to scale, and the performance is not bad...











