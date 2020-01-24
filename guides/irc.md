# IRC (Internet Relay Chat)

IRC is a protocol chat.

Inside the networks (servers) there are channels (rooms).

## Basics
- `/connect [server]`
  - connect to server
- `/join [channel]`
  - join / create channel to talk (channels generally start with `#`)
- `/nick [nickname]`
  - changes you nickname

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
