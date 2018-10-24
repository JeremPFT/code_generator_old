#!python
# -*- coding: utf-8 -*-

# build git repository is cloned in each modules and each modules test
# this script print the status of each clone

# WARNING for emacs users
# - git put global configuration in c:/Users/your_name
# - magit look for it in c:/Users/your_name/AppData/Roaming
# you have to COPY it, not move it


import subprocess, pathlib, os
import os.path

class Checker():

    __endMessages = []
    __moduleMessages = []
    
    __project_label = "in your project:"

    def __init__():
        pass
    
    def __string( text ):
        """
        converts stdout and stderr from binary string to normal string
        """

        return "".join( map( chr, text ) )
    
    def __updateMessages ( ):
        """
        when a module is processed, moduleMessages is saved and reset
        """
        
        Checker.__endMessages.append ( Checker.__moduleMessages )
        Checker.__moduleMessages = []
    
    def __parseStdout ( module, stdout ):
        """
        put a message in moduleMessages if matching string is found in output
        """        

        if module != None: 
            path      = os.path.normpath ( f"{module}/build" ).replace ( "\\", "/" )
            changeDir = f"cd {path} && "
            text      = Checker.__project_label
            end       = " && cd - && "
        else:
            changeDir = ""
            text      = "your branche"
            end       = ""
    
        if "Your branch is up to date with" in stdout:
            pass
        if "Your branch is ahead" in stdout:
            Checker.__moduleMessages.append ( f"{text} is ahead:\n  {changeDir}git push {end}" )
        if "Your branch is behind" in stdout:
            Checker.__moduleMessages.append ( f"{text} is behind:\n  {changeDir}git pull {end}" )
        if "Changes not staged for commit" in stdout:
            Checker.__moduleMessages.append ( f"changes not staged:\n  {changeDir}git add / checkout needed" )
        if "Untracked files:" in stdout:
            Checker.__moduleMessages.append ( f"untracked files:\n  {changeDir}git add needed" )
    
    def __fetch( module ):
        """
        call fetch, print output is it exists
        """

        call = subprocess.run ( [ "git", "fetch" ], capture_output = True )
        if call.returncode != 0: print ( "an error has occured" )
        if call.stdout != b"": print ( Checker.__string ( call.stdout ) )
        if call.stderr != b"": print ( Checker.__string ( call.stderr ) )
    
    def __status( module ):
        """
        call status, print output is it exists and update moduleMessages if needed
        """

        call = subprocess.run ( [ "git", "status" ], capture_output = True )
        if call.returncode != 0: print ( "an error has occured" )
        if call.stdout != b"": 

            synch = """On branch master
Your branch is up to date with 'origin/master'.

nothing to commit, working tree clean
"""

            if Checker.__string ( call.stdout ) == synch :
                print ( "synchronized" )
            else:
                print ( Checker.__string ( call.stdout ) )

            Checker.__parseStdout ( module, Checker.__string ( call.stdout ) )

        if call.stderr != b"": print ( Checker.__string ( call.stderr ) )
    
    def __push( module ):
        """
        call push, print output is it exists
        """

        call = subprocess.run ( [ "git", "push" ], capture_output = True )
        if call.returncode != 0: print ( "an error has occured" )
        if call.stdout != b"": print ( Checker.__string ( call.stdout ) )
        if call.stderr != b"": print ( Checker.__string ( call.stderr ) )
    
    def __pull( module ):
        """
        call pull, print output is it exists
        """

        call = subprocess.run ( [ "git", "pull" ], capture_output = True )
        if call.returncode != 0: print ( "an error has occured" )
        if call.stdout != b"": print ( Checker.__string ( call.stdout ) )
        if call.stderr != b"": print ( Checker.__string ( call.stderr ) )
    
    def __processBuildProject ( module ):
        """
        process the build git project inside current module
        """

        print ( f"------------------------------" )
        module_dir = str ( module ).replace ( "\\", "/" )
        print ( f"checking build status in {module_dir}" )

        build_dir = module / "build"
    
        Checker.__moduleMessages.append ( f"{module_dir}/build" )
    
        if not build_dir.exists ( ) :
            print ( "no build directory\n" )
        else:
            print ( "processing build" )
            project_directory = os.getcwd()

            if module.name == "tests":
                os.chdir ( os.path.join ( project_directory,
                                          "modules",
                                          module.parent.name,
                                          "tests",
                                          build_dir.name ) )
            else:
                os.chdir ( os.path.join ( project_directory,
                                          "modules",
                                          module.name,
                                          build_dir.name ) )

            module_build_dir = os.getcwd()
    
            print ( f"status:" )
            Checker.__fetch( module )
            Checker.__status( module )
    
            os.chdir ( project_directory )
    
        Checker.__updateMessages()
    
    def refresh( ) :
        """print updated git status for the project and the different build clones in
        every modules and their tests.
        Print the list of git commands to run to be in sync. with git repositories
        """

        subdirectories = [ x for x in pathlib.Path ( "./modules" ).iterdir ( ) if x.is_dir ( ) ]
    
        print ( "project status:" )
        Checker.__moduleMessages.append ( Checker.__project_label )
        Checker.__fetch( None )
        Checker.__status( None )
        Checker.__updateMessages()
    
        for module in subdirectories:
            Checker.__processBuildProject ( module )
            tests_dir =  module / "tests"
            if tests_dir.exists ():
                Checker.__processBuildProject ( tests_dir )
                # print ( "****************" )
                # print ( tests_dir )
                # print ( "****************" )
            else:
                print ( "no tests directory\n" )

                
        print ( f"==============================" )
    
        # each msg has at least the module name. Others elements are git commands.
        total = 0
        for msg in Checker.__endMessages:
            total = total + len ( msg )

        if total == len ( Checker.__endMessages ):
            print ( "nothing to do" )

        print ( "some git to do" )

        for messageData in Checker.__endMessages:
            if len ( messageData ) > 1:
                for text in messageData:
                    print ( text )
                    if len ( messageData ) == 2:
                        modulePath = messageData [ 0 ]

                        if"is ahead:\n" in text:
                            if modulePath == Checker.__project_label:
                                Checker.__push( None )
                            else:
                                project_directory = os.getcwd()
                                os.chdir ( modulePath )
                                Checker.__push( None )
                                os.chdir ( project_directory )
                        if"is behind:\n" in text:
                            if modulePath == Checker.__project_label:
                                Checker.__pull( None )
                            else:
                                project_directory = os.getcwd()
                                os.chdir ( modulePath )
                                Checker.__pull( None )
                                os.chdir ( project_directory )
                                
                                
                                
                print

Checker.refresh()
