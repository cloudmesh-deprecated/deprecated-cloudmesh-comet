.. _man_comet:

Commands
========

comet
-----
Command - comet::

    Usage:
       comet init
       comet active [ENDPOINT]
       comet ll [CLUSTERID] [--format=FORMAT] [--endpoint=ENDPOINT]
       comet cluster [CLUSTERID]
                     [--format=FORMAT]
                     [--sort=SORTKEY]
                     [--endpoint=ENDPOINT]
       comet computeset [COMPUTESETID]
                    [--allocation=ALLOCATION]
                    [--cluster=CLUSTERID]
                    [--state=COMPUTESESTATE]
                    [--endpoint=ENDPOINT]
       comet start CLUSTERID [--count=NUMNODES] [COMPUTENODEIDS]
                    [--allocation=ALLOCATION]
                    [--walltime=WALLTIME]
                    [--endpoint=ENDPOINT]
       comet terminate COMPUTESETID [--endpoint=ENDPOINT]
       comet power (on|off|reboot|reset|shutdown) CLUSTERID [NODESPARAM]
                    [--endpoint=ENDPOINT]
       comet console [--link] CLUSTERID [COMPUTENODEID]
                    [--endpoint=ENDPOINT]
       comet node info CLUSTERID [COMPUTENODEID] [--format=FORMAT]
                    [--endpoint=ENDPOINT]
       comet node rename CLUSTERID OLDNAMES NEWNAMES
                    [--endpoint=ENDPOINT]
       comet iso list [--endpoint=ENDPOINT]
       comet iso upload [--isoname=ISONAME] PATHISOFILE
                    [--endpoint=ENDPOINT]
       comet iso attach ISOIDNAME CLUSTERID [COMPUTENODEIDS]
                    [--endpoint=ENDPOINT]
       comet iso detach CLUSTERID [COMPUTENODEIDS]
                    [--endpoint=ENDPOINT]

    Options:
        --endpoint=ENDPOINT     Specify the comet nucleus service
                                endpoint to work with, e.g., dev
                                or production
        --format=FORMAT         Format is either table, json, yaml,
                                csv, rest
                                [default: table]
        --sort=SORTKEY          Sorting key for the table view
        --count=NUMNODES        Number of nodes to be powered on.
                                When this option is used, the comet system
                                will find a NUMNODES number of arbitrary nodes
                                that are available to boot as a computeset
        --allocation=ALLOCATION     Allocation to charge when power on
                                    node(s)
        --walltime=WALLTIME     Walltime requested for the node(s).
                                Walltime could be an integer value followed
                                by a unit (m, h, d, w, for minute, hour, day,
                                and week, respectively). E.g., 3h, 2d
        --isoname=ISONAME       Name of the iso image after being stored remotely.
                                If not specified, use the original filename
        --state=COMPUTESESTATE  List only computeset with the specified state.
                                The state could be submitted, running, completed
        --link                  Whether to open the console url or just show the link

    Arguments:
        ENDPOINT        Service endpoint based on the yaml config file.
                        By default it's either dev or production.
        CLUSTERID       The assigned name of a cluster, e.g. vc1
        COMPUTESETID    An integer identifier assigned to a computeset
        COMPUTENODEID   A compute node name, e.g., vm-vc1-0
                        If not provided, the requested action will be taken
                        on the frontend node of the specified cluster
        COMPUTENODEIDS  A set of compute node names in hostlist format,
                        e.g., vm-vc1-[0-3]
                        One single node is also acceptable: vm-vc1-0
                        If not provided, the requested action will be taken
                        on the frontend node of the specified cluster
        NODESPARAM      Specifying the node/nodes/computeset to act on.
                        In case of integer, will be intepreted as a computesetid;
                        in case of a hostlist format, e.g., vm-vc1-[0-3], a group
                        of nodes; or a single host is also acceptable,
                        e.g., vm-vc1-0
        ISONAME         Name of an iso image at remote server
        ISOIDNAME       Index or name of an iso image at the remote server.
                        The index is based on the list from 'comet iso list'.
        PATHISOFILE     The full path to the iso image file to be uploaded
        OLDNAMES        The list of current node names to be renamed, in hostlist
                        format. A single host is also acceptable.
        NEWNAMES        The list of new names to rename to, in hostlist format.
                        A single host is also acceptable.

h
-
Command - h::

    Usage:
        history
        history list
        history last
        history ID

help
----
Command - help::

    Usage:
        help
        help COMMAND

    Description:
        List available commands with "help" or detailed help with
        "help COMMAND".

history
-------
Command - history::

    Usage:
        history
        history list
        history last
        history ID

q
-
Command - q::

    Usage:
        quit

    Description:
        Action to be performed whne quit is typed

quit
----
Command - quit::

    Usage:
        quit

    Description:
        Action to be performed whne quit is typed

