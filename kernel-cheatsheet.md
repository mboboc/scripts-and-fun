# This is a Kernel Cheetsheet
##### Enjoy

### Initial setup
1. Download Kernel code
`git clone --depth 1 https://github.com/linux-kernel-labs/linux`

2. Change directory to tools/labs
`cd tools/labs`

3. Compile kernel image first time
`make boot`

### Every lab setup
0. Clean the workspace
[dev-tab] `make clean_skels`

1. Generate lab skeleton from templates (you can generate task one by one)
[dev-tab] `LABS=<name-of-the-lab>[/<task-name>] make skels`

2. Modify files after lab instruction
[dev-tab] `vi skels/<lab-name>/<task-dir>/<file.c>`

3. Build the Kernel
[dev-tab] `make build`

4. Copy files into VM
[dev-tab] `make copy`

5. Boot
[boot-tab] `make boot`

6. Connect to serial
[minicom-tab] `minicom -D serial.pts`


# Cscope
1. Search for a struct name - use only the name (without struct).
[terminal] `vim -t module`
[vim] `:cs f g module`

