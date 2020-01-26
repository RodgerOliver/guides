# IRC (Internet Relay Chat)

IRC is a protocol chat.

Inside the networks (servers) there are channels (rooms).

## Basics
### Network & Server
- `/connect [network]`
  - connect to network
- `/server [server]`
  - connect to server
- `/links`
  - list all servers on the current network. May be disabled "for security reasons"
- `/quit <message>`
  - disconnect from current server with optional leaving message

### Channel
- `/list`
  - list all channels on the current network
- `/join [channel]`
  - join / create channel to talk (channels generally start with `#`)
- `/part [channel]`
  - leave channel

### Nick
- `/nick [nickname]`
  - changes you nickname
- `/names [channel]`
  - show the nicks of all users on #channel
- `/msg [nickname] [message]`
  - send a private message to a user
- `/query [nickname] [message]`
  - send a private message to a user and open a private chat window
- `/notice [nickname] [message]`
  - send a notice to a user, like `/msg`, but usually makes a sound
- `/whois [nickname]`
  - show information about a user (this action is not visible to the user)
- `/whowas [nickname]`
  - show information about a user who has quit
- `/dns [nickname]`
  - attempt to resolve the IP address of a user
- `/ping [nickname]`
  - ping a user (this action is visible to the specified user)
- `/me action`
  - print "[yourname] action"

## Nick Management (NickServ)

All nickserv commands begin with `/ns` or `/msg NickServ`. Depending on your client, `/ns` may not work.

- `/ns register [password] [email]`
  - registers your current nick with NickServ with the chosen password and binds it to an e-mail address (optional).
- `/ns identify [password]`
  - identifies your nick to NickServ using the password you set. If you have a nick that's been registered, and you don't i

## Channel Management (ChanServ)

All ChanServ commands begin with `/cs` or `/chanserv` or `/msg ChanServ`. Depending on your client, `/cs` or `/chanserv` may not work.

- `/cs register #[channel_name]`
  - register channel
- `/cs op #[channel_name]`
  - return as op (channel operator / admin) of channel

## Clients
- HexChat
- Irssi
