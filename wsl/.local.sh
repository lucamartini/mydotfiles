export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
export LIBGL_ALWAYS_INDIRECT=1

export ACCOUNTS=/home/lmartini/nwg/services/accounts/accounts/index.js
export NEWS=/home/lmartini/nwg/services/news/news/index.js
export ENERGY=/home/lmartini/nwg/services/energy/energy/index.js
export MYFOCUS=/home/lmartini/nwg/services/myfocus/myfocus/index.js
export NEWS=/home/lmartini/nwg/services/news/news/index.js
export ISTAT=/home/lmartini/nwg/services/istat/istat/index.js
export COURSES=/home/lmartini/nwg/services/courses/courses/index.js
export HIRINGS=/home/lmartini/nwg/services/hirings/hirings/index.js
export USERS=/home/lmartini/nwg/services/users/users/index.js
export IVD=/home/lmartini/nwg/services/ivd/ivd/index.js
export FV=/home/lmartini/nwg/services/fv/fv/index.js
export CONSULTINGS=/home/lmartini/nwg/services/consultings/consultings/index.js
export PROPOSALS=/home/lmartini/nwg/services/proposals/proposals/index.js