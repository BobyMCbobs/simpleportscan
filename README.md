# simpleportscan
Simple port scanner using nmap.

**Requirements to install via your package manager**:  
  `nmap`

**How to use**:  
  sps [port] [base dhcp target] [bottom of range] [top of range]

**Examples**:  
  **Range scan**:  
    `sps 22 192.168.1 0 200`  
  **Address scan**:  
    `sps 22 192.168.1 0`

**To install, run**:  
  1: `git clone git://github.com/BobyMCBobs/simpleportscan.git`  
  2: `cd simpleportscan/`  
  3: `sudo install -g root -o root sps /usr/local/bin/sps;`  

**Or in a single command**:  
  `git clone git://github.com/BobyMCBobs/simpleportscan.git;cd simpleportscan/;sudo install -g root -o root sps /usr/local/bin/sps;echo "Simple Port Scanner has been installed."`
