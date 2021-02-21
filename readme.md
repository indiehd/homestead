<p align="center"><img src="https://indiehd.com/images/shell/logo.svg"></p>

<p align="center">
    <strong>Laravel Homestead</strong>... <em>customized for indieHD development.</em>
</p>

## Introduction

This is a customized version of Laravel Homestead that is tailored to meet
developers' needs when working on the indieHD project.

This box contains all the tools that are necessary to write and test code in
accordance with the standards to which the project adheres.

## Customizations

All customizations are stored in the `scripts-custom` directory, which keeps
them separate from the "stock" Laravel Homestead scripts. This makes the custom
logic easier to find, and it makes merging-in upstream changes conflict-free.

### PHP (CLI)

```
memory_limit=512M
max_execution_time=0
max_input_time=-1
post_max_size=2048M
upload_max_filesize=2047M
date.timezone='UTC'
file_uploads=On
html_errors=Off
session.cookie_lifetime=0
session.gc_maxlifetime=2592000
```

### NGINX

Primarily, these changes to NGINX's defaults are necessary to support large
file uploads, up to 2GB.

```
client_max_body_size 2000M;

proxy_buffer_size 128k;
proxy_buffers 4 256k;
fastcgi_buffer_size 128k;
fastcgi_buffers 4 256k;

fastcgi_read_timeout 1d;
fastcgi_send_timeout 1d;

charset UTF-8;

fastcgi_param PHP_ADMIN_VALUE "
    display_startup_errors=On
    display_errors=On
    log_errors=On
    memory_limit=4096M
    max_execution_time=0
    max_input_time=-1
    post_max_size=2048M
    file_uploads=On
    upload_max_filesize=2047M
    html_errors=On
    date.timezone=UTC
";
```

### MySQL/MariaDB

```
[mysqld]
default_storage_engine=InnoDB
skip-character-set-client-handshake
collation_server=utf8_unicode_ci
character_set_server=utf8

# Here you can see queries with especially long duration
long_query_time = 10
log-queries-not-using-indexes = OFF

skip-external-locking
key_buffer_size = 384M
max_allowed_packet = 128M
table_open_cache = 512
sort_buffer_size = 2M
read_buffer_size = 2M
read_rnd_buffer_size = 8M
myisam_sort_buffer_size = 64M
thread_cache_size = 8

# Uncomment the following if you are using InnoDB tables
innodb_data_home_dir = /var/lib/mysql
innodb_data_file_path = ibdata1:10M:autoextend
innodb_log_group_home_dir = /var/lib/mysql
# You can set .._buffer_pool_size up to 50 - 80 %
# of RAM but beware of setting memory usage too high
innodb_buffer_pool_size = 384M
# Set .._log_file_size to 25 % of buffer pool size
innodb_log_file_size = 100M
innodb_log_buffer_size = 8M
innodb_flush_log_at_trx_commit = 1
innodb_lock_wait_timeout = 50

[mysqldump]
quick
max_allowed_packet = 256M

[mysql]
no-auto-rehash
# Remove the next comment character if you are not familiar with SQL
#safe-updates

[myisamchk]
key_buffer_size = 256M
sort_buffer_size = 256M
read_buffer = 2M
write_buffer = 2M

[mysqlhotcopy]
interactive-timeout
```

### Dovecot + Postfix

This box features a fully-functional mail stack, which eliminates the
need to use a third-party service to test email functionality. Developers may
use any POP or IMAP client to connect to and retrieve application-generated
email directly from this box.

The credentials are hard-coded and are as follows:

- User: vagrant
- Password: secret

### Audio Processing Tools

- SoX
- Mutagen
- ffmpeg
- FLAC encoder
- Lame MP3 encoder
- AtomicParsley

