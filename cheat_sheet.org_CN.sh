# cheat_sheet.org.sh
# The contents of this file are released under the GNU General Public License. Feel free to reuse the contents of this work, as long as the resultant works give proper attribution and are made publicly available under the GNU General Public License.
# Best viewed in emacs org-mode.
# Alternately, one can keep this cheat sheet handy by adding the following line to ~/.bashrc:
#
# alias cheatsheet="less ~/path_to_cheat_sheet.org.sh" 


* Reference:
** Basics:
*** Getting help:

#  查看目标 command 的指南
man command

# 得到目标command 的(可能有些在上面, 但也可能没有):
command -h

# 万一你忘记命令的名称,  输入命令相关的单词:
apropos word

# 查看帮助命令的索引:
info

*** 命令行实用工具:
**** 文件和目录的基本操作:
#  显示现在工作的目录:
pwd

#  显示当前目录的所有文件呢:
ls

# 显示所有文件的详细信息，包括隐藏的:
ls -a

# 递归子目录再展示文件:
ls -R

# 列出文件的修改时间,  最近的排在前面.
ls -lt

# 移动/重命名 一个文件或是目录 (注意： 你移动的源文件名和目标文件名不能一样 ):
mv source destination

# 永远删除目标 (谨慎), 使用 -r 递归标记删除子目录中的文件 :
rm target

# 复制文件或目录:
cp source destination

# 挂载 文件系统:
mount /dev/device_name /media/device_name

# 卸载:
umount /media/device_name

# Forensically clone filesystems and do other low-level operations on files. Be careful with this one. Can be destructive:
dd

# 磁盘分区:
parted

# 文件系统产生工具:
mkfs

**** 系统管理:

# 以管理员权限执行文件 (可能带来破坏/不安全. 只用在系统管理任务):
sudo command

# 系统管理员登入:
sudo -s

# 退出系统管理员
exit

# Forgot to type sudo in front of a command and already hit enter? Repeat the last command using sudo:
sudo !!

***** 从 a .tgz 安装软件 (也被成为Tar包):

# 首先, 解压Tar包 (参考下面Tar的章节)
# 然后, move into unzipped directory:
cd software_directory

# Always read README first if it is provided, in case there are any modifications to the procedure outlined below:
cat README

# Automatically check for appropriate configurations and generate a MAKE file in the directory:
./configure

# 编译软件. 可能需要系统权限:
make

# 移动文件到它们特定的位置. 也可能需要系统权限:
make install

# Clean up files in directory, in case make command fails, or just to remove unnecessary cruft:
make clean

***** Ubuntu/Debian 软件仓库:

# 检查 distro 仓库 为软件升级:
sudo apt-get update

# 下载并安装升级文件 ( 首先升级 ):
sudo apt-get upgrade

# 在仓库中搜索软件包:
apt-cache search keyword

#  得到一个特定软件包的更多细节:
apt-cache show package_name

#  下载并安装软件包:
sudo apt-get install package_name

# View the output of a command in a more convenient format:
command | less

**** 文件操作:

# 在终端显示一个文件:
cat file

# 匹配文件名来找到一个文件:
locate filename

#  查看程序版本和它所在位置
which appname

# Search through filename for matches to phrase:
grep phrase filename

# Search through output of a command for phrase:
command | grep phrase

**** 进程操作:

# 列出全部正在允许的进程:
ps -e

# 标准系统监控 显示全部进程和系统资源更全面的查看 :
top

# 和Top命令差不多, 但是是一个更好更清爽的界面:
htop

# Stop a process from using all system resources and lagging computer:
renice process_name

# Kill misbehaving process (use sparingly, last resort, try 'renice' command first):
pkill process name

# 运行一个后台进程
command &

# Start a process in the background and have it keep running after you log off
nohup command &

****  压缩和加密:

# Make a simple compressed backup of files or directories:
tar -cvzf backup_output.tgz target_files_or_directories

# 打开压缩过的 .tgz or .tar.gz 文件:
tar -xvf target.tgz

# 加密一个文件:
gpg -o outputfilename.gpg -c target_file

# 解密一个文件:
gpg -o outputfilename -d target.gpg

# Zip方式打包并加密目录:
gpg-zip -o encrypted_filename.tgz.gpg -c -s file_to_be_encrypted

*** The Bash shell:
**** File Name expansions:
#  当前用户的主目录
~/

# 当前目录:
./

# 根目录:
../

# Or even (Two parent directories down):
../../

# 当前目录下的所有文件. (慎用.):
/*

**** 重定向输出:

# 重定向一个命令的输出到另一个管道命令的输入:
command_1 | command_2

# 或者更多:

command_1 | command_2 | command_3

#  命令重定向输出到文件
command > file

# 或者:

file > file

# 甚至,  可以通过不同的方向来重定向:
file < file

# 附加到目标文件末尾而不是覆盖目标文件:

file_or_command >> file

#  和 | 工作原来相似, 但是它同时写入输出到目标和终端:
tee target

# Redirect standard output and error to /dev/null, where it is deleted.
command > /dev/null 2>&1

****  控制命令的执行:
# 执行命令1知道命令2执行完毕:
command_1 ; command_2

# 还可以这样:
command_1 ; command_2 ; command_3

# && acts like ; but only executes command_2 if command_1 indicates that it succeeded without error by returning 0.
command_1 && command_2

# || acts like && but only executes command_2 if command_1 indicates an error by returning 1.
command_1 || command_2

**** Bash 通配符:
#  0或更多字符串:
*

# 匹配 "phrase"  和尾随其后的任意字符串:
phrase*

# Matches any incidences of "phrase" with any trailing or leading chars:
*phrase*

#  匹配任意一个字符:
?

# 匹配括号内的字符串Matches any of the characters listed inside brackets:
[chars]

# 匹配一个字符，范围在a-z之间:
[a-z]

** 高级:
***  命令行实用工具, 续:
**** 网络:

# 配置网络入口:
ifconfig

# 配置无线网络入口:
iwconfig

# 连接到远程服务.
ssh username@ip_address

# Forward X from target to current machine (进入远程桌面. 几分难以理解, 但是很有用):
ssh -X username@ip_address

# 从网络中一台机器复制文件/文件夹（包括子目录）复制到另一台:
scp -r source_filename:username@ip_address target_filename:target_username@target_ip_address

#  只复制文件/文件中变化的 (super efficient way to sync directories, works either locally or with remote servers using username@ip_address:optionalport, just like ssh):
rsync source target

# 检查目标主机是否在线和应答
ping ip_address

# 查看网络的路由路径:
traceroute6 ip_address

# 网络监控
netstat

# 查看防火墙规则
iptables -L

# 扫描机器(本地)  检查开发的端口:
nmap localhost

***** wget:

#  通过Http 的方式下载文件:
wget http://example.com/folder/file 

# 完成上次没有下载完整的文件:
wget -c http://example.com/folder/file

#  以后台运行的方式来下载:
wget -b wget -c http://example.com/folder/file

# 通过FTP的方式来下载:
wget --ftp-user=USER --ftp-password=PASS ftp://example.com/folder/file

***** netcat:

#  监听网络的一个端口输出结果到文件 (不稳定，但是很简捷):
netcat -l recieving_port > file_copied

# 通过管道输出命令到目标IP和端口:
command | netcat -w number_of_seconds_before_timeout target_ip target_port

#  以Tar包的方式输出数据流, 通过管道输送到网络中目标IP和端口:
sudo tar -czf - filename | netcat -w number_of_seconds_before_timeout target_ip target_port

****  用户和组:
# 改变目录或文件的所有者权限:
chown user_name:group_name directory_name

#  改变目录或文件的特殊权限 (see man page for details.)
chmod

# 创建一个新用户:
adduser

#  改变用户的特殊权限 (这项命令要慎用):
usermod

# 删除用户
deluser

# 显示所有用户组:
groups

# 创建一个新用户组:
groupadd

# 改变用户组的特殊权限:
groupmod

# 删除用户组:
delgroup

#  临时成为不同的用户:
su username

#  显示登录用户的用户名:
users

# 通过终端给另一用户写一句话:
talk

# Interactive talk program to talk to other users from terminal (must be installed from repositories.):
ytalk

****  文件操作, 续篇:
# 查看当前进程正在使用那些文件:
lsof

# 查看两份文件的不同之处:
diff file_1 file_2

# 在文件的最上面输出文件的总行数:
head -n number_of_lines file

# Like head, but it outputs the last -n lines:
tail -n number_of_lines file

# 效验一个文件:
md5sum file

# 效验文件夹中的每一个文件 ( 需要在软件仓安装 .):
md5deep directory

# 效验一个文件 ( 更好的算法没有 hash 值相同的冲突):
sha1sum

#  同 md5deep一样的操作, 但是是用 sha1的方式效验:
sha1deep

# 唤起命令每隔一段时间（秒）,  并且高亮输出不同:
watch -d -n number_of_seconds command

#  执行命令,  显示命令的执行所用时间:
time command

# 从最大到最小的方式显示当前目录下的文件 :
du -a directory | sort -n -r | less

# remove spaces from filenames in current directory:
rename -n 's/[\s]/''/g' *

# change capitals to lowercase in filenames in current directory:
rename 'y/A-Z/a-z/' *

*****  系统环境和硬件:
#  输出母板（主板）信息
dmidecode

# 显示长日期和长时间:
date

#  显示当前机器的主机名:
echo $HOSTNAME

#  显示当前Linux发行版的名称:
lsb_release -a

# 这样同样也可以:

more /etc/issue

# 显示Linux系统的内核版本:
uname -a

# 显示Linux系统的内核模块的信息:
lsmod

# 配置内核模块 (never do this ;p ):
modprobe

# 查看安装的软件包:
dpkg --get-selections

#  显示系统变量:
printenv 

# 列表显示连接到 PCI ports 的硬件:
lspci

# 列表显示连接到 USB ports 的硬件:
lsusb

# 显示BIOS里存储的硬件信息:
sudo dmidecode

# Dump captured data off of wireless card:
dumpcap

# Dump info about  键盘驱动:
dumpkeys

***** Ubuntu 系统管理员, 高级命令 (Continued):

# Add a Personal Package Archive from Ubuntu Launchpad:
add-apt-repository

# 命令下安装deb包文件:
sudo dpkg -i package.deb

**** Python:

# Update pip (Python package manager):
pip install -U pip

# search pip repos for a library:
pip search library_name

# create a virtual python environment to allow install of many different versions of the same Python modules:
virtualenv dirname --no-site-packages

# 连接到一个Python虚拟环境
source dirname/bin/activate

# 断开一个Python虚拟环境:
deactivate

# install package into virtual python environment from outside:
pip install packagename==version_number -E dirname

# export python virtual environment into a shareable format:
pip freeze -E dirname > requirements.txt

# import python virtual environment from a requirements.txt file:
pip install -E dirname -r requirements.txt

**** git (all commands must be performed in the same directory as .git folder):

# 开始一个git项目:
git init

git config user.name "user_name"

git config user.email "email"

# 复制一份 (target can be specified either locally or remotely, via any number of protocols):
git clone target

# 提交改变到一个 git:
git commit -m "message"

# 得到清晰的软件信息:
git status

# 显示清晰的软件升级日志:
git log

# 通过另个一软件仓来升级git目录:
git pull [target]

# 增加分支到另外的软件仓:
git push [target]

# 创建一个新的分支:
git branch [branchname]

# 转换到目标分支:
git checkout [branchname]

# 删除一个分支:
git branch -d [branchname]

# 合并两个分支:
git merge [branchname] [branchname]

# 展示一个项目的所有分支:
git branch

*** 虚拟化:

#clone a virtual machine (this works, it's been tested):
vboxmanage clonehd virtual_machine_name.vdi --format VDI ~/target_virtual_machine_name.vdi

#mount a shared virtual folder:
#you need to make sure you have the right kernel modules. You can do this with modprobe, but this package works instead in a ubuntu-specific way.

sudo apt-get install virtualbox-ose-guest-utils

sudo mount -t vboxsf name_of_shared_folder_specified_in_Virtualbox path_of_mountpoint

*** mysql:

# 显示帮助:
help

# 显示数据库:
show databases;

# 选择一个数据库使用:
use database_name_here;

# 显示数据库的图示:
show tables;

# 删除数据卡:
DROP DATABASE databasename;

# 创建新的数据库:
CREATE DATABASE databasename;

# 创建一个新用户:
CREATE USER username@localhost IDENTIFIED BY 'password';

# 显示所有用户:
select * from mysql.user;

# 删除一个用户:
delete from mysql.user WHERE User='user_name';

# Give user access to all tables (make them root). the "%" means that they can sign in remotely, from any machine, not just localhost.:
grant all privileges on *.* to someusr@"%" identified by 'password';

# give certain privileges to a user on a certain database:
grant select,insert,update,delete,create,drop on somedb.* to someusr@"%" identified by 'password';

# Tell mysql to use new user priv policies:
flush privileges;

# 修改用户的密码:
use mysql;

update user set password='password'('newpassword') where User='user_name';

# mysql command line args:
# export text file with commands to rebuild all mysql tables:
mysqldump databasename > dumpfilename.txt

# restore from a dump:
mysql -u username -p < dumpfilename.txt

# dump entire database:
mysqldump -u username -p --opt databasename > dumpfile.sql

# restore from entire database dump:
mysql -u username -p --database=databasename < dumpfile.sql

2013-05-18 21:54:12	第一次翻译
2013-05-25 18:07:28	第二次翻译
使用时间合计：4个番茄
Johnny
