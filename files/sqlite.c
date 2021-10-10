#if 0
#ruby extconf.rb that generates the makefile
#edit to fit your system
#-------------------------
require "mkmf"

dir_config "SQLite"

if find_library("sqlite", "sqlite_open", "/usr/local/lib", "/usr/pkg/lib") and have_header("sqlite.h")
  create_makefile "sqlite"
end
#-------------------------
__END__
#endif
/* $Id$
Domingo Alvarez Duarte domingo@dad-it.com
http://domingo.dad-it.com
*/
#include        <ruby.h>
#include        <sqlite.h>

static VALUE eDBError;

typedef struct sRubyFuncCall {
    VALUE obj_id;
    VALUE method;
} sRubyFuncCall;

typedef struct sDatabase {
  struct sqlite *conn;
  int autocommit;
  int full_column_names;
  VALUE array_srfc;
} sDatabase;


static void rbSQLite_free(void *p) {
    sDatabase *db = (sDatabase*) p;
    int i,len;

    if(db){
        if (db->conn) {
            sqlite_close(db->conn);
            db->conn = NULL;
        }
/*
        if (db->array_srfc != T_NIL) {
            len = RARRAY(db->array_srfc)->len;
            for(i = 0; i < len; i++)
                free((void*)RARRAY(db->array_srfc)->ptr[i]);
        }
*/
        free(p);
    }
}

static ID keys_id;

static VALUE rbSQLite_new(int argc, VALUE *argv , VALUE class){
    VALUE obj = Data_Wrap_Struct(class,0,rbSQLite_free,0);
    rb_obj_call_init(obj,argc,argv);
    return(obj);
}

static  VALUE   rbSQLite_init(int argc, VALUE *argv, VALUE obj){
    sDatabase *db;
    VALUE file,vmode,errstr;
    int mode;
    char *errmsg;
    struct sqlite *conn;

    Data_Get_Struct(obj, sDatabase,db);
    rbSQLite_free(db);
    if (rb_scan_args(argc, argv, "11", &file, &vmode) == 1) {
        mode = 0;               /* default value */
    }
    else if (NIL_P(vmode)) {
        mode = 0;               /* return nil if DB not exist */
    }
    else {
        mode = NUM2INT(vmode);
    }
    file = rb_str_to_str(file);
    Check_SafeStr(file);
    conn = sqlite_open(STR2CSTR(file),mode,&errmsg);
    if (!conn) {
        errstr = rb_str_new2(errmsg);
        free(errmsg);
        rb_raise(eDBError, STR2CSTR(errstr));
    }
    db = ALLOC(sDatabase);
    DATA_PTR(obj) = db;
    rb_iv_set(obj,"@array_srfc", rb_ary_new());
    db->conn = conn;
    db->array_srfc = rb_iv_get(obj,"@array_srfc");
    return(obj);
}

static int tables_callback(void *pArg, int argc, char **argv, char **columnNames) {
    VALUE ar, result = *(VALUE*)pArg;
    int i;
    if (RARRAY(result)->len == 0) {  /* copy column names*/
        ar = rb_ary_new2(argc);
        for(i = 0; i < argc; i++)
            rb_ary_push(ar, rb_str_new2(columnNames[i]));
        rb_ary_push(result,ar);
    }
    ar = rb_ary_new2(argc);
    for(i = 0; i < argc; i++)
        rb_ary_push(ar, rb_str_new2(argv[i]));
    rb_ary_push(result,ar);
    return 0;
}

static VALUE rbSQLite_exec(VALUE obj, VALUE sql){
    sDatabase *db;
    int state;
    char *errmsg;
    VALUE errstr, result = rb_ary_new();
    Data_Get_Struct(obj, sDatabase, db);
    Check_Type(sql, T_STRING);
    /* execute sql */
    state = sqlite_exec(db->conn, STR2CSTR(sql), &tables_callback, &result, &errmsg);
    if (state != SQLITE_OK) {
        errstr = rb_str_new2(errmsg);
        free(errmsg);
        rb_str_cat(errstr, "(", 1);
        rb_str_concat(errstr, rb_str_new2(sqliteErrStr(state)));
        rb_str_cat(errstr, ")", 1);
        rb_raise(eDBError, STR2CSTR(errstr));
    }
    return result;
}

static VALUE rbSQLite_close(VALUE obj){
    sDatabase *db;
    Data_Get_Struct(obj, sDatabase,db);
    rbSQLite_free(db);
    DATA_PTR(obj) = NULL;
}

static void call_ruby_function(sqlite_func *context, int argc, const char **argv){
    VALUE args,result;
    ID method;
    int i;
    sRubyFuncCall *sf;
    sf = (sRubyFuncCall*) sqlite_user_data(context);
    args = rb_ary_new();
    for (i = 0; i < argc; i++) { /* get arguments in first in first out order */
        rb_ary_push(args, rb_str_new2(argv[i]));
    }
    result = rb_funcall2(sf->obj_id,sf->method,RARRAY(args)->len,RARRAY(args)->ptr); /* the result */
    switch(TYPE(result)){
        case T_STRING:
            sqlite_set_result_string(context, RSTRING(result)->ptr, RSTRING(result)->len);
            break;;
        case T_FIXNUM:
            sqlite_set_result_int(context,FIX2INT(result));
            break;;
        case T_BIGNUM:
            sqlite_set_result_double(context,NUM2DBL(result));
            break;;
    }
}

static VALUE rbSQLite_setFunc(VALUE obj, VALUE args){
    int i;
    VALUE func_name,func_nargs,sfp;
    sRubyFuncCall *sf;
    sDatabase *db;
    if(RARRAY(args)->len == 4){
        Data_Get_Struct(obj, sDatabase, db);
        i = 0;
        sf = ALLOC(sRubyFuncCall);
        func_name = RARRAY(args)->ptr[i++];
        Check_Type(func_name, T_STRING);  /* function name to set */
        func_nargs = RARRAY(args)->ptr[i++];
        Check_Type(func_nargs, T_FIXNUM);  /* function number of arguments to set */
        sf->obj_id = RARRAY(args)->ptr[i++];
        sf->method = rb_intern(STR2CSTR(RARRAY(args)->ptr[i++]));
        sfp = Data_Wrap_Struct(obj,0,free,sf);
        rb_ary_push(db->array_srfc,sfp);
        sqlite_create_function(db->conn,STR2CSTR(func_name),FIX2INT(func_nargs),
            call_ruby_function,sf);
    }
    return(Qnil);
}

void Init_sqlite(){
    VALUE cSQLite;
    cSQLite=rb_define_class("SQLite",rb_cObject);
    rb_define_singleton_method(cSQLite,"new", rbSQLite_new,-1);
    rb_define_method(cSQLite,"initialize",rbSQLite_init,-1);
    /*rb_define_method(cSQLite,"open",rbSQLite_open,1);*/
    rb_define_method(cSQLite,"close",rbSQLite_close,0);
    rb_define_method(cSQLite,"exec",rbSQLite_exec,1);
    rb_define_method(cSQLite,"setFunc",rbSQLite_setFunc,-2);
    keys_id = rb_intern("keys");
}
