# IRC (Internet Relay Chat)

IRC is a protocol chat.

Inside the networks (servers) there are channels (rooms).

## Help
- `/help [command]`
  - view help for command
- `/msg NickServ help <command>`
  - view help for command with NickServ
- `/msg ChanServ help <command>`
  - view help for command with ChanServ
- `/set <variable> [value]`
  - show variables of the client or set them

## Basics
### Network & Server
- `/server add [server]`
  - add a server to connect to
- `/server list`
  - list servers
- `/connect [network]`
  - connect to network
- `/links`
  - list all servers on the current network. May be disabled "for security reasons"
- `/quit <message>`
  - disconnect from current server with optional leaving message

### Channel
- `/list`
  - list all channels on the current network
- `/join [channel]`
  - join / create channel to talk (channels generally start with `#`)
- `/part <channel> <message>`
  - leave channel
- `/topic [channel] [new_topic]`
  - change the topic for a channel that you are on

### Nick
- `/nick [nickname]`
  - changes you nickname
- `/names [channel]`
  - show the nicks of all users on #channel
- `/msg [nickname] [message]`
  - send a private message to a user
- `/query [nickname] [message]`
  - send a private message to a user and open a private chat window
- `/privmsg [nickname] [message]`
  - send a private message to nickname that will open a query window for the other user
- `/notice [nickname] [message]`
  - send a notice to a user, like `/msg`, but usually makes a sound, doesn't open a query window for either users
- `/whois [nickname]`
  - show information about a user (this action is not visible to the user)
- `/whowas [nickname]`
  - show information about a user who has quit
- `/dns [nickname]`
  - attempt to resolve the IP address of a user
- `/ping [nickname]`
  - ping a user (this action is visible to the specified user)
- `/me [action]`
  - print "[yourname] [action]"

### Other Basics Commands
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
- `/ns ghost [nickname] [password]`
  - terminate a "ghost" IRC session that's using your nickname
- `/ns set [password] [new_password]`
  - change your password. **NOTE:** Under no circumstances should you change your nick to the letter O followed by 8 digit
- `/ns set enforce [on|off]`
  - kick user with your nick the doesn't identify
- `/ns info`
  - return information about your account
- `/ns group`
  - group the current nick to your account
- `/ns ungroup`
  - ungroup the current nick to your account
- `/ns drop [nick] [password]`
  - un-register nick

## Channel Management (ChanServ)

All ChanServ commands begin with `/cs` or `/chanserv` or `/msg ChanServ`. Depending on your client, `/cs` or `/chanserv` may not work.

- `/cs info [channel]`
  - return information about the channel
- `/cs register [channel] [password] [description]`
  - register the current channel to the current nick and sets its password and description
- `/cs op #[channel_name] [nick]`
  - give op (channel operator / admin) permission on channel
- `/cs deop #[channel_name] [nick]`
  - remove op (channel operator / admin) permission on channel
- `/cs recover [channel]`
  - regain control of your channel
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
- `/cs set [channel] mlock [modes]`
  - lock the channel's modes, just + unlocks all
- `/cs set [channel] secureops [on|off]`
  - keep everyone except aops, sops, and the founder from becoming ops
- `/cs set [channel] keeptopic [on|off]`
  - maintain the topic even if everyone leaves
- `/cs set [channel] enforce [on|off]`
  - restore op/halfop/voice if a person with op/halfop/voice gets de-opped/halfopped/voiced
- `/cs set [channel] leaveops [on|off]`
  - whether or not to allow the first person who join the channel to get ops
- `/cs set [channel] guard [on|off]`
  - user ChanServ will guard your channel

## Channel Operator Actions
### Kick User

- `/kick [channel] [nickname] [reason]`
  - temporarily remove user from channel

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

## Send Files
- `/dcc send [nick] [file]`
  - send file to user
- `/dcc get [nick] [file]`
  - download file sent by a user
- `/dcc close send [nick] [file]`
  - stop sending file to user
- `/dcc`
  - status of current transfers

## Channel Modes

Set a mode to the channel with: `/mode [channel] +/-[mode]`

All channel modes will be lost when a channel becomes empty. Enable GUARD to preserve modes.

- `+n`
  - disallow external messages
- `+t`
  - only op/hops can set the topic
- `+p`
  - set the channel as invisible in `/list` and disable `/knock` to channel
- `+s`
  - set the channel as invisible in /list and /whois
- `+i`
  - set the channel as closed unless the user was invited or matches a `+I` criteria
- `+I`
  - allow a user to join a `+i` channel without an invite based on a `nick!user@host` match
- `+m`
  - prevent users who are not opped/hopped/voiced from talking
- `+z`
  - messages blocked by `+mbq` are sent to the ops
- `+g`
  - anyone on the channel can invite new users
- `+r`
  - set the channel so only registered nicks are allowed in
- `+S`
  - strip formatting from messages, rendering them as plaintext
- `+c`
  - block messages containing color codes
- `+k [pass]`
  - set a password for the channel which users must enter to join
- `+l [number]`
  - set a limit on the number of users who are allowed in the channel at the same time
- `+L`
  - large ban list (Only server OPs)
- `+P`
  - channel permanent, doen't disappear when empty (Only server OPs)
- `+C`
  - all CTCP (Client To Client Protocol) messages to the channel, except `action`, are disallowed

## User Modes
### Inside Server (for current user)

Set a mode to the user with: `/mode [nick] +/-[mode]`

- `+g`
  - choose to accept external private messages with `/accept`
- `+i`
  - hide user from `/whois` by normal users
- `+R`
  - ignore private messages
- `+w`
  - subscribes you to `/wallops` messages from freenode staff
- `+Z`
  - set automatically by the network when you connect via SSL/TLS

### Inside Channel

Set a mode to the user with: `/mode <channel> +/-[mode] [nick]`

**NOTE:** some modes may not be available in all networks

- `+v`
  - user has voice on the current channel (prefix `+`)
- `+h`
  - user is a half-op on the current channel (prefix `%`)
- `+o`
  - user is an operator (AOP) on the current channel (prefix `@`)
- `+a`
  - user is an admin (SOP) on the current channel (prefix `&` on UnrealIRCd, usually `@` elsewhere).
- `+q`
  - user is owner of the current channel (prefix `~` on UnrealIRCd, usually `@` elsewhere)

## Clients
- HexChat
- Irssi
- WeeChat

### Irssi
- `/network add -autosendcmd '/msg nickserv identify [nick] [password]'`
  - identify when connect to the network
- `/server modify -auto [server]`
  - autoconnect to server, like `chat.freenode.net`
