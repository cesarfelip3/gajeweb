gajeweb
=======

openssl pkcs12 -in pushcert.p12 -out pushcert.pem -nodes -clcerts

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

Non-SQL
=======

Seems non-SQL can't solve this problem too, one User have 1M+ friends or subscribes ?

User
Follow (User)

    A ==> B
    B ==> A

User

    Image : A 1 owen N

Image

    Comment : A 1 owen N
    Brander : A 1 owen N

Notificaiton

    user_uuid
    from : comment, brander, tracked
    object_id :
    to_id :
    create_date



From the relationship, if there is embedded document in mongodb, how could we manage image, or filter image, if we use reference, what priority it has? SQL is proved by mathematics, how about Non-SQL?



MongoDB

    Data Modeling

        Document

        Document Relationship

            Reference

                Independent Document

                    We need independent Document, only if we will have to operate it independently, for example
                    Post & Tag (Limited) ==>
                        {
                            _id: "",
                            title: "",
                            tag: [
                                "abc",
                                "def",
                                ...]
                        }

                    Tag ==> A list of tags
                    Has N


            Embedded Document

                One Document ==> Sub Document

                    Image & Comment ==>
                    Post & Comment ==>
                    Has A/N


SQL or NoSQL, no anwser
=======================

None of them is perfect, and SQL is not replacable actually.
The data model in reality not simply just store something there, but describe their relationship too..

From different data type, we may use different data model...
First, you will have to know your application, and its data model requirement...

    Read
    Write
    Transaction (ACID)
    Consistency
    Scalability
    Availablity
    Patition Tolerance

You can't just write an app without all these consideration, just like most programmer did everyday, they pick up a language, and a SQL database, then start to write something...

To know exactly your application, data and their possible size :

    User:

        10K
        10K - 1M
        1M+

    Image:

        10K
        10K - 1M
        1M+

    Comment:

        10K
        10K - 1M
        1M+

I have tried 1M data in MySQL, and it's dramatically slow when we do query, or simply try COUNT(*)...
I have worked with a web store which has 5K+ users, and they got 15-20 orders each day, so 20 * 360 = 7K+ orders / year...

    Read (daliy)

        less than 100 pages
        20 download sessions (30M)

    Write (daliy)

        20 uplod sessions (50M - 1G)
        20 orders

    Process (daliy)

        20 upload ==> convert to PDFs (printable)




















