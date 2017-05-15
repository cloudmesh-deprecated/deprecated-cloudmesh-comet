from __future__ import print_function
from cloudmesh.shell.command import command
from cloudmesh.shell.command import PluginCommand


class CometCommand(PluginCommand):

    @command
    def do_comet(self, args, arguments):
        """
        ::

          Usage:
                comet -f FILE
                comet FILE
                comet list

          This command does some useful things.

          Arguments:
              FILE   a file name

          Options:
              -f      specify the file

        """
        print(arguments)



