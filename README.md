![marid](https://cloud.githubusercontent.com/assets/5732914/4931337/f997fd4a-6576-11e4-98cb-479a568233b5.png)

### Marid Vagrant

## How to use marid-vagrant 

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
9. PostgreSQL passwords:<br />

db = 'marid'<br />
user = 'marid' <br />
password = 'passw0rd' <br/>

[Tested on Debian, Red Hat 6.5, Mac OS X Mavericks 10.9, should also work on Windows (install VirtualBox, Vagrant, Git)]<br />

## License

##### Marid is released under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0).
The full license text is included in `LICENSE.txt`.
