Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C3222B7FC1
	for <lists+drbd-dev@lfdr.de>; Thu, 19 Sep 2019 19:12:28 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5A50542034B;
	Thu, 19 Sep 2019 19:12:27 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
	[209.85.166.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 34A68420182
	for <drbd-dev@lists.linbit.com>; Thu, 19 Sep 2019 19:12:25 +0200 (CEST)
Received: by mail-io1-f46.google.com with SMTP id b136so9562892iof.3
	for <drbd-dev@lists.linbit.com>; Thu, 19 Sep 2019 10:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:references:from:organization:to:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=t7fz2OwimHtNQ0wkQQaBbN+OsyPSyMiSxzIsWK3fGs0=;
	b=V9ABbTT64C/AD8Q/XX+4WmP1PolBLGlzdgFnXymnZT9V18AR0TlwZY40a1BPMvl0rJ
	wWtznU8nBUxyB+cl7TFhAXV06y/t1b3S+o7hwBhrPHOCVQ8CtBeMwU03B7B0mHYJTnLE
	LGt41Y0SOTsCJwCG7/ggU5KiS37EZoEFl2ET4ZYjz/f4zPRAlAvKxQkfZ0CnY4AKqcaj
	j1Wx2DFpDYfdUZpupAkaY71XHKhIbAbBF1XFi6I/AcfHtd3ihQvxLztqnGlcyMijdOPA
	mXNtNzsOrAbIL3yax7ygDvcYYjxQTIBa0sHjEuG/fbCX/TXZslbX7qYKMY2xSDJf+18m
	D+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:references:from:organization:to
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=t7fz2OwimHtNQ0wkQQaBbN+OsyPSyMiSxzIsWK3fGs0=;
	b=ead3V1YjZ7vw52eK4MK6Wf7BWd6q6oIlzA3zuj4pI4NEk0c+sRptTWksb409Zav8mm
	qidZZhytnXlPQMMhO81Pou3CSWKq/c0Zdk5xT06qLu/t/X9fD12jvmHx7a6PFJxFbGiQ
	k52VTSUNSMQaq9lDbE76teap+6Ax9azq8CZXqRpIY97Oin34uaGZQHrf0nJpJJlDkbiL
	/qOn1uyhyCBorcQ9ZmjVFgnyiFfhl2ECoRo9Fsb4GsbKomDZ0jfALVo+EwbCtZ3V6u7T
	aZQgNYfflJhO+xkwO727ky19Zaaf9p89d95OYBZawuM3y79Ukoic1krIf8BzfhXPk55v
	rrLQ==
X-Gm-Message-State: APjAAAUxWIFICyVpD0qOR+c/aC0Y0SA6Q1p7RdPXY5iTdRd89V9DJKA+
	hOZRvBF/ZhH416grxHFI3ltWZoki
X-Google-Smtp-Source: APXvYqzByp8YhQitaUltNssf0vv9TmaAPaXgNjpjnMZOE3Zl3fClmPHPHe75jKkxGrQ39SxMFyxk+g==
X-Received: by 2002:a02:1785:: with SMTP id 127mr12493409jah.15.1568913084696; 
	Thu, 19 Sep 2019 10:11:24 -0700 (PDT)
Received: from [192.168.1.22] (c-73-78-150-191.hsd1.co.comcast.net.
	[73.78.150.191])
	by smtp.gmail.com with ESMTPSA id i24sm6808027ioe.6.2019.09.19.10.11.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Sep 2019 10:11:24 -0700 (PDT)
References: <806b8d90-272f-3e82-3fb6-9495e48ef20d@gmail.com>
From: David Butterfield <dab21774@gmail.com>
Organization: PGP: 70C7 0309 E859 40AB 4D1F CDC5 F7CE 9A64 95EB 9D1B
To: fuse-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com
X-Forwarded-Message-Id: <806b8d90-272f-3e82-3fb6-9495e48ef20d@gmail.com>
Message-ID: <57fcdc5d-ac21-ad50-d9e4-55069391829e@gmail.com>
Date: Thu, 19 Sep 2019 11:11:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <806b8d90-272f-3e82-3fb6-9495e48ef20d@gmail.com>
Content-Language: en-US
Subject: [Drbd-dev] SPDK + DRBD + tcmu-runner storage handlers
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

(Resending without the diagram attachment that is too large for the mailing list)
(Refer to diagram at https://raw.githubusercontent.com/DavidButterfield/spdk/tcmu-runner/spdk_drbd.pdf)

tcmu-runner block storage handlers running under SPDK
=====================================================
A prototype of a new block device module "bdev_tcmur" running under the Storage Performance
Development Kit allows access to block storage using tcmu-runner handlers.  (tcmu-runner itself
is not involved; only its loadable handlers are used here.)  The bdev_tcmur module is based on
the bdev_aio module source.  It enables the pathways for LUN 2 and LUN 3 shown in the diagram.

Distributed Replicated Block Device (DRBD 9.0) running in usermode
==================================================================
A recent project ported DRBD from the kernel to run in usermode as a Linux process, using
support from emulated kernel functions and a multi-threaded engine based on epoll_wait().  The
DRBD source code itself is unmodified, with its expected environment simulated around it.  It
receives requests from clients through the kernel's block-I/O ("bio") protocol, and also makes
requests to its backing storage using that same protocol.  Usermode DRBD can be plumbed under
Usermode SCST (not shown in this diagram), or under a FUSE interface (drbd1 in the diagram).

DRBD running with SPDK
======================
To bring usermode DRBD into an SPDK process, a new SPDK bdev module "bdev_bio" implements
translation of SPDK block device requests into the kernel's block-I/O ("bio") protocol, as
expected by DRBD.  This enables the pathways for LUN 4 and LUN 5 shown in the diagram.

DRBD then makes bio requests to its backing storage, which at present must be a tcmu-runner
device.  To support arbitrary SPDK devices (e.g. use Malloc0 to back a DRBD device) requires a
"bio_bdev" module to translate bio requests into SPDK bdev protocol.  (TBD)

The SPDK configuration file plus an external helper provide enough for SPDK to configure DRBD
with the devices needed by SPDK.  Once the SPDK+DRBD server is up and running, the DRBD logic
can be controlled using the native DRBD management commands (drbdsetup and drbdadm).

The emulated kernel functions (UMC - usermode compatibility) make use of services provided by a
multithreaded event engine (MTE) implemented around epoll_wait().  The MTE services are accessed
by UMC through an ops vector backed by MTE services for memory, time, and threads, as well as
event polling of file descriptors, timers, and a FIFO of work to be done ASAP.  I anticipate an
easy time converting the ops vector to point at a shim to SPDK services in place of MTE calls.

Limitations
===========
The implementation is very new.  So far I have mainly tested it using the SPDK iSCSI server,
exporting tcmu-runner backend devices as SCSI LUNs.  That seems to work reliably.  The drbd and
tcmur devices can alternatively be mounted locally through the FUSE interface, which also works.

I have only tried it with one reactor core.

This prototype implementation is clearly in need of some cleaning up and interfaces straightened
out.  I've been studying SPDK for less then two weeks, and I guessed at a few things that I need
to go back over carefully.  But it runs.

The makefiles have optimizations turned off and debugs turned on.

The UMC FUSE implementation is single-threaded and synchronous; thus it operates at an effective
queue depth of one.  This matters most when using it to access replicated volumes with DRBD
Protocol C, where performance will suffer significantly.  Accessing volumes with Protocol A
configured to "pull-ahead" performs reasonably, as does accessing the same data through an iSCSI
LUN, which does not have the QD=1 limitation,

NOTE: Only tcmu-runner modules handler_ram.so and handler_file.so have been tried so far; the
      latter is significantly faster, so it is the one specified in the example configuration
      files.  An *async* tcmu-runner handler (nr_threads == 0) has yet to be tried!

Usermode DRBD Limitations
=========================
Netlink multicast emulation not yet implemented, so anything like "drbdsetup wait*" hangs.

The bio block device nodes are exposed through a mount of the server's UMC fuse filesystem
implementation.  The fuse-tree node that represents a DRBD or TCMUR block device appears as a
regular file rather than as a block device (because otherwise fuse directs I/O for that dev_t to
the kernel instead of the fuse filesystem server).  So when communicating with a usermode
server, the DRBD utilities are modified to omit the check that their device is S_IFBLK() rather
than S_IFREG().

Messages from the utilities and in the logs have not been modified, so will still refer to "the
kernel" etc when referring to code that has been ported from the kernel to usermode.

Resync may run noticeably slower when observing resync network traffic with tcpdump.

Something I expect NOT to work is running the server executable off of a disk it implements.

I have only run the usermode server on machines without DRBD installed in the kernel.  The build
script and the config/run instructions assume that there are no DRBD modules or utilities
installed.  (That would likely be very confusing, but might actually work if assigned separate
ports)

Bugs
====
In general only the "happy path" has received any exercise -- expect bugs in untested error-
handling logic.

"Exclusive" opens aren't really exclusive, so be careful not to mount the same storage twice;
for example /UMCfuse/dev/file_c and /UMCfuse/dev/drbd1 are the same storage in the example
configuration.  For another example, SPDK configuration [BIO] for bdev_bio should never consume
both drbd2 and ram_b concurrently.  "Holders" and "claims" are not yet implemented.

The "writable" bits in the mode permissions do not appear correctly in /UMCfuse/dev.

The server apparently can mount and write a replicated DRBD device on a secondary node.

fsync/flush is probably ineffective.

4096 is the only tested block size; possible bugs with others.

Stacktrace is broken.

Probably there are broken untested refcountings on things that usually only get opened once.
(E.g. two concurrent dd commands to the same device or things like that).

Clean shutdown does not work at all.

I always "make clean" before make, because my makefiles don't calculate dependencies right.  The
makefiles are hateworthy.  SCST repository is unnecessarily tangled up with the build.

Sometimes DRBD resync doesn't start upon reconnect after restarting the server.  If it doesn't
start, disconnecting + reconnecting to the peer usually gets it going.

I have seen a very weird problem using the tcmu-runner handler_file.so.  After dlopen(),
libtcmur.c looks up the symbol for the handler_init routine and calls it.  The handler calls
back with the address of its ops vector.  The function addresses in the ops vector are properly
relocated for the loaded module, and the main module calls functions through the ops vector
thousands of times... and then suddenly SIGSEGV, and examining the ops vector (under gdb) the
function addresses are all back to their original UNRELOCATED relative values!  (And the
faulting program counter address matches the unrelocated value in the member of the ops vector
it was trying to call through.)  I have never seen this happen with handler_ram.

However, I have not seen the problem since I ensured adequate memory for the SPDK server.  The
SPDK test machine has "only" 4GiB RAM, and swap space used was increasing during problem tests.
Because handler_file runs significantly faster than handler_ram for mounted filesystems, all the
tcmu-runner handler devices in the example are now by default configured to use handler_file
(despite some names in /UMCfuse/dev and /tmp continuing to be called "ram" rather than "file").

Building from Source Code
=========================
The source code to build SPDK with support for tcmu-runner handlers is in my forks of the SPDK
and tcmu-runner repositories. Building-in DRBD support requires several additional repositories.
Because building is presently a mess, I've included scripts that will download the repositories
and build SPDK with support for tcmu-runner loadable handlers and/or DRBD.  To download and
build the SPDK iSCSI server with support for BOTH, cd into an empty directory and do:

    wget https://raw.githubusercontent.com/DavidButterfield/spdk/tcmu-runner/BUILD_spdk_drbd.sh
    chmod 755 BUILD_spdk_drbd.sh
    ./BUILD_spdk_drbd.sh

To OMIT DRBD and only download/build SPDK with support for tcmu-runner handlers do this instead:

    wget https://raw.githubusercontent.com/DavidButterfield/spdk/tcmu-runner/BUILD_spdk_tcmur.sh
    chmod 755 BUILD_spdk_tcmur.sh
    ./BUILD_spdk_tcmur.sh

The (former) DRBD script downloads and builds a superset of what the (latter) TCMUR script does,
and after the DRBD download you can specify to build the more limited server (to support TCMUR
but not DRBD) by selection of configuration options:

    --with-tcmur			# SPDK with tcmu-runner only
    --with-tcmur --with-drbd		# SPDK with DRBD and tcmu-runner

Comments in the download/build scripts document the process in case you want to do some steps
manually.  (It asks for the sudo password to install, so you might want to look at it first.)

The SCRIPTS ASSUME you already have the tools and libraries installed such that you can build
the standard SPDK, DRBD, and tcmu-runner repositories.  Some of the makefiles require various
build tools -- here are package names I added to a fresh installation of Ubuntu 18.04 LTS to
complete the build:

    build-essential  g++  gcc  git  make  gdb  valgrind  cscope  exuberant-ctags
    libfuse-dev  libaio-dev  libglib2.0-dev  libkmod-dev  libnl-3-dev  libnl-genl-3-dev
    librbd-dev  autoconf  automake  flex  coccinelle  cmake

I always "make clean" before "make", because my makefiles don't calculate dependencies right.

There should be no compile errors, but there will be some warnings in the DRBD code.  The build
script documents a few that are expected and can be ignored for now.

Configuring
===========
The example config files in etc/drbd.d are from a node in my setup.  They will have to be
modified to suit your network configuration, and put into /etc/drbd.d on your test system.

There is also a nasty "helper" script /usr/sbin/drbdadm_up_primary which at present can only
bring up one specific SPDK/DRBD device in the example configuration.  To support a different
configuration, that file probably needs updating (in addition to /etc/drbd.d/* and the SPDK
configuration file).

Running
=======
To run the DRBD management utilities so that they refer to the simulated /proc that talks to the
usermode server process (rather than the real /proc that talks to the kernel):

    export UMC_FS_ROOT=/UMCfuse			    # *** SET ENVIRONMENT ***

The utilities need the $UMC_FS_ROOT environment variable set to control the usermode DRBD server
instead of a kernel-based server.  But they also need to run superuser.  Keep in mind that the
sudo program does not pass your shell environment through to the program given on its command
line, unless you specify "sudo -E".  (Omitting the "-E" leads to bewildering non-sequitur error
messages because the utility is trying to parse an earlier version of the command language)

Also the *server* needs the $UMC_FS_ROOT environment variable set, because it invokes the
utilities through a "usermode helper", and they inherit the variable from the server.

The download/build script ends with a suggested server command-line, that depends on which
script you used.  The two scripts refer to different configuration files depending on whether
DRBD support was selected or not.

Troubleshooting
===============
If you didn't read the sections "Configuring" and "Running" just above, read those.

The implementation and configuration of SPDK+DRBD is an order of magnitude more complex than the
relatively straightforward implementation of tcmu-runner handlers under SPDK.  You may wish to
make sure the simpler case works before bringing in DRBD.

Make sure your configuration files were suitably modified for your names, addresses, etc.

Make sure you are running the server and the utilities with environment variable set:
    export UMC_FS_ROOT=/UMCfuse
    sudo -E drbdadm ...		# -E to pass the environment variable through sudo

Missing the environment variable leads to bewildering non-sequitur error messages because the
utility is trying to parse an earlier version of the command language.  These messages in the
server log or output from a DRBD utility probably mean the environment variable is not set:
    Cannot determine minor device number of device
    Missing connection endpoint argument
    Parse error: 'disk | device | address | meta-disk | flexible-meta-disk' expected,
	    but got 'node-id'

/proc and /sys/module entries for the DRBD usermode server can be observed under /UMCfuse.

After starting the server, a node should appear in /UMCfuse/dev for each bio or tcmu-runner
device configured by SPDK.  DRBD resource "nonspdk" (drbd1) is not configured as an SPDK device.
After the server is up the resource may be enabled using the native DRBD command, after which
its node should appear under /UMCfuse/dev:

    drbdadm up nonspdk	    # assumes metadata previously created

Multiple names can refer to the same underlying storage.  Referring to the diagram, LUN 5, bio1,
/UMCfuse/dev/drbd2, and /UMCfuse/dev/ram_b all refer to the same underlying storage in
/tmp/tcmur_ram01.  A filesystem can be mounted on an iSCSI initiator as LUN 5, or the same
filesystem can be mounted locally, e.g.

    sudo mount /UMCfuse/dev/drbd2 /mnt/x

One bug is that exclusive open is not currently exclusive, so be careful not to use storage
multiple ways at the same time!

More Information
================
The DRBD kernel source code ported to usermode is (within a dozen lines of) unmodified from the
original code in the LINBIT repository, with its expected kernel environment simulated around
it.  For more information about how that was done, see the README.md with diagrams at
https://github.com/DavidButterfield/SCST-Usermode-Adaptation

David Butterfield						Tue 17 Sep 2019 09:43:35 PM MDT

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
