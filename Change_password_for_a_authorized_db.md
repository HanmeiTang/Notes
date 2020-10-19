### Login mongo shell

```Bash
$ mongo  --username hulk --password "CWQmP72PUq8EvcEpYMXu"  --authenticationDatabase wflow_test --host mavrldb.ucsd.edu --port 27017
MongoDB shell version: 3.2.12
connecting to: mavrldb.ucsd.edu:27017/test
>
```

### Switch to the authorized db

```Bash
> use wflow_test
switched to db wflow_test
```

### You can change the role of user, though you don't really need read and write permission

```Bash
> db.grantRolesToUser("hulk",["readWrite"])
> show users
{
    "_id" : "wflow_test.banner",
    "user" : "banner",
    "db" : "wflow_test",
    "roles" : [
        {
            "role" : "read",
            "db" : "wflow_test"
        }
    ]
}
{
    "_id" : "wflow_test.hulk",
    "user" : "hulk",
    "db" : "wflow_test",
    "roles" : [
        {
            "role" : "readWrite",
            "db" : "wflow_test"
        },
        {
            "role" : "dbOwner",
            "db" : "wflow_test"
        }
    ]
}

```

### To change the password
```Shell
> db.changeUserPassword("admin_hanmei", "xxxxxxxxxxxxxxxxx")
```
