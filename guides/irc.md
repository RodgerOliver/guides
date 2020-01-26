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
  - register current nick and binds it to an e-mail address (optional).
- `/ns identify [password]`
  - identify (login) your nick to NickServ using the password
- `/ns recover [nickname] [password]`
  - kill (forcibly disconnects) someone who has your registered nick
- `/ns ghost [nickname] [password]`
  - terminate a "ghost" IRC session that's using your nickname
- `/ns set [password] [new_password]`
  - change your password. **NOTE:** Under no circumstances should you change your nick to the letter O followed by 8 digit

## Channel Management (ChanServ)

All ChanServ commands begin with `/cs` or `/chanserv` or `/msg ChanServ`. Depending on your client, `/cs` or `/chanserv` may not work.

- `/cs register [channel] [password] [description]`
  - register the current channel to the current nick and sets its password and description
- `/cs op #[channel_name]`
  - return as op (channel operator / admin) of channel
- `/cs identify [channel] [password]`
  - identify you as the channel's founder (op) and gives you founder-level privileges
- `/cs drop #channel [dropcode]`
  - un-register the current channel to you
- `/cs set [channel] founder [nickname]`
  - set new founder to the current channel's founder
- `/cs set [channel] [password] [new_password]`
  - change the current channel's password
- `/cs set [channel] desc [description]`
  - change the current channel's description
- `/cs set [channel] url [url_address]`
  - associate a URL with the channel
- `/cs set [channel] [email_address]`
  - associate an email address with the channel

### Other Channel Commands
- `/cs set [channel] mlock modes`
  - lock the channel's modes, just + unlocks all
- `/cs set [channel] secureops [on|off]`
  - keep everyone except aops, sops, and the founder from becoming ops
- `/cs set [channel] keeptopic [on|off]`
  - maintain the topic even if everyone leaves
- `/cs set [channel] enforce [on|off]`
  - restore op/halfop/voice if a person with op/halfop/voice gets de-opped/halfopped/voiced
- `/cs set [channel] leaveops [on|off]`
  - whether or not to allow the first person who join the channel to get ops

## Clients
- HexChat
- Irssi
