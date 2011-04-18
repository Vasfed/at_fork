require 'mkmf'

dir_config("at_fork")

unless have_header('pthread.h') && have_func('pthread_atfork')
  raise 'This extension requires posix threads to be available and capable of atfork'
end

create_makefile("at_fork")
