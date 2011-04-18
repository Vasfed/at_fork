#include <ruby.h>
#include <pthread.h>

#define AtFork_cls() rb_const_get(rb_cObject, rb_intern("AtFork"))

void before_fork(){
  VALUE cls = AtFork_cls();
  if(cls){
    rb_funcall(cls, rb_intern("before_fork_handler"), 0);

  } else {
    fprintf(stderr, "fork handler: cannot find class AtFork!\n");
  }
}

void after_fork_parent(){
  VALUE cls = AtFork_cls();
  if(cls){
    rb_funcall(cls, rb_intern("after_fork_parent"), 0);
  } else {
    fprintf(stderr, "fork handler: cannot find class AtFork!\n");
  }
}

void after_fork_child(){
  VALUE cls = AtFork_cls();
  if(cls){
    rb_funcall(cls, rb_intern("after_fork_child"), 0);
  } else {
      fprintf(stderr, "fork handler: cannot find class AtFork!\n");
  }
}


void Init_at_fork() {
  pthread_atfork(before_fork, after_fork_parent, after_fork_child);
}
