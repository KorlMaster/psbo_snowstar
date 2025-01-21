# Server Emulator for Snowbound Online / Project Powder
## PSBO | SnowStar

## SnowStar Version:

• only PH7 Gems dropped (high drop chance)

```
gem_drop_chances = { 99, 96, 93, 90, 87, 84, 81, 78 };
```

• all items added to the Ingame Shop (+ PSBO Community Items)

• etc



-----------------------------------------
• source is spagetti code. stuff was added as was found out. deal with it.

• visual studio 2022 was used to compile

• source needs boost and mysqlclient libraries, you need to set these up in the project to be able to compile it

• a compiled exe is in the zip ready to be used

• database requires MariaDB (most current MySQL did NOT work)

• see config.ini for configuring configs

• server also requires the itemlist from the client, see zip above

• source can be compiled for both windows and linux

• you can register an account by calling the "register" stored function

```
select register("username", "password", "charname", "email");
```
