### Login mongo shell

```Bash
$ mongo  --username <your_username> --password "<your_password>"  --authenticationDatabase <db_name> --host <host.name.com> --port <port>
MongoDB shell version: 3.2.12
connecting to: host.name.com:27000/test
>
```

### Switch to the authorized db

```Bash
> use db_name
switched to db db_name
```

### You can change the role of user, though you don't really need read and write permission

```Bash
> db.grantRolesToUser("a_user",["readWrite"])
> show users
{
    "_id" : "db_name.test",
    "user" : "a_user",
    "db" : "db_name",
    "roles" : [
        {
            "role" : "read",
            "db" : "db_name"
        }
    ]
}
{
    "_id" : "db_name.a_user",
    "user" : "a_user",
    "db" : "db_name",
    "roles" : [
        {
            "role" : "readWrite",
            "db" : "db_name"
        },
        {
            "role" : "dbOwner",
            "db" : "db_name"
        }
    ]
}

```

### To change the password
```Shell
> db.changeUserPassword("admin_user", "xxxxxxxxxxxxxxxxx")
```
