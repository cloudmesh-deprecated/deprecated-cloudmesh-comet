.. _refcard_comet:

Reference Card
==============

Shell
------

.. list-table:: Shell
   :widths: 25 75
   :header-rows: 1

   * - Command
     - Description
   * - cms help
     - help
   * - cms man
     - manual pages
   * - cms script.cm
     - execute cms commands in script

Comet
-------

+---------------------------------------+------------------------------------------------------------------------+
| | Command                             | | Description                                                          |
+=======================================+========================================================================+
| |                                     | | Configure comet endpoint and the authentication. This                |
| | cms comet init                      | | will retrieve api key/secret and setup the configuration             |
| |                                     | | file. A comet username/password is required and should               |
| |                                     | | be obtained via sepearate channels.                                  |
+---------------------------------------+------------------------------------------------------------------------+
| | cms comet ll                        | | Summary list of clusters owned by the authenticated                  |
| |                                     | | identity                                                             |
+---------------------------------------+------------------------------------------------------------------------+
| | cms comet cluster                   | | Detailed list of clusters owned by the authenticated                 |
| |                                     | | identity                                                             |
+---------------------------------------+------------------------------------------------------------------------+
| | cms comet cluster vc2               | | List a cluster by name (vc2)                                         |
+---------------------------------------+------------------------------------------------------------------------+
| | cms comet computeset                | | List all defined computesets                                         |
+---------------------------------------+------------------------------------------------------------------------+
| | cms comet computeset 63             | | Display one computeset by specifying the computeset                  |
| |                                     | | id (63)                                                              |
+---------------------------------------+------------------------------------------------------------------------+
| | cms comet power on vc4              | | Power on the frontend node of the specified cluster                  |
| |                                     | | (vc4)                                                                |
+---------------------------------------+------------------------------------------------------------------------+
| | cms comet power off vc4             | | Power off the frontend node of the specified cluster                 |
| |                                     | | (vc4)                                                                |
+---------------------------------------+------------------------------------------------------------------------+
| | cms comet start vc4 vm-vc4-[0-3]    | | Start a new set of compute nodes in one cluster (vc4).               |
| |                                     | | The nodes will be put into a computeset once succeeded               |
+---------------------------------------+------------------------------------------------------------------------+
| | cms comet start vc4 --count=4       | | Start an N (4) node computeset in one cluster (vc4)                  |
+---------------------------------------+------------------------------------------------------------------------+
| | cms comet start vc4 vm-vc4-[0-3]    | | Start a set of compute nodes in a cluster (vc4), as                  |
| |    --walltime=6h                    | | computeset, for a givenwalltime (30m, 3h, 2d, 1w, for                |
| |                                     | | 30 minutes, 3 hours, 2 days, 1 week, respectively)                   |
+---------------------------------------+------------------------------------------------------------------------+
| | cms comet start vc4 vm-vc4-[0-3]    | | Start new set of compute nodes with allocation                       |
| |    --allocation=YOUR_ALLOCATION     | |                                                                      |
+---------------------------------------+------------------------------------------------------------------------+
| | cms comet start vc4 vm-vc4-7        | | Start a one-node computeset                                          |
+---------------------------------------+------------------------------------------------------------------------+
| | cms comet power off vc4 vm-vc4-[0,1]| | You can power off and back on individual nodes of                    |
| | cms comet power on vc4 vm-vc4-0     | | an active computeset without impacting other nodes                   |
| |                                     | | in the same computeset                                               |
+---------------------------------------+------------------------------------------------------------------------+
| |                                     | | shutdown the whole computeset by specifying all nodes.               |
| | cms comet power shutdown vc4        | | The nodes can be powered back on again if the                        |
| |     vm-vc4-[0-3]                    | | requested walltime hasn't reached                                    |
+---------------------------------------+------------------------------------------------------------------------+
| |                                     | | Gracefully shutdown all nodes in computeset 123 AND                  |
| | cms comet terminate 123             | | terminate the resource reservation. A computeset will be             |
| |                                     | | terminated automatically when requested walltime reached             |
+---------------------------------------+------------------------------------------------------------------------+
| | cms comet console vc4               | | Get console of the frontend, openned in a browser                    |
+---------------------------------------+------------------------------------------------------------------------+
| | cms comet console vc4 vm-vc4-0      | | Get console of a running node                                        |
+---------------------------------------+------------------------------------------------------------------------+
| | cms comet console --link vc4        | | Get console of the frontend, URL only                                |
+---------------------------------------+------------------------------------------------------------------------+
| | cms comet iso list                  | | Get list of images available to you                                  |
+---------------------------------------+------------------------------------------------------------------------+
| | cms comet iso upload                | | Upload an image to the shared public directory on                    |
| |    /path/to/your/image.iso          | | nucleus server                                                       |
+---------------------------------------+------------------------------------------------------------------------+
| | cms comet iso upload                | | Upload an image to the shared public directory on                    |
| |    /path/to/your/image.iso          | | nucleus server with a new image name                                 |
| |    --imagename=newimagename.iso     | |                                                                      |
+---------------------------------------+------------------------------------------------------------------------+
| | cms comet iso attach                | | Attach an image (newimagename.iso) to frontend of                    |
| |    newimagename.iso vc2             | | a cluster (vc2), by providing an image name                          |
+---------------------------------------+------------------------------------------------------------------------+
| |                                     | | Attach an image (newimagename.iso) to frontend of                    |
| | cms comet iso attach 6 vc2          | | a cluster (vc2), by providing an image index based                   |
| |                                     | | on the order from the 'comet iso list'                               |
+---------------------------------------+------------------------------------------------------------------------+
| | cms comet iso attach                | | Attach an image to a compute node (vm-vc2-0) for a                   |
| |    newimagename.iso vc2 vm-vc2-0    | | cluster (vc2)                                                        |
+---------------------------------------+------------------------------------------------------------------------+
| | cms comet iso detach vc2            | | Detach the attached iso image from frontend of a                     |
| |                                     | | cluster (vc2)                                                        |
+---------------------------------------+------------------------------------------------------------------------+
| | cms comet iso detach vc2 vm-vc2-0   | | Detach the attached iso image from a compute node                    |
+---------------------------------------+------------------------------------------------------------------------+
| | cms comet iso attach                | | Attach an image to a set of compute node, specified in               |
| |    imagename.iso vc2 vm-vc2-[0-3]   | | hostlist format (vm-vc2-[0-3]) for a cluster (vc2)                   |
+---------------------------------------+------------------------------------------------------------------------+
| | cms comet iso detach                | | Detach also works in bulk                                            |
| |    vc2 vm-vc2-[0-3]                 | |                                                                      |
+---------------------------------------+------------------------------------------------------------------------+
| | cms comet node info vc2             | | List the detailed information of vc2 frontend node                   |
| |                                     | |                                                                      |
+---------------------------------------+------------------------------------------------------------------------+
| | cms comet node rename vc2           | | Rename a list of compute node (vm-vc2-[0-3]) from a                  |
| |    vm-vc2-[0-3] new-[0-3]           | | cluster (vc2) to a list of new names (new-[0-3]).                    |
| |                                     | | In hostlist format.                                                  |
+---------------------------------------+------------------------------------------------------------------------+
