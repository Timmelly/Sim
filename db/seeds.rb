Token.delete_all
ComputerStatus.delete_all
Computer.delete_all
User.delete_all
LastSystemChanging.delete_all
proccesses=[ "/lib/systemd/systemd --user",
"(sd-pam)",
 "mate-session",
"/usr/bin/VBoxClient --clipboard",
"/usr/bin/VBoxClient --clipboard",
"/usr/bin/VBoxClient --display",
"/usr/bin/VBoxClient --display",
 "/usr/bin/VBoxClient --seamless",
 "/usr/bin/VBoxClient --seamless",
 "/usr/bin/VBoxClient --draganddrop",
"/usr/bin/VBoxClient --draganddrop",
 "/usr/bin/ssh-agent /usr/bin/dbus-launch --exit-with-session /usr/bin/im-launch mate-session",
 "/usr/bin/dbus-launch --exit-with-session /usr/bin/im-launch mate-session",
"/usr/bin/dbus-daemon --fork --print-pid 5 --print-address 7 --session",
 "/usr/bin/ibus-daemon --daemonize --xim",
 "/usr/lib/gvfs/gvfsd",
 "/usr/lib/gvfs/gvfsd-fuse /run/user/1000/gvfs -f -o big_writes",
 "/usr/lib/ibus/ibus-dconf",
"/usr/lib/ibus/ibus-ui-gtk3",
"/usr/lib/ibus/ibus-x11 --kill-daemon",
 "/usr/lib/at-spi2-core/at-spi-bus-launcher",
"/usr/bin/dbus-daemon --config-file=/etc/at-spi2/accessibility.conf --nofork --print-address 3",
"/usr/lib/at-spi2-core/at-spi2-registryd --use-gnome-session",
"/usr/lib/dconf/dconf-service",
 "gnome-keyring-daemon --start",
 "/usr/bin/mate-settings-daemon",
 "mate-panel",
 "/usr/lib/ibus/ibus-engine-simple",
 "caja",
 "/usr/bin/pulseaudio --start --log-target=syslog",
 "/usr/lib/mate-panel/wnck-applet",
 "/usr/lib/mate-applets/trashapplet",
 "/usr/lib/mate-panel/clock-applet",
 "update-notifier",
"/usr/bin/python3 /usr/share/system-config-printer/applet.py",
 "mate-screensaver",
 "mate-volume-control-applet",
 "mate-power-manager",
"/usr/bin/python3 /usr/bin/blueman-applet",
"/usr/lib/i386-linux-gnu/polkit-mate/polkit-mate-authentication-agent-1",
 "nm-applet",
 "mate-maximus",
 "tilda",
 "/usr/lib/i386-linux-gnu/deja-dup/deja-dup-monitor",
 "/bin/sh -c /usr/lib/i386-linux-gnu/zeitgeist/zeitgeist-maybe-vacuum; /usr/bin/zeitgeist-daemon",
 "/usr/lib/gvfs/gvfsd-trash --spawner :1.1 /org/gtk/gvfs/exec_spaw/0",
 "/usr/bin/zeitgeist-daemon",
 "/usr/lib/i386-linux-gnu/zeitgeist-fts",
 "zeitgeist-datahub",
 "/usr/lib/gvfs/gvfs-udisks2-volume-monitor",
 "marco",
 "/usr/lib/gvfs/gvfs-mtp-volume-monitor",
 "/usr/lib/gvfs/gvfs-gphoto2-volume-monitor",
"/usr/lib/gvfs/gvfs-afc-volume-monitor",
"/usr/lib/gvfs/gvfs-goa-volume-monitor",
"/usr/lib/gnome-online-accounts/goa-daemon",
 "/usr/lib/gnome-online-accounts/goa-identity-service",
 "/usr/lib/telepathy/mission-control-5",
 "/bin/bash",
 "/usr/lib/gvfs/gvfsd-network --spawner :1.1 /org/gtk/gvfs/exec_spaw/1",
 "/usr/lib/bluetooth/obexd",
 "/usr/lib/gvfs/gvfsd-metadata",
"/usr/lib/gvfs/gvfsd-dnssd --spawner :1.1 /org/gtk/gvfs/exec_spaw/3",
 "mate-terminal",
 "gnome-pty-helper",
"/usr/lib/i386-linux-gnu/gconf/gconfd-2",
"/usr/lib/firefox/firefox",
 "-bash",
 "-bash",
 "spring server | Sim | started 2 hours ago",
 "spring app    | Sim | started 2 hours ago | development mode",
"ps ux"]
logins=[["timy86", "Мировой Тимур Семёнович", "1234"], ["lilia", "Борисова Лилия Ивановна", "1874d1"], ["dastin", "Захаров Константин Имануилович", "786gfi34"], ["mari68", "Петрова Мария Борисовна", "kiss45ok"], ["gari", "Гариилов Андрей Фёдорович", "05061974"], ["sereza", "Тараканов Сергей Владимирович", "900267a"], ["lola", "Терешко Лолита Анатольевна", "898rbr898"], ["kolia", "Совушкин Николай Прокофьевич", "3435fdfcxz"], ["moisey01", "Моисеев Егор Валентинович", "qwerty"], ["step", "Степанова Мария Алексеевна", "qaz123wsx"]]
users=[]
logins.each do |nam|
  u=User.new
  u.login=nam[0]
  u.info=nam[1]
  u.password=nam[2]
  u.role=rand(99)+1
  u.save
  users.push u
end

for i in 1..12
  c=Computer.new
  c.ip="192.168.32.#{i+1}"
  c.mac="6C:62:6D:E8:10:#{i+12}"
  c.name="mars#{i}.msiu.ru"
  c.save

  d=ComputerStatus.new
  d.status=rand(ComputerStatus::STATUSES.size)
  d.computer=c
  has={users: []}
  ran=rand(3)
  for a in 0..ran
    u = users[rand(users.size)]
    has[:users].push({user_login: u.login, proccesses: proccesses[0...(proccesses.size-rand(proccesses.size/2))]})
    d.users = has
  end
  d.save
end
last= LastSystemChanging.new
last.changing_date=DateTime.now

t=Token.new
t.token="93765xjsncvkdnwt240784hfszxqwepo"
t.api_action="reboot"
t.date_end=Date.new(2020,12,31)
t.save

t=Token.new
t.token="875hgfp6789inrh467830hyrvdpoec54"
t.api_action="change_password"
t.date_end=Date.new(2020,12,31)
t.save

t=Token.new
t.token="875hgfp6789inrh467830hyrvdpoec54"
t.api_action="user_block"
t.date_end=Date.new(2020,12,31)
t.save

t=Token.new
t.token="974567odyrhridjryt56780fhfkg4586"
t.api_action="user_info"
t.date_end=Date.new(2020,12,31)
t.save

t=Token.new
t.token="12jdhdbfh23746985yhdgdtrg5678vju"
t.api_action="computer_states"
t.date_end=Date.new(2020,12,31)
t.save

t=Token.new
t.token="75849345uinrtydjnfhtkr34567190hfr"
t.api_action="logout"
t.date_end=Date.new(2020,12,31)
t.save
