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

### Other General Commands
- `/invite [nickname] [channel]`
  - invite a nickname to a channel that you are on
- `/away <message>`
  - leave a message indicating that you are currently not paying attention to IRC. When someone sends you a message, they will automatically see your away message. Using `/away` with no message marks you as no longer being away and removes your previous message

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

### User Modes

- `+q`
  - user is owner of the current channel (prefix `~` on UnrealIRCd, usually `@` elsewhere)
- `+a`
  - user is an admin (SOP) on the current channel (prefix `&` on UnrealIRCd, usually `@` elsewhere).
- `+o`
  - user is an operator (AOP) on the current channel (prefix `@`).
- `+h`
  - user is a half-op on the current channel (prefix `%`).
- `+v`
  - user has voice on the current channel (prefix `+`).

### Kick User

- `/kick [channel] [nickname] [reason]`
  - temporarily remove user from channel
- `/mode [nickname] +/-attributes [data]`
  - setting user's modes (for current channel only)

### Ban User

- `/mode [channel] +b [hosts]`
  - `hosts` take the following form: `nickname!userid@hostname`
- Use `/whois`, `/whowas` or `/who` to find the information necessary for a ban.
- `*` is a wildcard and can replace `nickname`, `userid`, parts of nickname or `userid`, `hostname` or a segment of a `hostname`.

#### Examples

- `bob!*@*`
  - prevent anyone with the nick `bob` from joining
- `*bob*!*`
  - prevent anyone whose nick contains `bob` from joining
- `mark!*elc@*`
  - prevent anyone with the nick `mark` and the userid `elc` from joining
- `*!*@host.com`
  - prevent anyone with the host `host.com` from joining
- `*!*@*`
  - ban everyone

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

### Channel Modes

Set a mode to the channel with: `/mode [channel] +/-[mode]`

- `+n`
  - disallow external messages
- `+t`
  - only op/hops can set the topic
- `+p`
  - set the channel as invisible in /list
- `+s`
  - set the channel as invisible in /list and /whois
- `+i`
  - set the channel as closed unless the person was invited
- `+k [pass]`
  - set a password for the channel which users must enter to join
- `+l [number]`
  - set a limit on the number of users who are allowed in the channel at the same time
- `+m`
  - prevent users who are not opped/hopped/voiced from talking
- `+R`
  - set the channel so only registered nicks are allowed in
- `+M`
  - set the channel so only registered nicks are allowed to talk
- `+S`
  - strip formatting from messages, rendering them as plaintext
- `+c`
  - block messages containing color codes
- `+i`
  - a user must be invited to join the channel
- `+N`
  - no nick changes permitted in the channel

## Clients
- HexChat
- Irssi
