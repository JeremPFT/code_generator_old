#!python
# -*- coding: utf-8 -*-

# build git repository is cloned in each modules and each modules test
# this script print the status of each clone

# WARNING for emacs users
# - git put global configuration in c:/Users/your_name
# - magit look for it in c:/Users/your_name/AppData/Roaming
# you have to COPY it, not move it


import subprocess, pathlib, os

def __string( text ):
    return "".join( map( chr, text ) )

def __output ( call ) :
    if call.returncode == 0:
        print ( __string ( call.stdout ) )
    else:
        print ( "ERROR:" ) 
        print ( __string ( call.stderr ) ) 

def refresh( ) :
    subdirectories = [ x for x in pathlib.Path ( "./modules" ).iterdir ( ) if x.is_dir ( ) ]

    for module in subdirectories:

        print ( f"...checking module {module}" )

        build_dir = module / "build"

        print ( f".....checking build {build_dir!r}" )

        if not build_dir.exists ( ) :
            print ( "build not found" )
        else:
            print ( f"build_dir exists: {build_dir.exists ( )}" )

            git = "git"

            root_directory = os.getcwd()
            print ( f"root directory: {root_directory}" )
            os.chdir ( os.path.join ( root_directory, "modules", module.name, build_dir.name ) )
            workdir = os.getcwd()
            print ( f"workdir: {workdir}" )
            call = subprocess.run ( [ "git", "fetch" ], capture_output = True )
            print ( "call:" + repr ( call ) )
            if call.returncode == 0:
                print ( __string ( call.stdout ) )
            else:
                print ( __string ( call.stderr ) )
            call = subprocess.run ( [ "git", "status" ], capture_output = True )
            if call.returncode == 0:
                print ( __string ( call.stdout ) )
            else:
                print ( __string ( call.stderr ) )
            os.chdir ( workdir )

        #     subdirectories_ = [ x for x in pathlib.Path ( f"./modules/{build_dir.name}" ).iterdir ( ) ]

        #     for dir_ in subdirectories_:
        #         print ( dir.name + "/" + dir_.name )



        # print ( "testing " + build_dir.name )
        # if build_dir.exists():
        #     print ( f"{dir.name}/{build_dir.name}" )

        #     call = subprocess.run ( [ "git", "fetch" ], capture_output = True ) 
        #     print ( "fetch ..." )
        #     __output ( call )

        #     call = subprocess.run ( [ "git", "status" ], capture_output = True ) 
        #     print ( f"{dir.name} status:" ) 
        #     __output ( call )
        # else:
        #     print ( "no build dir in " + dir.name )






    # [ PosixPath ( '.hg' ) , PosixPath ( 'docs' ) , PosixPath ( 'dist' ) ,
    #  PosixPath ( '__pycache__' ) , PosixPath ( 'build' ) ]



    # for dir in dir ( "modules/*/build" ) :
    #     save_current_workdir ( ) 
    #     change_workdir ( f"modules{dir}/build/" ) 

    #     call = subprocess.run ( [ "git", "fetch" ], capture_output = False ) 
    #     call = subprocess.run ( [ "git", "status" ], capture_output = True ) 

    #     print ( f"{module_name ( dir ) } status:" ) 
    #     print ( __string ( call.stdout ) ) 

    #     if call.returncode != 0:
    #         print ( "ERROR:" ) 
    #         print ( __string ( call.stderr ) ) 
            

refresh()
