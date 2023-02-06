# runner
An interesting and useful shell instruction.
---

![image](https://user-images.githubusercontent.com/104540627/175332390-856b8409-7092-4a31-89a6-cb54ff28f5ff.png)

## Introduce

 🐸 This is a script to execut all kinds of files.
 
 🌹 The files it can execute include { ".java", ".c", ".py", ".md", ".docx", ".pdf",... }.


## Framework

It is just a shell script.

## Dependence

### Java

- Arch Linux:

  1. Install `java-8`:

     ```bash
     sudo pacman -S java-8-openjdk
     ```

  2. Configure the `java-8` environment:

     ```bash
     sudo archlinux-java set java-8-openjdk
     ```

- Debian

  1.  Install `java-8`:

     ```bash
     javac # to check java's version
     
     sudo apt install java~		
     ```

     2. Configure the `java-8` environment:

        ```bash
        sudo vim /etc/profile 
        
        export JAVA_HOME=/usr/local/java/jdk1.8.0_141 # your java's version
        export JRE_HOME=${JAVA_HOME}/jre
        export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib:$CLASSPATH
        export JAVA_PATH=${JAVA_HOME}/bin:${JRE_HOME}/bin
        export PATH=$PATH:${JAVA_PATH}
        
        sudo source /etc/profile
        ```

- Other

  1. Install `java.ter.gz` or `java.deb`

     [Java SE - Downloads](https://www.oracle.com/java/technologies/downloads/)

  2. Unzip it and put it in the specified directory

     ```bash
     sudo mkdir /usr/lib/jvm
     
     sudo tar -zxvf jdk-7u60-linux-x64.gz -C /usr/lib/jvm
     ```

  3. Configure the `java` environment:

     ```bash
     sudo vim ~/.bashrc
     
     
     #set oracle jdk environment
     export JAVA_HOME=/usr/lib/jvm/jdk1.7.0_60  ## 这里要注意目录要换成自己解压的jdk 目录
     export JRE_HOME=${JAVA_HOME}/jre  
     export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib  
     export PATH=${JAVA_HOME}/bin:$PATH
     
     source ~/.bashrc
     ```

### C

```bash
sudo pacman -S gcc
```

### Python

```bash
sudo pacman -S python3
```

### Firefox

- Arch Linux

  ```bash
  sudo pacman -S firefox
  ```

- Debian

  ```bash
  sudo apt install firefox
  ```

## Deployment procedure

```bash
git clone https://github.com/HoggAdams/runner.git
chmod +x install.sh
./install.sh
```

## Instruction parameter introduction

**Usage:**

-    runner [options]				Operation

-    runner [options] [file ...]     Operation file 

-    runner [options] [options]		Interesting parameter

**Options:**

- --				Author

- -u  			Compile programming files

- --user

- -r 				remove files

- --remove 

 -    -re			Empty the files in the trash

 -   --remove-empty

 -    -rr 		Restore the deleted file.

 -    --remove-restore

 -    -r[N]		Remove Files
 -           -remove[Files]



- -g 				Some Interesting Games

--game

- -h				runner's help

--help

## Instructions for use

 🍀 If you want to get the best experience, you can to install [zsh](https://github.com/zsh-users/zsh) and [oh-my-zsh](https://ohmyz.sh/)

 🌿 Then to revise `~/.zshrc` to add:

```tex
alias runner="source .runner.sh"
```

 🌸 Please make the script in your ${HOME}

## Participate and contribute

- [Hogg Adams](https://github.com/hoggadams)
