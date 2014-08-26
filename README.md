marid-vagrant
=============

How to use marid-vagrant 
--------

1.  Clone git repository to your home directory<br />
`$git clone --recursive https://github.com/maridco/marid-vagrant.git`
2.  Change directory to marid-vagrant<br />
`$cd madrid-vagrant`
3.  Run vagrant<br />
`$vagrant up`
4. Login to your vagrant box<br />
`$vagrant ssh`
5. Clone marid repository<br />
`$git clone marid-git-url`
6. Change directory and install dependencies<br />
`$cd backend && bundle install`
7. Start server<br />
`$bundle exec rails s`
8. Open website in your local browser<br />
`http://127.0.0.1:3000`
9. Postgresql passwords:<br />

db = 'marid'<br />
user = 'marid' <br />
password = 'passw0rd' <br/>

[Tested on Debian, Red Hat 6.5, Mac OS X Mavericks 10.9, should also work on Windows (install virtualbox, vagrant, git)]<br />
