### Docker Images for a Chat Room

#### Why ?
Yes, there are lots of service avaliable, such as slack, discord, skype, Wechat and so on. But some of them are censored, and some are not worth to trust.

It is a good idea to have something on hand just in case something happened.

#### What
It uses old and mature technologes: IRC.

This apps bundled oragono irc as backend and kiwi irc as front end. You only need to expose port 8080 for front end interface.


#### Status
This docker images works. However, may need spend some time to look at security stuff. e.g. update `[allowed_origins]` at `/kiwiirc/config.conf` etc.

#### How to use it
```bash
ibmcloud cf push <app-name> --docker-image privapps/chatroom
```
