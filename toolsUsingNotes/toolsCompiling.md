# overview
a tool (or program)'s compile procedures is usuall like this:
>1. generate makefile (for linux)
>2. make - compile the srcs
>3. make install - copy compile output, usually:
>>path|for
>>-|-
>>/usr/local/bin|executable
>>/usr/local/share/${program}|datas
>>/usr/local/lib| *.so, etc
>>/usr is like /usr/local, the former usually for which is ship with os, the latter for which is install afterwards
>4. set up enviroment variables - so the system aware a system is installed

the /usr/local is provide as a "path prefix" in the installing scrips, change it, you change the install path. the program may provide a option for changing the prefix, if not, you may need to search the install script for the prefix string and change it manually.

# vim
srcs already have makefiles, step 1 is passed. prefix can be change by passing the --prefix=${path} option to ./configure

## dependency
compile vim with python support. a python executable and lib, whom is usually shiped with os, is not enough. you need srcs of python.

# you complete me
for asynchronous features. it consist of two parts: client, witch run as a vim plugin, request the server periodly. and a server, a precomiled program for good performance.
client is already usable when shipped, the point is compiling the server.

like the full install guide said :
>1. cmake to generate makefile
>2. compile(use cmake and not make). the compile progress also do the install( or file copying)

## dependency
1. ptyhon

    you complete me server dont call bin python to execute python scripts, it compile with python .so and execute python script inside itself.<br>
    so shiped-with-os python is not enough, get python-dev.<br>
    for manually compiled python, cmake may can not detect it corectlly, try to set this variables manually when generating makefiles.(cmake -Dbalabala)
    options|
    -|
    -DPYTHON_INCLUDE_DIRS=/usr/include/python3.4m|
    -DPYTHON3_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython3.4m.so|
    dont forget changing path prefix "/usr" to path to you manully compiled python
2. clang

    you complete me use clang to analysis c file and provide semantic completion.<br>
    when you gose with the latest you complete me. even the apt-get-clang is usually not new enough. you need to download one from llvm.org, prebuilded or srcs-and-compile is both fine.<br>
    for envirment with direct internet acces the size is pretty scaring(300MB compressed,1.7 GB extracted). but for semantic completion, only three file(folder) is required:
    file(folder)|
    -|
    inlude/clang-c/|
    lib/libclang.so.7|
    lib/libclang.so<br>(a symbol link to libclang.so.7)|

## compile flags
for accurate semantic completion, accurate compile flags is required
see database chapter at https://github.com/Valloric/YouCompleteMe

# bear
compiling is easy and simple. baraly have dependency problem.

add -DCMAKE_INSTALL_PREFIX=${path} to change install path prefix when generate makefiles by cmake.<br>
if it doesn't work, it's still possible to all string about prefix in generated make files.