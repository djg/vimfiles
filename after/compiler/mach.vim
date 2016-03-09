" Vim compiler file
" Compiler:	mach
" Maintainer: 	Dan Glastonbury <dan.glastonbury@gmail.com>

if exists("current_compiler")
  finish
endif

if exists(":CompilerSet") != 2 " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

if exists('g:compiler_mach_skip_warnings') && g:compiler_mach_skip_warnings == 1
  let s:warn_skip = 1
else
  let s:warn_skip = 0
endif

CompilerSet makeprg=./mach\ --log-no-times
CompilerSet errorformat=
      \%*[^\"]\"%f\"%*\\D%l:%c:\ %m,
      \%*[^\"]\"%f\"%*\\D%l:\ %m,
      \\"%f\"%*\\D%l:%c:\ %m,
      \\"%f\"%*\\D%l:\ %m,
      \%-G%f:%l:\ %trror:\ (Each\ undeclared\ identifier\ is\ reported\ only\ once,
      \%-G%f:%l:\ %trror:\ for\ each\ function\ it\ appears\ in.),
      \%f:%l:%c:\ %trror:\ %m,
if s:warn_skip
  CompilerSet errorformat+=
      \%-G%f:%l:%c:\ %tarning:\ %m,
else
  CompilerSet errorformat+=
      \%f:%l:%c:\ %tarning:\ %m,
endif
  CompilerSet errorformat+=
      \%f:%l:%c:\ %m,
      \%f:%l:\ %trror:\ %m,
if s:warn_skip
  CompilerSet errorformat+=
      \%-G%f:%l:\ %tarning:\ %m,
else
CompilerSet errorformat+=
      \%f:%l:\ %tarning:\ %m,
endif
CompilerSet errorformat+=
      \%f:%l:\ %m,
      \\"%f\"\\,\ line\ %l%*\\D%c%*[^\ ]\ %m,
      \%D%*\\a[%*\\d]:\ Entering\ directory\ [`']%f',
      \%X%*\\a[%*\\d]:\ Leaving\ directory\ [`']%f',
      \%D%*\\a:\ Entering\ directory\ [`']%f',
      \%X%*\\a:\ Leaving\ directory\ [`']%f',
      \%DMaking\ %*\\a\ in\ %f

let &cpo = s:cpo_save
unlet s:cpo_save
unlet s:warn_skip

" vim:set sw=2 sts=2:
