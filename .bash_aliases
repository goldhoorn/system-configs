alias makei='make -j3 -C build install'
alias make='make -j3'
alias gitk='gitk --all'
alias astyle='astyle -A2 -s4 --indent=spaces=4 --align-pointer=name --align-reference=name -j -c -z2 -Y -xL'
alias bt='/usr/bin/gdb -ex="set confirm off" -ex=r -ex=bt -ex=q --args'
alias file='file -Pelf_phnum=10000'
alias xo="xdg-open"
alias evince='function _evince(){ evince $* 2> >( grep -v "evince.*WARNING" >&2 ); };_evince'
